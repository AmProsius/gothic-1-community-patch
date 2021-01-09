// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Hey, you!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Who? Me?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //You know who I mean, sonny!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Let me tell you something: This is MY district. And I don't want any trouble!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //But new guys like you are always trouble. Especially when they sneak around the place at night.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //So why don't you go home and make sure I don't see you here again? There's an empty hut opposite the arena, the one with the canopy. Get some sleep.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //And if I catch you in one of the other huts, I shall personally see to it that you live to regret it.
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Hey, you!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //If you want to get rid of your protection money - you've picked the wrong day.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Yeah? Why's that?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Cos I'm not here.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"I see.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Then how come I'm talking to you?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Oh, where are you then?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Oh, where are you then?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //I'm actually at the castle, sitting by the big camp fire, drinking a mug of beer.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Then how come I'm talking to you?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek's vanished. This district is usually his responsibility.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //And until he reappears, Thorus has ordered ME to guard it.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //I see.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "D'you know where Nek's got to?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //D'you know where Nek's got to?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //No, and I'm not likely to find out.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //If anything, the diggers in this district might know something. But diggers don't talk to guards.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Especially not now they know I hate this filthy work. I bet they're laughing behind my back!
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Maybe the diggers in the arena district know where Nek disappeared to.");
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "Why don't you just collect some more protection money?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Why don't you just collect some more protection money?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek did his rounds before he disappeared. There's not much left to collect now.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "It's about Nek...";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //It's about Nek...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Yeah?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //I think I've found him.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //What? Where is he?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Feeding the rats...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //Oh no! Damn it! That means I have to run the show here now. I was hoping he'd be coming back.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Now I have a problem.
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //No news.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Keep me posted.
	};
};

// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "What's the problem?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //What's the problem?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //I'm in debt to Scatty, right up to my neck. Now he knows I'm doing Nek's job, he'll be coming round every day...
};	












//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //You have got used to our ways pretty fast. Welcome to the Guards!
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Fletcher_DIE (C_INFO)
{
	npc			= Grd_255_Fletcher;
	condition	= Info_Fletcher_DIE_Condition;
	information	= Info_Fletcher_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Fletcher_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Fletcher_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Traitor! To think we let a thing like you join the Guards. BAH!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //It's one of those traitorous fire mages! BAH!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Hi, traitor! The fact that you used to be one of Gomez' Shadows won't help you now!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Hey, what are you talking about, Fletcher?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //You're in with that New Camp scum, aren't you?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Hold on...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //I guess you must've thought we wouldn't figure it out, huh?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Woah... Hold your horses!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //No, YOU hold on - hold on to your head. 'Cos you're going to be missing it soon.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //DIE, TRAITOR!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn has entrenched himself at the back gate. He reacted the same way as Fletcher at the main gate. I don't really know why, but it must have something to do with my search for the focus on behalf of the New Camp.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, who's guarding the main gate of the Old Camp with a group of guards, called me a traitor and a renegade. He wouldn't listen to me and attacked me at once!");
			B_LogEntry			(CH4_BannedFromOC,"It looks like I've been banished from the Old Camp!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Look at that. It's a guy from the New Camp!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Look at that. It's a guy from the swamp camp!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //So what? What business is it of yours?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Your mine's gonna be ours soon.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Yeah? Well dream on!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Sorry, but I can't risk you telling anyone about it!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Hang on, I don't want any trouble.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //You should have thought of that before you showed your face here!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hey, what the...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Go, boys, let's get him!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"The gates of the Old Camp are now closed, they're protected by guards. They attack anybody approaching the Camp.");
	};
	
	AI_StopProcessInfos	(self);
};

