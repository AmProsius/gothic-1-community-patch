//////////////////////////////////////////////////////////////////////////
//	B_RefreshArmor
//	==============
//	Wird einmal pro Spieltag um 0 Uhr vom Code aufgerufen!
//	Wurde fr�her genutzt, um NSCs die ihrer R�stung beraubt wurden, wieder
//	eine passende R�stung dazuzuschummeln. Da der Spieler nun den NSCs
//	nicht mehr die R�stung abnehmen kann, ist diese Funktion leer.
//
//	WICHTIG: K�nnte aber zum Respawnen von irgendwelchen anderen Dingen
//	benutzt werden!
//////////////////////////////////////////////////////////////////////////
func void B_RefreshArmor()
{
	PrintDebugNpc( PD_ZS_FRAME, "B_RefreshArmor" );
};