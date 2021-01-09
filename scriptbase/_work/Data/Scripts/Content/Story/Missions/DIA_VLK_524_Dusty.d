// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dusty_Exit (C_INFO)
{
	npc			= Vlk_524_Dusty;
	nr			= 999;
	condition	= DIA_Dusty_Exit_Condition;
	information	= DIA_Dusty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dusty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Dusty_Hello (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Hello_Condition;
	information		= DIA_Dusty_Hello_Info;
	permanent		= 0;
	description		= "Hi! I'm new here - how's things?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Hi! I'm new here - how's things?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Go away! I've been working my ass off in the mines for the last two weeks. And what for?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Some sad lumps of ore is all I got. I had to spend most of it on food.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //I talked to Baal Parvez down there. He told me some interesting things about the Sect Camp.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //I think I'd better go there instead of slaving away for Gomez.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

INSTANCE DIA_Dusty_WhyNotLeave (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_WhyNotLeave_Condition;
	information		= DIA_Dusty_WhyNotLeave_Info;
	permanent		= 0;
	description		= "You don't like it here? Why don't you just go then?";
};

FUNC INT DIA_Dusty_WhyNotLeave_Condition()
{	
	if	 Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //You don't like it here? Why don't you just go then?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Because I'm not quite sure what to expect there. I had a pal here - his name was Melvin. He headed off to the Sect Camp a week ago.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //But since then I haven't heard of him. And as long as I don't get a message from him, I'll stay here!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, a digger from the Old Camp, is no longer satisfied with living there. He's thinking about joining the Brotherhood in the swamp.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

INSTANCE DIA_Dusty_MetMelvin (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_MetMelvin_Condition;
	information		= DIA_Dusty_MetMelvin_Info;
	permanent		= 0;
	description		= "I was in the Sect Camp and met Melvin.";
};

FUNC INT DIA_Dusty_MetMelvin_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Melvin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_MetMelvin_Info()
{
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //I was in the Sect Camp and met Melvin.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //And? What did he say?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Apparently he likes it more than getting harassed by the guards.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //Hey man! He has all the fun for himself? I have to go there. But I'll never make it out of the Camp.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Really? Why not?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //The guards have found out that I wanna leave, I guess I talk too much.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //I need at least 100 ore to bribe the guards.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

INSTANCE DIA_Dusty_Offer100Ore (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Offer100Ore_Condition;
	information		= DIA_Dusty_Offer100Ore_Info;
	permanent		= 0;
	description		= "What if I gave you the 100 ore for the guards?";
};

FUNC INT DIA_Dusty_Offer100Ore_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_MetMelvin))
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_Offer100Ore_Info()
{
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //What if I gave you the 100 ore for the guards?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //You'd do that? Why?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Well, let's say you aren't the only one who'd prefer you to hang around in the Sect Camp.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //You mean you wanna come with me?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

INSTANCE DIA_Dusty_IWouldGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_IWouldGo_Condition;
	information		= DIA_Dusty_IWouldGo_Info;
	permanent		= 0;
	description		= "I WILL go with you to the Sect Camp.";
};

FUNC INT DIA_Dusty_IWouldGo_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_IWouldGo_Info()
{
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //I WILL go with you to the Sect Camp.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //Great, man! I'm ready. We can start as soon as you want.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //But don't forget - we need 100 ore for the guards.

	B_LogEntry	(CH1_RecruitDusty,"I managed to convince the digger Dusty to join the Brotherhood in the swamp camp. But I'll have to bribe the guards with some ore. It'll be best if I take him straight to Baal Tondral.");
	B_GiveXP	(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

INSTANCE DIA_Dusty_LetsGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_LetsGo_Condition;
	information		= DIA_Dusty_LetsGo_Info;
	permanent		= 1;
	description		= "I'm ready - let's go!";
};

FUNC INT DIA_Dusty_LetsGo_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_IWouldGo))
	&&	(Npc_GetDistToWP(hero, "OCR_MAINGATE_INSIDE") > 1500)
	&&	(Npc_GetDistToWP(hero, "OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_LetsGo_Info()
{
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //I'm ready - let's go!
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Okay - let's take the south gate - the north gate is of no use, it's impossible to bribe the guards there.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //And perhaps you should see to the ore - I'm not very good at that kind of thing.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Okay - let's move!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty warned me not to use the main gate in the north. It seems to be easier to bribe the guards at the gate to the south.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

