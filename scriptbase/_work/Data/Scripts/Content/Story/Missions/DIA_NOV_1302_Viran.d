// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Viran_Exit (C_INFO)
{
	npc			=  Nov_1302_Viran;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Viran_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance  DIA_Viran_What (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_What_Condition;
	information	= DIA_Viran_What_Info;
	permanent	= 0;
	description	= "What are you doing here?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //What are you doing here?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //We're picking the swampweed to be processed by our brothers, so it can be smoked later on.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //It's quite dangerous to pick it in the swamp, but the stuff only grows here. Actually, that's a good thing.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Why?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Because then the other two camps won't get it. We're the only ones in the colony who are able to pick swampweed.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //We can trade it with the other two camps - and WE can set the price.
};

// **************************************************
//				Kraut abholen
// **************************************************

instance  DIA_Viran_FetchWeed (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_FetchWeed_Condition;
	information	= DIA_Viran_FetchWeed_Info;
	permanent	= 0;
	description	= "Baal Orun sent me. I'm to take the whole harvest to Kalom.";
};                       

FUNC int  DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Baal Orun sent me. I'm to take the whole harvest to Kalom.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //You think it's that easy, do you?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //Anybody could turn up like that. 'Baal Orun sent me' - and whoosh - the whole lot of the weeds were gone.
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Go see him and ask him if you don't believe me!",DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"But Baal Orun really has sent me!",DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //But Baal Orun really has sent me!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Sure.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Go see him and ask him if you don't believe me!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //I have a better idea. You prove your loyalty by doing a little job for us!
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance  DIA_Viran_Bloodflies (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Bloodflies_Condition;
	information	= DIA_Viran_Bloodflies_Info;
	permanent	= 0;
	description	= "And what do you want me to do?";
};                       

FUNC int  DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Bloodflies_Info()
{
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //And what do you want me to do?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //It's really nothing. Work in the swamp, it's a bit risky, and then there's those damn bloodflies.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Work would be much easier without them! Do you follow?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,"Viran will only give me the swampweed once I've killed all the bloodflies within a radius of 20 paces.");
};
	
// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance  DIA_Viran_Running (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Running_Condition;
	information	= DIA_Viran_Running_Info;
	permanent	= 1;
	description	= "I don't see any more bloodflies anywhere.";
};                       

FUNC int  DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Running_Info()
{
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //I don't see any more bloodflies anywhere.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //But there are some more bugs within twenty paces!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //You won't get off that easily!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //No more bugs to be seen. That was a good job you did!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Someone who works like that is either on our side or a complete idiot!
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //An idiot would be too stupid to fool me, right?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Here, take the harvest and take it to Cor Kalom.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //If he complains and says it's not enough, tell him to move his butt here himself, to give him an idea of how much hard work it is.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran gave me the second half of today's swampweed harvest. Let's see whether Cor Kalom is satisfied with the amount.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,"Viran gave me today's swampweed harvest. Doesn't look that much. Perhaps there's a second group of gatherers.");
		};
		B_GiveXP		(XP_WeedFromViran);
				
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos (self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Viran_Perm (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Perm_Condition;
	information	= DIA_Viran_Perm_Info;
	permanent	= 1;
	description	= "How's the picking going?";
};                       

FUNC int  DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Perm_Info()
{
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //How's the picking going?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Yeah, yeah, just take make fun of me. I'm sure you're getting better jobs from the Gurus.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Well, at least I don't need to do the dirty work myself. The 'infantry' do that - he, he, he.
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Viran_RipOff (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 5;
	condition	= DIA_Viran_RipOff_Condition;
	information	= DIA_Viran_RipOff_Info;
	permanent	= 0;
	description	= "I'm to take all the weeds to Cor Kalom again.";
};                       

FUNC int  DIA_Viran_RipOff_Condition()
{
	if ( (Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_RipOff_Info()
{
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //I'm to take all the weeds to Cor Kalom again.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Again?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Now you're not going to tell me to kill all the swampsharks for you, are you? I really don't have that much time.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Okay okay! Here, take the bloody weeds!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








