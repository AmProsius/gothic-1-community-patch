//////////////////////////////////////////////////////////////////////////
//	B_RefreshArmor
//	==============
//	Wird einmal pro Spieltag um 0 Uhr vom Code aufgerufen!
//	Wurde früher genutzt, um NSCs die ihrer Rüstung beraubt wurden, wieder
//	eine passende Rüstung dazuzuschummeln. Da der Spieler nun den NSCs
//	nicht mehr die Rüstung abnehmen kann, ist diese Funktion leer.
//
//	WICHTIG: Könnte aber zum Respawnen von irgendwelchen anderen Dingen
//	benutzt werden!
//////////////////////////////////////////////////////////////////////////
func void B_RefreshArmor()
{
	PrintDebugNpc( PD_ZS_FRAME, "B_RefreshArmor" );
};