// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_GorNaDrak_EXIT (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 999;
	condition	= DIA_GorNaDrak_EXIT_Condition;
	information	= DIA_GorNaDrak_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "Hi! Wohin soll's denn gehen?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Hi! Wohin soll's denn gehen?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Wir bringen das Sekret der Minecrawler, das unsere Br�der in der Alten Mine gewinnen, zu Cor Kalom.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Einmal t�glich gehen wir zur Alten Mine, um es abzuholen.
};

// **************************************************
//					Was ist Sekret
// **************************************************

instance  DIA_GorNaDrak_WasSekret (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WasSekret_Condition;
	information	= DIA_GorNaDrak_WasSekret_Info;
	permanent	= 0;
	description  = "Was ist das f�r ein Sekret?";
};                       

FUNC int  DIA_GorNaDrak_WasSekret_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //Was ist das f�r ein Sekret?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Wir gewinnen es aus den Zangen der Minecrawler. Wenn man wei� wie, kann man sie herausnehmen, ohne dass das Sekret verloren geht.
};

// **************************************************
//			 	LERNE: Zangen Nehmen
// **************************************************

instance  DIA_GorNaDrak_TeachMandibles (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_TeachMandibles_Condition;
	information	= DIA_GorNaDrak_TeachMandibles_Info;
	permanent	= 0;
	description  = "Kannst du mir sagen, wie ich an das Sekret eines Minecrawlers herankomme?";
};                       

FUNC int  DIA_GorNaDrak_TeachMandibles_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Kannst du mir sagen, wie ich an das Sekret eines Minecrawlers herankomme?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Klar, nachdem du das Vieh get�tet hast, packst du es an den Bei�zangen und rei�t sie gerade heraus. Dann kommt die Sekretdr�se mit raus, ohne zu zerrei�en.
	
	PrintScreen	("Lerne: Minecrawlerzangen nehmen", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Wissen �ber Zangen rausschneiden - Minecrawler");
};

// **************************************************
//			 	Wof�r ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "Wof�r braucht Cor Kalom das Sekret?";
};                       

FUNC int  DIA_GorNaDrak_WhatFor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //Wof�r braucht Cor Kalom das Sekret?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Soweit ich wei�, gewinnt er daraus ein Elixier, das die magische Kraft eines Novizen steigert.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Seit wir uns auf die gro�e Anrufung vorbereiten, kann er gar nicht genug von dem Zeug bekommen.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //Mit Hilfe des Elixiers will er die Novizen auf den gro�en Tag vorbereiten.
};

// **************************************************
//			 	Kap 1 Permanent
// **************************************************

instance  DIA_GorNaDrak_Permanent (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Permanent_Condition;
	information	= DIA_GorNaDrak_Permanent_Info;
	permanent	= 1;
	description  = "Habt ihr schon genug Elixier f�r die gro�e Anrufung des Schl�fers?";
};                       

FUNC int  DIA_GorNaDrak_Permanent_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WhatFor) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_Permanent_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //Habt ihr schon genug Elixier f�r die gro�e Anrufung des Schl�fers?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //Nein - Wir m�ssen noch 'ne Menge sammeln - in der Alten Mine sind unsere Minecrawler-Jagdtrupps Tag und Nacht im Einsatz.
};




