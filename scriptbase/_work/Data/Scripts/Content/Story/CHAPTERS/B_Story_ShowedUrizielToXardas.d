func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_EnterTemple,	"Xardas war sichtlich überrascht, daß es mir gelungen war, in den unterirdischen Tempel einzudringen. Er hält mich wohl für die Ikone aus einer alten orkischen Prophezeiung.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,	"Xardas identifizierte ein seltsames Schwert, daß ich im Tempel des Schläfers fand, als URIZIEL. Diese uralte Klinge soll damals gewaltige Kräfte besessen haben, doch im Laufe der Jahre verlor es all seine magische Energie. Ich muß einen Weg finden, dieser Waffe wieder ihre alten Kräfte zurückzugeben.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};