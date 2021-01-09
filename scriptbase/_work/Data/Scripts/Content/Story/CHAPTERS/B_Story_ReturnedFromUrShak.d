func void B_Story_ReturnedFromUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,	"Xardas schien zufrieden mit dem, was ich bei UrShak in Erfahrung bringen konnte. Mein weiterer Weg f�hrt mich nun in die Freie Mine, um den Freund von Ur-Shak zu finden.");
	Log_SetTopicStatus	(CH4_FindOrcShaman,	LOG_SUCCESS);

	Log_CreateTopic		(CH4_EnterTemple,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_RUNNING);
	B_LogEntry			(CH4_EnterTemple,	"Langsam verstehe ich Xardas' Ziel. Ich bat ihn um Hilfe bei der Zerst�rung der magischen Barriere und er zeigt mir tats�chlich einen Weg, nur hat dieser Weg �berhaupt nichts mit dem gro�en Erzhaufen der Wassermagier zu tun. Statt dessen verlangt er von mir, einen Weg in den unterirdischen Schl�fer-Tempel zu finden."); 

	//-------- Erfahrung --------
	B_GiveXP		(XP_ReturnedFromUrShak);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};