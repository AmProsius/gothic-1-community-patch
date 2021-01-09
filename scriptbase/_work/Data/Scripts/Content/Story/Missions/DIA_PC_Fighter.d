//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //Let's fight!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //See you later.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begrüßung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hey. A new face.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Who are you?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //I am Gorn, mercenary of the magicians.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "What do you have to do as a mercenary of the magicians?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //What do you have to do as a mercenary of the magicians?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee has made a deal with the magicians. He hires the best fighters to be found in the colony. Which means us.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //We take care that the scrapers can mine the ore without being bothered and keep trouble away from the magicians.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //The magicians make sure we'll get out of here. And we get a small share of the ore as our pay.
};

//*************************************
//			Hütte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "Can I stay somewhere here?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Can I stay somewhere here without having to kick somebody out of his hut?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //I don't think so. But if that's really what you want to do, go and see Shrike.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //He's taken the hut right at the front, at the entrance to the cave. It was empty - but it really belonged to us.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Us?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Well, us mercenaries. Mercenaries and rogues live separately here. And none of Lares' gang should be here, on this side of the big hole.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //It doesn't make much difference really. But he didn't ask. And you can't let those rogues get away with everything, because then they get real cocky!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Gorn, the mercenary, told me that Shrike had taken a hut of the mercenaries without asking. Since I've asked Gorn, none of the mercenaries will interfere if I can 'convince' Shrike of getting another hut.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			Hütte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Shrike has moved to another hut.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Shrike has moved to another hut.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Good. Torlof just told me that he wanted to have a word with the guy.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Gorn was really amused that I kicked Shrike out of his hut. I think he's an honest guy. Tough, but fair. I should stick to him in the future.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			Söldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "What do I have to do to join the New Camp?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //What do I have to do to join the New Camp?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Before Lee admits you, you'll have to improve your fighting skills. It doesn't matter what weapon you use, but you have to be good.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Besides, you should be very experienced with the life here and everything.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //If you don't want to go to the other camps, you should try to join the rogues before you start as a mercenary.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Have you got any more of that stuff?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Plenty. You wanna trade?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "Why did you take part in one of the gang's raids?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Why did you take part in one of the gang's raids?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //Who says I did?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Why would you have so much of the stuff if it wasn't true?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Don't you think that this is all from ONE haul.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //You take part in raids regularly?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //If I did, I couldn't tell you. Lee wouldn't like that one bit.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //I see.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig für Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Ahh, it's you! My friend Lester from the swamp camp told me all you did there.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //For somebody who hasn't been here for long, you've come quite a way.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //I came quite close to becoming worm food a few times, too.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "I have an important message for the Magicians of Water!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //I have an important message for the Magicians of Water!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Then you should talk to Saturas. He's the highest of the water mages and spends all day studying some writings or other.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //But no matter how important your message is, the guards of the upper level won't let you through to him.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //Can't you put in a good word for me?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //I can't, but Cronos, the keeper of the ore, might be able to give you permission.
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Where can I find this 'keeper of the ore'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Where can I find this 'keeper of the ore'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//If you proceed from here, you'll come across the big dwelling cave behind the dam.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos is usually at the grid over the big ore mound.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //But he's a bit arrogant. You'll have to convince him that your message is important.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn recommended me to go straight to the High Magician of Water, who's called Saturas. Cronos, the keeper of the ore, can get me an audience. Cronos is to be found in the center of the Camp, at the grid above the ore mound."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Hi, greenhorn. As you can see, the colony is quite a small place.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //You can't help bumping into people all the time.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "What are you doing here?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //What are you doing here?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Oh, I'm trying to track down an old legend.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //A legend?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Yes, Milten, my pal from the Old Camp, told me that monks used to live here.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Of course, that was long before the Barrier was created.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //It's said they worshipped a god who gave them the power to turn into animals.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //I'm sure there are still treasures from the old times here.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //What brings you here?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "I'm looking for a magic focus.";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //I'm looking for a magic focus.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //It must be somewhere in this area.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //The thing you're looking for might be in the old ruined monastery beyond the canyon.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "We could go on together.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //We could go on together.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Good idea. This area is crowded with snappers.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //When they're on their own, they're no problem for an experienced hunter. Most of the time they hunt in packs though.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //A pack can even tear the cleverest sword fighter to pieces.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //So we'll go together?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Okay, but before we cross this log, I'd like to examine the canyon. I like to know what's at my back.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Come with me, I've discovered a path which will take us there.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"When I approached the ruined monastery, I met the mercenary Gorn. He's here to search the ruins for old treasures.");
	B_LogEntry			(CH3_MonasteryRuin,"We'll continue our search together. Gorn warned me of big herds of snappers in the area.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //That's what I call luck. Apparently this used to be a storage cave.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Why don't you take the lead now, I just wanted to make sure that we won't be surprised on our return trip.

	B_LogEntry		(CH3_MonasteryRuin,"We have discovered a secret supply cave. Above all, one key and two spell scrolls proved to be quite interesting.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //You seem to have lost interest in the ruined monastery.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //I'll go on, on my own.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Just follow me if you change your mind.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //This damn gate. They say nobody in the colony has ever been able to open it.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //The little beasts over there seem to be the only ones who have managed to get into the inner yard.

	B_LogEntry		(CH3_MonasteryRuin,"We're right in front of a closed gate. Looks like it can't be opened from the outside.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "What happens now?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //What happens now?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //You have to find a way to get to the other side of the gate.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //There's some kind of platform up there. But it seems to be too high to climb.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //We'll have to find another way.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Looks like a pedestal of some sort.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Perhaps the artefact you're looking for used to lay here.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //You actually managed to open the gate. That spell of yours was real clever.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //And on we go, come on.

	B_LogEntry		(CH3_MonasteryRuin,"With the aid of the spell scrolls from the supply cave, I transformed myself into a meatbug. This way I was able to crawl inside through a gap in the wall.");
	B_LogEntry		(CH3_MonasteryRuin,"The gate is now open.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //You seem to have lost interest in the ruined monastery.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //I'll go on on my own.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Just follow me if you change your mind.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //So you found your magic artefact!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Yeah. I have to take the focus to the Magicians of Water. They need it.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //I'll accompany you for a while.

	B_LogEntry		(CH3_MonasteryRuin,"I found the focus in a kind of study room. Gorn will accompany me some more.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //OH HELL!!! What monster's that over there?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Where did THAT come from?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //Looks like one of those virtually invincible trolls. Only smaller!
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Whatever, if we want to get out of here, we have to get past that beast.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //That was hard work.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Yeah, we defeated that monster. But if that was just a young troll...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //... then you'd rather not bump into its parents, huh?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Something like that.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //This is where we go our separate ways. I want to stay here for a while and have a look around.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //But I'm sure we'll meet again. See you later, my friend.

	B_LogEntry		(CH3_MonasteryRuin,"On the way back into the monastery courtyard, we met a young troll. It was a hard fight, but we've won it.");
	B_LogEntry		(CH3_MonasteryRuin,"My way with Gorn has ended now. I have a feeling that I'll be meeting him again soon.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "I met Diego and Milten in front of the Old Camp!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //I met Diego and Milten in front of the Old Camp!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //That's good news!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //They want to meet you and Lester. At your usual rendezvous.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Thanks. There's nothing more valuable than good friends in troubled times like these.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //You're almost one of us by now. You're reliable!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"I informed Lester and Gorn about the meeting with their friends. Now, this isn't my affair any longer. They'll know what do do next..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "What did you see in the Free Mine?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //What did you see in the Free Mine?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //After I returned from the ruined monastery, I wanted to drop by at Okyl's, the boss of the Free Mine.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //But when I arrived, there were corpses lying everywhere.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //I just spotted some guards entrenching themselves at the entrance to the mine.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //How could so many mercenaries be defeated by only two dozen guards?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //It looked like an ambush to me. Nobody would have expected attackers to cross the mountains.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //The element of surprise can multiply the force of a troop.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "What have you got planned now?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //What have you got planned now?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Our entire defense strategy will have to be changed. That takes time.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Until Lee and his people are ready, I'll join Cord's provisional guard.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Are you planning a counterattack?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Not yet, but the day will come.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //If ever you're looking for me, start here and walk towards the mine. I'll be on guard there.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "How's it going?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //How's it going?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Everything's quiet. Nothing's moving in the Free Mine.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee is still busy organizing our defense!
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //You're just in time! We're preparing our counterattack.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Taking back the Free Mine is the first step.
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "You're planning to retake it with just four men?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //You're planning to retake it with just four men? Where are all the mercenaries?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //A frontal attack is no good! Gomez' people are too well entrenched for that!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //But we could run a stealth mission, eliminating one man after another - that could work.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee asked me to give you a message.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //As one of our best mercenaries, you have been chosen to carry out this mission.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //As a Magician of the Circle of Water and an experienced fighter, you have been chosen to carry out this mission.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //As one of our best rogues, you have been chosen to carry out this mission!
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Although you aren't one of us, you have done our camp a great service and proved your worth more than once.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //We're offering you the chance of carrying out this mission!
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //I'll go with you. Together we can make it!
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "The first step? What will be the second?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //The first step? What will be the second?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //As soon as the mine is ours again, we'll start looking for the mountain pass that Gomez' people used in the raid!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //When the pass is closed, the situation will be under control again.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //I see.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "Why me, of all people?";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Why me, of all people?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //You've already proved more than once that you can be brave and clever at the same time!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Besides, you know the Old Camp and the guards better than most of us.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //You are the best man for this difficult job!
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Okay, let's go and teach the unwelcome guests in the mine a lesson!";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //Okay, let's go and teach the unwelcome guests in the mine a lesson!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //I didn't expect you to say anything else!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Here, take this key. It opens the gatehouse in front of the entrance to the mine.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "Why not. I need to get into the mine anyway!";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Why not. I need to get into the mine anyway!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Whatever YOUR reasons may be, I'm glad we're dealing with this thing together!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Here, take this key. It opens the gatehouse in front of the entrance to the mine.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Oh, I nearly forgot!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //The rogue Wolf wants to talk to you urgently before we leave for the mine.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"He can wait, we have more important things to do.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Then I'd better go there now.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Wolf, the rogue, wants to speak to me again before we make our way to the mine. I'm to look in on him.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //He can wait, we have more important things to do.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Whatever you say!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Then I'd better go there now.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //You do that. I'll wait for you right here.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Looks like you do want to speak to Wolf!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //This is the wrong direction! We have to go to the mine!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //I'll wait for you at the provisional guardpost!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "Let's set out for the mine!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Let's set out for the mine!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //It's time to drive the guards out of there!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //You go on ahead, I'll follow!

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //WATCH OUT, RAZORS!!!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //They hunt in packs like snappers, but they bite much harder!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //We should do away with them. You know me, I like to know what's at my back.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Hold on, do you see all these corpses?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //You go down to the entrance to the mine, I'll stay here and make sure that we don't get a nasty surprise thrown at us from behind.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //When you're down there, I'll follow.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //I heard you fighting and went after you immediately.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //An old acquaintance... But that account is settled.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Good, open the gate, I'll watch out.

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Oh, man. That was a really tough fight.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //I'd never have thought Gomez' guards would offer that much resistance.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //The main thing is that we've driven them out of our mine again.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //I'll stay here and make sure it stays that way!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee über die befreite Mine informieren.     ***Björn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "How's the situation?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //How's the situation?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Everything's quiet. Nothing moving in the Free Mine.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //It can't be long now till Lee sends reinforcements up here.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //I'll just make myself at home until then.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //That's an interesting Orc standard you have there.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Is that from the former Orc slave in the mine?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //It's an Orcish symbol for friendship. I want to enter the Orc town with it.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //I hope for your sake that the Orcs will respect this... THING!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








