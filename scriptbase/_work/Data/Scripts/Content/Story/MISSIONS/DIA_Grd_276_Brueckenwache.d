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
	description = "Hi! Ich bin neu hier.";
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
	AI_Output (other,self,"Info_GRD_276_Tips_15_00"); //Hi! Ich bin neu hier.
	AI_Output (self,other,"Info_GRD_276_Tips_07_01"); //Schön für dich.
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
	description = "Ist das da hinten das Alte Lager?";
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
	AI_Output (other,self,"Info_GRD_276_Bla_15_00"); //Ist das da hinten das Alte Lager?
	AI_Output (self,other,"Info_GRD_276_Bla_07_01"); //Nein, das ist das Neue Lager. Das Alte Lager liegt unter der Brücke.
	AI_StopProcessInfos(self);
};
