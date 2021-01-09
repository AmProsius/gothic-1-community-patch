// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //Ah! A new face.
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //What do you want?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //I wanna offer you help. You're new here, an' new 'uns always get into trouble... You could save yourself a lot by makin' a small donation.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Just 10 ore, man! It ain't much to ask.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"What if I don't pay?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"And what do I get out of it?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Here's 10 ore. And you'll have to help me if I get into trouble.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Here's 10 ore. And you'll have to help me if I get into trouble.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //You can count on me if I'm close by. You'll find me between the market place and the south gate.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //The other areas are Fletcher and Bloodwyn's affair.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hey, watch who you're trying to fool! Come back when you have the ore!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //And what do I get out of it?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //While you're in my district, I'll protect you.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //If you get into any trouble with the guys from the New Camp or if one of the sect loonies gets on your nerves, you can count on me.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //If you have bother with one of the diggers, we'll help whichever one of you has paid - it's as simple as that.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //And what if both have paid?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Then we sit back an' watch the show. But that don't happen too often.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //What if I don't pay?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Hey man, don't stress yourself! You're a newcomer - take a look around. Collect a bit of ore and when you're ready to pay, then pay.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //You can do it anytime - but don't count on my help until you've made your contribution to my expenses - I'm sure you'll understand.
	Info_AddChoice		(Info_Jackal_Hello,"I'll see you later.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //I'll see you later.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Just you take care of yourself.
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "I've been thinking about that protection money - here's your 10 ore.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) )
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //I've been thinking about that protection money - here's your 10 ore.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //You've made the right choice, man. I'll protect you from now on!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //I don't see any 10 ore, man. Come back when you have it.
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "Well, how's it going?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //Well, how's it going?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //You can always count on me, kid!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //You've worked your way up pretty fast! Well done, man!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Hey, look at that! It's the traitor that switched camps!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //You shouldn't have got involved with those losers, you'd still be one of us!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Hey, look at that! It's that guy from the New Camp, the one that caused us all that trouble!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //If you'd shown a bit more sense back then, you could be on our side now - the side of the winners!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Will you look at that. It's the guy from the swamp camp.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //You've been around those loonies too long, they've made you soft in the head!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Even the protection money you paid me ain't gonna help you now.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //You should have paid me when you still had the chance.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //You've gone too far! It was a dumb idea to attack the mine!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Seems to have worked though. And you ain't gonna change that, believe me!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //HEY GUYS, LET'S TAKE HIM OUT!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

