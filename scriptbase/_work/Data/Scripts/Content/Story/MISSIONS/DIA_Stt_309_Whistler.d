// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "Hi! Ich bin neu hier.";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Hi! Ich bin neu hier!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Was willst du von mir?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Ich will einer von euch werden - ich will mich dem Lager anschließen.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Auf der Suche nach Fürsprechern, was?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Wenn ich ein gutes Wort bei Diego für dich einlegen soll, schuldest du mir einen Gefallen.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "Was ist das für ein Gefallen, den du von mir erwartest?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Was ist das für ein Gefallen, den du von mir erwartest?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Ich will eine Waffe von Fisk haben. Er ist einer der Händler am Marktplatz.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Er will sie mir nicht mehr verkaufen. Es ist ein Breitschwert mit Ornamenten.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Ich gebe dir 100 Erz und du holst die Waffe für mich ab. Aber sag ihm nichts von mir, klar?

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour, "Okay, her mit den 100 Erzbrocken. Ich hol das Ding."								,DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour, "Hast du mal daran gedacht, dass ich mit dem Erz durchbrennen könnte...?"	,DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour, "Warum will er dir die Waffe nicht mehr verkaufen?"									,DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Okay, her mit den 100 Erzbrocken. Ich hol' das Ding.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Hier hast du sie. Kommt direkt zu mir zurück!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Whistler unterstützt mich, wenn ich ihm bei Fisk auf dem Marktplatz ein Schwert kaufe. Er hat mir 100 Erz gegeben.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Hast du mal daran gedacht, dass ich einfach mit dem Erz durchbrennen könnte ...?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Vergiss nicht: Die Kolonie ist klein! Wenn du mit dem Erz durchbrennst, finde ich dich!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Warum will er dir die Waffe nicht mehr verkaufen?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Wir hatten eine kleine Meinungsverschiedenheit.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //Und?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //Und das ist alles, was du wissen musst!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "Fisk will jetzt 110 Erz für dein Schwert";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk will jetzt 110 Erz für dein Schwert.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //Und ich soll dir jetzt noch 10 Erz geben ...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Ich dachte, du legst Wert auf dein Schwert.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Hier, nimm, und jetzt beeil dich!
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "Ich kriege das Schwert nicht - hier hast du deine 100 Erz zurück.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Ich kriege das Schwert nicht - hier hast du deine 100 Erz zurück.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Du Idiot! So 'ne Flasche wie dich können wir hier nicht gebrauchen! Zieh Leine!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Ich habs vermasselt, Whistler kriegt sein Schwert nie.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Ich sehe aber keine 100 Erz - du besorgst sie am besten, so schnell du kannst, sonst gibt's Ärger!
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Da bist du ja! Wolltest mit meinen Erz durchbrennen, was? Komm her, Bürschchen!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Ich hab's vermasselt. Whistler ist ganz schön sauer auf mich.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "Ich hab' dein Schwert...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Ich hab' dein Schwert ...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //War ja auch nicht wirklich schwierig. Wie auch immer - eine Hand wäscht die andere.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Falls Diego mich nach dir fragt, ist dir meine Stimme sicher. Bis dahin - mach's gut!
	
	B_LogEntry (CH1_JoinOC,"Whistler war zufrieden, als ich ihm das gewünschte Schwert übergab. Er will sich bei Diego für mich einsetzen.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Whistler war zufrieden, als ich ihm das gewünschte Schwert übergab.Leider nützt mir das nicht viel, denn Schatten kann ich nicht mehr werden.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "Wie sieht's aus...";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //Wie sieht's aus ...
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Gut! Du hast mir einen Gefallen getan, ich tue dir einen. Ich werd Diego erzählen, dass du ein zuverlässiger Mann bist.
};





	
	





















