// wird aufgerufen, NACHDEM die Action Taste losgelassen wurde, und in Spell_ProcessMana der Spruch NOCH NICHT GECASTED und NOCH NICHT GESTOPPT wurde
// wieviele Mana bereits investiert wurden wird mit manaInvested übergeben.
// voher wurde pro investiertem Punkt die Skript Funktion Spell_ProcessMana aufgerufen
// es macht keinen Sinn, diese Funktion was anderes als SPL_SENDSTOP oder SPL_SENDCAST zurückliefern zu lassen

// SELF 	= Der Caster
// OTHER 	= Das Opfer // kann auch leer sein


func int Spell_ProcessMana_Release(var int manainvested)
{
	//PrintDebugNpc(PD_MAGIC,"Spell_ProcessMana_Release called");

	//PrintDebugInt(PD_MAGIC, "### MAGIC ###-> invested Mana: ", 	manaInvested);
	//PrintDebugInt(PD_MAGIC, "### MAGIC ###-> Spell-Level: ", 	Npc_GetActiveSpellLevel(self));

////////////////////////////////////////////////////////////////////////////////////////////
// Spells, die beim loslassen der Taste auch dann gecastet werden wenn noch nicht max. Mana investiert
	//PrintDebugInt		(PD_MAGIC, "...manaInvested: ", manaInvested);

	if (Npc_GetActiveSpell(self) == SPL_FIREBALL		)	{	return	SPL_SENDCAST;	};
	if (Npc_GetActiveSpell(self) == SPL_FIRESTORM		)	{	return	SPL_SENDCAST; 	};

	if (Npc_GetActiveSpell(self) == SPL_THUNDERBALL		)	{	return	SPL_SENDCAST;	};

	if (Npc_GetActiveSpell(self) == SPL_WINDFIST		)	{	return	SPL_SENDCAST;	};
	if (Npc_GetActiveSpell(self) == SPL_STORMFIST		)	{	return	SPL_SENDCAST;	};


////////////////////////////////////////////////////////////////////////////////////////////
// Spells, die gecastet werden solange man die Tasten gedrückt hält

// Auf Programm-Seite ist das Aufrechterhalten des Spells aber die INVEST-Phase!! 
// Das bedeutet, daß die Damage_per_Level Angabe in der Spells_Params.d erst beim stoppen (eigentlich CASTEN) 
// des Spells aufgerufen wird! Der Abzug von Schaden beim Opfer muß also im zs_"Victim"-Script des Opfers erfolgen...

	if (Npc_GetActiveSpell	(self) == SPL_TELEKINESIS	)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell	(self) == SPL_HEAL			)	{	return	SPL_SENDSTOP;	};

	if (Npc_GetActiveSpell	(self) == SPL_CHAINLIGHTNING)
	{
//		Npc_SendSinglePerc	(self, other, PERC_ASSESSSTOPMAGIC);
		return	SPL_SENDSTOP;
	};

	if (Npc_GetActiveSpell	(self) == SPL_PYROKINESIS	)
	{
		Npc_SendSinglePerc	(self, other, PERC_ASSESSSTOPMAGIC);
		return	SPL_SENDSTOP;
	};



////////////////////////////////////////////////////////////////////////////////////////////
// Spells, die abgebrochen werden, wenn beim loslassen der Taste noch nicht gecastet 

	// FIXME: soll man bei abgebrochenen Spells das investierte Mana zurückbekommen?
	//	Npc_ChangeAttribute	(self,ATR_MANA,self.attribute[ATR_MANA]+manainvested);	
	
	if (Npc_GetActiveSpell(self) == SPL_LIGHT			)	{	return  SPL_SENDSTOP; 	};
	if (Npc_GetActiveSpell(self) == SPL_FIREBOLT		)	{	return	SPL_SENDSTOP;	};
	
	if (Npc_GetActiveSpell(self) == SPL_FIRERAIN		)	{	return	SPL_SENDSTOP; 	};
	if (Npc_GetActiveSpell(self) == SPL_THUNDERBOLT		)	{	return	SPL_SENDSTOP;	};

	if (Npc_GetActiveSpell(self) == SPL_BREATHOFDEATH	)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_NEW1			)	{	return	SPL_SENDSTOP;	};	// Spell SPL_NEW1 (URIZIEL-Rune mit speziellen Spieler-BreathOfDeath)

	if (Npc_GetActiveSpell(self) == SPL_TELEPORT1		)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TELEPORT2		)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TELEPORT3		)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TELEPORT4		)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TELEPORT5		)	{	return	SPL_SENDSTOP;	};

	if (Npc_GetActiveSpell(self) == SPL_TRF_BLOODFLY	) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_CRAWLER	    ) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_LURKER	    ) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_MEATBUG	    ) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_MOLERAT	    ) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_ORCDOG	    ) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_SCAVENGER   ) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_SHADOWBEAST )	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_SNAPPER	    ) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_WARAN       ) 	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_TRF_WOLF        ) 	{	return	SPL_SENDSTOP;	};

	if (Npc_GetActiveSpell(self) == SPL_ICECUBE			)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_ICEWAVE			)	{	return	SPL_SENDSTOP;	};

	if (Npc_GetActiveSpell(self) == SPL_SUMMONDEMON		)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_SUMMONSKELETON	)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_SUMMONGOLEM		)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_ARMYOFDARKNESS	)	{	return	SPL_SENDSTOP;	};

	if (Npc_GetActiveSpell(self) == SPL_DESTROYUNDEAD	)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_CHARM			)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_SLEEP			)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_CONTROL			)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_BERZERK			)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_SHRINK			)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_MASSDEATH		)	{	return	SPL_SENDSTOP;	};
	if (Npc_GetActiveSpell(self) == SPL_FEAR			)	{	return	SPL_SENDSTOP;	};
};