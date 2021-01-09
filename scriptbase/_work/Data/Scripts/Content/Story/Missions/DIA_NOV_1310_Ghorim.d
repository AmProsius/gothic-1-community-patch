// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Ghorim_Exit (C_INFO)
{
	npc			=  Nov_1310_Ghorim;
	nr			=  999;
	condition	=  DIA_Ghorim_Exit_Condition;
	information	=  DIA_Ghorim_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Ghorim_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

instance  DIA_Ghorim_MissingHarlok (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_MissingHarlok_Condition;
	information	= DIA_Ghorim_MissingHarlok_Info;
	permanent	= 0;
	description	= "Hi! How's it going?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Hi! How's it going?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //I'm dead on my feet, man. I've been working for two days without a single break.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok should have taken over ages ago. It's always the same with that guy.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //He's probably lying in his hut, fast asleep!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Why don't you just go there and give him a right kick in the butt?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Can't leave here while Baal Orun is in charge - the work has to be done either way!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //But you could go there for me - he's staying right under Cor Kalom's alchemy lab, at Fortuno's.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Tell him to get his butt over here.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"The novice Ghorim asked me to make lazy Harlok take over from him. Harlok usually hangs around at Fortuno's weed shop.");

	Ghorim_KickHarlok = LOG_RUNNING;
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Ghorim_SUCCESS (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_SUCCESS_Condition;
	information	= DIA_Ghorim_SUCCESS_Info;
	permanent	= 1;
	description	= "Well? Has he taken over now?";
};                       

FUNC int  DIA_Ghorim_SUCCESS_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Ghorim_SUCCESS_Info()
{
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //Well? Has he taken over now?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Yeah - finally I can get to sleep. Thanks, man!
};


