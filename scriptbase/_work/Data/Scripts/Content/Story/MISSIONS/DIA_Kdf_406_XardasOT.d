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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Wir haben nicht viel Zeit, also höre mir genau zu!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Wie kommst du ....
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Der Schläfer ist nicht mehr weit. Ich musste all meine Kraft aufbringen, um zu dir zu gelangen.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Ich habe die orkischen Prophezeiungen übersetzt und herausgefunden, was es mit den fünf Herzen auf sich hat.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Die fünf Herzen der Priester, die du besiegt hast, wurden in fünf Schreine gelegt.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Diese Schreine können geöffnet werden, aber nur die alten Klingen, welche die Priester bei sich trugen, können die Herzen verletzen.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Du musst die Herzen mit den fünf Klingen durchstoßen, nur so wirst du den Schläfer von dieser Welt verbannen können.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Ich verstehe!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Beeile dich, denn das Erwachen des Erzdämons ist nahe, der verrückte Cor Kalom und seine verblendeten Anhänger sind hier.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Sie haben sich in der Halle des Schläfers versammelt.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Ich habe schon genug geblutet! Jetzt wird mich niemand mehr aufhalten!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Die Macht des Schläfers wird immer stärker, ich kann nicht ...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Was ist los mit dir?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Ich ... muss ...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,	"Es ist soweit. Ich muss mich kurz vor der Ruhestätte des Schläfers befinden. Xardas tauchte plötzlich auf und gab mir die letzten Instruktionen für den bevorstehenden Kampf. Die fünf Herzen der untoten Ork-Schamanen befinden sich in Schreinen und müssen von den fünf Klingen, die ich bei mir trage, durchstoßen werden. Nur so kann der Schläfer besiegt werden. Hört sich eigentlich ganz einfach an...");
	
	AI_StopProcessInfos	(self);
};		
