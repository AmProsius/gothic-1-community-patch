func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheintr�ge --------
	B_LogEntry		(CH4_FindXardas,"I've handed over all three golem hearts to the demon guard. In exchange I've received the magic rune of teleportation. Let's see where it'll take me to.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabl�ufe �ndern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};
