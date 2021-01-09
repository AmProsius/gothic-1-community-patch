// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Gravo_Exit (C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 999;
	condition		= DIA_Gravo_Exit_Condition;
	information		= DIA_Gravo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Gravo_Exit_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Hallo_Condition;
	information		= DIA_Gravo_Hallo_Info;
	permanent		= 0;
	description 	= "How are you doing?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //How are you doing?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Well, since I stopped working in the mine, I can't really complain.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //And where do you get your ore from?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //I help people who have problems.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //If you get into trouble with influential people here, I can help you sort the thing out.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpHow_Condition;
	information		= DIA_Gravo_HelpHow_Info;
	permanent		= 0;
	description 	= "If I was in trouble, YOU could help me? How?";
};                       

FUNC INT DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpHow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //If I was in trouble, YOU could help me? How?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //Well, let's assume you're in trouble with Thorus. You better never get into trouble with him, but then, well, you never know.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus can be quite stubborn - when he's pissed off with you once, he'll never talk to you again. And that's a bad thing.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //As a greenhorn, you depend on him. So you come to see me. I know a lot of people here Thorus listens to.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //They put in a good word for you, and Thorus is your friend again. Of course the boys want to see some ore for these kind of favors. Your ore.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //And I take care that your ore gets to the right people...

	B_LogEntry(GE_TraderOC,"The digger Gravo is selling a special kind of service. If I get in trouble with important people in the Camp, I can pay him to settle it.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //That's right, you're in his bad books.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //I'll have some people talk to him. 100 ore and I'll take care of the problem.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Well, let's see how much you have... Ah! Yeah, that should be enough. You can consider the affair settled.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //And don't talk to anyone about it. Just behave as if nothing had happened at all.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //I don't have that much.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Then I can't do anything for you - I'm sorry, boy.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //You call that trouble? That's an understatement, I think. I think he would like to tear you into little pieces, boy.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //It won't be cheap if I'm to convince some people to calm him down again. It'll cost you 500 ore at least.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Let's see what you have there... You seem to be a rich boy. I'll take the 500 and sort the thing out.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //And remember: He is never ever to know that I took care of the problem - so don't you talk to anybody about it, you understand?
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Soviel hab' ich nicht.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Dann kann ich nichts für dich tun - tut mit leid, Junge.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //As far as I know he doesn't have a problem with you - don't worry.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpAngryNow_Condition;
	information		= DIA_Gravo_HelpAngryNow_Info;
	permanent		= 1;
	description 	= "Can you help me - I think I'm in trouble.";
};                       

FUNC INT DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Can you help me - I think I'm in trouble.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //I think so, but I warn you, my help could cost between 100 and 500 ore.
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Help me with Diego.",DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Help me with Thorus.",DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow,"Help me with Gomez.",DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Help me with Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Help me with Thorus.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Help me with Gomez.
	var C_NPC gomez; gomez = Hlp_GetNpc (Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 2;
	condition		= DIA_Gravo_Influence_Condition;
	information		= DIA_Gravo_Influence_Info;
	permanent		= 1;
	description 	= "Could you tell me who belongs to the influential people here?";
};                       

FUNC INT DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Influence_Info()
{
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Could you tell me which of the Shadows belongs to the influential people here?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //You want to impress the right people, do you?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Diego has the most power of all the Shadows. He trusts Fingers, Whistler and Sly.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter and Fisk sell their stuff on the market square. They have many customers, even the guards, and that makes them rather influential.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //And then there's Scatty. He's in charge of the arena, and determines who fights and all that. Many people here owe him ore - he's important as well.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter and Fisk trade in various goods on the market square.");

	
};











