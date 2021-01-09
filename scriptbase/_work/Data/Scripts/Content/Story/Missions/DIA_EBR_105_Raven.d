// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //What can I do for you?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Who are you?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Who are you?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //I'm Raven. Gomez' right hand man. Anyone who wants to see Gomez has to talk to ME first.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "I have some weed for Gomez from Cor Kalom.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //I have some weed for Gomez from Cor Kalom.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Bartholo deals with that kind of thing. Gomez isn't bothered with gofers.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //You'll find him in the room on the right, behind the entrance, or in the kitchen in the big tower.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //Course he sleeps at night. I wouldn't disturb him then, if I were you.

	B_LogEntry			(CH1_KrautBote,"The weed supply for Gomez must be dropped off at Bartholo's. I'll find him in the house of the Ore Barons.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "I want to see Gomez. Thorus says I'm to be taken on as a Shadow.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //I want to see Gomez. Thorus says I'm to be taken on as a Shadow.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //We're always on the lookout for good men. You seem to have your wits about you. You might be okay.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //I'll take you to Gomez. Follow me. And don't touch anything!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT") ) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Gomez is over there. If you don't show him some respect, I'll take pleasure in teaching it to you personally, have you got that?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "How's the ore trade going?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //How's the ore trade going?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //The Old Mine's doing well. The last load of supplies from the outside world was massive.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "Gomez says I'm in.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez says I'm in.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Great! In that case, you can prove your worth with a first task.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //It shouldn't be too difficult for you, provided your connections are as good as you say.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "What d'you want me to do?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //What d'you want me to do?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //We do a lot of trade with the Brotherhood. That doesn't mean to say we trust 'em.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Go to the swamp.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //When you get to the Camp, keep your ears open. Anything you pick up might be useful for us.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //The more you find out, the better. It'll take a bit of tact, if you know what I mean.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Keep cool, I'm not going to get them angry.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //I knew you'd understand.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Raven has sent me to the Brotherhood in the swamp on behalf of the Old Camp. I'm to have a look around there and keep my ears open. Maybe I'll get some useful information for the Ore Barons there.");
};

// *********************************************
// 				Ausrüstung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "Where can I get better equipment?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Where can I get better equipment?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Go and see Diego, he'll give you some armor. It'll stop you from getting killed and it'll serve as an ID at the same time.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Your armor should give you access to all the places you need to go.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //If you need any weapons, go and talk to Skip. You'll find him in the big shed right at the back, left of the castle courtyard.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Diego has better ARMORS for Gomez' shadows. He's at the entry of the castle.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"The guard Skip in the rear courtyard sells WEAPONS. But only to Gomez' men.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "I just thought I'd report in.";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //I just thought I'd report in.
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Good. I like being kept up to date.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //The great invocation has taken place.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //You have done well.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Raven has fobbed me off with some cheap words! That's not the kind of attitude I had expected! From now on I'll do my own thing.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //They now want a minecrawler queen's eggs, so they can brew a potion that will enable them to contact the Sleeper. I have the eggs with me.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Very interesting. I wonder if it will work. Bring the eggs to the temple.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //You have done well.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Raven has fobbed me off with some cheap words! That's not the kind of attitude I had expected! From now on I'll do my own thing.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //I don't really know what they're planning yet.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Then why are you bothering me?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


