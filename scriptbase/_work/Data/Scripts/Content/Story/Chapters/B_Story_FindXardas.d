//*****************************************************************************
//***			Diese Funktion tötet alle Bewohner des FMC					***
//*****************************************************************************
func void B_Story_FindXardas()
{
	//-------- Tagebucheinträge --------
	Log_CreateTopic		(CH4_FindXardas,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_FindXardas,	LOG_RUNNING);
	B_LogEntry			(CH4_FindXardas,"After the Magicians of Fire were assassinated, there's only ONE remaining to aid with the explosion of the ore mound. Saturas told me that the creation of the Magic Barrier was led by a 13th magician.");
	B_LogEntry			(CH4_FindXardas,"This 13th magician, called Xardas, lives a secluded life in a tower right in the middle f the Orc land. I've agreed to go there and ask for help.");
	

	//-------- Missionsgegenstände --------
	
	//-------- NSCs einsetzen --------
	Wld_InsertNpc	(XardasDemon,	"DT_E1_06");
	
	//-------- globale Variable setzen --------
	FindXardas = TRUE;
};
