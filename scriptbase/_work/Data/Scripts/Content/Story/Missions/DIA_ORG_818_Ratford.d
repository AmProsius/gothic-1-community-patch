// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //Hey, you!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //What do you want?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //I want to warn you. If you continue this way, you'll be entering our hunting ground.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "What do you hunt?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //What do you hunt?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //Mostly scavengers. There's a lot of meat on them. Besides, it isn't too hard to get them... Once you know how.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Really? How's that?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Ask my friend Drax here - he knows more about these things than anyone.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "Why's this area so dangerous?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Why's this area so dangerous?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //You've just arrived, haven't you? There are different areas in the colony which are all more or less dangerous.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //The paths between the camps are quite safe. But even there you might come across some wolves which will look on you as easy prey.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //And that's exactly what you are until you get a proper weapon and armor.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Where can I get better equipment?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Where can I get better equipment?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //The nearest place is the Old Camp. Just follow the path that brought you here.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //But you can get the stuff cheaper in our New Camp - provided you know the right people.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //If you go to the Old Camp, ask for Mordrag. He's one of us. For just a little ore, he'll sell you the proper goods.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"The rogue Mordrag sells all sorts of goods for reasonable prices in the Old Camp.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Tell me more about the areas of the colony.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Tell me more about the areas of the colony.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //If you travel between the camps, you'll need a map to distinguish paths and dead ends.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Dead ends often lead you to dangerous canyons where you encounter creatures you'd better avoid.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Do not enter the old ruins. There are many around here. Most of them are old fortifications dating back to the time of the first Orc war. Some are abandoned Orc dwellings.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //There are often Orcs in those ruins - or even worse creatures. I'd avoid those places, especially at night.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //And one more hint - don't go into the forest!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "Where do I get a map?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Where do I get a map?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Ask the people in the Old Camp. There's a cartographer living there.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Maybe you can steal one of his maps! If you manage to do it, take one for me as well!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"If I get them without paying, I'll take as many as I can carry!",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Why? Doesn't he sell the maps? ",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //If I manage to get them without paying, I'll take as many as I can carry!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //You're alright! You should consider coming to the New Camp! In case you go there, ask for Lares. He takes care of the new ones. I'm sure he'll have a job for you!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Why? Doesn't he sell the maps? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //If you get enough ore to pay for them...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Thanks for your help.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Thanks for your help.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Don't go thinking everyone's going to be so friendly, kid!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //There may not be much in a newcomer's pockets, but some folks would even beat you up for a pickaxe.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //I'll keep it in mind.
};











