// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_3_EXIT_Condition;
	information	= Info_Mine_Vlk_3_EXIT_Info;
	permanent	= 1;
	description = "END";
};                       

FUNC INT Info_Mine_Vlk_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_3_Mine_Condition;
	information	= Info_Mine_Vlk_3_Mine_Info;
	permanent	= 1;
	description = "Tell me about the mine.";
};                       

FUNC INT Info_Mine_Vlk_3_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00"); //Tell me about the mine.
	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01"); //We all have to work hard for weeks on end, we never get to see the light of day. There is no escape. The only way out is death.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_3_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Who calls the shots around here?";
};                       

FUNC INT Info_Mine_Vlk_3_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00"); //Who calls the shots around here?
	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01"); //Ian's the boss of the mine. Asghan's in charge of the guards.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_3_Minecrawler_Condition;
	information	= Info_Mine_Vlk_3_Minecrawler_Info;
	permanent	= 1;
	description = "What do you know about minecrawlers?";
};                       

FUNC INT Info_Mine_Vlk_3_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00"); //What do you know about minecrawlers?
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01"); //You mean what's the best way of dealin' with crawlers? Run. Run as fast as your legs will carry you.
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02"); //If you go missing, it's too late. Not that anyone's likely to miss you.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_3_DieLage_Condition;
	information	= Info_Mine_Vlk_3_DieLage_Info;
	permanent	= 1;
	description = "How's it going?";
};                       

FUNC INT Info_Mine_Vlk_3_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00"); //How's it going?
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01"); //Well, my back aches, my arms feel like they're gonna drop off, my tongue's bone dry and I'm dead tired.
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02"); //And the constant hammering of the pickaxes is slowly driving me round the bend.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_3(var c_NPC slf)
{
	Info_Mine_Vlk_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_3_DieLage.npc					= Hlp_GetInstanceID(slf);
};
