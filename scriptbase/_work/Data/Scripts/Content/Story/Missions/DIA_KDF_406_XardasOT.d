//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
instance  Info_Xardas_OT (C_INFO)
{
	npc				= Kdf_406_OTXardas;
	condition		= Info_Xardas_OT_Condition;
	information		= Info_Xardas_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_Xardas_OT_Condition()
{	
	if (Npc_GetDistToWP(self, "TPL_331") < 1000)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OT_Info()
{
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //We don't have much time, so listen carefully!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //How did you....
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //The Sleeper is not far. I had to use all my powers to get here.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //I have translated the Orcish prophecies and discovered what the five hearts are about.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //The five hearts of the priests you defeated were placed in five shrines.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //These shrines may be opened, but only the ancient blades carried by the priests can harm the hearts.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Now you must pierce the hearts with the five blades. Only thus will you be able to drive the Sleeper from this world.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //I understand!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Hurry, for the awakening of the arch demon is nigh, the crazed Cor Kalom and his misled disciples are here.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //They have gathered in the hall of the Sleeper.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //I've bled enough! Nobody can stop me now!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //The might of the Sleeper is growing stronger and stronger, I cannot...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //What's wrong with you?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //I... must...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"The time has come. I must be just a short distance away from the Sleeper's resting place. Xardas suddenly appeared and gave me instructions for the fight. The five hearts of the undead Orc shamans are in shrines, I need to pierce them with the five blades I've got on me. This is the only way to defeat the Sleeper. Sounds quite simple ...");
	
	AI_StopProcessInfos	(self);
};		
