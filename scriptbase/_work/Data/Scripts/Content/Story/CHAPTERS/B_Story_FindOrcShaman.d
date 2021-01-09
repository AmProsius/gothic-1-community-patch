//*****************************************************************************
//***		Initialisiert die Ork-Schamanen-Szene am Kastell				***
//*****************************************************************************
func void B_Story_FindOrcShaman()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindXardas,	"Endlich habe ich Xardas getroffen. Doch die Begegnung verlief völlig anders als erwartet. Er interessierte sich überhaupt nicht für den Erzhaufen, sondern erzählte mir den ersten Teil der Historie des Schläfers. Ich bin nicht sicher, wie ich Saturas vom Verlauf dieses Gesprächs berichten soll.");

	Log_CreateTopic		(CH4_FindOrcShaman,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_RUNNING);
	B_LogEntry			(CH4_FindOrcShaman,	"Xardas will mich erneut auf die Probe stellen. Um den zweiten Teil der Schläfer-Geschichte zu erfahren, soll ich einen verbannten Ork-Schamanen in der Ruine eines Kastells aufsuchen. Es steht auf dem Gipfel eines hohen Berges im Osten von Xardas' Turm. Mir ist noch nicht ganz klar, wie ich den Schamanen davon abhalten kann, gleich Feuerbälle nach mir zu werfen. Kommt Zeit, kommt Rat.");
	
		
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(ORC_2200_Shaman,	"CASTLE_06");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(OrcWarrior4,		"CASTLE_07");
	Wld_InsertNpc	(StoneGolem,		"CASTLE_04");
	
	//-------- globale Variable setzen --------
	FindOrcShaman = LOG_RUNNING;
};