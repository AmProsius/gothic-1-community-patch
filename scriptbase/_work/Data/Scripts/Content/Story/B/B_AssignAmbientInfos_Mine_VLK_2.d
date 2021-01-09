// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_2_EXIT_Condition;
	information	= Info_Mine_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "END";
};                       

FUNC INT Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_2_Mine_Condition;
	information	= Info_Mine_Vlk_2_Mine_Info;
	permanent	= 1;
	description = "Tell me about the mine.";
};                       

FUNC INT Info_Mine_Vlk_2_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00"); //Tell me about the mine.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01"); //There's a lot of caves where there's still some ore left. But the crawlers just make it impossible to work in them.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02"); //Too many attacks, too many losses.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Who has the say round here?";
};                       

FUNC INT Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00"); //Who has the say round here?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01"); //Viper's the smelter. He knows all about the oven, he has a body like iron. He don't mind the heat. He spends all day melting the ore.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_2_Minecrawler_Condition;
	information	= Info_Mine_Vlk_2_Minecrawler_Info;
	permanent	= 1;
	description = "What do you know about minecrawlers?";
};                       

FUNC INT Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00"); //What do you know about minecrawlers?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01"); //We had to close down the big pit at the bottom. It's overrun with minecrawlers.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02"); //There are minecrawlers all over the place. Can't you hear 'em? I sure can!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_2_DieLage_Condition;
	information	= Info_Mine_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "How are you?";
};                       

FUNC INT Info_Mine_Vlk_2_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00"); //How are you?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01"); //I have to work. If the guards catch me standing around talking, they'll cut my rations.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_2(var c_NPC slf)
{
	Info_Mine_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc					= Hlp_GetInstanceID(slf);
};
