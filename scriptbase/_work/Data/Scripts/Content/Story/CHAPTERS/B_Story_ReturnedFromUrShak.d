func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,	"Xardas schien zufrieden mit dem, was ich bei UrShak in Erfahrung bringen konnte. Mein weiterer Weg führt mich nun in die Freie Mine, um den Freund von Ur-Shak zu finden.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,	"Langsam verstehe ich Xardas' Ziel. Ich bat ihn um Hilfe bei der Zerstörung der magischen Barriere und er zeigt mir tatsächlich einen Weg, nur hat dieser Weg überhaupt nichts mit dem großen Erzhaufen der Wassermagier zu tun. Statt dessen verlangt er von mir, einen Weg in den unterirdischen Schläfer-Tempel zu finden."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};