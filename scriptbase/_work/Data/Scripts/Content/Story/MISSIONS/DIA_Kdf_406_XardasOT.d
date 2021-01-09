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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Wir haben nicht viel Zeit, also h�re mir genau zu!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Wie kommst du ....
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Der Schl�fer ist nicht mehr weit. Ich musste all meine Kraft aufbringen, um zu dir zu gelangen.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Ich habe die orkischen Prophezeiungen �bersetzt und herausgefunden, was es mit den f�nf Herzen auf sich hat.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Die f�nf Herzen der Priester, die du besiegt hast, wurden in f�nf Schreine gelegt.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Diese Schreine k�nnen ge�ffnet werden, aber nur die alten Klingen, welche die Priester bei sich trugen, k�nnen die Herzen verletzen.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Du musst die Herzen mit den f�nf Klingen durchsto�en, nur so wirst du den Schl�fer von dieser Welt verbannen k�nnen.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Ich verstehe!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Beeile dich, denn das Erwachen des Erzd�mons ist nahe, der verr�ckte Cor Kalom und seine verblendeten Anh�nger sind hier.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Sie haben sich in der Halle des Schl�fers versammelt.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Ich habe schon genug geblutet! Jetzt wird mich niemand mehr aufhalten!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Die Macht des Schl�fers wird immer st�rker, ich kann nicht ...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Was ist los mit dir?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Ich ... muss ...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,	"Es ist soweit. Ich muss mich kurz vor der Ruhest�tte des Schl�fers befinden. Xardas tauchte pl�tzlich auf und gab mir die letzten Instruktionen f�r den bevorstehenden Kampf. Die f�nf Herzen der untoten Ork-Schamanen befinden sich in Schreinen und m�ssen von den f�nf Klingen, die ich bei mir trage, durchsto�en werden. Nur so kann der Schl�fer besiegt werden. H�rt sich eigentlich ganz einfach an...");
	
	AI_StopProcessInfos	(self);
};		
