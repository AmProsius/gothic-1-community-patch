// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_ORG_830_EXIT (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 999;
	condition	= Info_ORG_830_EXIT_Condition;
	information	= Info_ORG_830_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_ORG_830_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_830_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_ORG_830_Hello (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 1;
	condition	= Info_ORG_830_Hello_Condition;
	information	= Info_ORG_830_Hello_Info;
	permanent	= 0;
	description	= "Hi! I'm new here.";
};                       

FUNC INT Info_ORG_830_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_830_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_830_Hello_15_00"); //Hi! I'm new here.
	AI_Output (self, other,"Info_ORG_830_Hello_13_01"); //So what?
};

// ************************************************************
// 						Was machst du hier?
// ************************************************************

INSTANCE Info_ORG_830_What (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 1;
	condition	= Info_ORG_830_What_Condition;
	information	= Info_ORG_830_What_Info;
	permanent	= 0;
	description	= "What are you doing?";
};                       

FUNC INT Info_ORG_830_What_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_ORG_830_What_Info()
{	
	AI_Output (other, self,"Info_ORG_830_What_15_00"); //What are you doing?
	AI_Output (self, other,"Info_ORG_830_What_13_01"); //What's it look like? I'm smoking.
	AI_Output (self, other,"Info_ORG_830_What_13_02"); //If you think I'll let you have a drag... Forget it!
};

// ************************************************************
// 						Aufhalten
// ************************************************************

INSTANCE Info_ORG_830_Aufhalten (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 2;
	condition	= Info_ORG_830_Aufhalten_Condition;
	information	= Info_ORG_830_Aufhalten_Info;
	permanent	= 0;
	description	= "Aren't you going to try and stop me? Ask me what or something?";
};                       

FUNC INT Info_ORG_830_Aufhalten_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_ORG_830_Aufhalten_Info()
{	
	AI_Output (other, self,"Info_ORG_830_Aufhalten_15_00"); //Aren't you going to try and stop me? Ask me what or something?
	AI_Output (self, other,"Info_ORG_830_Aufhalten_13_01"); //No. That's too much trouble for me. Besides, someone like you won't do much damage in there.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_ORG_830_Perm (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 3;
	condition	= Info_ORG_830_Perm_Condition;
	information	= Info_ORG_830_Perm_Info;
	permanent	= 1;
	description	= "What's it like inside?";
};                       

FUNC INT Info_ORG_830_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_ORG_830_Perm_Info()
{	
	AI_Output (other, self,"Info_ORG_830_Perm_15_00"); //What's it like inside?
	AI_Output (self, other,"Info_ORG_830_Perm_13_01"); //Like always - calm, just a couple of brawls.
};
