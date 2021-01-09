//#####################################################################
//##
//##							KAPITEL 3
//##							=========
//##	Der Spieler wurde von Cor Angar zu den Wassermagiern ins
//##	Neue Lager geschickt.
//##
//#####################################################################

func void B_Story_SentToNC()
{
	//-------- Cor-Angar zur�ck zum �bungsplatz schicken --------
	var C_NPC	angar;
	angar = Hlp_GetNpc	(Gur_1202_CorAngar);
	Npc_ExchangeRoutine	(angar, "start");

	//-------- Y-Berion --------
	var C_NPC	yberion;
	yberion = Hlp_GetNpc(Gur_1200_YBerion);
	Npc_ExchangeRoutine	(yberion, "dead");

	//-------- Gorn platzieren --------
	var C_NPC	gorn;
	gorn = Hlp_GetNpc	(PC_FIGHTER);
	PrintDebugNpc		(PD_MISSION,	gorn.name);
	Npc_ExchangeRoutine	(gorn, "NCWAIT");
	AI_ContinueRoutine	(gorn);

	//-------- Tagebucheintr�ge --------
	Log_CreateTopic		(CH3_EscapePlanNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_EscapePlanNC,	LOG_RUNNING);
	B_LogEntry			(CH3_EscapePlanNC,	"Y'Berion, der geistige Vater der Bruderschaft ist tot! M�ge seine Seele in Frieden ruhen. In seinen letzten Worten legte er alle Hoffnungen auf ein Entkommen aus der Barriere in die H�nde der Magier vom Kreis des Wassers.");
	B_LogEntry			(CH3_EscapePlanNC,	"Mein Entschlu� steht fest. Ich werde mich ins Neue Lager begeben, um den Ausbruchsplan der Wassermagier zu unterst�tzen. Cor-Angar �bergab mir den Schl�ssel zur Truhe in Cor-Kaloms Alchemielabor. Darin sollen sich sowohl der Fokusstein als auch der Almanach aus meinen bisherigen Missionen f�r die Bruderschaft befinden. Cor-Angar glaubt, da� die Magier aus dem Neuen Lager diese beiden Artefakte f�r ihren Plan ben�tigen werden.");

	//-------- Missionitem --------
	CreateInvItem		(self,			ItArRuneTeleport5);
	B_GiveInvItems		(self,	hero,	ItArRuneTeleport5,	1);

	//-------- globale Missionsvariable --------
	CorAngar_SendToNC = TRUE;
};