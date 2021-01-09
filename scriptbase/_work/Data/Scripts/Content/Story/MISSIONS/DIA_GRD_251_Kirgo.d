// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kirgo_What(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_What_Condition;
	information		= Info_Kirgo_What_Info;
	permanent		= 0;
	description 	= "Hi! Ich bin neu hier.";
};                       

FUNC INT Info_Kirgo_What_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func VOID Info_Kirgo_What_Info()
{
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Hi! Ich bin neu hier.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Ein Neuer! Erzähl mir was von draußen! Es ist schon über einen Monat her, dass ich Neuigkeiten aus der Außenwelt gehört hab.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Ich bin Kirgo. Ich kämpfe in der Arena.
};

// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Good (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Good_Condition;
	information		= Info_Kirgo_Good_Info;
	permanent		= 0;
	description 	= "Bist du gut? - Im Kämpfen meine ich.";
};                       

FUNC INT Info_Kirgo_Good_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Good_Info()
{
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //Bist du gut?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //Im Kämpfen? Ich bin noch nicht lange dabei, aber ich habe schon einen Kampf gewonnen!
};

// **************************************
//				Fordern (Vorspiel)
// **************************************

instance Info_Kirgo_Charge(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Charge_Condition;
	information		= Info_Kirgo_Charge_Info;
	permanent		= 0;
	description 	= "Ich fordere dich zum Kampf in der Arena!";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1))	// Kapitelfix   ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //Ich fordere dich zum Kampf in der Arena!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Was? Aber ich hab' gerade keine Lust zu kämpfen. Lass uns doch lieber ein Bier zusammen trinken und erzähl mir was von draußen.
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"Nein! Ich will gegen dich kämpfen. Jetzt!"		,Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"Okay, gib ein Bier rüber!"						,Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //Nein! Ich will gegen dich kämpfen. Jetzt!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //Wie du willst ... Ich bin bereit, wenn du es bist.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Okay, gib mir ein Bier rüber!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Hier nimm!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Danke! Ich fürchte, von draußen kann ich nicht viel erzählen - sie haben mich fast zwei Monate in einem dunklen Loch gefangen gehalten, bevor sie mich hier reingeworfen haben.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //Schade ... Na, was soll's ... Hey, für zwei Monate Kerker siehst du aber noch ziemlich gut aus.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //Ich werde zusehen, dass das so bleibt.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //Warum willst du dann unbedingt gegen einen von uns antreten?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Ich will Anerkennung im Lager finden!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //Bei Scatty, meinst du? Hm, er ist einer der einflussreichsten Leute hier im Außenring ... Wenn du mich besiegst, könnte ihn das schon beeindrucken ...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Aber wenn du ihm richtig imponieren willst, müsstest du Kharim umhauen. Ich fürchte nur, er ist viel zu gut für dich!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Falls du immer noch gegen mich kämpfen willst - sag mir Bescheid! Aber ich werd' dir nicht gerne die Fresse polieren.
	
	CreateInvItem (other, ItFoBeer);
	B_GiveInvItems (other, self, ItFoBeer, 1);
	
	self.npctype = npctype_FRIEND;
	
	Info_ClearChoices	(Info_Kirgo_Charge );
};

// **************************************
//				Fordern REAL
// **************************************
	var int Kirgo_Charged;
// **************************************

instance Info_Kirgo_ChargeREAL(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_ChargeREAL_Condition;
	information		= Info_Kirgo_ChargeREAL_Info;
	permanent		= 0;
	description 	= "Lass uns kämpfen - Bist du bereit?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Björn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Lass uns kämpfen - Bist du bereit?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //Folge mir!
	
	AI_StopProcessInfos	( self );
	
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_InArena_Condition;
	information		= Info_Kirgo_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kirgo_InArena_Condition()
{
	if ( (Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 1)			//Fix für spätere Kapitel ****Björn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //So, dann wollen wir mal. Möge der Bessere gewinnen!
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Den kleinen Streit vergessen wir, okay?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















