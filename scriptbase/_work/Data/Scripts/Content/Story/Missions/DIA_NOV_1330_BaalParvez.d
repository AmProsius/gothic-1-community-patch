// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //The Sleeper be with you, stranger!
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //I'm here to guide you onto the right path.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "And which is the right path?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //And which is the right path?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //The path of the Sleeper. He alone has the power to set us free.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //The Gurus are preparing a great invocation in our camp - they want to get in contact with the Sleeper.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //So far he's just talked to us in visions - but now it's time to get in touch with him.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //We'll need as many supporters as possible for that. By focusing our spiritual power, we'll get through to him.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Our camp is some distance away, in the swamp - I can take you there though, if you want.
};

// **************************************************
//					Vorteile für mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "What would be the benefit of joining you?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //What would be the benefit of joining you?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Maybe you're one of the chosen people who receive the gift of magic from the Sleeper.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //Or you might obtain the highest honors and become a templar. Only the best fighters among us can obtain that position.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //If the Sleeper is with you, you can even combine both - the best of the templars receive the gift of magic as well.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //You see, our Brotherhood has a lot of possibilities for you.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //You should be aware of that before you decide on joining any other camp!
};

// **************************************************
//					Schläfer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Who's the Sleeper?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Who's the Sleeper?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //The Sleeper speaks to us through dreams and visions.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //He has been leading us ever since he first made contact with Y'Berion five years ago.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //All the followers of the Brotherhood have renounced the three gods. We pray only to the Sleeper for salvation.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Salvation from what?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //From this goddamn place, of course! The Sleeper will show us the way to freedom!
};

// **************************************************
//			Was hat Schläfer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "What did the Sleeper tell you?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //What did the Sleeper tell you?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //He guided us to the swamp, to the old temple ruins. That's where we built our camp.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //He gave us independence - none of us need to labor in the mines.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //He showed us what swampweed can do. We sell it to the other camps, and in exchange we get everything we need.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //And he gave some of us the gift of magic. Of an old and powerful magic which is different from the one the magicians of the realm use.
};

// **************************************************
//		Erzähl mir von der MAgie des Schläfers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Tell me about the magic of the Sleeper.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Tell me about the magic of the Sleeper.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //This gift enables you to control things with the power of your mind.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Only the Gurus of our Brotherhood have been initiated into the secrets of this magic.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "Take me to your camp. I want to have a look at it!";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Take me to your camp. I want to have a look at it!
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez is a missionary of the Brotherhood. He stays in the Old Camp to look out for new believers in the SLEEPER! He offered to accompany me to the swamp camp, the home of the Brotherhood.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //Very good! I'll go ahead. Follow me!
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Here we are. Down there lies the camp of the Brotherhood.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //You've taken your time, brother! Down there you see the Camp.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Go through the gate and speak to my brothers. I'm sure you haven't come here for nothing.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Ask for Cor Kalom. He's in charge of the novices and tutors.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //I'll go back to the Old Camp - there are still many infidels who need to be guided to the right path.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Good luck.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"The Swamp Camp is below me. My companion advised me to talk to Cor Kalom. He is the head of the novices and tutors.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


