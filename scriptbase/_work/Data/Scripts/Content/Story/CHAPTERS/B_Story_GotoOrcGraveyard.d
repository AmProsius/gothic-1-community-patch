//#####################################################################
//##
//##							KAPITEL 3
//##							=========
//##	Der Spieler wurde von Cor Angar in den Ork-Friedhof geschickt
//##
//#####################################################################

func void B_Story_GotoOrcGraveyard()
{
	//-------- Tagebucheintrag --------
	Log_CreateTopic		(CH3_OrcGraveyard,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_RUNNING);
	B_LogEntry			(CH3_OrcGraveyard,	"Die große Anrufung des Schläfers lief nicht wie erwartet. Es waren nur sehr undeutliche Bilder von Orks in Höhlen zu sehen.  Y'Berion, der religiöse Kopf der Bruderschaft ist durch die Anstrengungen der Beschwörung in ein Koma gefallen!"); 
	B_LogEntry			(CH3_OrcGraveyard,	"Cor-Angar, der Anführer der Templer bat mich in den Ork-Friedhof, ein Höhlensystem in der Nähe des Sumpflagers, zu gehen. Der Guru Baal-Lukor ist bereits mit einigen Templern vor Ort und sucht nach weiteren Hinweisen, um die unklare Vision des Schläfers besser zu verstehen.");
	
	//-------- Templer und Orks vor Ork-Friedhof setzen --------
	// mitten auf dem Vorplatz 
	Wld_InsertNpc		(OrcBiter,			"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc		(OrcBiter,			"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc		(OrcBiter,			"OW_PATH_198_ORCGRAVEYARD4");
	Wld_InsertNpc		(OrcBiter,			"OW_PATH_198_ORCGRAVEYARD4");

	// vor dem Höhleneingang 
	Wld_InsertNpc		(OrcScout,			"OW_PATH_198_ORCGRAVEYARD5");
	Wld_InsertNpc		(OrcScout,			"OW_PATH_198_ORCGRAVEYARD6");
	Wld_InsertNpc		(OrcScout,			"OW_PATH_198_ORCGRAVEYARD7");
	Wld_InsertNpc		(OrcScout,			"OW_PATH_198_ORCGRAVEYARD8");

	Wld_InsertNpc		(Tpl_1463_Templer,	"OW_PATH_198_ORCGRAVEYARD8");

	//-------- Cor Kalom wegschicken --------
	var C_NPC Kalom; 
	Kalom = Hlp_GetNpc (GUR_1201_CORKALOM); 
	Npc_ExchangeRoutine (Kalom, "FLEE");

	//-------- globale Missionsvariable --------
	CorAngar_GotoOGY = TRUE;

	
	// NOVIZEN NACH HAUSE SCHICKEN
	var C_NPC Novize;
	Novize = Hlp_GetNpc (NOV_1319_Novize);
	Npc_ExchangeRoutine (Novize,"START");
	AI_ContinueRoutine	(Novize);
	
	
	var C_NPC Novize_1;
	Novize_1 = Hlp_GetNpc (NOV_1320_Novize);
	Npc_ExchangeRoutine   (Novize_1,"START");
	AI_ContinueRoutine	  (Novize_1);
	

	var C_NPC Novize_2;
	Novize_2 = Hlp_GetNpc (NOV_1343_Novize);
	Npc_ExchangeRoutine   (Novize_2,"START");
	AI_ContinueRoutine	  (Novize_2);
	
	var C_NPC Novize_3;
	Novize_3 = Hlp_GetNpc (NOV_1344_Novize);
	Npc_ExchangeRoutine   (Novize_3,"START");
	AI_ContinueRoutine	  (Novize_3);
	
	var C_NPC Novize_4;
	Novize_4 = Hlp_GetNpc (NOV_1339_Novize);
	Npc_ExchangeRoutine   (Novize_4,"START");
	AI_ContinueRoutine	  (Novize_4);
	
	var C_NPC Novize_5;
	Novize_5 = Hlp_GetNpc (NOV_1341_Novize);
	Npc_ExchangeRoutine   (Novize_5,"START");
	AI_ContinueRoutine	  (Novize_5);
	
	var C_NPC Novize_6;
	Novize_6 = Hlp_GetNpc (NOV_1346_Novize);
	Npc_ExchangeRoutine   (Novize_6,"START");
	AI_ContinueRoutine    (Novize_6);
	
	var C_NPC Novize_7;
	Novize_7 = Hlp_GetNpc (NOV_1347_Novize);
	Npc_ExchangeRoutine   (Novize_7,"START");
	AI_ContinueRoutine	  (Novize_7);
	
	var C_NPC Novize_8;
	Novize_8 = Hlp_GetNpc (NOV_1348_Novize);
	Npc_ExchangeRoutine   (Novize_8,"START");
	AI_ContinueRoutine	  (Novize_8);
	
	var C_NPC Novize_9;
	Novize_9 = Hlp_GetNpc (NOV_1349_Novize);
	Npc_ExchangeRoutine   (Novize_9,"START");
	AI_ContinueRoutine	  (Novize_9);
	
	var C_NPC Novize_10;
	Novize_10 = Hlp_GetNpc (NOV_1338_Novize);
	Npc_ExchangeRoutine    (Novize_10,"START");
	AI_ContinueRoutine	   (Novize_10);
	
	var C_NPC Novize_11;
	Novize_11 = Hlp_GetNpc (NOV_1337_Novize);
	Npc_ExchangeRoutine    (Novize_11,"START");
	AI_ContinueRoutine	   (Novize_11);



};