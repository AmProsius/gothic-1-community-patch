
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "You're hunting, aren't you?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //You're hunting, aren't you?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Looks like it... what do you want?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Do you have some hints for the hunt?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //I could teach you a few things - but everything has its price.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Which would be how much?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //A good gulp of beer will do to start with - then we'll see.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Here you are, take a beer and tell me about hunting.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Here you are, take a beer and tell me about hunting.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Scavengers, that's what we call the big birds, should be attacked one after the other. It's easy to lure single scavengers from the pack.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //If you come too close, they'll become irritated. After a while they'll storm in your direction. At this point, you should be waiting for them with a raised weapon.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //If you manage to strike the beast before it hits you, you have to keep fighting, then you'll be able to defeat the creature without being hurt yourself.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //If it hits YOU first - well - just don't let them.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //I don't have any beer.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Then go and fetch some. That'll be the best free hint you'll get in a long time. And as you're going anyway, bring some ore with you as well!
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //I can give you some information about animals, but it'll cost you!
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"The rogue Drax offered to teach me about the gutting of animals if I can pay his prices. He hunts on the way from the trading square to the Old Camp.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "What else can you tell me about hunting?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //What else can you tell me about hunting?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //A lot - but it'll cost you more than a beer.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //If you know how, you can take the creatures' teeth, claws and skin. It's hard to get them but they are valuable.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //At least every merchant will trade those things with you.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"You're demanding a lot for your advice.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Remove teeth (cost: 1 skill point, 50 ore)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Remove fur (cost: 1 skill point, 100 ore)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Remove claws (cost: 1 skill point, 50 ore)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Skin reptiles (cost: 1 skill point, 100 ore)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //I've told you everything I know.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //You're demanding a lot for your advice.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Possibly, but you can earn a lot of ore with this knowledge.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //All the animals you kill without knowing how to cut them up will just rot away.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //That's a wasted opportunity of skinning them and selling the fur at a high price.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //If I were you, I'd try to gain this knowledge as soon as possible.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //How do I get the teeth?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Learn: Extracting teeth", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //The most important thing is to make sure the teeth don't splinter. To avoid that, put your knife near the center of the tooth and lever it out carefully.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //You can take the teeth of wolves, shadowbeasts and snappers.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Knowledge on the removal of teeth - wolf, Orc dog, snapper, biter, blood hound, shadowbeast.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //You have to gain more experience otherwise my knowledge won't be of any use to you.
			PrintScreen	("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //I want to see some ore first. Like I said: Everything has its price!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //How can I skin these creatures?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Learn: Taking off the fur", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //It's very important to skin them from the back to the front. Once you get the hang of it, it'll be easy. Furs are very valuable!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //The furs of wolves and shadowbeasts can be used to make clothes. When you examine the fur of a killed animal, you'll soon notice if it can be used or not. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Knowledge on the removal of fur - wolf, Orc dog, shadowbeast, troll");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //You need more experience, otherwise my knowledge won't be of any use to you.
			PrintScreen	("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //I want to see some ore first. Like I said: Everything has its price!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Learn: Taking off the claws", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Show me how to take off the claws!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Actually it's quite simple if you know what to do. Bend the claws forward - never backwards - and you MUSTN'T pull them out either!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Claws can be taken especially from lizards. From now on, you'll know which creature's claws to take.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Knowledge on the removal of claws - lizard, snapper, lurker, biter, razor");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //You need more experience, otherwise my knowledge won't be of any use to you.
			PrintScreen	("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //I want to see some ore first. Like I said: Everything has its price!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Learn: Skin lizards", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //What do I have to observe while skinning reptiles?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //The only reptiles suited for this purpose are lurkers and swampsharks.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //If you slit the skin at the sides, it'll peel off by itself. From now on you should be able to skin reptiles.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Knowledge on skinning - lurker, swampshark");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //You need more experience, otherwise my knowledge won't be of any use to you.
			PrintScreen	("Not enough skill points!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //I want to see some ore first. Like I said: Everything has its price!
	};
};
