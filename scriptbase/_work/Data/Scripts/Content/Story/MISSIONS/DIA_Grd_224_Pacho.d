//***************************************************************************
//	Info EXIT
//***************************************************************************
instance Info_Pacho_EXIT (C_INFO)
{
	npc			= Grd_224_Pacho;
	nr			= 999;
	condition	= Info_Pacho_EXIT_Condition;
	information	= Info_Pacho_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Pacho_EXIT_Condition()
{
	return TRUE;
};

func VOID Info_Pacho_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};


//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################
//---------------------------------------------------------------------
//	Info STOP
//---------------------------------------------------------------------
instance Info_Pacho_STOP (C_INFO)
{
	npc				= Grd_224_Pacho;
	condition		= Info_Pacho_STOP_Condition;
	information		= Info_Pacho_STOP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Pacho_STOP_Condition()
{
	return TRUE;
};

func void Info_Pacho_STOP_Info()
{
	AI_Output			(self, hero,"Info_Pacho_STOP_13_01"); //Hey, du!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //Wer? Ich?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //Nein, ich mein deine Großmutter ... Natürlich mein ich dich!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //Wenn ich du wäre, dann würde ich diesen Weg hier nicht weitergehen!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Warum nicht?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //Du scheinst wirklich neu hier zu sein!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //Mann, hier geht es ins Orkgebiet!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //Die machen Kleinholz aus dir!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Oh.
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //Gern geschehen!

	AI_StopProcessInfos	(self);
};
