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
	description 	= "Hi! I'm new here.";
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
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Hi! I'm new here.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //You don't say! Tell me about the outside world! It's been over a month since I heard anything from outside.
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //I'm Kirgo. I fight in the arena.
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
	description 	= "Are you good? At fighting, I mean?";
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
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //Are you good?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //At fighting? I haven't been doing it for long, but I've already won a fight!
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
	description 	= "I'd like to challenge you to a fight in the arena!";
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
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //I'd like to challenge you to a fight in the arena!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //What? But I don't wanna fight. Why don't we just have a beer together and talk about the outside world?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"No! I want to fight. Now!",Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"Okay, give me a beer then!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //No! I want to fight. Now!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //In that case... I'm ready when you are.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Okay, give me a beer then!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Here you are!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Thanks! I'm afraid I can't tell you much about the outside world - they kept me locked away in a dark hole for almost two months before throwing me in here.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //That's a shame... Oh well, never mind... Hey, you're still looking pretty good for someone who's been locked up for two months.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //I'd like it to stay that way, too.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //Then why do you insist on fighting one of us?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //I want to get acknowledged in the Camp!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //By Scatty, you mean? Hm, he's one of the most influential men in the Outer Ring... You might be able to impress him by defeating me...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //But if you really want to impress him, it's Kharim you need to beat. Only thing is, I'm afraid he might be too good for you!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //If you still want to fight me, let me know! But I won't enjoy knocking you out cold.
	
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
	description 	= "Let's fight - are you ready?";
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
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Let's fight - are you ready?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //Follow me!
	
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
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Right, let's get to it. May the best man win!
		
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


















