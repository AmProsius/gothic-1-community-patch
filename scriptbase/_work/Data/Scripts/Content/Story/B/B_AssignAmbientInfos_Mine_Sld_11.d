// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Sld_11_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_Mine_Sld_11_EXIT_Condition;
	information	= Info_Mine_Sld_11_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Mine_Sld_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Mine_Sld_11_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Sld_11_EinerVonEuchWerden_Condition;
	information	= Info_Mine_Sld_11_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Wie kann ich bei Euch mitmachen?";
};                       

FUNC INT Info_Mine_Sld_11_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};	

FUNC VOID Info_Mine_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00"); //Wie kann ich bei euch mitmachen?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01"); //Um hier mitzumachen, musst du erst einen Namen haben.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02"); //Beweise dich erst einmal woanders, dann darfst du auch im Kessel Dienst tun.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Sld_11_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Sld_11_WichtigePersonen_Condition;
	information	= Info_Mine_Sld_11_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer erteilt hier die Befehle?";
};                       

FUNC INT Info_Mine_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00"); //Wer erteilt hier die Befehle?
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01"); //Hier im Kessel läuft alles über Okyl. Er steht mit den wichtigen Leuten im Lager im Kontakt.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02"); //Also wenn du hier Mist baust, werden auch die Wassermagier im Neuen Lager davon erfahren.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Sld_11_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Sld_11_DasLager_Condition;
	information	= Info_Mine_Sld_11_DasLager_Info;
	permanent	= 1;
	description = "Gibt´s hier irgendwas besonderes?";
};                       

FUNC INT Info_Mine_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00"); //Gibt's hier irgendwas besonderes?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01"); //Hier gibt's nichts außer ´ne ganze Menge Ärger, wenn man uns dumm kommt.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02"); //Ach ja, wer versucht ohne Genehmigung in die Mine oder ins Torhaus zu kommen, bekommt auch Ärger.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Sld_11_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Sld_11_DieLage_Condition;
	information	= Info_Mine_Sld_11_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht´s aus?";
};                       

FUNC INT Info_Mine_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01"); //Ruhig, für meinen Geschmack etwas zu ruhig.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Sld_11(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);
	
	Info_Mine_Sld_11_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DieLage.npc				= Hlp_GetInstanceID(slf);
};
