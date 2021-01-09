// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Wie kann ich dem Sch�rferbund beitreten?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //Wie kann ich dem Sch�rferbund beitreten?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Bei uns mitmachen? Glaub blo� nicht, hier wird nicht gearbeitet, nur weil man uns nicht zwingt.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Also wenn du glaubst, du kannst hier faulenzen, dann bist du schief gewickelt, mein Freund.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Wenn du jetzt immer noch glaubst hier richtig zu sein, dann rede mal mit Swiney. Er ist der Sch�rfer, der den ganzen Tag rumsteht und raucht.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Das Sagen? Sieh dich doch mal um. Bestimmt nicht die Leute, die den ganzen Tag schuften, um genug Erz zu f�rdern.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "Was ist das hier?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Was ist das hier?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //Wie sieht es denn aus? Wie der Palast des K�nigs?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Also wenn du wirklich in der Freien Mine arbeiten willst, dann wirst du erst hier im Kessel beweisen m�ssen, dass wir dich gebrauchen k�nnen.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //Wie soll's schon aussehen? Beschissen wie immer. Kaum was zu bei�en, daf�r immer was zu tun.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Der Einzige von uns, der nicht so viel zu tun hat, ist Swiney. Okyl hat ihn zum Sprecher f�r uns Sch�rfer benannt. Jetzt steht er den ganzen Tag rum und passt auf, dass er keine Blasen an den H�nden kriegt.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
