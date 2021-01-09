// Der Spieler wird von Xardas losgeschickt, um URIZIEL aufzuladen.
func void B_Story_LoadSword ()
{
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,	"Xardas hat die Zauberformel fertiggestellt. Ich benötige jetzt eine sehr große magische Energiequelle und einen hilfsbereiten Magier, der mich bei meinem Vorhaben unterstützt. Zufälligerweise gibt es eine Gemeinschaft in der Kolonie, die eine solche Energiequelle besitzt und sie steht tief in meiner Schuld...");

	//-------- Erfahrung --------
	B_GiveXP			(XP_ReturnedFromSunkenTower);

	//-------- magische Formel, um URIZIEL zu laden --------
	CreateInvItem		(hero,	Scroll4Milten);
	
	//-------- TA für Milten, dass er auf SC wartet --------
	VAR C_NPC Milten; Milten = Hlp_GetNpc(PC_Mage);
	Npc_ExchangeRoutine (Milten, "LSWait"); 						

	//-------- globale Variable --------
	LoadSword = TRUE;
};

