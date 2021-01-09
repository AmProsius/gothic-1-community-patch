//*****************************************************************************
//***			Diese Funktion t�tet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,	"Nach der Ermordung der Feuermagier bleibt nur noch EINER �brig, der die Sprengung des Erzhaufens erm�glichen kann. Saturas erz�hlte, da� die Erschaffung der magischen Barriere von einem 13. Zauberer geleitet wurde.");
	B_LogEntry			(CH4_FindXardas,	"Dieser 13. Zauberer mit Namen Xardas lebt zur�ckgezogen in einem Turm mitten im Orkgebiet. Ich habe mich dazu bereiterkl�rt, ihn aufzusuchen und um Hilfe zu bitten.");
	

	//-------- Missionsgegenst�nde --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};