// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Joru_Exit (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 999;
	condition	= DIA_Joru_Exit_Condition;
	information	= DIA_Joru_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Joru_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Was machst du?
// **************************************************

instance  DIA_Joru_Greet (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Greet_Condition;
	information	= DIA_Joru_Greet_Info;
	permanent	= 0;
	description = "What are you doing here?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //What are you doing here?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //I'm teaching the words of the Sleeper to the novices.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //I'm still a novice myself, but soon I'll be a Baal - one of the Gurus.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //I've even spoken to Y'Berion. He's the chosen one. He told me that if I work hard, I can soon be a master myself.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //But I'm still putting that off. There's no rush - you understand? I can still become a master anytime.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //At the moment I'm quite happy about my current task.
};

// **************************************************
//					Tester
// **************************************************

instance  DIA_Joru_Tester (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Tester_Condition;
	information	= DIA_Joru_Tester_Info;
	permanent	= 0;
	description = "What's your task here?";
};                       

FUNC int  DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_Tester_Info()
{
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //What's your task here?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //I test the new substances developed by Cor Kalom in his alchemy lab with my pals here.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //His aide gives us something new every couple of days. And we test it.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //This weed opens your spirit. If you take the right amount, you can get in touch with the Sleeper.
};

// **************************************************
//				Schonmal Kontakt?
// **************************************************

instance  DIA_Joru_SleeperContact (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_SleeperContact_Condition;
	information	= DIA_Joru_SleeperContact_Info;
	permanent	= 0;
	description = "Have you ever been in contact with the Sleeper?";
};                       

FUNC int  DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_SleeperContact_Info()
{
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //Have you ever been in contact with the Sleeper?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //No. Not yet. But that's because we never get enough of the stuff.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom always wants to hear about the effect of it, but I get the impression he's not really interested in my opinion at all.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //If I find the stuff stimulating, he passes it straight on to the Gurus...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //But soon I'll be a Guru myself, then I can go right to my limits and listen to the voice of the Sleeper myself.
};


// **************************************************
//					JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance  DIA_Joru_JoinPsi (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JoinPsi_Condition;
	information	= DIA_Joru_JoinPsi_Info;
	permanent	= 0;
	description = "I'd like to join your camp - can you help me?";
};                       

FUNC int  DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JoinPsi_Info()
{
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //I'd like to join your camp - can you help me?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //You want to join us? That's good! Just wait... yes, I think I can help you.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //I'm not a Guru yet, but I have some influence in the Brotherhood.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //You'd have to do me a favor. Have you seen Fortuno yet?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"No.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Yes.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Then you have your daily ration? If you give it to me then we're in business.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //I'll think about it.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Then go, see him and collect your daily ration. If you leave me all the swampweed he gives you, we're in business.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //I'll think about it.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Joru would like to have my daily ration of swampweed I get from Fortuno.");
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Joru_JointsRunning (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JointsRunning_Condition;
	information	= DIA_Joru_JointsRunning_Info;
	permanent	= 1;
	description = "I have swampweed on me. You can have it.";
};                       

FUNC int  DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JointsRunning_Info()
{
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //I have swampweed on me. You can have it.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Good! You must have noticed that none of the Gurus wants to talk to you.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //You can change that by impressing them. I can tell you how to do that.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //We agreed on three Northern Dark and nothing else! Get me the weeds, THEN we can do business!
	}; 
};

// **************************************************
//			Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance  DIA_Joru_ImpressGurus (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_ImpressGurus_Condition;
	information	= DIA_Joru_ImpressGurus_Info;
	permanent	= 1;
	description = "How can I impress the Gurus?";
};                       

FUNC int  DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_ImpressGurus_Info()
{
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //How can I impress the Gurus?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar instructs the novices in the magic of the Sleeper.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //If you want his attention, use magic.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //But don't give him the Fist of Wind! Send one of his audience to sleep or something like that.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib is over there at the main gate. He's one of the toughest guys. I think Lester might be able to help you with him. Speak to him as soon as his master is away.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //The other Gurus are basically quite okay - just try to make yourself useful.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Thanks for the advice.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Hey - a deal's a deal.
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi,"In order to impress Baal Cadar I have to cast a sleeping spell on one of his listeners.");
		B_LogEntry	(CH1_JoinPsi,"I shall ask the novice Lester how to impress Baal Namib at the main gate. I should make sure no Guru is nearby, though!");
		Joru_JoinPsi = TRUE;
	};
	
	Joru_Tips = TRUE;
};

// **************************************************
//					Woher Magie?
// **************************************************

instance  DIA_Joru_GetMagic (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_GetMagic_Condition;
	information	= DIA_Joru_GetMagic_Info;
	permanent	= 1;
	description = "How do I get at the magic of the Sleeper?";
};                       

FUNC int  DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
		B_LogEntry		(GE_TraderPSI,"Baal Cadar sells RUNES and SCROLLS.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //How do I get at the magic of the Sleeper?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar sells runes and spell scrolls. That's no use to you if he doesn't talk to you, right?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Maybe another Guru can help you.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Weißt du, es ist ziemlich gut. Es öffnet deinen Geist für die Worte des Schläfers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit für eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 


	










