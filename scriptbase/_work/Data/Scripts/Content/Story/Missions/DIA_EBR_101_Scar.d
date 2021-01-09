// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "Who are you?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Who are you?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //They call me Scar.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "What's your job?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //What's your job?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Me and Arto make sure nobody gets to see Gomez unless they're invited.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //And I make sure the women don't get restless.
};

// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_SCAR_Frau (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Frau_Condition;
	information	= DIA_SCAR_Frau_Info;
	permanent	= 0;
	description = "When they threw me in here, I saw a woman being brought down...";
};                       

FUNC INT DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Frau_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //When they threw me in here, I saw a woman being brought down with the goods.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //So what?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Is she here?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Look, in case you're interested in her, let me give you some advice: Forget her.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //She's only just got here and Gomez has her locked in his room.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //When he's done with her, he might just send her down. But for now, she's HIS - so you'd better take your mind off her.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 1;
	description = "Is there anything you can tell me about Gomez?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Is there anything you can tell me about Gomez?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //All you need to know is that he's the most powerful man in the colony.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //He gets what he wants, but all he really wants is power.
};

