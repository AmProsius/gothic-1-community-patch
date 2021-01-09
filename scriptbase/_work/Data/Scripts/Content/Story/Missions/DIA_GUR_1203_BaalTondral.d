// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "Say nothing";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //You don't look like one who's submitted to slavery under the Ore Barons.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //You look more like a seeker - someone who's searching for the true faith. D'you not feel a fire inside your body which keeps you from sleeping at night?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //I see, you doubt that what the Ore Barons' slaves try to tell you is really true and just. You know why you doubt them, too. They're lying!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //With those lies they try to control weak spirits. But your spirit is stronger than their lies!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Don't you feel a longing for freedom every single day? Don't you feel it growing stronger? It guides your spirit. Let it happen!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Do you know what you're doing when you try to suppress it? You're denying your soul, denying yourself! Don't let your fears dominate your life.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Free yourself. You need to understand! The Sleeper WILL awaken. He will set you free and wash away all these disbelieving infidels.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Like dross that is washed away by the rain, they will vanish from this world. They will moan, whine and repent, but it will be too late.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Then they will pay the price. They will pay with their blood. And with their lives.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "Hey! You've spoken to me. Does that mean I may talk to you now?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hey! You've spoken to me. Does that mean I may talk to you now?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //I see you've become familiar with our rules. That's good.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //I can feel your great spiritual strength! Soon you'll be allowed to join our community.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //I have spoken to you because I wanted to give you a chance to prove your loyalty.
};

// **************************************************
// 				Loyalität beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "How can I prove my loyalty?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //How can I prove my loyalty?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Most of all, we need new souls to join our community.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //By recruiting one more man to our camp, you will prove that you're willing to do good service to our community.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral has sent me into the Old Camp to recruit a new man for the Brotherhood. I suppose that's a good chance to win his favor!");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "Where can I recruit new members for the Brotherhood?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Where can I recruit new members for the Brotherhood?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //The Old Camp is a good place to try, since a lot of the people there are fed up with fear and lies. They just need some kind of support.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //I guess you won't be very successful in the New Camp. The men living there are barbarians.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "Why are you so desperate for new members?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Why are you so desperate for new members?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //The Sleeper has spoken to our master, revealing that he has an important message for us.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //However, he has not gathered full strength yet. That's why he needs OUR strength to contact us.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Therefore we are preparing a great invocation, and the more men participate, the likelier we are to be successful.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //If you want to know more about it, go to the large court in front of the temple hill. But don't disturb our master in his meditations!
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "Here's somebody who would like to make your acquaintance, Master!";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Here's somebody who would like to make your acquaintance, Master!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Who have you brought me? Is he worthy?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //He will certainly require your spiritual guidance, Master.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Very well. From now on, he shall be one of my disciples.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //You will come to my hut every day to listen to my words. Your soul can still be saved.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Heißt das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC lösen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,"Dusty is now Baal Tondral's disciple. I've accomplished my task.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "Master! I would like to join the Brotherhood.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Master! I would like to join the Brotherhood. I need you to speak in my favor.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //You have proven your worth. Go to Cor Kalom and don the robe.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral considers me worthy of wearing a novice's robe!");
};








