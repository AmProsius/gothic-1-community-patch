// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wie's aussieht, beherrschst du dein Handwerk.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Wie's aussieht, beherrschst du dein Handwerk.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Bisher hat sich noch niemand beschwert.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //Aber das will ich auch keinem raten. Jeder Pisser hier braucht ein Schwert, und das kriegen sie von mir.
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "Wie lange brauchst du f�r eine Klinge?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Wie lange brauchst du f�r eine Klinge?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //Kommt drauf an. Ein einfaches Schwert mach' ich dir schneller, als deine m�den Augen zuschauen k�nnen.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Vorausgesetzt, du motivierst mich mit einer entsprechenden Bezahlung.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //So'n Spinner wie der Whistler muss aber meistens l�nger auf sein Schmuckst�ck warten.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Wieso? Bezahlt er nicht gut?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Doch, ganz im Gegenteil. F�r sein letztes Schwert hat er 150 Erz locker gemacht.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Irgendwie hat der Typ ein Faible f�r Ornamente und so 'nen Weiberkram, und das hat nat�rlich seinen Preis.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hey, du bist ganz sch�n neugierig, Freundchen.
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 1;
	important		= 0;
	description		= "Na, Schmied, wie l�uft das Gesch�ft?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Na, Schmied, wie l�uft das Gesch�ft?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Was geht dich das an?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Vielleicht habe ich einen Auftrag f�r dich.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Ach ja? Was denn?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Ich �berleg's mir.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Komm wieder, wenn du was brauchst, und geh mir nicht auf die Nerven.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Ich w�rde mich selbst gern mal an deiner Schmiede versuchen.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Ich w�rde mich selbst gern mal an deiner Schmiede versuchen.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //So so, aber glaub nur nicht, dass du tolle Klingen herstellen kannst!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Was muss ich tun?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Okay, nimm den Rohstahl und halte ihn ins Schmiedefeuer.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Dann musst du den gl�henden Stahl am Amboss schmieden.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Stecke dann die gl�hende Klinge dort dr�ben in den Wassereimer, um sie zu h�rten.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Am Ende muss die abgek�hlte Klinge noch am Schleifstein gesch�rft werden.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Verstehe.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Allerdings brauchst du daf�r ein paar Sachen. Ich kann sie dir verkaufen.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Ich m�chte Dinge f�rs Schmieden kaufen!";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Ich m�chte Dinge f�rs Schmieden kaufen!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


