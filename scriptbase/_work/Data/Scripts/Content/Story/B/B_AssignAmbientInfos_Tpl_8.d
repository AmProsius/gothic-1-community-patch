// *************************************************************************
//                                  Kapitel 1
// *************************************************************************


// *************************************************************************
//                                  EXIT
// *************************************************************************

INSTANCE Info_Tpl_8_EXIT(C_INFO)
{
    // npc wird in B_AssignAmbientInfos_Tpl_8 (s.u.) jeweils gesetzt
    nr          = 999;
    condition   = Info_Tpl_8_EXIT_Condition;
    information = Info_Tpl_8_EXIT_Info;
    permanent   = 1;
    description = "ENDE";
};

FUNC INT Info_Tpl_8_EXIT_Condition()
{
    return 1;
};

FUNC VOID Info_Tpl_8_EXIT_Info()
{
    AI_StopProcessInfos (self);
};

// *************************************************************************
//                              Einer von Euch werden
// *************************************************************************

INSTANCE Info_Tpl_8_EinerVonEuchWerden (C_INFO) // E1
{
    nr          = 4;
    condition   = Info_Tpl_8_EinerVonEuchWerden_Condition;
    information = Info_Tpl_8_EinerVonEuchWerden_Info;
    permanent   = 1;
    description = "Könnt ihr noch einen guten Mann brauchen?";
};

FUNC INT Info_Tpl_8_EinerVonEuchWerden_Condition()
{
    if (Npc_GetTrueGuild(other) != GIL_TPL)
    && (!C_NpcBelongsToNewCamp (other))
    && (!C_NpcBelongsToOldCamp (other))
    {
        return TRUE;
    };
};

FUNC VOID Info_Tpl_8_EinerVonEuchWerden_Info()
{
    AI_Output(other,self,"Info_Tpl_8_EinerVonEuchWerden_15_00"); //Könnt ihr noch einen guten Mann brauchen?
    AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_01"); //Gute Leute suchen wir immer. Aber du wirst hart an dir arbeiten müssen. Erst ein fortgeschrittener Novize kann zum Templer befördert werden.
    AI_Output(self,other,"Info_Tpl_8_EinerVonEuchWerden_08_02"); //Es ist die höchste Ehre für einen Anhänger der Bruderschaft des Schläfers.
};

// *************************************************************************
//                          Wichtige Personen
// *************************************************************************

INSTANCE Info_Tpl_8_WichtigePersonen(C_INFO)
{
    nr          = 3;
    condition   = Info_Tpl_8_WichtigePersonen_Condition;
    information = Info_Tpl_8_WichtigePersonen_Info;
    permanent   = 1;
    description = "Wer hat hier das Sagen?";
};

FUNC INT Info_Tpl_8_WichtigePersonen_Condition()
{
    return 1;
};

FUNC VOID Info_Tpl_8_WichtigePersonen_Info()
{
    AI_Output(other,self,"Info_Tpl_8_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
    AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_01"); //Wir tun alles, was uns die Gurus sagen. Es ist unsere Pflicht, ihnen zu dienen.
    AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_15_02"); //Wer sind eure Gurus?
    AI_Output(self,other,"Info_Tpl_8_WichtigePersonen_08_03"); //Y'Berion der Erleuchtete ist der Oberste Guru. Unter ihm folgen Cor Kalom und Cor Angar und noch einige weitere.
    var C_NPC YBerion;      YBerion = Hlp_GetNpc(Gur_1200_Yberion);
    var C_NPC CorKalom;     CorKalom= Hlp_GetNpc(Gur_1201_CorKalom);
    var C_NPC CorAngar;     CorAngar= Hlp_GetNpc(Gur_1202_CorAngar);
    YBerion.aivar[AIV_FINDABLE] = TRUE;
    CorKalom.aivar[AIV_FINDABLE] = TRUE;
    CorAngar.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
//                              Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Tpl_8_DasLager(C_INFO)
{
    nr          = 2;
    condition   = Info_Tpl_8_DasLager_Condition;
    information = Info_Tpl_8_DasLager_Info;
    permanent   = 1;
    description = "Was kannst du mir über dieses Lager erzählen?";
};

FUNC INT Info_Tpl_8_DasLager_Condition()
{
    if (!C_NpcBelongsToPsiCamp (other))
    {
        return 1;
    };
};

FUNC VOID Info_Tpl_8_DasLager_Info()
{
    AI_Output(other,self,"Info_Tpl_8_DasLager_15_00"); //Was kannst du mir über dieses Lager erzählen?
    AI_Output(self,other,"Info_Tpl_8_DasLager_08_01"); //Als Neuling darfst du dich fast überall aufhalten. Aber es ist Ungläubigen untersagt, den Tempel des Schläfers zu betreten.
    AI_Output(other,self,"Info_Tpl_8_DasLager_08_02"); //Also halt dich nur da auf, wo es dir gestattet ist. Und störe nicht unsere Meister bei der Meditation.
};

// *************************************************************************
//                                  Die Lage
// *************************************************************************

INSTANCE Info_Tpl_8_DieLage(C_INFO) // E1
{
    nr          = 1;
    condition   = Info_Tpl_8_DieLage_Condition;
    information = Info_Tpl_8_DieLage_Info;
    permanent   = 1;
    description = "Wie sieht's aus?";
};

FUNC INT Info_Tpl_8_DieLage_Condition()
{
    if (!C_NpcBelongsToPsiCamp (other))
    {
        return 1;
    };
};

FUNC VOID Info_Tpl_8_DieLage_Info()
{
    AI_Output(other,self,"Info_Tpl_8_DieLage_15_00"); //Wie sieht's aus?
    AI_Output(self,other,"Info_Tpl_8_DieLage_08_01"); //Ich warne dich. Sei nicht respektlos. Du redest mit einem Auserwählten Beschützer der Propheten.
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Tpl_8(var c_NPC slf)
{
    B_AssignFindNpc_ST(slf);

    Info_Tpl_8_EXIT.npc                 = Hlp_GetInstanceID(slf);
    Info_Tpl_8_EinerVonEuchWerden.npc   = Hlp_GetInstanceID(slf);
    Info_Tpl_8_WichtigePersonen.npc     = Hlp_GetInstanceID(slf);
    Info_Tpl_8_DasLager.npc             = Hlp_GetInstanceID(slf);
    Info_Tpl_8_DieLage.npc              = Hlp_GetInstanceID(slf);
};
