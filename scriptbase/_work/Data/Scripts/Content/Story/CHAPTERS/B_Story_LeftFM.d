func void B_Story_LeftFM()
{
	//-------- TA's ändern --------
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	Npc_ExchangeRoutine(gorn, "WaitFM");
	gorn.aivar[AIV_PARTYMEMBER] = FALSE;

	//-------- Monster platziern --------
	Wld_InsertNpc	(FireWaran,		"OW_PATH_SCAVENGER15_SPAWN01");
	Wld_InsertNpc	(FireWaran,		"SPAWN_OW_WARAN_DEMON_01");
	Wld_InsertNpc	(FireWaran,		"OW_COAST_SHIPWRECK_WARAN");

	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI16");
	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI17");
	Wld_InsertNpc	(Swampshark,	"PATH_AROUND_PSI18");

	Wld_InsertNpc	(Shadowbeast,	"OW_PATH_260");
	Wld_InsertNpc	(Shadowbeast,	"OW_PATH_033_TO_CAVE5");
	Wld_InsertNpc	(Shadowbeast,	"SPAWN_OW_SHADOWBEAST2_PSIWOOD_02");

	Wld_InsertNpc	(Troll,			"OW_RUIN_TROLL");
    Wld_InsertNpc	(Troll,			"LOCATION_12_12");
	Wld_InsertNpc	(Troll,			"OW_PATH_2_08");

	//-------- Ur-Shak vor Orkstadt schicken --------
	var C_NPC urshak;
	urshak = Hlp_GetNpc(ORC_2200_Shaman);
	Npc_ExchangeRoutine(urshak, "LeftFM");

	//-------- globale Variable setzen --------
	EnteredFreeMine = TRUE;
};