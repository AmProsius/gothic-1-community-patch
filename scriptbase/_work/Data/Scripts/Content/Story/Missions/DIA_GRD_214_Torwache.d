// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_214_Torwache_Exit (C_INFO)
{
	npc			= Grd_214_Torwache;
	nr			= 999;
	condition	= DIA_Grd_214_Torwache_Exit_Condition;
	information	= DIA_Grd_214_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_214_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_214_Torwache_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Was machst du
// **************************************************

INSTANCE DIA_Grd_214_Torwache_job (C_INFO)
{
	npc				= Grd_214_Torwache;
	nr				= 2;
	condition		= DIA_Grd_214_Torwache_job_Condition;
	information		= DIA_Grd_214_Torwache_job_Info;
	permanent		= 1;
	description		= "What do you do all day?"; 
};

FUNC INT DIA_Grd_214_Torwache_job_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Grd_214_Torwache_job_Info()
{
	AI_Output (other, self,"DIA_Grd_214_Torwache_job_15_00"); //What do you do all day?
	AI_Output (self, other,"DIA_Grd_214_Torwache_job_07_01"); //I make sure no-one gets in if Gomez don't want 'em to.
	AI_Output (self, other,"DIA_Grd_214_Torwache_job_07_02"); //So don't make trouble when you're inside, or you won't be going nowhere.
};

//-----------------------------------------------------------------
// Zu Thorus schicken / Gildenaufnahme Gardist
//-----------------------------------------------------------------
instance Grd_214_Torwache_SEETHORUS (C_INFO)
{
	npc				= Grd_214_Torwache;
	condition		= Grd_214_Torwache_SEETHORUS_Condition;
	information		= Grd_214_Torwache_SEETHORUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_214_Torwache_SEETHORUS_Condition()
{	
	if  (! Npc_KnowsInfo (hero,GRD_216_TORWACHE_SEETHORUS))
	&&  ((CorKalom_BringMCQBalls == LOG_SUCCESS) || (Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3))
	&& 	(! Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
};
func void  Grd_214_Torwache_SEETHORUS_Info()
{
	AI_Output (self, other,"Grd_214_Torwache_SEETHORUS_Info_07_01"); //Hey, I'm glad you're here. Thorus wants to see you!
	AI_Output (other, self,"Grd_214_Torwache_SEETHORUS_Info_15_02"); //What does he want?
	AI_Output (self, other,"Grd_214_Torwache_SEETHORUS_Info_07_03"); //I'm sure he'll tell you soon enough.
};

//-----------------------------------------------------------------
// Dusty abfangen
//-----------------------------------------------------------------
instance Grd_214_Torwache_NODUSTY (C_INFO)
{
	npc				= Grd_214_Torwache;
	condition		= Grd_214_Torwache_NODUSTY_Condition;
	information		= Grd_214_Torwache_NODUSTY_Info;
	important		= 1;
	permanent		= 1;
};

FUNC int  Grd_214_Torwache_NODUSTY_Condition()
{	
	var C_NPC Dusty; Dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if (Dusty.aivar[AIV_PARTYMEMBER] == TRUE)
	&&	(Npc_GetDistToNpc(hero,dusty)<2000)
	{
		return TRUE;
	};
};
func void  Grd_214_Torwache_NODUSTY_Info()
{
	AI_Output			(self, other,"Grd_214_Torwache_NODUSTY_Info_07_01"); //HEY, YOU!!! You wouldn't be trying to smuggle Dusty out o' here, would you?
	AI_Output			(other, self,"Grd_214_Torwache_NODUSTY_Info_15_02"); //We just wanted...
	AI_Output			(self, other,"Grd_214_Torwache_NODUSTY_Info_07_03"); //You won't be wanting anymore soon!

	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_Attack,1,"");

	B_ExchangeRoutine	(Vlk_524_Dusty,"start");
	var C_NPC dusty;	dusty = Hlp_GetNpc(Vlk_524_Dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
};

