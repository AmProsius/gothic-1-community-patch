// ************************************************************
// 								EXIT
// ************************************************************

INSTANCE Info_GRD_276_Exit (C_INFO)
{
	npc			= GRD_276_Brueckenwache;
	nr			= 999;
	condition	= Info_GRD_276_Exit_Condition;
	information	= Info_GRD_276_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_GRD_276_Exit_Condition()
{
	return 1;
};

FUNC VOID Info_GRD_276_Exit_Info()
{
	AI_StopProcessInfos(self);
};

// *****************************************************************
// 								Hi
// *****************************************************************

INSTANCE Info_GRD_276_Tips(C_INFO)
{
	npc			= GRD_276_Brueckenwache;
	nr			= 1;
	condition	= Info_GRD_276_Tips_Condition;
	information	= Info_GRD_276_Tips_Info;
	permanent	= 0;
	description = "Hi! I'm new here.";
};                       

FUNC INT Info_GRD_276_Tips_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_GRD_276_Tips_Info()
{
	AI_Output (other,self,"Info_GRD_276_Tips_15_00"); //Hi! I'm new here.
	AI_Output (self,other,"Info_GRD_276_Tips_07_01"); //How nice for you.
};

// *****************************************************************
// 								Tips
// *****************************************************************

INSTANCE Info_GRD_276_Bla(C_INFO)
{
	npc			= GRD_276_Brueckenwache;
	nr			= 2;
	condition	= Info_GRD_276_Bla_Condition;
	information	= Info_GRD_276_Bla_Info;
	permanent	= 1;
	description = "Is that the Old Camp over there?";
};                       

FUNC INT Info_GRD_276_Bla_Condition()
{
	if (Npc_KnowsInfo(hero, Info_GRD_276_Tips))
	{
		return 1;
	};
};

FUNC VOID Info_GRD_276_Bla_Info()
{
	AI_Output (other,self,"Info_GRD_276_Bla_15_00"); //Is that the Old Camp over there?
	AI_Output (self,other,"Info_GRD_276_Bla_07_01"); //No, that's the New Camp. The Old Camp is underneath the bridge.
	AI_StopProcessInfos(self);
};
