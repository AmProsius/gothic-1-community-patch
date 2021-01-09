// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_5_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_5 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_5_EXIT_Condition;
	information	= Info_Nov_5_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};

FUNC INT Info_Nov_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_5_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_5_EinerVonEuchWerden_Condition;
	information	= Info_Nov_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Wie werde ich in diesem Lager aufgenommen?";
};

FUNC INT Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00"); //Wie werde ich in diesem Lager aufgenommen?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01"); //Nichts leichter als das. Rede einfach mit einigen der niederen Gurus. Sie werden dir weiterhelfen.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02"); //Es wird dir hier gefallen - wirst schon sehen.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_5_WichtigePersonen_Condition;
	information	= Info_Nov_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};

FUNC INT Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01"); //Die Gurus haben alles unter Kontrolle. Aber wenn man nicht auffällt, lassen sie einen in Ruhe.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_5_DasLager_Condition;
	information	= Info_Nov_5_DasLager_Info;
	permanent	= 1;
	description = "Was kannst du mit über dieses Lager erzählen?";
};

FUNC INT Info_Nov_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00"); //Was kannst du mir über dieses Lager erzählen?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01"); //Es ist der beste Ort, an dem du in dieser gottverdammten Kolonie sein kannst.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02"); //Selbst wenn du nicht an die Lehren des Schläfers glaubst, bekommst du deine tägliche Ration Essen und Sumpfkraut. Du brauchst nur zu Fortuno zu gehen.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03"); //Und wo finde ich den?
	AI_Output(other,self,"Info_Nov_5_DasLager_05_04"); //Unten an Cor Kaloms Labor. In der Nähe des großen Tempelplatzes.

	var C_NPC CorKalom;		CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_5_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_5_DieLage_Condition;
	information	= Info_Nov_5_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};

FUNC INT Info_Nov_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01"); //Kann mich nicht beklagen. Bist du neu hier?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02"); //Ich bin vor kurzem angekommen.
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_5(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);

	Info_Nov_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
