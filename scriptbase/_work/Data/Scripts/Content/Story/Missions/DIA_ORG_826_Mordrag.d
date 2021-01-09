// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Hey, newcomer! I'm Mordrag. You should remember that name - you can buy any kind of goods from me at a cheap price!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Show me your goods.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Show me your goods.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Choose something...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"The rogue Mordrag sells stolen goods at the market.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FÜR MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "Are you really the magicians' courier?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Are you really the magicians' courier?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //What if I am?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //I'd like to have a chance to talk to the magicians. I have to get inside the castle.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //The magicians' couriers bear seals which allow them entry to the castle. If you were one of us, you could get such a seal...
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "You have a problem.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //You have a problem.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Really? What's that?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //There are people around here who want to get rid of you.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Really? Then you can tell them they should send someone along to enforce their wish.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //What makes you so sure I'm not the one to do it?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Cos I think you're smarter than that, boy. You'll soon realize that there are better opportunities than working for Gomez.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //We too need capable people in the New Camp, and nobody tells you what to do.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Tell me more about the New Camp.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Tell me more about the New Camp.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //It's the camp where you have the most freedom within the colony. We don't have any Ore Barons or Gurus bossing us around.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //We have our own mine. But the ore that is produced there isn't given to the damned king!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //So what is it used for?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Our magicians are working on a plan to break out of here. All the ore is collected for this plan.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //While Gomez and his people are lazing around, we drudge for freedom - that's what's going on.
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "And if I want to join the New Camp...";//könntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //And if I wanted to join the New Camp... could you help me?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //If you're serious we can go now! I can take you to Lares. He's the head of our gang.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //But if you prefer to beat me out of the Camp... Well, go for it!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Let's go to the New Camp!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Let's go to the New Camp!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //O.K.! Follow me.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag has agreed to show me the way to the New Camp. I hope this isn't a trap!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //Well, here we are.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //I thought you'd never arrive! Never mind - we're here!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //When you pass through the gate, you'll reach the New Camp. Talk to Lares. He'll help you. Give this to him. It's a precious ring.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //It's your ticket to see Lares. You need a good reason to be allowed to meet him.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Well, thinking about it, I think I'll stay here for some time. I've earned enough for now, and things are heating up in the Old Camp.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //If you want, come and meet me at the bar - it's the hut out on the lake. Take care!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //See you.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Now we're in front of the gate of the New Camp. Mordrag gave me a ring I am supposed to give Lares, the leader of the rogues, if I really want to join the New Camp. Mordrag wants to stay in the bar at the lake for a while.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "The camp ain't big enough for the both of us!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //There camp ain't big enough for the both of us!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Pardon me?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"Just scram out of this camp!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"There's no room here for people who steal from the Ore Barons!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Thorus sent me. He wants to get rid of you once and for all.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Just get out of this camp!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Big words from a small man...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //There ain't no room for people who steal from the Ore Barons!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //Oh, that's what you mean! Why didn't you just say so...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Thorus sent me. He wants to get rid of you once and for all.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Really? Thorus? That's all I wanted to know...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Just get out of here...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"I knocked Mordrag out and told him I never wanted to see him in the Old Camp again.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Lares has a message for you.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares has a message for you.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Tell me about it.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //He wants to know what's going on in the Sect Camp and he wants you to find out.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //I get the feeling this problem will solve itself...

	B_LogEntry	(CH1_JoinNC,"I told Mordrag what Lares asked me to say. He mumbled something about things taking care of themselves. No idea what he meant by it!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares told me to help you with this sect business.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares told me to help you with this sect business.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //You see... I knew I wouldn't have to take care of it myself.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Do you want me to settle the affair all by myself?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //I'm sure you'll make it. Listen: It's important to find out the truth about this invocation story.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //I know that those sect loonies are planning a big invocation. Me, I don't believe in the Sleeper - but one thing's for sure:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //The Gurus have powerful magic at their command. Therefore it's better to know what's going on. You with me so far?

	B_LogEntry			(CH1_GotoPsiCamp,"Mordrag has passed the buck of spying on the swamp camp quite cleverly to me. The Gurus seem to be preparing a big invocation, but I should get more details.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Could you give me more concrete instructions?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"I'll see what I can do.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Could you give me more concrete instructions?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Talk to Lester. I once spent a long time in the Sect Camp, and he helped me back then. He's with the good guys.
	B_LogEntry(CH1_GotoPsiCamp,"I'm supposed to talk to a novice called Lester in the camp of the Brotherhood. He seems to be trustworthy and he's helped Mordrag before.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //I'll see what I can do.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //As soon as you know about their plans, come back and report.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "About that sect business...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //About that sect business...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //What?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //The great invocation has taken place.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //No! You mean you took part in their folly?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //They intend to strengthen themselves and to contact the Sleeper by means of a potion they produce from minecrawlers' eggs.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //What a scream! Those madcaps really believe all that, don't they?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //I'm curious about the result.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Me too. Let me know when the Gurus have finished making complete fools of themselves.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag killed himself laughing when I told him about the minecrawlers' eggs. He doesn't seem to be very interested in spying on the Gurus any more, though. I'll just consider the matter settled!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //I haven't found anything out yet.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Then get on with it...
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
