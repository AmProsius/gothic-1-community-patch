func void ZS_Bathing_Babe ()
{
	PrintDebug("Enter ZS_Bathing_Babe () ");

	B_SetBabeDefaultPerceptions();
	AI_SetWalkmode (self, NPC_WALK);


	PrintDebug("Suche Badewanne !");

	// Suche Badewanne
	if (Wld_IsMobAvailable ( self, "BATHTUB") )
	{
		PrintDebug ("Wanne gefunden! Gehe baden");
		// Lege Nacktmesh-Rüstung ins Inventory ...
		CreateInvItem (self, BAB_ARMOR_NUDE);
		// Lege die Rüstung an, funzt nur wenn dies die beste Rüstung ist !!!! ACHTUNG !!!
		AI_EquipBestArmor (self);
		// wenn vorhanden dann reinsteigen
		AI_UseMob (self, "BATHTUB", 1);

		// Spiele div. random-Anis dazu ab
		Mdl_ApplyRandomAni (self, "S_BATHTUB_S1", "T_BATHTUB_RANDOM1");
		Mdl_ApplyRandomAni (self, "S_BATHTUB_S1", "T_BATHTUB_RANDOM2");

		Mdl_ApplyRandomAniFreq (self, "S_BATHTUB_S1", 3);
	}
	else
	{
		// Keine Badewanne aufzutreiben
		PrintDebug("No BATHTUB-Mobsi found !");
	};

};

func void ZS_Bathing_Babe_Loop ()
{
	// gar nix machen ausser rumbaden
};

func void ZS_Bathing_Babe_End ()
{
	PrintDebug("Enter ZS_Bathing_Babe_End() ");
	// Aus der Wanne steigen
	AI_UseMob (self, "BATHTUB", -1);
	// Ziehe Nackrüstung aus
	AI_UnequipArmor (self);
	// Nackig-Rüstung wieder aus dem Inv entfernen
	Npc_RemoveInvItem (self, BAB_ARMOR_NUDE);
};

/*
func void ZS_Bathing_Babe ()
{
	PrintDebug("Enter ZS_Bathing_Babe () ");

	AI_SetWalkmode (self, NPC_WALK);

	// Suche Umzieh-FP
	if (Wld_IsFPAvailable (self, "FP_UNDRESS_") )
	{
		PrintDebug("FP_UNDRESS found. Undressing !");

		// gehe zu Umziehen-FP
		AI_GotoFP (self, "FP_UNDRESS_");

		// Lege Nacktmesh-Rüstung ins Inventory ...
		CreateInvItem (self, BAB_ARMOR_NUDE);

		// Lege die Rüstung an, funzt nur wenn dies die beste Rüstung ist !!!! ACHTUNG !!!
		AI_EquipBestArmor (self);

		// Warten
		PrintDebug("Suche Badewanne !");

		// Suche Badewanne
		if (Wld_IsMobAvailable ( self, "BATHTUB") )
		{
			PrintDebug ("Wanne gefunden! Gehe baden");

			// wenn vorhanden dann reinsteigen
			AI_UseMob (self, "BATHTUB", 1);

			// Spiele div. random-Anis dazu ab
			Mdl_ApplyRandomAni (self, "S_BATHTUB_S1", "T_BATHTUB_RANDOM1");
			Mdl_ApplyRandomAni (self, "S_BATHTUB_S1", "T_BATHTUB_RANDOM2");

			Mdl_ApplyRandomAniFreq (self, "S_BATHTUB_S1", 3);
		}
		else
		{
			// Keine Badewanne aufzutreiben
			PrintDebug("No BATHTUB-Mobsi found !");
		};


	}
	else
	{
		// Kein FP in 10m Umkreis
		PrintDebug("No FP_UNDRESS_ found !");
	};
};

func void ZS_Bathing_Babe_Loop ()
{
	// gar nix machen ausser rumbaden
};

func void ZS_Bathing_Babe_End ()
{
	PrintDebug("Enter ZS_Bathing_Babe_End() ");

	// Suche wieder Gelegenheit zum Umziehen
	if (Wld_IsFPAvailable (self, "FP_UNDRESS_") )
	{
		PrintDebug("FP_UNDRESS found. Dressing !");

		// Aus der Wanne steigen
		AI_UseMob (self, "BATHTUB", -1);

		// gehe zum Umkleide-FP
		AI_GotoFP (self, "FP_UNDRESS_");

		// Ziehe Nackrüstung aus
		AI_UnequipArmor (self);
	}
	else
	{
		// Kein FP in der Nähe
		PrintDebug("No FP_UNDRESS_ found !");
	};
	// Nackig-Rüstung wieder aus dem Inv entfernen
	Npc_RemoveInvItem (self, BAB_ARMOR_NUDE);
};

*/