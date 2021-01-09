
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
	
	AI_Output			(self, other,"Info_HighPriest3_17_01"); //STEEEEERBLICHEEEEER!!!!!
	AI_Output			(self, other,"Info_HighPriest3_17_02"); //DEINEEEEEE REISEEEEE EEEENDET HIIEEER BEI MIIIIR!!
	AI_Output 			(other, self,"Info_HighPriest3_15_03"); //Erst mal schicke ich dich auf eine neue Reise, verfaultes Madenparadies!

	B_LogEntry			(CH4_EnterTemple,	"Varrag-Unhilqt, einer der fünf Ork-Schamanen des Schläfers, steht vor mir. Nur einer von uns wird diese Kammer verlassen!");

	AI_StopProcessInfos	(self);
	
	Npc_SetAttitude		(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);
};

