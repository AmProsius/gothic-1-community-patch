//#####################################################################
//##
//##							KAPITEL 2
//##							=========
//##	Y'Berion schickt den Spieler los, um den ersten Fokus
//##	zu holen.
//##
//#####################################################################
func void B_Story_BringFirstFocus()
{
	//-------- Ausrüstung für Spieler --------
	CreateInvItem	(self, ItWrFocusmapPsi);
	B_GiveInvItems	(self, hero, ItWrFocusmapPsi,1);
	
	//-------- Nyras modifizieren --------
	var C_NPC nyras;
	nyras = Hlp_GetNpc	(Nov_1303_Nyras);
	Npc_ExchangeRoutine	(nyras, "PrepareRitual");		// zum Ort des 1. Fokus schicken
	AI_ContinueRoutine	(nyras);
	nyras.flags = 0;									// IMMORTAL-Flag entfernen
	CreateInvItem 		(nyras, Focus_1);				// Fokus in die Tasche stecken

	//-------- globale Story Variablen --------
	YBerion_BringFocus = LOG_RUNNING;
};