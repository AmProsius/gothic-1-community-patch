// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Balor_Exit (C_INFO)
{
	npc			=  Nov_1304_Balor;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Balor_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Kraut abholen
// **************************************************
	var int Balor_BotenDay;
// **************************************************

instance  DIA_Balor_FetchWeed (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_FetchWeed_Condition;
	information	= DIA_Balor_FetchWeed_Info;
	permanent	= 0;
	description	= "Baal Orun sent me. I'm to collect all the swampweed.";
};                       

FUNC int  DIA_Balor_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Baal Orun sent me. I'm to collect all the swampweed.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Good. Then I don't need to go myself. Here, take it.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Don't forget to go to Viran on the other side of the swamp, if you haven't been there yet.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //Otherwise your load might be a bit small and people might think you'd sold the other half of it, hee, hee.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Balor gave me today's swampweed harvest for Cor Kalom.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"According to Balor, there's a second group of gatherers who are working on the other side of the swamp. Since I wasn't allowed to ask Baal Orun any questions, I have to search the swamp for the second group, whether I like it or not."); 
	};
	
	Balor_BotenDay = Wld_GetDay(); 
};

// **************************************************
//				Wem verhökern?
// **************************************************
	var int Balor_PlayerCheating;
// **************************************************

instance  DIA_Balor_SellUnder (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_SellUnder_Condition;
	information	= DIA_Balor_SellUnder_Info;
	permanent	= 0;
	description	= "Who could I sell the weeds to anyway?";
};                       

FUNC int  DIA_Balor_SellUnder_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_Balor_FetchWeed)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_SellUnder_Info()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //Who could I sell the weeds to anyway?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //Oh-oh! Now I've been puttin' ideas in your head, haven't I?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Forget it, it was just a thought.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"If you know somebody - we could go halves.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"No - tell me - who?",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Forget it, it was just a thought.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //If you know somebody - we could go halves.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Well, I'd know somebody in the New Camp, he'd be interested in weed...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //But if the Gurus catch you at it, they'll feed you to the swampsharks! I don't know anything, okay?!
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //No - tell me - who?
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //You have something in mind? I'm telling you: If the stuff doesn't arrive at Cor Kalom's, we'll both be in real trouble!
};

// **************************************************
//				Name des Dealers
// **************************************************
	var int Balor_TellsNCDealer;
// **************************************************

instance  DIA_Balor_TellDealer (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_TellDealer_Condition;
	information	= DIA_Balor_TellDealer_Info;
	permanent	= 1;
	description	= "Okay - who's the buyer in the New Camp?";
};                       

FUNC int  DIA_Balor_TellDealer_Condition()
{
	if ( (Balor_PlayerCheating==TRUE) && (Balor_TellsNCDealer==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_TellDealer_Info()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Okay - who's the buyer in the New Camp?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //You think I'll give you the name and you can just make a run with the weed - it doesn't work quite like that!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //I wanna see 50 ore as an advance payment. Then we'll see.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Forget it.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"50's fair - here you go.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //50's fair - here you go.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Good... Listen. His name's Cipher. You'll probably find him in the bar on the lake.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Be careful and don't let anybody fool you.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Balor mentioned a man called Cipher, who would like to buy the swampweed harvest. I can find him in the bar at the lake of the New Camp. I would get into enormous trouble with the Gurus, though.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Cipher buys and sells all sorts of goods in the bar at the lake. He is especially interested in major swampweed deliveries.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //I don't see any 50 ore. I want 50 ore and not a nugget less, okay?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Forget it.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Don't think you can simply walk into the New Camp and sell it to anybody! If you don't know the right name, you'll never get rid of it.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Unless you let some rogue whack you on the nut.
	Info_ClearChoices 	(DIA_Balor_TellDealer);
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Balor_RipOff (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 5;
	condition	= DIA_Balor_RipOff_Condition;
	information	= DIA_Balor_RipOff_Info;
	permanent	= 0;
	description	= "I'm to pick up the next delivery for Cor Kalom.";
};                       

FUNC int  DIA_Balor_RipOff_Condition()
{
	if ( (Balor_BotenDay<=(Wld_GetDay()-2)) && Npc_KnowsInfo(hero,DIA_Balor_FetchWeed) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_RipOff_Info()
{
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //It's me, I'm back. I'm to pick up the next delivery.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //Of course! To sell it off to the New Camp again?
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //I wanna see 50 ore - my usual advance payment.
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //You again? Well then, here, take it, but don't do anything stupid, you got that?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //I wouldn't dare.
		CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
		B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
	};
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Balor_Perm (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_Perm_Condition;
	information	= DIA_Balor_Perm_Info;
	permanent	= 1;
	description	= "Just keep picking hard!";
};                       

FUNC int  DIA_Balor_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_Perm_Info()
{
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //Just keep picking hard!
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //Of course, what do you think I'm doing? Rocking my balls?
};
