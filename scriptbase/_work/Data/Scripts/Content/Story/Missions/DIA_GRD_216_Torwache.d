// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_216_Exit (C_INFO)
{
	npc			= Grd_216_Torwache;
	nr			= 999;
	condition	= DIA_Grd_216_Exit_Condition;
	information	= DIA_Grd_216_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_216_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_216_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Kap 1 Standard Hallo
// **************************************************

INSTANCE DIA_Grd_216_First (C_INFO)
{
	npc				= Grd_216_Torwache;
	nr				= 1;
	condition		= DIA_Grd_216_First_Condition;
	information		= DIA_Grd_216_First_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grd_216_First_Condition()
{	
	if (Npc_GetDistToWP(other,"OCR_NORTHGATE_ADVANCE") > 400) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,30);
	};
	
	if (Npc_RefuseTalk(self) == FALSE)
	{
		var C_NPC Dusty; Dusty = Hlp_GetNpc(Vlk_524_Dusty);
		if	(Dusty.aivar[AIV_PARTYMEMBER] == FALSE)
		&&	(Kapitel < 2)
		{
			return 1;
		};
	};
};

FUNC VOID DIA_Grd_216_First_Info()
{
	AI_Output (self, other,"DIA_Grd_216_First_13_00"); //Hey, you! I don't think I've seen you here before!
	AI_Output (other, self,"DIA_Grd_216_First_15_01"); //No wonder. I've only just got here.
	AI_Output (self, other,"DIA_Grd_216_First_13_02"); //Then watch out! The outside world is pretty dangerous. You're only safe inside a camp.
};

// **************************************************
// 					Dusty Zoll
// **************************************************

INSTANCE DIA_Grd_216_DustyZoll (C_INFO)
{
	npc				= Grd_216_Torwache;
	nr				= 1;
	condition		= DIA_Grd_216_DustyZoll_Condition;
	information		= DIA_Grd_216_DustyZoll_Info;
	permanent		= 1;
	important 		= 1;
};

FUNC INT DIA_Grd_216_DustyZoll_Condition()
{	
	var C_NPC Dusty; Dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if (Dusty.aivar[AIV_PARTYMEMBER] == TRUE)
	&&	(Npc_GetDistToNpc(hero,dusty)<2000)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_216_DustyZoll_Info()
{
	AI_Output			(self, other,"DIA_Grd_216_Dusty_Zoll_13_00"); //Stop! Where d'you think you're going with our friend?
	Info_ClearChoices	(DIA_Grd_216_DustyZoll);
	Info_AddChoice		(DIA_Grd_216_DustyZoll,"That's none of your business!",DIA_Grd_216_DustyZoll_PissOff);
	Info_AddChoice		(DIA_Grd_216_DustyZoll,"We're on our way to the Brotherhood's camp.",DIA_Grd_216_DustyZoll_ToPSI);
	if (Npc_HasItems (other,itminugget) >= 100)
	{
		Info_AddChoice	(DIA_Grd_216_DustyZoll,"We're just going for a stroll. Here's 100 ore.",DIA_Grd_216_DustyZoll_LittleWalk);
	};
};

func void DIA_Grd_216_DustyZoll_PissOff()
{
	AI_Output			(other, self,"DIA_Grd_216_Dusty_Zoll_PissOff_15_00"); //That's none of your business!
	AI_Output			(self, other,"DIA_Grd_216_Dusty_Zoll_PIssOff_13_00"); //I disagree!
	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_Attack,1,"");

	B_ExchangeRoutine	(Vlk_524_Dusty,"start");
	var C_NPC dusty;	dusty = Hlp_GetNpc(Vlk_524_Dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
};

func void DIA_Grd_216_DustyZoll_ToPSI()
{
	AI_Output			(other, self,"DIA_Grd_216_Dusty_Zoll_ToPsi_15_00"); //We're on our way to the Brotherhood's camp.
	AI_Output 			(self, other,"DIA_Grd_216_Dusty_Zoll_ToPsi_13_00"); //Well, you ain't gonna get there...
	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_Attack,1,"");

	B_ExchangeRoutine	(Vlk_524_Dusty,"start");
	var C_NPC dusty;	dusty = Hlp_GetNpc(Vlk_524_Dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
};

func void DIA_Grd_216_DustyZoll_LittleWalk()
{
	AI_Output				(other, self,"DIA_Grd_216_Dusty_Zoll_LittleWalk_15_00"); //We're just going for a stroll. Here's 100 ore.
	if (Npc_HasItems (hero,itminugget) >= 100)
	{
		AI_Output			(self, other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_00"); //I never saw anything.

		B_GiveInvItems	(hero, self, ItMiNugget, 100);
		DIA_Grd_216_DustyZoll.permanent = 0;
		B_LogEntry			(CH1_RecruitDusty,"I managed to bribe the guards at the rear south gate. Everyone has a price!");
		B_GiveXP			(XP_BribedDustyGuard);
		
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_02"); //Are you having me on? You won't get off that easy, kid!
		AI_StopProcessInfos	(self);
		Npc_SetTarget		(self,other);
		AI_StartState		(self,ZS_Attack,1,"");

		B_ExchangeRoutine	(Vlk_524_Dusty,"start");
		var C_NPC dusty;	dusty = Hlp_GetNpc(Vlk_524_Dusty);
		dusty.aivar[AIV_PARTYMEMBER] = FALSE;
		dusty.flags = 0;	// Immortal löschen
	};
};

//-------------------------------------------------------
// WEGEN AUFNAHME GARDIST ZU THORUS SCHICKEN
//-------------------------------------------------------
instance GRD_216_Torwache_SEETHORUS (C_INFO)
{
	npc				= GRD_216_Torwache;
	condition		= GRD_216_Torwache_SEETHORUS_Condition;
	information		= GRD_216_Torwache_SEETHORUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_216_Torwache_SEETHORUS_Condition()
{	
	if  (! Npc_KnowsInfo (hero,GRD_214_TORWACHE_SEETHORUS))
	&&  ((CorKalom_BringMCQBalls == LOG_SUCCESS) || (Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3))
	&& 	(! Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	 
	{
		return TRUE;
	};
};

func void  GRD_216_Torwache_SEETHORUS_Info()
{
	AI_Output (self, other,"Grd_216_Torwache_SEETHORUS_Info_13_01"); //Hey, I'm glad you showed up. Thorus wants to see you!
	AI_Output (other, self,"Grd_216_Torwache_SEETHORUS_Info_15_02"); //What does he want?
	AI_Output (self, other,"Grd_216_Torwache_SEETHORUS_Info_13_03"); //Why, I'm sure he'll tell you soon enough.
};
