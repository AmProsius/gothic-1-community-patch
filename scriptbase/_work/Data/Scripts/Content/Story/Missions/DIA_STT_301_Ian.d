
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //I'll just have a look around.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Don't make any trouble.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "Are you Ian, the boss of the mine?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //Are you Ian, the boss of the mine?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Yes, I'm Ian. And this is my mine. So don't touch or break anything.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Isn't that Gomez' mine?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Isn't that Gomez' mine?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Yes, of course this is the mine of the Old Camp. But in here there's only one boss - and that's me.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Can you tell me something about the ore production here? "; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Can you tell me something about the ore production here?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //We dig for ore day and night. This means a storage of 200 sacks per month and another 20 sacks which will be melted down.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Hundreds of blades can be forged with the ore we supply to the King.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "I've heard that the ore has magical qualities. Tell me about it."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //I've heard that the ore has magical qualities. Tell me about it.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //The magic ore does have special qualities. Weapons forged from it don't break, their blades are sharper than usual ones.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //An army equipped with these weapons has a decisive advantage in battle.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tell me more about the ore."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Tell me more about the ore.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Unfortunately the magic powers of the ore vanish during the smelting process. They know the right smelting technique in the blast furnaces of Nordmar.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //But even without the magic powers, weapons made from this ore are extremely resistant and do more damage than normal weapons.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tell me about the mine."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Tell me about the mine.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //If you want to look around here you need to be careful. There are minecrawlers in the caves. You'd better stay in the main shaft.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //And leave the templars alone. Even if they only hang around most of the time, they're the best fighters you can ever have at your side when it comes down to the crawlers.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //I'll keep that in mind.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //I have some work to do. And don't keep my boys from doing their work.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //I'll just have a look around here.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "I'm here to collect the list for the Camp."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //I'm here to collect the list for the Camp.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Anybody could say that. Get lost.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Diego sent me. I'm to collect the list."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Diego sent me. I'm to collect the list.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //Alright, here's the list. Tell them to hurry up with the deliveries.
	B_LogEntry  (CH1_BringList,"Ian gave me the list without any problem.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "There must be a nest of minecrawlers somewhere here.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //There must be a nest of minecrawlers somewhere here.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //There are probably dozens of nests here.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Listen, I need to get to this nest now...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //I don't have time to see to it now. Our masher doesn't work any more. The gearwheel broke a few hours ago.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //I've no idea where to get a new one.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Just get me a gearwheel, then I'll see to your problem.

	B_LogEntry		(CH2_MCEggs,"Ian, the boss of the mine, will not help me find the nest. I had better get him a new gearwheel for his broken ore masher. He mentioned an abandoned side tunnel where I might find an old masher.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "A gearwheel? Where am I supposed to get that?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //A gearwheel? Where am I supposed to get that?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //No idea. I'm as much at a loss as you are!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //But there's an old broken masher in a side shaft. Maybe you'll be lucky there.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "I have the gearwheel.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //I have the gearwheel.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Hey, well done. I think that'll work. Now what about you, you're looking for the nest of the minecrawlers... hm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Just go to Asghan and tell him to open the gate, so you can search the dark shafts.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //"Just tell him ""Everything's gonna be fine."" Then he'll know that I've given you permission."

	B_LogEntry		(CH2_MCEggs,"I brought Ian the gearwheel from the abandoned ore masher. Ian said I should say EVERYTHING'S GOING TO BE FINE to Asghan. Apparently, that'll make him open the gate to the dark shafts.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "I'm still looking for the crawlers' nest.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //I'm still looking for the crawlers nest.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //I've already told you, go to Asghan. He's the chief of the guards. You'll find him somewhere on the lowest level.

	B_LogEntry		(CH2_MCEggs,"If I want to find the minecrawlers' nest, I need to talk to Asghan.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "I've found the nest!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //I've found the nest!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //Then we'll finally have peace and quiet here again. Hahaha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //No offence. Good work, boy!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Here, take this crate of beer for your efforts.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "I've found the nest! And the eggs of the minecrawler queen!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //I've found the nest! And the eggs of the minecrawler queen!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //What? Is that all the eggs you found? Well, so what. You've proved you can fight.
};
