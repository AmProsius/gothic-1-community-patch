//***************************************************************************
//	Info EXIT
//***************************************************************************
INSTANCE Info_GornFM_EXIT (C_INFO)
{
	npc			= PC_FighterFM;
	nr   		= 999;
	condition	= Info_GornFM_EXIT_Condition;
	information	= Info_GornFM_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_GornFM_EXIT_Condition()
{
	return 1;
};

func VOID Info_GornFM_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_GornFM_EXIT_09_01"); //Let's fight!
	}
	else
	{
		AI_Output (self, other,"Info_GornFM_EXIT_09_02"); //See you later.
	};
	
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info WAIT
//---------------------------------------------------------------------
INSTANCE Info_GornFM_WAIT (C_INFO)
{
	npc			= PC_FighterFM;
	condition	= Info_GornFM_WAIT_Condition;
	information	= Info_GornFM_WAIT_Info;
	important	= 0;	
	permanent	= 1;
	description	= "Hold the position, I'll check the situation!";
};                       

FUNC INT Info_GornFM_WAIT_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

func VOID Info_GornFM_WAIT_Info()
{
	AI_Output 			(hero,self,"Info_GornFM_WAIT_15_01"); //Hold the position, I'll check the situation!
	AI_Output 			(self,hero,"Info_GornFM_WAIT_09_02"); //Alright. I'll wait at the entrance to the mine and make sure nobody tries anything.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"wait");
};

//---------------------------------------------------------------------
//	Info FOLLOW
//---------------------------------------------------------------------
INSTANCE Info_GornFM_FOLLOW (C_INFO)
{
	npc			= PC_FighterFM;
	condition	= Info_GornFM_FOLLOW_Condition;
	information	= Info_GornFM_FOLLOW_Info;
	important	= 0;	
	permanent	= 1;
	description	= "Come on, I need your help.";
};                       

FUNC INT Info_GornFM_FOLLOW_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func VOID Info_GornFM_FOLLOW_Info()
{
	AI_Output 			(hero,self,"Info_GornFM_FOLLOW_15_01"); //Come on, I need your help.
	AI_Output 			(self,hero,"Info_GornFM_FOLLOW_09_02"); //At last we're moving on! You go first, I'll follow.

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"follow");
};



