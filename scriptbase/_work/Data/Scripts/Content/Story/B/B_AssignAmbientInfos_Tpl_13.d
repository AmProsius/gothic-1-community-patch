// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Tpl_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Tpl_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Tpl_13_EXIT_Condition;
	information	= Info_Tpl_13_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Tpl_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Tpl_13_EinerVonEuchWerden_Condition;
	information	= Info_Tpl_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Ich will ein Templer werden - so wie du.";
};                       

FUNC INT Info_Tpl_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) != GIL_TPL)
	&& (!C_NpcBelongsToNewCamp (other))
	&& (!C_NpcBelongsToOldCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Tpl_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Tpl_13_EinerVonEuchWerden_15_00"); //Ich will ein Templer werden - so wie du.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_01"); //Hast du eine Ahnung wie viele Entbehrungen ich auf mich nehmen musste, um den Auserwählten des Schläfers als Tempelwächter dienen zu dürfen?
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_02"); //Glaub bloß nicht, du kannst hier einfach reinspazieren und bekommst so mir nichts dir nichts die höchsten Auszeichnungen.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_03"); //Bevor du überhaupt darüber nachdenkst, solltest du dich mit der Lehre des Schläfers vertraut machen.
	AI_Output(self,other,"Info_Tpl_13_EinerVonEuchWerden_13_04"); //Das wird einige Zeit in Anspruch nehmen und es wird dir auch sicher die Flausen aus dem Kopf treiben.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_13_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Tpl_13_WichtigePersonen_Condition;
	information	= Info_Tpl_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Tpl_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Tpl_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Tpl_13_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Tpl_13_WichtigePersonen_13_01"); //Unsere Gurus sind die Auserwählten des Schläfers! Der Schläfer bestimmt unser Schicksal und die Gurus verkünden es uns.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Tpl_13_DasLager_Condition;
	information	= Info_Tpl_13_DasLager_Info;
	permanent	= 1;
	description = "Ich würde gerne mal in den Tempel des Schläfers gehen...";
};                       

FUNC INT Info_Tpl_13_DasLager_Condition()
{	
	if (Kapitel <= 1) 
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DasLager_15_00"); //Ich würde gerne mal in den Tempel des Schläfers gehen ...
	AI_Output(self,other,"Info_Tpl_13_DasLager_13_01"); //Undenkbar! Ein Ungläubiger im Tempel! Bevor du dich nicht in den Dienst des Schläfers gestellt hast, wird dir der Zutritt zum Tempel verwehrt bleiben!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Tpl_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Tpl_13_DieLage_Condition;
	information	= Info_Tpl_13_DieLage_Info;
	permanent	= 1;
	description = "Wie läuft's?";
};                       

FUNC INT Info_Tpl_13_DieLage_Condition()
{	
	if (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_Tpl_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_00"); //Wie läuft's?
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_01"); //Seit ich ein auserwählter Beschützer des Glaubens bin, fühle ich mich besser als je zuvor in meinem Leben.
	AI_Output(other,self,"Info_Tpl_13_DieLage_15_02"); //Hört sich wichtig an ...
	AI_Output(self,other,"Info_Tpl_13_DieLage_13_03"); //Du bist ein Ungläubiger. Du verstehst davon nichts.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_13(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Tpl_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Tpl_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Tpl_13_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Tpl_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
