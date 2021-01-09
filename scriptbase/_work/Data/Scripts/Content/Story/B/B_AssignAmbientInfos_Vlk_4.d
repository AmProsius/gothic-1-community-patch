// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_4_EXIT_Condition;
	information	= Info_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Danke. Mach's gut.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Halt die Ohren steif, Junge.
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_4_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_4_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Was muß ich tun, um in diesem Lager aufgenommen zu werden?";
};                       

FUNC INT Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_4_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Was muss ich tun, um in diesem Lager aufgenommen zu werden?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //Als Schatten oder Gardist meinst du? Das wird nicht leicht, Junge. Du wirst einige Prüfungen bestehen müssen, bevor der alte Thorus dich Gomez vorstellt.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //Und du musst dich mit den Leuten hier gut stellen. Aber solange du keinem Lager angehörst, nimmt dich keiner ernst.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Wenn ich du wäre, würde ich mich bei den Schatten umhören. Unter ihnen findest du noch am ehesten einen, der dir hilft. Natürlich nur für eine Gegenleistung.
	
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Gibt es hier Leute, die ich kennen sollte?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Gibt es hier Leute, die ich kennen sollte?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Als Neuer solltest du's dir nicht mit Gravo verscherzen. Er ist zwar nur ein Buddler, aber er hat Beziehungen bis zu den Erzbaronen.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Wenn du mal ein Problem mit Gomez' Leuten hast, kann er dir helfen dich freizukaufen.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_4_DasLager_Condition;
	information	= Info_Vlk_4_DasLager_Info;
	permanent	= 1;
	description = "Was gibt es hier für wichtige Orte?";
};                       

FUNC INT Info_Vlk_4_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Was gibt es hier für wichtige Orte?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Wenn du keine Lust hast, in den Minen zu schuften, solltest du dich am Eingangsplatz zwischen Nordtor und Burgtor rumtreiben.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Wenn du Glück hast, gibt Thorus oder Diego dir 'ne Aufgabe - dann kannst du dich bewähren. Ist bestimmt nicht schlecht, zu Gomez' Leuten zu gehören.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Oder du hast das Glück einen Magier zu treffen. Sie wollen manchmal, dass du einen Botengang für sie erledigst. Sie zahlen immer gut.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Die Magier kommen aus der Burg raus? Wann?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Was weiß ich. Frag die Leute, die da wohnen.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_4_DieLage_Condition;
	information	= Info_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "Alles klar?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Alles klar?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //So klar wie vor 20 Jahren. Und seitdem hat sich hier nicht viel verändert.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_4(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc				= Hlp_GetInstanceID(slf);
};
