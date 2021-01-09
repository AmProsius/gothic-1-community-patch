// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "It looks as if you knew what you were doing.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //It looks as if you knew what you were doing.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Nobody ain't complained yet.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //But that would be a bad idea anyway. Every idiot here needs a sword, and that is what they get from me.
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "How long does it take you to make one blade?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //How long does it take you to make one blade?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //That depends. I'm as fast as a hurricane with simple swords.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Of course only on condition that the price motivates me.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //A freak like Whistler usually has to wait longer for his toy than other people.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Why? Doesn't he pay enough?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //No, on the contrary. He gave me 150 ore for his last sword.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //The guy is into ornaments and girlie stuff like that, and of course that's not cheap.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hey, you ain't curious at all, are you, pal.
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 1;
	important		= 0;
	description		= "Well, smith, how's business?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Well, blacksmith, how's business?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Why would you want to know?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //I may have an order for you.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Oh really? And what?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //I'll think about it.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Come back when you really need something and don't get on my nerves.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "I'd like to try working here as well.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //I'd like to try working here as well.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Oh, but don't you think that you can make great blades!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //What do I have to do?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Okay, take the steel and hold into the fire.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Then you have to lay the red-hot steel across the anvil.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //When you're finished, you put the hot blade into the water bucket over there to temper it.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //The cooled blade finally has to be sharpened on the grindstone.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //I see.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //However, you'll need some things for that. I could sell them to you.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "I'd like to buy blacksmith equipment!";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //I'd like to buy some blacksmith equipment!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


