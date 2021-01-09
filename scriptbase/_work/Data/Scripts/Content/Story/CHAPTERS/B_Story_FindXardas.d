//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,	"Nach der Ermordung der Feuermagier bleibt nur noch EINER übrig, der die Sprengung des Erzhaufens ermöglichen kann. Saturas erzählte, daß die Erschaffung der magischen Barriere von einem 13. Zauberer geleitet wurde.");
	B_LogEntry			(CH4_FindXardas,	"Dieser 13. Zauberer mit Namen Xardas lebt zurückgezogen in einem Turm mitten im Orkgebiet. Ich habe mich dazu bereiterklärt, ihn aufzusuchen und um Hilfe zu bitten.");
	

	//-------- Missionsgegenstände --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};