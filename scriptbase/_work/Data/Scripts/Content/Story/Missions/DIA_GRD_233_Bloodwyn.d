// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //See ya.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Take care of yourself, kid.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Don't you worry about anything here in the Camp! We'll be looking out for you.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 2) 
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //Hey, you!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //Are you talking to me?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //I'm warning you! People like you can get into trouble awfully quick round here!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //And most of the guys they chuck in here are bastards!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //They think they can do what they like to you. But we won't allow that.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomez wants some peace in the Camp, and we guards make sure he gets it. But it's a job that doesn't come cheap.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //That's why I'm asking you for some ore. Look at it as a kind of token of friendship. You help us, and we'll help you. If you get in trouble, we'll be there for you.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Why not? How much ore were you thinking of?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"You want me to pay protection money? I can take care of myself!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Is that a threat?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //You mean you want me to pay protection money? No thanks, I can take care of myself!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Have it your own way, kid. You'll soon regret turning down a friendly offer!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Is that a threat?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //On the contrary! It's an offer of friendship!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Why not? How much ore were you thinking of?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Not much. 10 ore, that's all I need.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"I don't have 10 ore.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Here's your ore. I can always use a friend or two.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Here's your ore. I can always use a friend or two.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //You seem to be a clever lad. From now on, we'll be watching out for you.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //But that doesn't mean to say you can do what you like around here, okay?
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //I don't have 10 ore.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Then I'll take whatever you have - that's okay. You can give me the rest next time I see you.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Let me see...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Hey, look at that? Looks like someone can't count to 10, eh?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //I'm just gonna take everything you have. That'll help me forget you lied to me.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Oh, I take small donations too. It's the thought that counts! Thanks for the ore, kid!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //From now on, I'll be watching out for you whenever you're in the Camp.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hm, you really are broke, aren't you. Well, I guess there's always next time...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) )
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Ah, good to see you, my friend!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //How about your daily contribution? Your 10 ore is due, you know.
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Here, take it. 10 ore's not much among friends.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"I'm not paying - you've had enough out of me already.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hey, you!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Now what?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //The time's come for you to prove you're a true friend.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Just 10 ore, and you're in - what d'you say?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Here, take it. 10 ore's not much among friends.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //My thoughts exactly!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //I'm not paying - you've had enough out of me already.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //You disappoint me! We're not friends anymore. See to it that you don't get mugged and robbed on your own now!
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Don't worry, I can take care of myself just fine.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //We'll see...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "I've changed my mind. I'm going to pay you the 10 ore after all.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //I've changed my mind. I'm going to pay you the 10 ore after all.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //There now! You see, you CAN make the right choices.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //And from now on, you'll keep paying me your daily contribution, won't you?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Then come back when you have it.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Jesse sent me to pay his 10 ore for him.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse sent me to pay his 10 ore for him.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //What you should do is pay YOUR 10 ore.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Never mind about Jesse. He's a loser, he's not got long anyway.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //No - I am paying for him. So take his 10 ore and leave him be!
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Okay, man, if that's the way you want it.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Oh! It looks like I don't have that much ore on me.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //That's an omen, man! Think again! Paying for that bum is a waste of good ore!
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //You're one of us now. Well done. The Guards need men like you!
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
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //It's the traitor in our midst! PAH! And we called you a guard!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Looks like we've overlooked one of the rebellious fire mages!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //It's the Shadow that betrayed us!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Hold on. What are you talking about, Bloodwyn?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //So you're in cahoots with the New Camp, huh?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //No, wait, I'm still...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Guess you must have thought you could go on like that forever.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Stop this nonsense...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Traitors like you must die.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //DIE, TRAITOR!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, who's guarding the main gate now, reacted the same way as Bloodwyn at the back gate. I don't know why, but it must somehow be connected to my search for the focus on behalf of the New Camp.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn, who's guarding the back gate of the Old Camp with a group of guards, called me a traitor and a renegade. He wouldn't listen to me and attacked me at once!");
			B_LogEntry			(CH4_BannedFromOC,"It looks like I've been banished from the Old Camp!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //So you've ventured out of your New Camp? That was mighty stupid of you!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //Oh, so you've ventured out of your swamp camp? That was mighty stupid of you!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //What? What do you mean?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Haven't you heard about the attack on your mine?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //What...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Sorry, but we can't let you go shooting your mouth off!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hey, I don't want any trouble...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //You should've thought of that before!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Look, I've had about enough of this...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //So have I! KILL HIM!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,"The gates of the Old Camp are now closed, they're protected by guards. They attack anybody approaching the Camp.");
	};
	
	AI_StopProcessInfos	(self);
};

