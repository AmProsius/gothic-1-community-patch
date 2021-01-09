// infos 
instance Info_TPL_1455_GorBoba (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba_Condition;
	information		= Info_TPL_1455_GorBoba_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1455_GorBoba_Condition()
{
	return TRUE;
};

func void Info_TPL_1455_GorBoba_Info()
{
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Get lost, you aren't wanted here.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "And YOU are gonna stop me?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //And YOU are gonna stop me?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //YES! I will stop you - you won't prevent Master Kalom from awakening the Sleeper.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Don't try to attack me, the high priest has transferred part of his powers to Master Kalom and us. Now we are immortal.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //I'll show you how immortal you are!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Prepare to meet your Creator!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","GorBoba wanted to stop me. He told me that Kalom and his supporters had been given powers by the high priest to make them invincible by human weapons."); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
