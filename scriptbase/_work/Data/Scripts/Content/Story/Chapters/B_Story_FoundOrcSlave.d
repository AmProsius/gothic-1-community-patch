//*****************************************************************************
//***			Der Spieler hat den Freund von Ur-Shak gefunden				***
//*****************************************************************************
func void B_Story_FoundOrcSlave()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,"I've met Ur-Shak's friend in one of the lower tunnels of the Free Mine. He's called Tarrok. He's poisoned, and urgently needs a special bottle of Orc medicine he lost on his escape. It's somewhere in the lower tunnels of the mine. I need to find it or else he'll die.");

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcSlave);
	
	//-------- globale Variable setzen --------
	FreemineOrc_SuchePotion = LOG_RUNNING;
};
