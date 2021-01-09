// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //May you return in one piece!

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //What are you doing here? You've no business here! Scram!

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "I have important news from the Brotherhood's camp!";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //I have important news from the Brotherhood's camp!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //If Cronos gave you permission to visit me, it must be important news indeed!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Y'Berion is dead!";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y'Berion is dead! He died during the ritual invocation of the Sleeper.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y'Berion dead? That's bad news, very bad news indeed!
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Who's leading the Brotherhood now? That power-hungry and deceitful Cor Kalom?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //No! Kalom has turned his back on the Brotherhood. He's taken some templars with him. Nobody knows where they've gone.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Why is that? He was in second place after Y'Berion!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Certain events have convinced the Gurus that their way is the wrong one. Their god seems to be an evil arch demon.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //One of the Gurus nearly killed me under the influence of the Sleeper, although I had saved his life just briefly beforehand.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom was the only Guru who didn't want to admit the true nature of the hellish creature, that's why he's left the camp in the swamp.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //I see! Well, at least we are lucky in this regard. Cor Angar is a good man. He's tough, but honest.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //If anybody could prevent the Brotherhood from falling apart after this spiritual catastrophe, he can.

	B_LogEntry		(CH3_EscapePlanNC,"I've told Saturas about the incidents in the swamp camp. He was happy that Cor Angar had taken over the leadership of the Brotherhood.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "I have this almanac...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //I have this almanac...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'Berion used it to charge the focus.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Very good. We need the knowledge contained in this book to charge the five original focus stones.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //I'll take the almanac!

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "I have this focus...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //I have this focus...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //You're holding the key that can unlock all our bonds.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //It is one of the five focus stones which were used to create the Magic Barrier.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //And with the help of the very same focusing power of these stones, we will tear down the great wall of energy.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //But won't that use up an awful lot of power?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //True, but in all these years we have untiringly collected ore instead of trading it for luxuries with our jailers.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //As you must know, each ore nugget contains a certain amount of magic power. With the aid of the energy thus amassed in the ore mound, we'll be able to destroy the Magic Barrier.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //Sounds dangerous.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //The explosion will be merely of a magical nature, it will only destroy everything that's been modified by the magic inside the Barrier. There is no danger to us human beings.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Here, take the focus. I hope it really will be of some use to your plans with the ore mound!

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "What are you going to do with the focus and the almanac now?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //What are you going to do with the focus and the almanac now?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Nothing. We need the four remaining focus stones first!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Unfortunately we don't have any of these four magic stones.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "I'm willing to find the four remaining focus stones for you!";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //I'm willing to find the four remaining focus stones for you!
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //After all, I'm quite keen on getting out of here sometime myself.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //I must warn you. Searching for them will prove as difficult as it will be dangerous.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Since conflict with the Old Camp is getting worse every day, I cannot give you any mercenary either.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //You'll be totally on your own.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Well... That's nothing unusual for me! I'll find a way to organize these things.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Your confidence does you credit, but you'll need some items to assist you.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Take this map here. It's old, but on it you'll see the original locations of the focus stones when the Barrier was created.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Also, this spell scroll will enable you to travel back to our camp faster.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //Finally, you need to speak to Riordian. He brews the potions for the Camp.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //You'll find him in his hut, here, on the upper level.

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hm, that's a start. You're doing well.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //There are still three focus stones missing to accomplish our plan.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Now go and look out for the remaining focus stones.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Good, that's the second focus stone you've brought us.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //We're getting closer and closer to our target.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Be brave and fetch the two remaining focus stones.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Unbelievable, now we have four focus stones altogether.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //There's only one more missing, then we'll have them all.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //You have already done our community a great service. Get the last focus stone, and we'll soon be able to free ourselves.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Brilliant, now we have all five focus stones.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Your deeds are invaluable to our camp. Be assured of my eternal gratitude.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Go to Riordian now. He'll give you something for your immense efforts.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Speak to Cronos, the keeper of the ore, as well. He will give you another gift from our community.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"I managed to find all four focus stones. Saturas is unbelievably happy. I believe they owe me quite a favor in the New Camp.");
		B_LogEntry		(CH3_BringFoci,"The Magicians of Water Cronos and Riordian have each promised me a reward for retrieving all the focus stones. I should go round to see them.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //I see you've used up the teleportation scroll. Here, take a new one.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "I've found a focus in the troll canyon!";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //I've found a focus in the troll canyon!

	B_LogEntry		(CH3_TrollCanyon,"The focus from the troll canyon is now safe with Saturas.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "I've found a focus in the mountain fort!";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //I've found a focus in the mountain fort!

	B_LogEntry		(CH3_Fortress,"Saturas received the focus from the mountain fort from me.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "I've found a focus in the ruined monastery!";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //I've found a focus in the ruined monastery!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Gorn the mercenary was there, he gave me a hand in searching.

	B_LogEntry		(CH3_MonasteryRuin,"At last I could give Saturas the focus from the ruined monastery.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "I've found a focus under the ring of stone!";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //I've found a focus under the ring of stone!

	B_LogEntry		(CH3_Stonehenge,"I've given Saturas the focus from the crypt underneath the ring of stone.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "Can you blast the ore mound now?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Can you blast the ore mound now?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //We now have all the artefacts we need to fulfill our plan.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //But the Barrier was created by twelve magicians.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //There are not enough magicians in the Circle of Water to control the powerful energies and to guide them onto the right course.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //What can we do?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //I am aware that you have already done much for our community, we owe you greatly...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //... but in the interest of all the inhabitants of the colony, I need to ask one more favor of you.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "One more favor?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //One more favor?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Yes. Go to the Old Camp and try to win some of the Magicians of the Circle of Fire for our cause.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //MAGICIANS OF FIRE??? Why should they want to give up their easy life?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //The destruction of the Barrier would rob them of their powerful position!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //That is the exact reason why YOU must accomplish this mission. You know people from all the camps of the colony.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Remind the Magicians of Fire of the old times, when we studied the arts of magic together.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "Alright then, I'll try to convince the Magicians of Fire!";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //Alright then, I'll try to convince the Magicians of Fire!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //But I can't promise anything! It seems nearly impossible to me.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //You must try. If you do not succeed in this, there is only one other...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Just one...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //... one WHAT?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Forget it! You MUST succeed!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Here, take this magic rune. Hand it over to Corristo, the High Magician of the Circle of Fire, as a sign of our trust.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //With this he can teleport into this room without passing the guards anytime he wants.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //I hope that'll convince our former friends of our good intentions.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //I'm glad you returned. Something terrible's happened!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Let me guess, the Free Mine has been assaulted by the guards from the Old Camp. Nobody saw them coming...?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Hang on... how... but of course... You found out about it in the Old Camp!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn arrived here just before you did.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //What could have caused Gomez to dare to take such an aggressive step?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //He should be aware that such a heinous act can only provoke war.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "The Old Mine collapsed after water seeped in!";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //The Old Mine collapsed after water seeped in!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //... Collapsed... of course... then the whole thing makes sense.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez has his back to the wall. He's more dangerous than ever. Now that he doesn't have anything left to lose, he'll do anything!
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gomez has had all the Magicians of Fire killed!";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez has had all the Magicians of Fire killed!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //HAD THEM KILLED??? Why in Beliar's name would he do a thing like that?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //They were against the attack on the Free Mine, and opposed Gomez.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Then we're all doomed. Without the other six magicians, we'll never be able to control the concentrated power of the massive ore mound.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //But in spite of that, I thank you for passing this dangerous message on to me.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas was not at all happy when I told him about the incidents in the Old Camp. Whatever happens to their escape plan ... they'll have to make do WITHOUT the Magicians of Fire.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "I have been exiled from the Old Camp because I have helped you!"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //I have been exiled from the Old Camp because I have helped you!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //You don't belong to the Old Camp any longer?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Then I welcome you to our community.

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"After I was banned from the Old Camp, Saturas welcomed me to the New Camp.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Does that mean the mercenaries will take me on?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Does that mean the mercenaries will take me on?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Talk to Lee. He'll see to it. Then come back to me.

	B_LogEntry			(CH4_BannedFromOC,"Lee, the leader of the mercenaries, wants to speak to me. I'm supposed to see him and return to Saturas after."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Does that mean that I now belong to the Magicians of Water?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Does that mean that I now belong to the guild of the Magicians of the Water?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Not yet. First you need to take the oath of Water.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //But I've already taken the oath of Fire!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm....
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //It doesn't mean you're breaking your vow!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Uhh... I don't understand...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //You're extending your vow. That way you'll become a magician of both elements!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Then you'll have the force of Fire as well as the wisdom of Water!

	B_LogEntry			(CH4_BannedFromOC,"Saturas will let me join the Circle of Water and I don't need to break the oath of Fire."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "I'm ready to take the oath."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //I'm ready to take the oath.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Servant of the Fire, you shall now receive the blessing of the Water!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Now speak the words of the oath:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //I swear by the might of the gods...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //I swear by the might of the gods...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... and by the power of the holy Water...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... and by the power of the holy Water...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... that my knowledge and my deeds from now on and forever shall be one with the Water...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... that my knowledge and my deeds from now on and forever shall be one with the Water...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... until my body shall return to the realm of Beliar and the source of my life shall dry out.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... until my body shall return to the realm of Beliar and the source of my life shall dry out.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //With this oath you unite the power of the Fire and the blessing of the Water within you.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //You have now bound together what was apart before. May your life be a sign of the unification of the elements.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Wear this robe as a sign of your bond with the holy Water and with Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Now I've joined the Circle of Water. From now on I've got access to both schools of magic."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "Can you instruct me?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Can you instruct me?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //There's much you need to learn. I shall teach you as soon as you're ready.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //There is one more Circle you don't know yet. I shall teach you as soon as you're ready.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //You have already mastered the Fifth Circle of Magic! You know all I know.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //I can't teach you any more!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, the leader of the Magicians of Water, teaches the magic CIRCLES. He always stays at the pentagram on the upper level.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //I am ready to enter the First Circle.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //To enter the first of the magic Circles means learning to use magic runes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Each rune contains the structure of a special magic spell.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //By using your own magic powers, you'll be able to cast the magic of the rune.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //But in contrast to the magic scrolls, which are magic formulas as well, the magic power of the rune ensures that the structure of the spell endures.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Every rune is a source of magic power which you can fall back on anytime.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Your own magic power is used up when you use a rune, just as with a spell scroll.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //With every Circle you enter, you learn to use further runes as well.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Use the power of the runes to recognize yourself.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //I am ready to enter the Second Circle.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //You have learned to understand the runes. Now it is time to deepen this understanding.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //When you join the Second Circle you will learn the foundations of stronger battle spells, and above all the secret of healing.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //But you need to learn much if you want to recognize the true secrets of magic.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //You know that you can use every rune as often as you like until you've used up all your own powers.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //But before you act, think about the point of your actions. You have obtained powers with which you may easily conjure up death and destruction.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //But a true magician only uses magic when it is necessary.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Understand the situation, then you'll recognize the power of the runes.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Could you teach me the Third Circle?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //The Third Circle of Magic is one of the most important steps in the life of a magician. Once you've reached it, you cease to be a seeker.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //You have already come far on the path of magic. You have learned to use the runes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //This knowledge is the foundation for your further path. Use the runes with deliberation.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //You may use a rune or not. But you must decide on one of these possibilities.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Do not hesitate to use your powers as soon as you've made your choice.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Understand your path, then you'll recognize the power of the decision.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //I am ready to enter the Fourth Circle.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //You have completed the first three Circles. Now is the time for you to learn the secrets of magic.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //The magic of the runes is based on the stone. They are magic stones, created out of magic ore.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //It is the same ore which is collected in the mines. This ore is endowed with magic formulas in the temples. There the runes are converted to the instruments of our power.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //With the runes you control now, you have the entire knowledge of the temples of the realm at your fingertips.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Understand the magic, then you'll discover the secret of power.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER FÜNFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //I am ready to enter the Fifth Circle.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //So be it. I shall teach you the power of the Fifth Circle.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //The Storm of Fire, the Wave of Ice and the power to destroy the undead are now spells whose runes you can use.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //But the mightiest spell of the Fifth Circle is the Ripple of Death. If you ever possess this rune, you'll have dangerous powers.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Be careful to use this kind of magic as little as possible. It's a gift from the god of darkness.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //You have now learned everything I can teach you.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Expose your limits, then you'll recognize your true power.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //I'd like to wear the high robe of Water.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //It is not yet time for you to wear the high robe.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //The little ore that you have won't even cover the manufacturing costs.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //The time has come. You are worthy of wearing the high robe of Water.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee has admitted me to the mercenaries.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee has admitted me to the mercenaries.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Good. Very good. Then you are now officially a part of our community.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Be welcome!

	B_LogEntry			(CH4_BannedFromOC,"Saturas has now officially welcomed me as a mercenary.");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "When you sent me to the Magicians of Fire, you mentioned SOMEBODY...";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Björn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Björn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //When you sent me to the Magicians of Fire, you mentioned there was... SOMEBODY.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Well, I had hoped we could make it without his help, but the way things are developing...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //Who is HE?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //Alright, alright!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Many, many years ago...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Give me the shortened version, please!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Be patient! Well, when we - the twelve magicians - created the Barrier back then, our magic powers were directed and controlled by a thirteenth magician.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //A thirteenth magician? I thought there were only twelve!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Most people who did not experience the early days of the colony believe that.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //This thirteenth magician was our leader. All this took place before we were divided into the Circles of Fire and Water.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //But he left the Old Camp, which was once the only camp of the colony.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "What is this thirteenth magician called?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //What is this thirteenth magician called?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //His name is Xardas. Hardly anybody remembers the old stories about him!
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //The ones who do just call him the NECROMANCER!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Why did he leave the Old Camp?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Why did he leave the Old Camp?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //He started to investigate the invocation of undead and magical creatures.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gomez was not the only one who began to worry. Most of the other magicians opposed him as well and his unholy deeds.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //What happened then?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //Unlike Gomez, he was no butcher, so he avoided the conflict and left.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Where is this magician today?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Where is this magician today?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //He lives in seclusion, in his tower in the middle of the Orc land.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //That's just about the southernmost point of the colony.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "I'll make my way to Xardas and ask him for help!";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //I'll make my way to Xardas and ask him for help!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //He's the only one that can help us now.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //If he knows no way out or doesn't want to help us...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //HE WILL!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //There is one other problem...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "A problem?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //A problem?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Yes. Over the years we have tried to get in touch with Xardas several times.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //But it looks like he prefers to remain undisturbed.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //What does that mean?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //None of the messengers ever returned from his tower.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //You'll have to find a way to get past his creatures.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Looks like this is going to be interesting!
	
	B_LogEntry			(CH4_FindXardas,"Saturas warned me of the magic creatures of Xardas, the Necromancer. There are writings about the dangers and weaknesses of these creatures in the library of the Magicians of Water. I should take some time to have a look around there.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "How will I get past his creatures?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //How will I get past his creatures?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //If I knew that, I would tell you!
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //I'd advise you to do some research in our library.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Maybe you'll find something in the old books about the strengths and weaknesses of magically invoked creatures.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //I'll rummage through the library. And don't worry...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //I'll be back!

	B_LogEntry			(CH4_FindXardas,"There are writings about the dangers and weaknesses of these creatures in the library of the Magicians of Water. I should take some time to have a look around there.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlüsselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Have you spoken to Xardas?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Well...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"No...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"The whole thing's not the way you think...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Well...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Well ..? Well what?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Äh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dürfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //No...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Why not?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //I couldn't get into that area yet...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //You need to find him and ask him for advice!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //The whole thing's not the way you think...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //What do you mean? He needs to find a way how to blow up the ore mound!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //The ore mound... uh... uhm... It's grown very high!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Find Xardas, he needs to help!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius said I was ready to wear the robe of a Magician of Water."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius said I was ready to wear the robe of a Magician of Water.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Then I welcome you to our community.
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Does that mean that I now belong to the guild of the Magicians of the Water?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Not yet. First you need to take the oath of Water.
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "I'm ready to take the oath."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //I'm ready to take the oath.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Now speak the words of the oath:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //I swear by the might of the gods...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //I swear by the might of the gods...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... and by the power of the holy Water...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... and by the power of the holy Water...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... that my knowledge and my deeds from now on and forever shall be one with the Water...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... that my knowledge and my deeds from now on and forever shall be one with the Water...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... until my body shall return to the realm of Beliar and the source of my life shall dry out.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... until my body shall return to the realm of Beliar and the source of my life shall dry out.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Wear this robe as a sign of your bond with the holy Water and with Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas has now admitted me to the Circle of Water.");

	AI_StopProcessInfos	(self);
};

