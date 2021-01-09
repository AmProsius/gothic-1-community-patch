instance  GUR_1212_MadCorKalom_Talk2SC (C_INFO)
{
	npc				= GUR_1212_MadCorKalom;
	condition		= GUR_1212_MadCorKalom_Talk2SC_Condition;
	information		= GUR_1212_MadCorKalom_Talk2SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	return TRUE;
};

FUNC void GUR_1212_MadCorKalom_Talk2SC_Info ()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, hero);
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //At last we meet again!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //My master has already told me of your arrival!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //He can sense that you're near.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //I'll soon be nearer to him than he would like me to be!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //We will not let you foil our plans.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //The world is about to witness the awakening of the Redeemer, and nobody can stop him.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //All the infidels out there will pay the price.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //And you shall have the honor of being the first to pay.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //SSSLLLLLLEEEEEEEEEEEPPPEEEEEERRRR AAWWWAAAAAAAAAAAKKKEEEEEENN!!!!!!!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
