
// *********************** PRIESTER 4 ***********************

INSTANCE Info_HighPriest4 (C_INFO)
{
	npc			= ORC_Priest_4;
	nr			= 1;
	condition	= Info_HighPriest4_Condition;
	information	= Info_HighPriest4_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_HighPriest4_Condition()
{
	return 1;
};

FUNC VOID Info_HighPriest4_Info()
{
	B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	AI_Output			(self, other,"Info_HighPriest4_17_01"); //ZUEEEENDEEEE IST DEEEIN LANGER WEEEG!!!
	AI_Output			(self, other,"Info_HighPriest4_17_02"); //BREEENNEEEN SOLL DEINEEEE STEEEERBLICHEEEE HÜLLEEEE!!! 
	AI_Output			(other, self,"Info_HighPriest4_15_03"); //Das wollen wir doch mal schön bleiben lassen!
	
	B_LogEntry			(CH4_EnterTemple,	"Varrag-Ruuushk, einer der untoten Schamanen der Schläfer-Herbeirufung kreuzt nun meinen Weg. Er wird mich nicht aufhalten, dafür sorge ich!");
	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
};

