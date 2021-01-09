// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Grd_13_EXIT_Condition;
	information	= Info_Mine_Grd_13_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Mine_Grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Grd_13_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_Mine_Condition;
	information	= Info_Mine_Grd_13_Mine_Info;
	permanent	= 1;
	description = "Was läuft in der Mine?";
};                       

FUNC INT Info_Mine_Grd_13_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_Mine_15_00"); //Was läuft in der Mine?
	AI_Output(self,other,"Info_Mine_Grd_13_Mine_13_01"); //Die Mine ist das Herz des Alten Lagers. Ohne Mine kein Erz, ohne Erz keine Waren. Alles klar?
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_WichtigePersonen_Condition;
	information	= Info_Mine_Grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Mine_Grd_13_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Mine_Grd_13_WichtigePersonen_13_01"); //Asghan ist unser Chef. Aber lass ihn bloß in Ruhe. Für Typen wie dich ist Ian zuständig.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_DasLager_Condition;
	information	= Info_Mine_Grd_13_DasLager_Info;
	permanent	= 1;
	description = "Erzähl mir was über die Crawler";
};                       

FUNC INT Info_Mine_Grd_13_DasLager_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DasLager_15_00"); //Erzähl mir was über die Crawler.
	AI_Output(self,other,"Info_Mine_Grd_13_DasLager_13_01"); //Die Bruderschaft bezahlt das Alte Lager mit Sumpfkraut, damit sie hier in der Mine die Crawler jagen dürfen.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Grd_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_13_DieLage_Condition;
	information	= Info_Mine_Grd_13_DieLage_Info;
	permanent	= 1;
	description = "Wie läuft's?";
};                       

FUNC INT Info_Mine_Grd_13_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_13_DieLage_15_00"); //Wie läuft's?
	AI_Output(self,other,"Info_Mine_Grd_13_DieLage_13_01"); //Hab schon lange keinen Kampf mehr gehabt!
	
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_grd_13(var c_NPC slf)
{
	
	
	Info_Mine_Grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
