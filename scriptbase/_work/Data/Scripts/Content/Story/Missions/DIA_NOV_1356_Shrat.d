// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Shrat_Exit (C_INFO)
{
	npc			=  Nov_1356_Shrat;
	nr			=  999;
	condition	=  DIA_Shrat_Exit_Condition;
	information	=  DIA_Shrat_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Shrat_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance  DIA_Shrat_WhyHere (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_WhyHere_Condition;
	information	= DIA_Shrat_WhyHere_Info;
	permanent	= 0;
	description	= "What are you doing here?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //What are you doing here?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Did I give you permission to speak to me?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //Only joking! Those damned loonies are getting on my nerves, that's why I'm here!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //Don't speak to me!' - 'Pray for forgiveness by the Sleeper!' - 'Your mission is of extraordinary importance!'
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //It's enough to drive a man out of his mind - no wonder they're all crazed round here.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //I'm Shrat, novice of the first rank - and that's who I'll always remain!
};

// **************************************************
//				Hilfe bei Join PSI ??
// **************************************************

instance DIA_Shrat_JoinPSI (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_JoinPSI_Condition;
	information	= DIA_Shrat_JoinPSI_Info;
	permanent	= 0;
	description	= "I want to join the Brotherhood - can you help me?";
};                       

FUNC int DIA_Shrat_JoinPSI_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	{
		return 1;
	};
};

FUNC void DIA_Shrat_JoinPSI_Info()
{
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //I want to join the Brotherhood - can you help me?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //You want to join this place? I'm actually just thinking about how to get away from here.
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //We could roam the colony. Relieve a few numskulls of their money, collect some ore - what do you think?
};

// **************************************************
//					Komm mit
// **************************************************

instance DIA_Shrat_ComeWithMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_ComeWithMe_Condition;
	information	= DIA_Shrat_ComeWithMe_Info;
	permanent	= 1;
	description	= "Let's move around together! Come with me!";
};                       

FUNC int DIA_Shrat_ComeWithMe_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER]==FALSE) )
	{
		return 1;
	};
};

FUNC void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //Let's move around together! Come with me!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //Now that's what I like to hear! Let's go!

	Npc_ExchangeRoutine (self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// **************************************************
//					Verlassen
// **************************************************

instance DIA_Shrat_LeaveMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 700;
	condition	= DIA_Shrat_LeaveMe_Condition;
	information	= DIA_Shrat_LeaveMe_Info;
	permanent	= 1;
	description	= "Our paths separate here - I'll go on on my own.";
};                       

FUNC int DIA_Shrat_LeaveMe_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER]==TRUE)
	{
		return 1;
	};
};

FUNC void DIA_Shrat_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Our paths separate here - I'll go on on my own.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Okay. I'll get back to my hiding place in the swamp. Take care of yourself!

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
