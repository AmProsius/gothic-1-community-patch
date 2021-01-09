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
	description 	= "I'm new here. Who are you?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //I'm new here. Who are you?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //I'm Kharim! You must have just been booted in here - or else you'd have heard of me!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //I'm the best fighter this damned camp has ever seen.
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
	description 	= "I'll challenge you! Let's go to the arena!";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //I'll challenge you! Let's go to the arena!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //YOU?! I'll have you for breakfast, kid!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Do yourself a favor and get lost!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Okay, okay, let's forget about it.",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"So you don't get hurt, you coward?!",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //Okay, okay, let's forget about it.
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //So you don't get hurt, you coward?!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //Don't you have any better ideas, boy?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"You're only here to get a chance to kiss Gomez' ass!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"How about: Your mother's a sheep-shagging...",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"No, there's nothing I can think of you'd actually understand.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"You've got thin arms, but then I saw your ugly mug.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"Okay, okay, let's forget about it.",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //How about: Your mother's a sheep-shagging...
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Yeah, I guess she is...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //You're only here to get a chance to kiss Gomez' ass!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //WHAT!?! You worm! You know nothing about us! The New Camp is INDEPENDENT from all that shit!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //And apart from that there's only one reason why I'm here: So I can beat the brains out of smart asses like you.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //It'll be my pleasure to do the same to YOU! Your destiny is awaiting you in the arena!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Let's think about it: No, there's nothing I can think of you'd actually understand.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Maybe you should give it a try.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //At first I wanted to say something about your thin arms, but then I saw your ugly mug.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //I think this is your last chance to finally GET LOST!
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
	if (Kapitel <= 1)				// Kapitelfix ***Björn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Pain is a question of willpower!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Von mir aus können wir unseren Streit vergessen ...	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
