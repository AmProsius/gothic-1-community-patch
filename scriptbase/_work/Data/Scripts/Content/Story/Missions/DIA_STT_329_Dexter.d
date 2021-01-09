// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hey, you! I trade in swampweed and potions from the Sect Camp. Do you want something?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "What is swampweed?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //What is swampweed?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //New here, are you? You can smoke it. Very relaxing for most of us.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Show me your goods.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Show me your goods.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //I've got the best stuff here...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Dexter, the Shadow, trades in swampweed and POTIONS from the Sect Camp.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "I want to join the Camp - I want to become a Shadow.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //I want to join the Camp - I want to become a Shadow.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //Oh? You're looking for a chance to prove your worth?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Good - you can do me a favor. If you do it well, I'll speak up for you in front of Diego.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //What is it?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //In the Sect Camp there's a man called Kalom. Quite a big shot - one of the Gurus of the sect.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom is an alchemist. He has the recipe for an effective healing potion.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //I'd like to buy the recipe off him, then I can produce it myself.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //But nobody can get near Kalom.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //And what do you expect me to do?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //The sect loonies are looking for new people all the time. You're new here. Just pretend you want to be recruited.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom is one of the Gurus, that means he checks the new candidates. If you get in touch with him, try to get the recipe.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Whether you want to pay for it or you don't, I don't care.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Okay - I'll see if I can get the thing.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Sounds like a difficult business - how much is in it for me?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Okay - I'll see if I can get the thing.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, the Shadow at the market, told me to go to the Guru Kalom in the Sect Camp to get a recipe for him.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter said to get in I should pretend to be a supporter of the Sect Camp.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Sounds like a difficult business - how much is in it for me?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //At some point Diego will ask me if you're suitable for us. Just guess what my answer will depend on.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Maybe I'll have to pay for the recipe - give me 50 ore in advance.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Maybe I'll have to pay for the recipe - give me 50 ore as an advance payment.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Forget it.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"No ore - no recipe!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //No ore - no recipe!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Well then! We can talk about the ore as soon as you have the recipe.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"No! I want to see ore right now or you can get your recipe yourself.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //No! I want to see ore right now or you can get your recipe yourself.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //There's enough other newcomers, I think I should give the job to one of them...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Okay! Let's just forget about the whole thing.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Okay! Let's just forget about the whole thing.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Not so fast! I just wanted to know how far you'd go... 50 ore is quite a lot for a newcomer, don't you think?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //That sounds better.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //Okay, okay, I've just got 50 ore nuggets spare here. Don't let me down, kid!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, the Shadow at the market, told me to go to the Guru Kalom in the Sect Camp to get a recipe for him.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter said to get in I should pretend to be a supporter of the Sect Camp.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 1;
	description	= "Where is the Sect Camp?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Where is the Sect Camp?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Leave the Camp through the south exit, then head eastwards. You'd better take a map -
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Björn
		{																						//Björn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //I've got one here for 50 ore...
		};																						//Björn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //The south exit is the collapsed tower, isn't it?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Exactly.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"The Sect Camp is to the east of the Old Camp");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "I have the recipe you wanted!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //I have the recipe you wanted!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //Very good! Show it to me!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Good! Now I can produce the potions myself.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //You are a good man! I'll tell Diego about it!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Here you go - take that - for your efforts...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter was impressed. I'm sure he'll speak to Diego in my favor.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter was impressed. But that's useless - I can't become a Shadow any more");
	};
	B_GiveXP (XP_DexterKalom);
};

