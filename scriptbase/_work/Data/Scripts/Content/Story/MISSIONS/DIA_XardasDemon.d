// ************************ EXIT **************************

instance  Info_XardasDemon_EXIT (C_INFO)
{
	npc			=	XardasDemon;
	nr			=	999;
	condition	=	Info_XardasDemon_EXIT_Condition;
	information	=	Info_XardasDemon_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_XardasDemon_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_XardasDemon_EXIT_Info()
{
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output (hero, self,"Info_Saturas_EXIT_15_01"); //... Sterblicher? ...  Wer, ich? ... Ich geh ja schon!

	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info INTRO
//***************************************************************************
instance Info_XardasDemon_INTRO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_INTRO_Condition;
	information	= Info_XardasDemon_INTRO_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_XardasDemon_INTRO_Condition()
{	
	if (FindXardas)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_INTRO_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_01"); //Moment... Wer... Wer spricht hier.
	AI_WhirlAround	(hero, self);	//KEIN B_Whirlaround()!!!
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_02"); //DUUUU sprichst zu mir ??? Wie ... wie kommst du in meinen Kopf?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_03"); //Du bist was? ... der Diener deines Herren?
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_04"); //Du erscheinst mir eher wie eine Kreatur der H�lle!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_05"); //Ich soll schweigen?
};

//***************************************************************************
//	Info MASTERWHO
//***************************************************************************
instance Info_XardasDemon_MASTERWHO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERWHO_Condition;
	information	= Info_XardasDemon_MASTERWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Hei�t Dein Herr und Meister zuf�llig Xardas?";
};

FUNC INT Info_XardasDemon_MASTERWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERWHO_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_01"); //Hei�t dein Herr und Meister zuf�llig Xardas?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_02"); //Aha ... Namen sind also unwichtig ... Okay.
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_03"); //Ich gehe einfach mal davon aus, dass das hier der Turm von Xardas ist.
};

//***************************************************************************
//	Info MASTERHOW
//***************************************************************************
instance Info_XardasDemon_MASTERHOW (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERHOW_Condition;
	information	= Info_XardasDemon_MASTERHOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich muss mit deinem Meister sprechen!";
};

FUNC INT Info_XardasDemon_MASTERHOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERHOW_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_01"); //Ich muss mit deinem Meister sprechen!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_02"); //... Ich? ... unw�rdig?? ... Was f�r ein Test???
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_03"); //... Aaahhhh ... Ich verstehe ... wer deinen Meister sprechen will, muss sich w�rdig erweisen!
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_04"); //... Moment, wie war das? ... Der Beweis? ... Sieg �ber was? ... Sieg �ber die Elemente?
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_05"); //... Stein? ... Eis? ... Feuer?

	FindGolemHearts = 1;		// Auftrag vergeben

	B_LogEntry		(CH4_FindXardas,	"Im Inneren von Xardas' Turm begegnete ich einem D�mon, der in meinen Gedanken zu mir sprach. Er will drei Beweise f�r den Sieg �ber die Elemente Feuer, Eis und Stein, bevor er mich zu seinem Meister vorl��t.");
};

//***************************************************************************
//	Info NOHEART
//***************************************************************************
instance Info_XardasDemon_NOHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_NOHEART_Condition;
	information	= Info_XardasDemon_NOHEART_Info;
	permanent	= 1;
	important 	= 0;
	description = "Du sprichst in R�tseln!";
};

FUNC INT Info_XardasDemon_NOHEART_Condition()
{	
	if 	 Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	!Npc_HasItems (hero, ItAt_StoneGolem_01)
	&&	!Npc_HasItems (hero, ItAt_IceGolem_01)
	&&	!Npc_HasItems (hero, ItAt_FireGolem_01)
	&&	(FindGolemHearts < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_NOHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_01"); //Du sprichst in R�tseln!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_02"); //... Das hast du schon mal gesagt, du wiederholst dich!
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_03"); //... Du willst Beweise f�r den Sieg �ber die Elemente Feuer, Eis und Stein!
};

//***************************************************************************
//	Ein Herz abliefern
//***************************************************************************
func void B_XardasDemon_GiveHeart()
{
	if 		(FindGolemHearts == 1)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_01"); //... Was? ... Aha! ... Ein w�rdiger Beweis!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_02"); //... Fehlen? ... Zwei fehlen noch?
		FindGolemHearts = 2;
	}
	else if (FindGolemHearts == 2)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_03"); //... Die Dualit�t? ... Der zweite Beweis?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_04"); //... Einer bleibt noch?
		FindGolemHearts = 3;
	}
	else if (FindGolemHearts == 3)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_05"); //... Vollkommenheit? ... Ich bin w�rdig?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_06"); //Wenn das so ist, dann w�nsche ich jetzt, deinen Meister zu sprechen!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_07"); //... Gegenbeweis? ... Was f�r einen Gegenbeweis? ... Eine Rune? ... Eine Rune f�r mich?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_08"); //Nun, dann nehme ich die Rune der Teleportation als Zeichen der W�rde an mich!

		B_Story_AccessToXardas();
	};
};


//***************************************************************************
//	Info STONEHEART
//***************************************************************************
instance Info_XardasDemon_STONEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_STONEHEART_Condition;
	information	= Info_XardasDemon_STONEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich habe hier das Herz eines Steingolems!";
};

FUNC INT Info_XardasDemon_STONEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_StoneGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_STONEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_STONEHEART_15_01"); //Ich habe hier das Herz eines Steingolems!

    B_GiveInvItems  (hero, self, ItAt_StoneGolem_01, 1);
	Npc_RemoveInvItem(self, ItAt_StoneGolem_01);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info ICEHEART
//***************************************************************************
instance Info_XardasDemon_ICEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_ICEHEART_Condition;
	information	= Info_XardasDemon_ICEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ist dieses Herz eines Eisgolems ein Beweis?";
};

FUNC INT Info_XardasDemon_ICEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_IceGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_ICEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_ICEHEART_15_01"); //Ist dieses Herz eines Eisgolems ein Beweis?

	B_GiveInvItems  (hero, self, ItAt_IceGolem_01, 1);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info FIREHEART
//***************************************************************************
instance Info_XardasDemon_FIREHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_FIREHEART_Condition;
	information	= Info_XardasDemon_FIREHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Was ist mit diesem Herz des Feuergolems?";
};

FUNC INT Info_XardasDemon_FIREHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_FireGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_FIREHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_FIREHEART_15_01"); //Was ist mit diesem Herz des Feuergolems?

	B_GiveInvItems  (hero, self, ItAt_FireGolem_01, 1);

	B_XardasDemon_GiveHeart();
};





