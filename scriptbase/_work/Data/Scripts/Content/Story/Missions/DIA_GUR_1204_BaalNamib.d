// ************************************************************
//                          EXIT
// ************************************************************

INSTANCE DIA_BaalNamib_EXIT(C_INFO)
{
    npc             = GUR_1204_BaalNamib;
    nr              = 999;
    condition       = DIA_BaalNamib_EXIT_Condition;
    information     = DIA_BaalNamib_EXIT_Info;
    permanent       = 1;
    description     = DIALOG_ENDE;
};

FUNC INT DIA_BaalNamib_EXIT_Condition()
{
    return 1;
};

FUNC VOID DIA_BaalNamib_EXIT_Info()
{
    AI_StopProcessInfos (self);
};

// ************************************************************
//                  NICHT ansprechbar (Ungläubiger)
// ************************************************************
// ************************************************************

INSTANCE DIA_BaalNamib_NoTalk(C_INFO)
{
    npc             = GUR_1204_BaalNamib;
    nr              = 1;
    condition       = DIA_BaalNamib_NoTalk_Condition;
    information     = DIA_BaalNamib_NoTalk_Info;
    permanent       = 1;
    important       = 1;
};

FUNC INT DIA_BaalNamib_NoTalk_Condition()
{
    if ( Npc_IsInState(self,ZS_TALK) && (BaalNamib_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) )
    {
        return 1;
    };
};

FUNC VOID DIA_BaalNamib_NoTalk_Info()
{
    Info_ClearChoices   (DIA_BaalNamib_NoTalk);
    Info_Addchoice      (DIA_BaalNamib_NoTalk,DIALOG_ENDE                   ,DIA_BaalNamib_NoTalk_ENDE);
    Info_Addchoice      (DIA_BaalNamib_NoTalk,"Alles, klar, Alter?"         ,DIA_BaalNamib_NoTalk_Imp);
    Info_Addchoice      (DIA_BaalNamib_NoTalk,"Der Schläfer sei mit dir!"   ,DIA_BaalNamib_NoTalk_Sleeper);
    Info_Addchoice      (DIA_BaalNamib_NoTalk,"Hi! Ich bin neu hier!"       ,DIA_BaalNamib_NoTalk_Hi);
};

func void DIA_BaalNamib_NoTalk_Hi()
{
    AI_Output (other, self,"DIA_BaalNamib_NoTalk_Hi_15_00"); //Hi! Ich bin neu hier!
    AI_Output (self, other,"DIA_BaalNamib_NoTalk_Hi_02_01"); //
    BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Sleeper()
{
    AI_Output (other, self,"DIA_BaalNamib_NoTalk_Sleeper_15_00"); //Der Schläfer sei mit dir!
    AI_Output (self, other,"DIA_BaalNamib_NoTalk_Sleeper_02_01"); //
    BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_Imp()
{
    AI_Output (other, self,"DIA_BaalNamib_NoTalk_Imp_15_00"); //Alles, klar, Alter?
    AI_Output (self, other,"DIA_BaalNamib_NoTalk_Imp_02_01"); //
    BaalNamib_Sakrileg = TRUE;
};

func void DIA_BaalNamib_NoTalk_ENDE()
{
    AI_StopProcessInfos (self);
};

// ************************************************************
//                  BN spricht dich an
// ************************************************************

INSTANCE DIA_BaalNamib_FirstTalk(C_INFO)
{
    npc             = GUR_1204_BaalNamib;
    nr              = 1;
    condition       = DIA_BaalNamib_FirstTalk_Condition;
    information     = DIA_BaalNamib_FirstTalk_Info;
    permanent       = 0;
    important       = 1;
};

FUNC INT DIA_BaalNamib_FirstTalk_Condition()
{
    if (BaalNamib_Ansprechbar==TRUE)
    {
        return 1;
    };
};

FUNC VOID DIA_BaalNamib_FirstTalk_Info()
{
    AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_00"); //
    AI_Output (self, other,"DIA_BaalNamib_FirstTalk_02_01"); //Der Schläfer hat dich erwählt. Ist es dir wirklich ernst mit deinem Wunsch, uns beizutreten?

    Info_ClearChoices   (DIA_BaalNamib_FirstTalk);
    Info_AddChoice      (DIA_BaalNamib_FirstTalk,"NICHTS SAGEN"                                     ,DIA_BaalNamib_FirstTalk_Mute);
    Info_AddChoice      (DIA_BaalNamib_FirstTalk,"Ja, ich will den Weg des Schläfers beschreiten!"  ,DIA_BaalNamib_FirstTalk_Sleeper);
};

func void DIA_BaalNamib_FirstTalk_Mute()
{
    AI_Output (other, self,"DIA_BaalNamib_FirstTalk_Mute_15_00"); //
    AI_Output (self, other,"DIA_BaalNamib_FirstTalk_Mute_02_01"); //Nun?
};

func void DIA_BaalNamib_FirstTalk_Sleeper()
{
    AI_Output           (other, self,"DIA_BaalNamib_FirstTalk_Sleeper_15_00"); //Ja, ich will den Weg des Schläfers beschreiten!
    AI_Output           (self, other,"DIA_BaalNamib_FirstTalk_Sleeper_02_01"); //Geh zu Cor Kalom. Sag ihm, ich schicke ihm einen wahren Anhänger des Glaubens!
    Info_ClearChoices   (DIA_BaalNamib_FirstTalk);

    B_LogEntry          (CH1_JoinPsi,   "Lester's Schauspiel hat funktioniert. Baal Namib hat mir mir gesprochen und ist überzeugt, dass ich nun ein wahrer Anhänger des Glaubens bin. Ich soll nun den Guru Cor Kalom in seinem Alchemielabor aufsuchen!");
    B_GiveXP            (XP_ImpressBaalNamib);
};

//-----------------------------------------------------
// BESSERE RÜSTUNG NOVIZEN
//-----------------------------------------------------
instance  GUR_1204_BaalNamib_ARMOR (C_INFO)
{
    npc             = GUR_1204_BaalNamib;
    condition       = GUR_1204_BaalNamib_ARMOR_Condition;
    information     = GUR_1204_BaalNamib_ARMOR_Info;
    important       = 0;
    permanent       = 1;
    description     = "Ich möchte eine bessere Rüstung haben.";
};

FUNC int  GUR_1204_BaalNamib_ARMOR_Condition()
{
    if (Npc_GetTrueGuild (hero) == GIL_NOV)
    && (!Npc_HasItems (hero,NOV_ARMOR_H))
    {
        return TRUE;
    };

};
FUNC void  GUR_1204_BaalNamib_ARMOR_Info()
{
    AI_Output (hero,self,"GUR_1204_BaalNamib_ARMOR_Info_15_01");//Ich möchte eine bessere Rüstung haben.

    if (Kapitel < 3)
    {
        AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_02");//Es ist noch nicht an der Zeit für dich, die schwere Rüstung der Novizen zu tragen.
    }
    else if (Npc_HasItems (hero, ItMinugget) < VALUE_NOV_ARMOR_H )
    {
        AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_03");//Komm wieder, wenn du genug Erz hast.
    }
    else
    {
        AI_Output (self,other,"GUR_1204_BaalNamib_ARMOR_Info_02_04");//Diese Rüstung schützt deinen Körper, wie der Schläfer deinen Geist schützt!
        CreateInvItem (self,NOV_ARMOR_H);
        B_GiveInvItems (self, hero, NOV_ARMOR_H, 1);
        B_GiveInvItems (hero, self, ItMinugget,VALUE_NOV_ARMOR_H);
    };
};

////////////////////////////////////////
////////////////////////////////////////
/////////       Kap 2           ////////
////////////////////////////////////////
////////////////////////////////////////

// **************************************************************************
//                  BAAL NAMIB SCHICKT DEN SPIELER ZU YBERION
// **************************************************************************
INSTANCE Info_BaalNamib_BROTHERHOOD (C_INFO)
{
    npc         = GUR_1204_BaalNamib;
    condition   = Info_BaalNamib_BROTHERHOOD_Condition;
    information = Info_BaalNamib_BROTHERHOOD_Info;
    important   = 0;
    permanent   = 0;
    description = "Gibt es Aufgaben, die ich für die Bruderschaft erledigen kann?";
};

FUNC INT Info_BaalNamib_BROTHERHOOD_Condition()
{
//  return (kapitel == 2) ;
};

FUNC VOID Info_BaalNamib_BROTHERHOOD_Info()
{
    AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_15_01"); //Gibt es Aufgaben, die ich für die Bruderschaft erledigen kann?
    AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_02_02"); //Unser Meister, der weise Y'Berion, schickt nach einem Novizen. Nun, da du ein Bruder der Gemeinschaft geworden bist, geh zu ihm und biete ihm deine Hilfe an.
    Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
    Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"In Ordnung, ich werde ihn sofort aufsuchen"     ,Info_BaalNamib_BROTHERHOOD_OK);
    Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Wo finde ich Y'Berion?"                         ,Info_BaalNamib_BROTHERHOOD_YBWO);
    Info_Addchoice (Info_BaalNamib_BROTHERHOOD,"Weißt du, was ich für Y'berion erledigen soll?" ,Info_BaalNamib_BROTHERHOOD_YBWAS);
    var C_NPC Kalom;
    Kalom = Hlp_GetNpc (GUR_1201_CORKALOM);
    Npc_ExchangeRoutine (Kalom,"kapitel2");
    AI_ContinueRoutine (Kalom);
};
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWO()
{
    AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWO_15_01"); //Wo finde ich Y'Berion?
    AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWO_02_02"); //Er hält sich im Inneren des Tempelbergs auf. Wie immer.

};
FUNC VOID Info_BaalNamib_BROTHERHOOD_YBWAS()
{
    AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_01"); //Weißt du, was ich für Y'Berion erledigen soll?
    AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_02"); //Eine große Beschwörung wird stattfinden. Allerdings brauchen wir dafür einen magischen Gegenstand.
    AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_03"); //Y'Berion sucht Männer, die mutig genug sind, ihm dieses Artefakt zu bringen.
    AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_YBWAS_15_04"); //Klingt einfach.
    AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_YBWAS_02_05"); //Wenn es einfach wäre, hätten wir den Gegenstand schon. Sprich erst mal mit Y'Berion. Er wird dir alles erklären.
};
FUNC VOID Info_BaalNamib_BROTHERHOOD_OK()
{
    AI_Output (other, self,"Info_BaalNamib_BROTHERHOOD_OK_15_01"); //In Ordnung, ich werde ihn sofort aufsuchen.
    AI_Output (self, other,"Info_BaalNamib_BROTHERHOOD_OK_02_02"); //Möge der Schläfer dich beschützen
    Info_Clearchoices ( Info_BaalNamib_BROTHERHOOD);
};
