// **************************************
//					EXIT 
// **************************************

instance DIA_Grd_218_Exit (C_INFO)
{
	npc			= Grd_218_GArdist;
	nr			= 999;
	condition	= DIA_Grd_218_Exit_Condition;
	information	= DIA_Grd_218_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Grd_218_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_218_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Grd_218_FirstIn (C_INFO)
{
	npc			= Grd_218_GArdist;
	nr			= 1;
	condition	= DIA_Grd_218_FirstIn_Condition;
	information	= DIA_Grd_218_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Grd_218_FirstIn_Condition()
{
	if (self.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_218_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_00"); //Halt! Was willst du hier?
	AI_Output (other, self,"DIA_Grd_218_FirstIn_15_01"); //Ich will hier rein.
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_02"); //Machst du Witze?
	AI_Output (other, self,"DIA_Grd_218_FirstIn_15_03"); //Frag das doch mal Thorus.
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_04"); //Werde ich. Wenn du gelogen hast, bist du tot!
	AI_Output (other, self,"DIA_Grd_218_FirstIn_15_05"); //Soll das heißen, ich kann jetzt reingehen.
	AI_Output (self, other,"DIA_Grd_218_FirstIn_07_06"); //Ja. Geh schon!
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//	NSC:		Grd_218_Gardist
//	Lager:		OldCamp		
//	Durchgang:	Eingang Erzbaronhaus
//	Uhrzeit:	24h
//
//	Es passiert folgendes:
//	1.	Nähert sich der Spieler dem Durchgang, so wird er in diesen
//		Dialog gezwungen und einmal gewarnt
//	2.	Nähert er sich trotzdem wieder, wird er angegriffen
//////////////////////////////////////////////////////////////////////////
const string	Grd_218_CHECKPOINT		= "OCC_BARONS_HALLWAY_FRONT";

instance Info_Grd_218_FirstWarn (C_INFO)
{
	npc			= Grd_218_Gardist;
	nr			= 1;
	condition	= Info_Grd_218_FirstWarn_Condition;
	information	= Info_Grd_218_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

//------------------------------------------------------------------------
//	1. Warnung
//------------------------------------------------------------------------
func int Info_Grd_218_FirstWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]== AIV_GPS_BEGIN)
	&&  (self.aivar[AIV_PASSGATE]			== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)			!= ATT_FRIENDLY	) 
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self), self.wp)		))
	{
		return TRUE;
	};
};

func void Info_Grd_218_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Grd_218_FirstWarn_Info_07_01"); //HALT! Keinen Schritt weiter!
	AI_Output (hero, self,"Info_Grd_218_FirstWarn_Info_15_02"); //Warum?
	AI_Output (self, hero,"Info_Grd_218_FirstWarn_Info_07_03"); //Das Haus der Erzbarone ist tabu für Abschaum wie dich!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Grd_218_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	

	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Grd_218_Attack (C_INFO)
{
	npc			= Grd_218_Gardist;
	nr			= 1;
	condition	= Info_Grd_218_Attack_Condition;
	information	= Info_Grd_218_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Grd_218_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  (self.aivar[AIV_PASSGATE]					== FALSE		) 
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Grd_218_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_Grd_218_Attack_Info()
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
