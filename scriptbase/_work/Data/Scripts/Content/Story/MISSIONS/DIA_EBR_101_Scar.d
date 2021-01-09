// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "Wer bist du?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Wer bist du?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Sie nennen mich Scar.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "Was ist deine Aufgabe hier?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Was ist deine Aufgabe hier?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Ich und Arto passen auf, dass Gomez niemand zu nahe kommt, der hier nicht eingeladen wurde,
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Außerdem kümmere ich mich darum, dass die Frauen hier nicht zu kurz kommen .
};

// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_SCAR_Frau (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Frau_Condition;
	information	= DIA_SCAR_Frau_Info;
	permanent	= 0;
	description = "Als sie mich reingeworfen haben, habe ich eine Frau gesehen.";
};                       

FUNC INT DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Frau_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Als sie mich reingeworfen haben, habe ich gesehen, wie eine Frau zusammen mit den Waren heruntergefahren wurde.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //Und?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Ist sie hier?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Wenn du dich für sie interessierst, geb' ich dir einen guten Rat: Vergiss sie.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Sie ist gerade angekommen und Gomez hat sie bei sich auf dem Zimmer eingesperrt.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Wenn er sie 'ne Zeit lang gehabt hat, schickt er sie vielleicht runter. Aber jetzt gehört sie IHM - also verschwende besser keinen Gedanken an sie.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 1;
	description = "Kannst du mir etwas über Gomez erzählen?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Kannst du mir etwas über Gomez erzählen?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //Über ihn musst du nur wissen, dass er der mächtigste Mann der Kolonie ist.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Er kann alles haben, was er will, aber das einzige, was ihn WIRKLICH interessiert, ist Einfluss.
};

