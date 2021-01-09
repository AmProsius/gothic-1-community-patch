// *********************** PRIESTER 2 ***********************

INSTANCE Info_HighPriest2 (C_INFO)
{
	npc			= ORC_Priest_2;
	nr			= 1;
	condition	= Info_HighPriest2_Condition;
	information	= Info_HighPriest2_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest2_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest2_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output			(self, other,"Info_HighPriest2_17_01"); //AN INFIDEL IN THE HOUSE OF THE MASTER!!!!
	AI_Output			(self, other,"Info_HighPriest2_17_02"); //DAMNED BE YOOUUUU!
	AI_Output			(other, self,"Info_HighPriest2_15_03"); //YOU be damned, you stinking moldy carpet!
	
	B_LogEntry			(CH4_EnterTemple,"Varrag-Kasorg, another one of the five Orc shamans, will now end his sad existence down at my feet!");

	AI_StopProcessInfos	(self );

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};
