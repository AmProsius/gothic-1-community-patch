// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "I want to become a Shadow!"; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //I want to become a Shadow!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //So?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"I'm looking for somebody to teach me something.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Can you help me?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Can you help me?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //I wouldn't know how...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //I'm looking for somebody to teach me something.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Why have you come to me?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Diego sent me.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //You should have said that before.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //If you wanna join the Camp, it's an advantage to be a good fighter or thief.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //If the influential Shadows in this camp test you, they'll give you tasks you'd better not get caught doing.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //That's why the way of the thief would be a good start to you.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Incidentally, I'm the best thief in the whole of the Old Camp.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Fingers can teach me the skills of PICKPOCKETING and how to OPEN LOCKS");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "What can you teach me?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //What can you teach me?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //That depends on what you want to know.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"I want to learn how to sneak around.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //I wanna learn how to sneak around.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //I believe - no false modesty - that I'm one of the best thieves they ever chucked into this colony.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //But when it comes to teaching how to sneak around, Cavalorn is the better man for you!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //How can I improve my lock-picking skills?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //You'd like to know that, wouldn't you! It's not too difficult to begin with.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Above all, you have to make sure that your lockpick doesn't break off.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //If you're a little bit more patient in future, you'll see that you won't need that many lockpicks any more!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //How can I become an expert at cracking locks?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Only when you've gained some experience can you tell when a lockpick is going to break. It makes a different sound!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //I think you have it. Learn to listen for the gentle clicking of the lock and you won't lose so many lockpicks in future.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //An expert in this field stands a good chance of opening a trunk without breaking his lockpick.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //I wanna become a skilled pickpocket!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //So you want to relieve a few people of their belongings? Well then.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //I'll teach you how to improve your skills, but it's still very likely that you'll get caught.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //You should only take the risk if nobody but your victim is around.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Only an expert can take things from people's pockets without them noticing!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Forget it! You'll never make a skilled thief unless you can sneak around.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //I want to become an expert pickpocket!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //I think you've progressed far enough to be taught the final tricks of the trade.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //But you should know that even the best can get caught sometimes.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Take care.
	};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "Where can I find Cavalorn?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Where can I find Cavalorn?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //He's hunting out in the wild. You'll find him at the path to the New Camp. Westwards of the Old Camp there's a wide canyon.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //In this canyon there's an old woodcutters' hut. You'll find him there.
	
	B_LogEntry( GE_TeacherOW,"Cavalorn can teach me to sneak. His hut is in a canyon to the west of the Old Camp, in the direction of the New Camp.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "You wouldn't speak up for me in front of Diego, would you?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //You wouldn't speak up for me in front of Diego, would you?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Yes. You've learned something which makes you quite useful to us.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //We can make use of skilled thieves in this camp here. You'll have my vote.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"Fingers is really satisfied with my progress.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //Depends...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //If you demonstrate that you've learned something as a thief, we could make use of you!
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //How am I supposed to do that?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Learn a thief's skill! You need to become more skilled in sneaking around, pickpocketing or opening locks. Then you'll have my vote.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"Fingers will speak in my favor of me when I learn one of the thieving skills.");
	};
};




























