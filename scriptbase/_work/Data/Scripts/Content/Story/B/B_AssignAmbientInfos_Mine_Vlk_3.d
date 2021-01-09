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
	description = "ENDE";
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
	description = "Erzähl mir was von der Mine";
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
	AI_Output(other,self,"Info_Mine_Vlk_3_Mine_15_00"); //Erzähl mir was von der Mine
	AI_Output(self,other,"Info_Mine_Vlk_3_Mine_01_01"); //Wir müssen alle arbeiten. Wochenlang ohne Tageslicht. Es gibt kein Entkommen. Die einzige Freiheit ist der Tod.
	
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
	description = "Wer hat hier was zu Sagen?";
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
	AI_Output(other,self,"Info_Mine_Vlk_3_WichtigePersonen_15_00"); //Wer hat hier was zu sagen?
	AI_Output(self,other,"Info_Mine_Vlk_3_WichtigePersonen_01_01"); //Ian ist der Chef der Mine. Asghan befehligt die Gardisten.
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
	description = "Was weißt Du über Minecrawler?";
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
	AI_Output(other,self,"Info_Mine_Vlk_3_Minecrawler_15_00"); //Was weißt du über Minecrawler?
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_01"); //Die beste Art mit den Crawlern fertig zu werden? Lauf. Lauf, so schnell deine Beine dich tragen.
	AI_Output(self,other,"Info_Mine_Vlk_3_Minecrawler_01_02"); //Wenn du vermisst wirst, ist es eh zu spät. Aber dich wird sowieso keiner vermissen.
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
	description = "Wie sieht's aus?";
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
	AI_Output(other,self,"Info_Mine_Vlk_3_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_01"); //Tja, also mein Rücken schmerzt, meine Arme fallen mir ab, meine Kehle ist trocken und ich bin müde.
	AI_Output(self,other,"Info_Mine_Vlk_3_DieLage_01_02"); //Und das ständige Geräusch der Spitzhacken. Ich werde noch wahnsinnig.
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
