
INSTANCE Focus_Normal (C_Focus)
{
	// NSCs
	npc_longrange = 500.0;			// Nur im Normalmodus gueltig -- Horst:Nein auch im Melee modus wichtig!!Bei Fragen bitte an mich wenden
	npc_range1	= 0.0;				
	npc_range2	= 300.0;
	npc_azi		= 45.0;				
	npc_elevup	= 45.0;
	npc_elevdo	= -45.0;
	npc_prio	= 0;					// neu -- Mike
	// ITEMs
	item_range1	= 0.0;				
	item_range2	= 400.0;			// von 150 auf 130 -- Mike	// von 130 auf 180 - Markus wegen Orcs // von 180 auf 300, man sieht sonst keine Items -Mike
	item_azi	= 40.0;					
	item_elevup	= 10.0;
	item_elevdo	= -90.0;			// von -100 auf -90 -- geht eh nur bis -90 wegen azi! -- Mike
	item_prio	= 1;					// neu -- Mike	
	// MOBs
	mob_range1	= 0.0;				
	mob_range2	= 350.0;
	mob_azi		= 45.0;				
	mob_elevup	= 60.0;
	mob_elevdo	= -90.0;			// von -100 auf -90 -- geht eh nur bis -90 wegen azi! -- Mike
	mob_prio	= 0;					// neu -- Mike
};

INSTANCE Focus_Melee (C_Focus)
{
	// NSCs
	//npc_longrange = 600.0;         // FINGER WEG DA!!!  -- Horst
	
	npc_range1	= 0.0;				
	npc_range2	= 500.0;
	npc_azi		= 45.0;			//    - geändert von 30 auf 45 -- Mike
	npc_elevup	= 45.0;
	npc_elevdo	= -60.0;
	npc_prio	= 1;					// NPCs(1) before MOBs(0)

	// No ITEMs
	item_prio	= -1;
	
	// MOBs
	mob_range1	=   0.0;				
	mob_range2	= 150.0;
	mob_azi		=  30.0;			
	mob_elevup	=  45.0;
	mob_elevdo	= -45.0;
	mob_prio	=    -1;			// MOBs(0) after NPCs(1)
};

INSTANCE Focus_Ranged (C_Focus)
{
	// NSCs
	npc_range1	= 0.0;				
	npc_range2	= 3000.0;
	npc_azi		= 45.0;				
	npc_elevup	= 45.0;
	npc_elevdo	= -45.0;
	npc_prio	= 1;				// NSCs werden bevorzugt
	// ITEMs
	item_range1	= 0.0;				
	item_range2	= 3000.0;
	item_azi	= 45.0;				
	item_elevup	= 45.0;
	item_elevdo	= -45.0;
	item_prio	= -1;
	// MOBs
	mob_range1	= 0.0;				
	mob_range2	= 3000.0;
	mob_azi		= 45.0;			
	mob_elevup	= 45.0;
	mob_elevdo	= -45.0;
	mob_prio	= -1;
};

INSTANCE Focus_Throw_Item (C_Focus)
{
	// NSCs
	npc_range1	= 300.0;				
	npc_range2	= 1500.0;
	npc_azi		= 20.0;				
	npc_elevup	= 45.0;
	npc_elevdo	= -45.0;
	// ITEMs
	item_range1	= 300.0;				
	item_range2	= 1500.0;
	item_azi	= 20.0;			
	item_elevup	= 45.0;
	item_elevdo	= -45.0;
	// MOBs
	mob_range1	= 300.0;				
	mob_range2	= 1500.0;
	mob_azi		= 20.0;				
	mob_elevup	= 45.0;
	mob_elevdo	= -45.0;
};

INSTANCE Focus_Throw_Mob (C_Focus)
{
	// NSCs
	npc_range1	= 50.0;				
	npc_range2	= 200.0;
	npc_azi		= 20.0;			
	npc_elevup	= 45.0;
	npc_elevdo	= -45.0;
	// ITEMs
	item_range1	= 50.0;				
	item_range2	= 200.0;
	item_azi	= 20.0;			
	item_elevup	= 45.0;
	item_elevdo	= -45.0;
	// MOBs
	mob_range1	= 50.0;				
	mob_range2	= 200.0;
	mob_azi		= 20.0;				
	mob_elevup	= 45.0;
	mob_elevdo	= -45.0;
};

// ACHTUNG!!!!!!!: Der Magie Fokus sollte nicht verändert werden. Alle spezifischen Focus Modes sind PRO SPELL in der Spell_Params.d einstellbar.
// Diese Magie Focus Instanz trifft die Vorentscheidung, welche Vobs überhaupt in Frage kommen. Der eigentlich Test findet in den einzelnen Spells statt!
INSTANCE Focus_Magic(C_Focus)
{
	// NSCs
/*	npc_range1	= 0.0;				
	npc_range2	= 30000.0;
	npc_azi		= 180.0;				
	npc_elevup	= 90.0;
	npc_elevdo	= -90.0;
	npc_prio	= 2;				// NSCs werden bevorzugt
	// ITEMs
	item_range1	= 0.0;				
	item_range2	= 30000.0;
	item_azi	= 180.0;				
	item_elevup	= 90.0;
	item_elevdo	= -90.0;
	item_prio	= 1;
	// MOBs
	mob_range1	= 0.0;				
	mob_range2	= 30000.0;
	mob_azi		= 180.0;			
	mob_elevup	= 90.0;
	mob_elevdo	= -90.0;
	mob_prio	= 0;*/
	
	npc_range1	= 0.0;				
	npc_range2	= 3000.0;
	npc_azi		= 45.0;				
	npc_elevup	= 45.0;
	npc_elevdo	= -45.0;
	npc_prio	= 1;				// NSCs werden bevorzugt
	// ITEMs
	item_range1	= 0.0;				
	item_range2	= 3000.0;
	item_azi	= 45.0;				
	item_elevup	= 45.0;
	item_elevdo	= -45.0;
	item_prio	= 0;
	// MOBs
	mob_range1	= 0.0;				
	mob_range2	= 3000.0;
	mob_azi		= 45.0;			
	mob_elevup	= 45.0;
	mob_elevdo	= -45.0;
	mob_prio	= 0;

};