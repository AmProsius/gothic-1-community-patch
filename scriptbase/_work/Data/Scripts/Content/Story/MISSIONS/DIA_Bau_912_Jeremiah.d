// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "Was machst du hier?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Was machst du hier?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Ich brenne den Reisschnaps, Junge.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Hier - nimm ne Flasche. Aber sag nichts Silas.
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "Wie läuft das Schnapsbrennergeschäft?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Wie läuft das Schnapsbrennergeschäft?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Ich kann kaum soviel nachlegen, wie die Kerle wegsaufen.
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //Ist auch ganz gut so - solange ich hier genug zu tun habe, lassen mich die Jungs vom Reislord in Ruhe.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "Was kannst du mir über den Reislord sagen?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Was kannst du mir über den Reislord sagen?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //Er ist ein verdammtes Schwein! Seine Schläger suchen sich die Schwachen aus, um sie zur Arbeit auf den Feldern zu zwingen.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Der einzige, der sich wehren könnte ist Horatio. Aber der hat mit Gewalt nichts am Hut.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //Ich hab' mal gehört, wie er gesagt hat, er würde dem Reislord gerne den Schädel einschlagen, aber das würde er nie tun.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //Seine Überzeugung hält ihn davon ab.
};

