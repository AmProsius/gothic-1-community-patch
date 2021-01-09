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
	AI_Output			(self, hero,"Info_Pacho_STOP_13_01"); //Hey, you!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_02"); //Who? Me?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_03"); //No, your grandmother... Who else could I mean?!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_04"); //I wouldn't go down that way if I were you!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_05"); //Why not?
	AI_Output			(self, hero,"Info_Pacho_STOP_13_06"); //You can't have been here long!
	AI_Output			(self, hero,"Info_Pacho_STOP_13_07"); //Man, that's the way to the Orc land...
	AI_Output			(self, hero,"Info_Pacho_STOP_13_08"); //They'll make mincemeat out of you!
	AI_Output			(hero, self,"Info_Pacho_STOP_15_09"); //Oh.
	AI_Output			(self, hero,"Info_Pacho_STOP_13_10"); //You're welcome!

	AI_StopProcessInfos	(self);
};
