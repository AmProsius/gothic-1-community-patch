//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //WHO DARES TO DISTURB ME IN MY STUDIES?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //My name is...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //I don't wish to know your name. It is insignificant.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //All that matters is that you are the first person in years to have solved my Golem's riddles.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Have there been any other visitors?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Have there been any other visitors?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Not many, and when they began to annoy me I confronted them with one of my supernatural creatures.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //You enjoy being on your own, don't you?
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "I was sent by Saturas. We need your help!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //I was sent by Saturas. We need your help!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //The Magicians of Water plan to use their big ore mound...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //The ore mound is NOT the solution!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //It isn't?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //NO!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "All the Magicians of Fire are dead!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //All the Magicians of Fire are dead!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez had them assassinated.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //That does not surprise me. Those foolish barbarian butchers in the castle, especially Gomez, were never to be trusted.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo and the other magicians elected their own hangman when they helped Gomez to usurp the power.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "The so-called Sleeper is said to be an evil arch demon.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //"The so-called ""Sleeper"" is said to be an evil arch demon."
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //That's what the Brotherhood in the swamp found out.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Now the Magicians of Water believe that everybody in the colony is in great danger.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //There is a greater danger than anyone within the Barrier could possibly imagine. 
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "If the explosion of the ore mound doesn't avert the great danger...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //If the explosion of the ore mound doesn't avert the great danger...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //... Forget the ore mound! Its power won't open the Barrier.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //If Corristo and Saturas hadn't wasted their time fighting over foolish and vain issues throughout the past years, they'd all know what I know now.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //Which is?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //None of the twelve magicians ever stopped to wonder why the formation of the Barrier got beyond their control, or why it assumed such gigantic proportions.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "Did you find out why that happened? ";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //Did you find out why that happened? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Well, one thing is certain: The answer lies deep beneath the Orc town.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //The Orc town?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Orcs are not animals, as many people think. Their culture is as old as the human culture.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //A few centuries ago, five Orc shamen invoked a very old arch demon which they hoped would give their clan the power to defeat their enemies.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //This arch demon, was it the Sleeper?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //The Orcs gave him that name much later. But I won't tell you why they did it, or why they are now terrified by this supernatural creature!
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "Why not?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Why not?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //I believe you could be... NO, to be really sure, you'll have to perform another task!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Which task?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Listen carefully: The Orcs have exiled one of their shamen from the town.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Why have they exiled him?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //Why have they exiled him?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //The dying Orc warrior was no longer able to answer that question when he was interrogated by one of my demons.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "What does this Orc shaman have to do with my task?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //What does this Orc shaman have to do with my task?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //He'll tell you the rest of the story about the Sleeper.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //An Orc shaman is hardly likely to be keen on talking to me!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Do you want me to help you or do you not?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Well, yes, but...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Then never question my words again!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Find the shaman. He's not on good terms with his brothers in the Orc town, so he may listen to you before turning you into a living torch!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Very comforting!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Where is this exiled shaman?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Where is this exiled shaman?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Go the old citadel in the east. You can't miss it, it's on top of a high mountain which can be seen from a distance.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //Can you just enter it?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //They call it the old citadel but there's hardly anything left of it other than the foundation walls. It's been a ruin for many decades.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "I will get the answers from this shaman!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //I will get the answers from this shaman!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //My servant has already given you a teleportation rune for the pentagram one floor below.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //That will make it easier for you to get back here later.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "I'm seeking magic knowledge"; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //I'm seeking magic knowledge
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "I have the answers from the Orc shaman!";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //I have the answers from the Orc shaman!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //Well, then report!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //The five Orc shamans that invoked the Sleeper built him an underground temple, its entrance is in the Orc town.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //That's right!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Ungrateful as he was, he tore out their hearts and condemned them and the workers to an eternal existence as undead creatures!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Very good, very good!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //The Orcs locked the temple and started making sacrifices to appease the demon!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Have you found a way to enter the temple?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Yes, there's an Orc who...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //No details! Go to the underground temple! There you'll find the only way to destroy the Barrier!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //I don't understand!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Didn't you call on me to help with the destruction of the Barrier?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //That's right, but...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //THEN GO! A lot of time has already been wasted! Go into the underground temple to find the answer!

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "I have found a way into the underground temple!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //I have found a way into the underground temple!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //YOU HAVE... That's remarkable!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //You have become very powerful! Stronger than anybody else inside the Barrier.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Maybe you really are the man the Orcish prophecies told of!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Prophecies? What prophecies?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Prophecies? What prophecies?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Ancient Orcish documents written shortly after the sealing of the underground temple mention a 'Holy Foe'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //A holy foe?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Someone who shall come to drive the SLEEPER from our world forever!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //I'm supposed to be the one mentioned in the ancient prophecies??? You must be wrong, surely!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Maybe... Maybe not!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "I've found this strange sword."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //I've found this strange sword.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Show it to me.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //That's interesting... It has 'URIZIEL' written on it.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //I've heard of this sword. It's a weapon from the olden days, when the human race was still young.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //The weapon was forged from an unknown material. And there's nothing written about who created it!
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //This blade was said to possess unbelievable powers, but I don't notice any magical aura! 
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "URIZIEL possessed unbelievable powers?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL possessed unbelievable powers?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //It was written that the owner of the weapon was able to pierce the strongest armor and to overcome even the most powerful of protection spells.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //How could the Orcs get this powerful weapon into their hands?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //It's claimed that the Orcs took it from a powerful warlord. They didn't know how to use it, but they did hide it!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //But they didn't hide it well enough!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "Is it possible to restore the former powers of the weapon?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Is it possible to restore the former powers of the weapon?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //You'd need a very strong magical source of power for that purpose.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //You mean strong enough to detonate the Magic Barrier with?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //About that strong...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Besides, you'll need a very special magic formula in order to transfer the power.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Give me some time and I'll create the magic formula.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Meanwhile, I'll be hunting around for a better armor!"; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //Meanwhile, I'll be hunting around for better armor!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //These patchwork minecrawler plates have been pierced too often in the underground temple!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //These blue rags didn't protect me well enough in the underground temple!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //The undead have made massive dents in my armor!
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //You should go to my old tower.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Your old tower?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //It sank below one of the eastern lakes during one of the earthquakes. The spires are still visible above the surface.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //There are still some artefacts inside it. I never made any effort to salvage them.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //How do I get there?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //I haven't been there since the earthquake, which means you'll have to find a way to enter it yourself.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //But take this key. It opens a chest in which I used to store some particularly rare artefacts.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //I see! You're wearing the ore armor.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //As I can see, you've found the ore armor.
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //I found it in one of those old chests in the sunken tower.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //It belonged to the general who wielded URIZIEL in the battle against the Orcs.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //I hope it'll bring me more luck than it did him!
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "Have you completed the magic formula to reactivate URIZIEL?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //Have you completed the magic formula to reactivate URIZIEL?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //It's done. But you won't be able to use it by yourself.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Why not?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //It has to be spoken by a magician while you touch the power source with the sword.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Then I'll have to look around for some support!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Take the formula and restore the sword's former power. You'll need it!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Since I'm a magician, it'll be hard for me to wield URIZIEL!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Since I'm a magician, it'll be hard for me to wield URIZIEL!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //There is a solution...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //But first you have to restore the blade's former powers! Then come back!
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "I've reactivated URIZIEL!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //I've reactivated URIZIEL!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //It's incredible, the sword has regained its former powers. Now you have a really powerful weapon!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige Lösung für´s Ich-brauch-Orc-Statue-Massaker ***Björn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "You said there might be a way to wield URIZIEL though I'm a magician!"; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //You said there might be a way for me to wield URIZIEL though I'm a magician?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Look closely at URIZIEL. You'll notice the big blue jewel in the blade.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //It contains the magical powers of the blade.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //If I remove the jewel, I'll be able to create a magic rune which contains the attributes of URIZIEL itself.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //A magic rune made from URIZIEL?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //In battle, the rune will be as powerful as the sword!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //But don't forget that only a Magician of the Sixth Circle will be able to control such a powerful magic rune!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "Remove the jewel from URIZIEL!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Remove the jewel from URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //But you have not yet mastered the Sixth Circle of Magic!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //This decision is final. Do you really want me to remove the jewel?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"YES, do it!",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"NO, don't do it!",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //YES, do it!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Since it's what you want... Here, take the empty sword and the rune!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas removed the magic gem from the sword URIZIEL. The power of this blade now rests in a magic rune of incomparable powers.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NO, don't do it!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //As you wish. The blade shall keep its magic powers!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Can you teach me?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //I shall raise you into the Sixth Circle of Magic.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Notice that only the most powerful magicians may join the Sixth Circle. It's reserved to those whose life is a sign.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Your sign is the unification of the elements.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //The Sixth Circle enables you to use the magic of any rune.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //And don't forget: Do not claim the power, but serve it.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() übergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem für Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Not yet. You have the skill, but you're not experienced enough. Let Saturas train you first, I shall instruct you afterwards.
		
		AI_StopProcessInfos	( self );
	};
};

	
