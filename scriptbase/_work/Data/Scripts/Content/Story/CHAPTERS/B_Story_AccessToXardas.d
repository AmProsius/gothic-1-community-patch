func void B_Story_AccessToXardas()
{
	//-------- Missionsgegenst�nde --------
	CreateInvItem	(hero, ItArRuneTeleport3);

	//-------- Tagebucheintr�ge --------
	B_LogEntry		(CH4_FindXardas,	"Ich habe alle drei Golemherzen an den W�chter-D�mon �bergeben. Im Tausch erhielt ich eine Zauberrune der Teleportation. Mal sehen, wo sie mich hinbringt.");

	//-------- Erfahrung --------
	B_GiveXP		(XP_DeliveredGolemhearts);

	//-------- Tagesabl�ufe �ndern --------
	
	//-------- globale Variable setzen --------
	FindGolemHearts = 4;
};