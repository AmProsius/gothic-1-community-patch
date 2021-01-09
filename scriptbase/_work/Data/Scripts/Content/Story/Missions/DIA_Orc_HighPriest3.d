
// *********************** PRIESTER 3 ***********************

INSTANCE Info_HighPriest3 (C_INFO)
{
	npc			= ORC_Priest_3;
	nr			= 1;
	condition	= Info_HighPriest3_Condition;
	information	= Info_HighPriest3_Info;
	important	= 1;
};                       

FUNC INT Info_HighPriest3_Condition()
{
	return 1;
};

FUNC VOID Info_HighPriest3_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output			(self, other,"Info_HighPriest3_17_01"); //MOOORTAAAAL!!!!!
	AI_Output			(self, other,"Info_HighPriest3_17_02"); //YOOOOOOUR TRAAAVELS EEEND HEEERE WIITH MEEEEEEE!!
	AI_Output 			(other, self,"Info_HighPriest3_15_03"); //I'll send you traveling first, you moldy maggot's idea of paradise!

	B_LogEntry			(CH4_EnterTemple,"Varrag-Unhilqt, one of the five Orc shamans of the Sleeper, is right in front of me. Only one of us will leave this chamber alive!");

	AI_StopProcessInfos	(self);
	
	Npc_SetAttitude		(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);
};

