//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_UluMulu,	"Ich habe den Freund von Ur-Shak in einem unteren Stollen der Freien Mine gefunden. Er hei�t Tarrok, ist allerdings vergiftet und ben�tigt dringend eine spezielle Flasche Ork-Medizin, die er bei seiner Flucht hierher verloren hat. Sie liegt irgendwo hier in den unteren Stollen der Mine. Ich mu� sie wiederfinden, sonst stirbt er.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};