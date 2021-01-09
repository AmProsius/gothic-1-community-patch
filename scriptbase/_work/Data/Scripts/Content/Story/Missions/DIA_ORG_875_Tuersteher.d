// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Org_875_EXIT (C_INFO)
{
	npc			= Org_875_Tuersteher;
	nr			= 999;
	condition	= DIA_Org_875_EXIT_Condition;
	information	= DIA_Org_875_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Org_875_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Org_875_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Org_875_PERM (C_INFO)
{
	npc			= Org_875_Tuersteher;
	nr			= 1;
	condition	= DIA_Org_875_PERM_Condition;
	information	= DIA_Org_875_PERM_Info;
	permanent	= 1;
	description = "You only let in rogues and scrapers?";
};                       

FUNC INT DIA_Org_875_PERM_Condition()
{
	return 1;
};

FUNC VOID DIA_Org_875_PERM_Info()
{	
	AI_Output (other, self,"DIA_Org_875_PERM_15_00"); //You only let in rogues and scrapers?
	AI_Output (self, other,"DIA_Org_875_PERM_13_01"); //We don't mind the sect brothers either.
	AI_Output (self, other,"DIA_Org_875_PERM_13_02"); //But apart from that, nobody gets in here.
};
