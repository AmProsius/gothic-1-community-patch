func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_EnterTemple,	"Xardas war sichtlich �berrascht, da� es mir gelungen war, in den unterirdischen Tempel einzudringen. Er h�lt mich wohl f�r die Ikone aus einer alten orkischen Prophezeiung.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,	"Xardas identifizierte ein seltsames Schwert, da� ich im Tempel des Schl�fers fand, als URIZIEL. Diese uralte Klinge soll damals gewaltige Kr�fte besessen haben, doch im Laufe der Jahre verlor es all seine magische Energie. Ich mu� einen Weg finden, dieser Waffe wieder ihre alten Kr�fte zur�ckzugeben.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};