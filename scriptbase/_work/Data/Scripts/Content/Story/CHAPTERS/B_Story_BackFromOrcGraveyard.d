//#####################################################################
//##
//##							KAPITEL 3
//##							=========
//##	Der Spieler kehrt vom Ork-Friedhof zurück und berichtet
//##	von Baal-Lukor und den Ereignissen dort.
//##
//#####################################################################

func void B_Story_BackFromOrcGraveyard()
{
	//-------- Tagebucheintrag --------
	B_LogEntry			(CH3_OrcGraveyard,	"Ich habe Cor-Angar von den Ereignissen im Ork-Friedhof berichtet. Er war sehr bestürzt und setzt nun seine ganze Hoffnung auf den immer noch bewusstlosen Y'Berion.");
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_SUCCESS);
};