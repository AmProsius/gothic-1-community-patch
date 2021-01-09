// ************************ EXIT **************************

instance  Info_XardasDemon_EXIT (C_INFO)
{
	npc			=	XardasDemon;
	nr			=	999;
	condition	=	Info_XardasDemon_EXIT_Condition;
	information	=	Info_XardasDemon_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_XardasDemon_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_XardasDemon_EXIT_Info()
{
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output (hero, self,"Info_Saturas_EXIT_15_01"); //... Mortal?... who, me?... Okay, I'm on my way!

	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info INTRO
//***************************************************************************
instance Info_XardasDemon_INTRO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_INTRO_Condition;
	information	= Info_XardasDemon_INTRO_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_XardasDemon_INTRO_Condition()
{	
	if (FindXardas)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_INTRO_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_01"); //Hold on... Who.... Who's talking to me?
	AI_WhirlAround	(hero, self);	//KEIN B_Whirlaround()!!!
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_02"); //YOU are talking to me??? How did you get into my head?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_03"); //You are what?... The servant of your master?
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_04"); //You seem to be a creature from hell!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_05"); //You want me to be silent?
};

//***************************************************************************
//	Info MASTERWHO
//***************************************************************************
instance Info_XardasDemon_MASTERWHO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERWHO_Condition;
	information	= Info_XardasDemon_MASTERWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Is your master's name perhaps Xardas?";
};

FUNC INT Info_XardasDemon_MASTERWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERWHO_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_01"); //Is your master's name perhaps Xardas?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_02"); //Oh, right... So names are not important... Okay.
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_03"); //I'll just assume that this here is the tower of Xardas.
};

//***************************************************************************
//	Info MASTERHOW
//***************************************************************************
instance Info_XardasDemon_MASTERHOW (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERHOW_Condition;
	information	= Info_XardasDemon_MASTERHOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "I have to talk to your master!";
};

FUNC INT Info_XardasDemon_MASTERHOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERHOW_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_01"); //I have to talk to your master!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_02"); //... Me?... Unworthy??... What kind of test???
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_03"); //... Aaahhhh... I understand... Whoever wants to talk to your master must prove worthy first!
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_04"); //... Hold on, what was that?... The proof?... Victory over what?... Victory over the elements?
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_05"); //... Stone?... Ice?... Fire?

	FindGolemHearts = 1;		// Auftrag vergeben

	B_LogEntry		(CH4_FindXardas,"In Xardas' tower, I meet a demon that talked to me in my thoughts. It wants three proofs of the victory over the elements of fire, ice and stone before granting me access to its master.");
};

//***************************************************************************
//	Info NOHEART
//***************************************************************************
instance Info_XardasDemon_NOHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_NOHEART_Condition;
	information	= Info_XardasDemon_NOHEART_Info;
	permanent	= 1;
	important 	= 0;
	description = "You're speaking in riddles!";
};

FUNC INT Info_XardasDemon_NOHEART_Condition()
{	
	if 	 Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	!Npc_HasItems (hero, ItAt_StoneGolem_01)
	&&	!Npc_HasItems (hero, ItAt_IceGolem_01)
	&&	!Npc_HasItems (hero, ItAt_FireGolem_01)
	&&	(FindGolemHearts < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_NOHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_01"); //You're speaking in riddles!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_02"); //... You said that before, you're repeating yourself!
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_03"); //... You want evidence for the victory over the elements fire, ice and stone?
};

//***************************************************************************
//	Ein Herz abliefern
//***************************************************************************
func void B_XardasDemon_GiveHeart()
{
	if 		(FindGolemHearts == 1)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_01"); //... What?... Right!... Worthy proofs!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_02"); //... Missing? Two are still missing?
		FindGolemHearts = 2;
	}
	else if (FindGolemHearts == 2)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_03"); //... Duality?... The second proof?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_04"); //... One is still remaining?
		FindGolemHearts = 3;
	}
	else if (FindGolemHearts == 3)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_05"); //... Perfection?... I'm worthy?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_06"); //If that's the case, I'd like to speak to your master now!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_07"); //... Counterevidence?... What kind of counterevidence?... A rune?... A rune for me?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_08"); //Well, then I'll accept the rune of teleportation as a sign of worthiness!

		B_Story_AccessToXardas();
	};
};


//***************************************************************************
//	Info STONEHEART
//***************************************************************************
instance Info_XardasDemon_STONEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_STONEHEART_Condition;
	information	= Info_XardasDemon_STONEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Here's the heart of a stone golem.";
};

FUNC INT Info_XardasDemon_STONEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_StoneGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_STONEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_STONEHEART_15_01"); //Here's the heart of a stone golem.

    B_GiveInvItems  (hero, self, ItAt_StoneGolem_01, 1);
	Npc_RemoveInvItem(self, ItAt_StoneGolem_01);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info ICEHEART
//***************************************************************************
instance Info_XardasDemon_ICEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_ICEHEART_Condition;
	information	= Info_XardasDemon_ICEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Is this heart of an ice golem the proof?";
};

FUNC INT Info_XardasDemon_ICEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_IceGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_ICEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_ICEHEART_15_01"); //Is this heart of an ice golem the proof?

	B_GiveInvItems  (hero, self, ItAt_IceGolem_01, 1);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info FIREHEART
//***************************************************************************
instance Info_XardasDemon_FIREHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_FIREHEART_Condition;
	information	= Info_XardasDemon_FIREHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "What about this heart of a fire golem?";
};

FUNC INT Info_XardasDemon_FIREHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_FireGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_FIREHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_FIREHEART_15_01"); //What about this heart of a fire golem?

	B_GiveInvItems  (hero, self, ItAt_FireGolem_01, 1);

	B_XardasDemon_GiveHeart();
};





