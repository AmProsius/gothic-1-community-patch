//#####################################################################
//##
//##							KAPITEL 2
//##							=========
//##	Der Spieler hat alle drei Artefakte abgeliefert. Die
//##	Bruderschaft bereitet sich nun auf die große Anrufung
//##	des Schläfers vor.
//##
//#####################################################################

func void B_Story_PrepareRitual()
{
	CorKalom_BringBook = LOG_SUCCESS;

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc	(GUR_1200_YBerion);
	Npc_ExchangeRoutine		(YBerion,"CALLSLEEPER");
 	AI_ContinueRoutine		(YBerion);				
	
	var C_NPC CorKalom;
	CorKalom = Hlp_GetNpc	(GUR_1201_CorKalom);
	Npc_ExchangeRoutine		(CorKalom,"CALLSLEEPER");		//kein AI_ChangeRoutine, da dies hier aus dem CorKalom-Dialog heraus aufgerufen wird!
	
	var C_NPC CorAngar;
	CorAngar = Hlp_GetNpc	(GUR_1202_CorAngar);
	Npc_ExchangeRoutine		(CorAngar,"CALLSLEEPER");
	AI_ContinueRoutine		(CorAngar);

	var C_NPC Novize;
	Novize = Hlp_GetNpc (NOV_1319_Novize);
	Npc_ExchangeRoutine (Novize,"RITUAL");
	AI_ContinueRoutine	(Novize);
	Novize.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	var C_NPC Novize_1;
	Novize_1 = Hlp_GetNpc (NOV_1320_Novize);
	Npc_ExchangeRoutine   (Novize_1,"RITUAL");
	AI_ContinueRoutine	  (Novize_1);
	Novize_1.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	B_ExchangeRoutine		(Gur_1205_Chani,	"dead");
	B_ExchangeRoutine		(Gur_1207_Natalia,	"dead");

//-----------------------------------------------------------------------
	var C_NPC Novize_2;
	Novize_2 = Hlp_GetNpc (NOV_1343_Novize);
	Npc_ExchangeRoutine   (Novize_2,"RITUAL");
	AI_ContinueRoutine	  (Novize_2);
	
	var C_NPC Novize_3;
	Novize_3 = Hlp_GetNpc (NOV_1344_Novize);
	Npc_ExchangeRoutine   (Novize_3,"RITUAL");
	AI_ContinueRoutine	  (Novize_3);
	
	var C_NPC Novize_4;
	Novize_4 = Hlp_GetNpc (NOV_1339_Novize);
	Npc_ExchangeRoutine   (Novize_4,"RITUAL");
	AI_ContinueRoutine	  (Novize_4);
	
	var C_NPC Novize_5;
	Novize_5 = Hlp_GetNpc (NOV_1341_Novize);
	Npc_ExchangeRoutine   (Novize_5,"RITUAL");
	AI_ContinueRoutine	  (Novize_5);
	
	var C_NPC Novize_6;
	Novize_6 = Hlp_GetNpc (NOV_1346_Novize);
	Npc_ExchangeRoutine   (Novize_6,"RITUAL");
	AI_ContinueRoutine    (Novize_6);
	
	var C_NPC Novize_7;
	Novize_7 = Hlp_GetNpc (NOV_1347_Novize);
	Npc_ExchangeRoutine   (Novize_7,"RITUAL");
	AI_ContinueRoutine	  (Novize_7);
	
	var C_NPC Novize_8;
	Novize_8 = Hlp_GetNpc (NOV_1348_Novize);
	Npc_ExchangeRoutine   (Novize_8,"RITUAL");
	AI_ContinueRoutine	  (Novize_8);
	
	var C_NPC Novize_9;
	Novize_9 = Hlp_GetNpc (NOV_1349_Novize);
	Npc_ExchangeRoutine   (Novize_9,"RITUAL");
	AI_ContinueRoutine	  (Novize_9);
	
	var C_NPC Novize_10;
	Novize_10 = Hlp_GetNpc (NOV_1338_Novize);
	Npc_ExchangeRoutine    (Novize_10,"RITUAL");
	AI_ContinueRoutine	   (Novize_10);
	
	var C_NPC Novize_11;
	Novize_11 = Hlp_GetNpc (NOV_1337_Novize);
	Npc_ExchangeRoutine    (Novize_11,"RITUAL");
	AI_ContinueRoutine	   (Novize_11);
	
	var C_NPC Templer;	
	Templer	= Hlp_GetNpc   (TPL_1431_Templer);
	Templer.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	
	var C_NPC Templer_1;	
	Templer_1	= Hlp_GetNpc	(TPL_1430_Templer);
	Templer_1.senses =		SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	// Talas wieder zurücksetzen, falls der Spieler ihn hat stehen lassen
	B_ExchangeRoutine	(Nov_1300_Talas,"BackInCamp");
};

func int	C_TimeForGreatPrayer()
{
	if Wld_IsTime(20,00,	04,00)
	{
		return TRUE;
	};
};	