// **************************************************
//						 EXIT 
// **************************************************

instance  Org_804_Organisator_Exit (C_INFO)
{
	npc			= Org_804_Organisator;
	nr			= 999;
	condition	= Org_804_Organisator_Exit_Condition;
	information	= Org_804_Organisator_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_804_Organisator_Exit_Condition()
{
	if (Npc_KnowsInfo(hero,Org_804_Organisator_ToLares))
	{
		return 1;
	};
};

FUNC VOID  Org_804_Organisator_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  Org_804_Organisator_Greet (C_INFO)
{
	npc			= Org_804_Organisator;
	nr			= 1;
	condition	= Org_804_Organisator_Greet_Condition;
	information	= Org_804_Organisator_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_804_Organisator_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_804_Organisator_Greet_Info()
{
	AI_Output (self, other,"Org_804_Organisator_Greet_06_00"); //Now where are YOU going?
};

// **************************************************
//					Wo geht's hier hin?
// **************************************************

instance Org_804_Organisator_WayTo (C_INFO)
{
	npc			= Org_804_Organisator;
	nr			= 1;
	condition	= Org_804_Organisator_WayTo_Condition;
	information	= Org_804_Organisator_WayTo_Info;
	permanent	= 0;
	description  = "Where can I go?";
};                       

FUNC int Org_804_Organisator_WayTo_Condition()
{
	return 1;
};

FUNC VOID Org_804_Organisator_WayTo_Info()
{
	AI_Output (other, self,"Org_804_Organisator_WayTo_15_00"); //Where CAN I go?
	AI_Output (self, other,"Org_804_Organisator_WayTo_06_01"); //To Lares.
	var C_NPC Lares; Lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// **************************************************
//					Will zu Lares
// **************************************************

instance  Org_804_Organisator_ToLares (C_INFO)
{
	npc			= Org_804_Organisator;
	nr			= 1;
	condition	= Org_804_Organisator_ToLares_Condition;
	information	= Org_804_Organisator_ToLares_Info;
	permanent	= 0;
	description  = "I want to see Lares.";
};                       

FUNC int  Org_804_Organisator_ToLares_Condition()
{
	if (Npc_KnowsInfo(hero,Org_804_Organisator_WayTo))
	{
		return 1;
	};
};

FUNC VOID  Org_804_Organisator_ToLares_Info()
{
	AI_Output (other, self,"Org_804_Organisator_ToLares_15_00"); //I want to see Lares.
	AI_Output (self, other,"Org_804_Organisator_ToLares_06_01"); //I doubt he'll talk to you.
	AI_Output (other, self,"Org_804_Organisator_ToLares_15_02"); //Just you leave that to me.
	AI_Output (self, other,"Org_804_Organisator_ToLares_06_03"); //I won't stop you.
	AI_StopProcessInfos	(self);
};

// **************************************************
//				Kann ich zu Lares? - PERM
// **************************************************

instance  Org_804_Organisator_PERM (C_INFO)
{
	npc			= Org_804_Organisator;
	nr			= 1;
	condition	= Org_804_Organisator_PERM_Condition;
	information	= Org_804_Organisator_PERM_Info;
	permanent	= 1;
	description  = "Can I see Lares?";
};                       

FUNC int  Org_804_Organisator_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Org_804_Organisator_ToLares))
	{
		return 1;
	};
};

FUNC VOID  Org_804_Organisator_PERM_Info()
{
	AI_Output (other, self,"Org_804_Organisator_PERM_15_00"); //Can I see Lares?
	AI_Output (self, other,"Org_804_Organisator_PERM_06_01"); //Sort that out with Roscoe.
	AI_StopProcessInfos	(self);
};

//////////////////////////////////////////////////////////////////////////
//	DURCHGANGSWACHE
//	===============	
//  AL aufhalten
//////////////////////////////////////////////////////////////////////////

// **********************************************
// Erste Warnung
// **********************************************
	const string Org_804_CHECKPOINT = "NC_HUT23_OUT";
// **********************************************

instance Info_Org_804_FirstWarn (C_INFO)
{
	npc			= Org_804_Organisator;
	nr			= 2;
	condition	= Info_Org_804_FirstWarn_Condition;
	information	= Info_Org_804_FirstWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Org_804_FirstWarn_Condition()
{
	if (	( (other.guild == GIL_GRD) || (other.guild == GIL_STT) 	) 
	&&	(Npc_GetAttitude(self,hero)	!= ATT_FRIENDLY	) 
	&&		(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp))				)
	{
		return TRUE;
	};
};

func void Info_Org_804_FirstWarn_Info()
{
	PrintGlobals	(PD_MISSION);

	AI_Output (self, hero,"Info_Org_804_FirstWarn_Info_06_00"); //Gomez' servants don't get in here! Go!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP(hero,Org_804_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_FIRSTWARN;	
	
	AI_StopProcessInfos	(self);	
};

//------------------------------------------------------------------------
//	2. Warnung
//------------------------------------------------------------------------
instance Info_Org_804_LastWarn (C_INFO)
{
	npc			= Org_804_Organisator;
	nr			= 1;
	condition	= Info_Org_804_LastWarn_Condition;
	information	= Info_Org_804_LastWarn_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Org_804_LastWarn_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_FIRSTWARN				)
	&&  ( (other.guild == GIL_GRD) || (other.guild == GIL_STT) 	)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Org_804_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return TRUE;
	};
};

func int Info_Org_804_LastWarn_Info()
{
	AI_Output (self, hero,"Info_Org_804_LastWarn_06_00"); //Go while you can still walk!

	hero.aivar[AIV_LASTDISTTOWP] 		= Npc_GetDistToWP (hero,Org_804_CHECKPOINT);
	hero.aivar[AIV_GUARDPASSAGE_STATUS]	= AIV_GPS_LASTWARN;	
	
	AI_StopProcessInfos	(self);
};

//------------------------------------------------------------------------
//	Attack
//------------------------------------------------------------------------
instance Info_Org_804_Attack (C_INFO)
{
	npc			= Org_804_Organisator;
	nr			= 1;
	condition	= Info_Org_804_Attack_Condition;
	information	= Info_Org_804_Attack_Info;
	permanent	= 1;
	important	= 1;
};                       

func int Info_Org_804_Attack_Condition()
{
	if ((hero.aivar[AIV_GUARDPASSAGE_STATUS]		== AIV_GPS_LASTWARN					)
	&&  ( (other.guild == GIL_GRD) || (other.guild == GIL_STT) 	)
	&&	(Npc_GetAttitude(self,hero)					!= ATT_FRIENDLY	) 
	&&  (Npc_GetDistToWP(hero,Org_804_CHECKPOINT)	< (hero.aivar[AIV_LASTDISTTOWP]-100))
	&&	(Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)										)) 
	{
		return 			TRUE;
	};
};

func int Info_Org_804_Attack_Info()
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
