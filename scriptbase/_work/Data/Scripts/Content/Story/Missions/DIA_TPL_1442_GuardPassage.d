//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		TPL_1442_Templer
//	Lager:				
//	Durchgang:
//	Uhrzeit:
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert sich der SC trotzdem weiter, so wird er ein ZWEITES Mal
//		gewarnt (aggressiver mit Waffe ziehen)
//	3.	Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string	TPL_1442_CHECKPOINT		= "PSI_TEMPLE_IN";

instance Info_TPL_1442_FirstWarn (C_INFO)
{
	npc			= TPL_1442_Templer;
	nr			= 1;
	condition	= Info_TPL_1442_FirstWarn_Condition;
	information	= Info_TPL_1442_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_TPL_1442_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_TPL_1442_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output		(self, hero,"Info_TPL_1442_FirstWarn_13_01"); //STOP! You can only enter the temple hill if you have a Guru's permission!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,TPL_1442_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	if (Npc_KnowsInfo(hero, PC_Psionic_SEND))
	{
		Info_Clearchoices 	(Info_TPL_1442_FirstWarn);
		Info_Addchoice 		(Info_TPL_1442_FirstWarn,"Y'Berion himself gave me permission.",	Info_TPL_1442_FirstWarn_Condition_YBERION);  
		Info_Addchoice 		(Info_TPL_1442_FirstWarn,"The novice Lester sent me.",	Info_TPL_1442_FirstWarn_Condition_LESTER);  
	}
	else
	{
		AI_StopProcessInfos(self);
	};
};

func void Info_TPL_1442_FirstWarn_Condition_YBERION ()
{
	AI_Output (hero, self,"Info_TPL_1442_FirstWarn_Condition_YBERION_15_01"); //Y'Berion himself gave me permission.
	AI_Output (self, hero,"Info_TPL_1442_FirstWarn_Condition_YBERION_13_02"); //Liars tend to lose their tongues easily, so you'd better watch what you're saying.
};

func void Info_TPL_1442_FirstWarn_Condition_LESTER ()
{
	AI_Output (hero, self,"Info_TPL_1442_FirstWarn_Condition_LESTER_15_01"); //The novice Lester sent me. I shall offer my services to Y'Berion.
	AI_Output (self, hero,"Info_TPL_1442_FirstWarn_Condition_LESTER_13_02"); //Lester is trustworthy. I know him. You may pass.
	Info_Clearchoices 	(Info_TPL_1442_FirstWarn);

	//---- beide Wachen auf passieren schalten ----
	var C_NPC templer; templer = Hlp_GetNpc(TPL_1441_Templer);
	hero.aivar[AIV_GUARDPASSAGE_STATUS] = AIV_GPS_BEGIN;
	self.aivar[AIV_PASSGATE] 			= TRUE;
	templer.aivar[AIV_PASSGATE] 		= TRUE;
};



//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_TPL_1442_LastWarn (C_INFO)
{
	npc			= TPL_1442_Templer;
	nr			= 1;
	condition	= Info_TPL_1442_LastWarn_Condition;
	information	= Info_TPL_1442_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_TPL_1442_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (Npc_GetDistToWP(hero,TPL_1442_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_TPL_1442_LastWarn_Info()
{
	AI_Output 		(self, hero,"Info_TPL_1442_LastWarn_13_01"); 		//One step further and you'll cease to exist.

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,TPL_1442_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_TPL_1442_Attack (C_INFO)
{
	npc			= TPL_1442_Templer;
	nr			= 1;
	condition	= Info_TPL_1442_Attack_Condition;
	information	= Info_TPL_1442_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_TPL_1442_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  (self.aivar[AIV_PASSGATE] == FALSE)
	&&  (Npc_GetDistToWP(hero,TPL_1442_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_TPL_1442_Attack_Info()
{
	
	hero.aivar[AIV_LASTDISTTOWP] 		= 0;
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_PUNISH;	
	
	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					// dem Spieler sofort wieder die Kontrolle zurückgeben
	B_IntruderAlert		(self,	other);
	B_SetAttackReason	(self,	AIV_AR_INTRUDER);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};
