// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kharim_Exit (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 999;
	condition		= Info_Kharim_Exit_Condition;
	information		= Info_Kharim_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kharim_Exit_Condition()
{
	return 1;
};

func VOID Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "Ich bin neu hier. Wer bist du?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Ich bin neu hier. Wer bist du?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Ich bin Kharim! Du bist wohl wirklich gerade erst reingeworfen worden - sonst h�ttest du schon von mir geh�rt!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Ich bin der beste K�mpfer, den dieses dreckige Lager je gesehen hat.
};

// **************************************
//				Fordern
// **************************************
	var int Kharim_Charged;
// **************************************

instance Info_Kharim_Charge(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 2;
	condition		= Info_Kharim_Charge_Condition;
	information		= Info_Kharim_Charge_Info;
	permanent		= 1;
	description 	= "Ich fordere dich heraus! Lass es uns in der Arena austragen!";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Bj�rn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Ich fordere dich heraus! Lass es uns in der Arena austragen!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //DU?! Ich fress' dich zum Fr�hst�ck, Kleiner!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Tu dir selber einen Gefallen und mach, dass du wegkommst!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Okay, okay, vergessen wir die Sache."					,Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Damit du ungeschoren davonkommst, du feiges Schwein?!"	,Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Okay, okay, vergessen wir die Sache.
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Damit du ungeschoren davonkommst, du feiges Schwein?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //F�llt dir nichts besseres ein, Kleiner?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Du bist doch nur hier, um Gomez in den Arsch zu kriechen!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"Wie w�r's mit: Deine Mutter treibt's mit Ziegen..."									,Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"Nein, mir f�llt nichts ein, das du begreifen w�rdest."				,Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"Deine d�rren �rmchen sind nichts gegen deine h��liche Visage."	,Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Okay, okay, vergessen wir die Sache."													,Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //Wie w�r's mit: Deine Mutter treibt's mit Ziegen ...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Das tut sie vermutlich wirklich ...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Du bist doch nur hier, damit du mal 'ne Chance bekommst, Gomez in den Arsch zu kriechen!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //WAS!?! Du Wurm! Du wei�t gar nichts �ber uns! Das Neue Lager ist UNABH�NGIG von dieser ganzen Schei�e!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //Und im �brigen gibt es nur einen Grund, warum ich hier bin: Damit ich Klugschei�ern wie dir das Hirn aus dem Sch�del pr�geln kann.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //Es wird mir ein Vergn�gen sein, das bei DIR zu tun! Dein Schicksal erwartet dich in der Arena!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Lass mal �berlegen: Nein, mir f�llt nichts ein, was du begreifen w�rdest.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Vielleicht solltest du es auf einen Versuch ankommen lassen.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Ich wollte zuerst was �ber deine d�rren �rmchen sagen, aber dann fiel mir deine h�ssliche Fesse auf.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //Ich denke, das ist deine letzte Chance, hier ENDLICH ZU VERSCHWINDEN!
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 1)				// Kapitelfix ***Bj�rn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Schmerzen sind eine Frage des Willens!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Von mir aus k�nnen wir unseren Streit vergessen ...	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
