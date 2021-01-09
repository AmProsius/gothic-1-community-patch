// *********************** PRIESTER 1 ***********************

INSTANCE Info_HighPriest1 (C_INFO)
{
	npc			= ORC_Priest_1;
	nr			= 1;
	condition	= Info_HighPriest1_Condition;
	information	= Info_HighPriest1_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest1_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest1_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output 			(self, other,"Info_HighPriest1_17_01"); //MOOOOOOORTAAAL!
	AI_Output 			(self, other,"Info_HighPriest1_17_02"); //YOU DAAARE TO DISTURB MY PEEEAACE!
	AI_Output 			(self, other,"Info_HighPriest1_17_03"); //PREEPAAARE FOR THE EEEND!
	AI_Output 			(other, self,"Info_HighPriest1_15_04"); //It remains to be seen whose end it's going to be, you worm-bitten meatloaf!
	
	B_LogEntry			(CH4_EnterTemple,"I'm facing Varrag-Hashor, one of the five Orc shamans, who brought the Sleeper to this world. I'll put an end to his undead existence.");

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

