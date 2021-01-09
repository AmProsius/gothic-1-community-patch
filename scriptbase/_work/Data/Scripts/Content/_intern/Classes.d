	
//////////////////////////////////////	
// 	Class - Definitions					
//	Global Instances					
//	Phoenix V0.76						
//////////////////////////////////////	

CONST INT MAX_CHAPTER	 = 5;
CONST INT MAX_MISSIONS   = 5;

CLASS C_NPC 
{
	VAR INT     id								;		//	absolute ID des NPCs
	VAR STRING 	name			[5]				;		//	Namen des NPC
	VAR STRING 	slot							;			
	VAR INT		npcType							;			
	VAR INT	    flags							;			
	VAR INT     attribute		[ATR_INDEX_MAX]	;			
	VAR INT		protection		[PROT_INDEX_MAX];			
	VAR INT		damage			[DAM_INDEX_MAX] ;			
	VAR INT		damagetype						;
	VAR INT	    guild,level						;			
															
	VAR FUNC    mission			[MAX_MISSIONS]	;			
	var INT		fight_tactic					;			
	VAR INT	    weapon							;			
															
	VAR INT		voice							;			
	VAR INT		voicePitch						;			
	VAR INT		bodymass						;			
															
	VAR FUNC	daily_routine					;		//	Tagesablauf
	VAR FUNC    start_aistate					;		//	Zustandsgesteuert
															
	// **********************					
	// Spawn									
	// **********************					
	VAR STRING	spawnPoint						;		//	Beim Tod, wo respawnen ?
	VAR INT		spawnDelay						;		//	Mit Delay in (Echtzeit)-Sekunden
															
	// **********************					
	// SENSES									
	// **********************					
	VAR INT 	senses							;		//	Sinne
	VAR INT 	senses_range					;		//	Reichweite der Sinne in cm
															
	// **********************					
	// Feel free to use							
	// **********************					
	VAR INT		aivar			[50]			;						
	VAR STRING	wp								;			
	
	// **********************					
	// Experience dependant						
	// **********************					
	VAR INT		exp								;		// EXerience Points
	VAR INT		exp_next						;		// EXerience Points needed to advance to next level
	VAR INT		lp								;       // Learn Points		
};															
															
CLASS C_Mission												
{															
	VAR STRING	name							;		//	Name des Auftrages
	VAR STRING	description						;			
	VAR INT		duration						;		//	Max. Dauer in Tageszeiten
	VAR INT		important						;
												
	VAR FUNC	offerConditions					;
	VAR FUNC	offer							;
	VAR FUNC	successConditions				;
	VAR FUNC	success							;
	VAR FUNC	failureConditions				;
	VAR FUNC	failure							;
	VAR FUNC	obsoleteConditions				;
	VAR FUNC	obsolete						;
	VAR FUNC	running							;
};												

CLASS C_Item 
{
	// Für alle Items
	VAR INT		id								;				
	VAR STRING  name,nameID						;
	VAR INT		hp,hp_max						;

	VAR INT     mainflag,flags					;		//	Hauptflag und weitere Flags
	VAR INT		weight,value					;			
															
	// Für Waffen								
	VAR INT		damageType						;		//	Welche Schadensarten
	VAR	INT		damageTotal						;
	VAR INT		damage			[DAM_INDEX_MAX]	;

	// Für Rüstungen
	VAR INT		wear							;
	VAR INT		protection		[PROT_INDEX_MAX];

	// Für Nahrung
	VAR INT		nutrition						;		//	HP-Steigerung bei Nahrung

	// Benötigte Attribute zum Benutzen des Items
	VAR INT		cond_atr		[3]				;
	VAR INT		cond_value		[3]				;

	// Attribute, die bei anlegen des Items verändert werden
	VAR INT		change_atr		[3]				;
	VAR INT		change_value	[3]				;

	// Parserfunktionen
	VAR FUNC	magic							;		//	Parserfunktion zum "Magie Header"
	VAR FUNC	on_equip						;		//	Parserfunktion, wenn Item equipped wird.
	VAR FUNC	on_unequip						;		//	Parserfunktion, wenn Item unequipped wird.
	VAR FUNC	on_state		[4]				;			
															
	// Besitzer									
	VAR FUNC	owner							;		//	Besitzer : Instanz-Name
	VAR INT		ownerGuild						;		//	Besitzer : Gilde
	VAR INT		disguiseGuild					;		//	Zur Schau getragene Gilde durch Verkleidung

	// Die 3DS-Datei
	VAR STRING	visual							;

	// Veränderung des NSC-Meshes beim Anlegen dieses Gegenstandes
	VAR STRING  visual_change					;		//	ASC - File
	VAR INT		visual_skin						;
	
	VAR STRING 	scemeName						;
	VAR INT		material						;	
	// VAR STRING	pfx								;		//	Magic Weapon PFX
	VAR INT		munition						;		//	Instance of Munition
															
	var int 	spell							;			
	var int		range							;			
	
	var int		mag_circle						;
	
	VAR STRING	description						;
	VAR STRING	text			[ITM_TEXT_MAX]	;
	VAR INT		count			[ITM_TEXT_MAX]	;
};															
															
CLASS C_Focus												
{															
	/// für NSCs											
	VAR FLOAT	npc_longrange					;		//	Zurufweite	( 20 m )
	VAR FLOAT	npc_range1, npc_range2			;		//	Reichweite 
	VAR FLOAT	npc_azi							;		//	Azimuth		( Seitenwinkel )
	VAR FLOAT	npc_elevdo, npc_elevup			;		//	Elevation	( Höhenwinkel  )
	VAR INT		npc_prio						;		//	Priorität
															
	/// für ITEMs											
	VAR FLOAT	item_range1, item_range2		;		//	Reichweite 
	VAR FLOAT	item_azi						;		//	Azimuth		( Seitenwinkel )
	VAR FLOAT	item_elevdo, item_elevup		;		//	Elevation	( Höhenwinkel  )
	VAR INT		item_prio						;		//	Priorität
															
	/// für MOBs											
	VAR FLOAT	mob_range1, mob_range2			;		//	Reichweite 
	VAR FLOAT	mob_azi							;		//	Azimuth		( Seitenwinkel )
	VAR FLOAT	mob_elevdo, mob_elevup			;		//	Elevation	( Höhenwinkel  )
	VAR INT		mob_prio						;		//	Priorität
};

CLASS C_INFO 
{
	VAR INT		npc								;
	VAR INT		nr								;
	VAR INT		important						;		//	Wichtig Flag -> ansprechen
	VAR FUNC	condition						;
	VAR FUNC	information						;  
	VAR STRING	description						;
	VAR INT		trade							;
	VAR INT		permanent						;
};

CLASS C_ITEMREACT
{
	VAR INT		npc;
	VAR INT		trade_item;
	VAR INT		trade_amount;
	VAR INT		requested_cat;
	VAR INT		requested_item;
	VAR INT		requested_amount;
	VAR FUNC	reaction;
};


// ************************************************************
// Globale Klasseninstanzen
// ************************************************************

// Aktueller Npc und der SC
INSTANCE self,other (C_NPC);

// Opfer bei "witness"-Aktionen
INSTANCE victim(C_NPC);

// aktuelles Item
INSTANCE item(C_Item);

// Und der Player immer als globale Instanz
INSTANCE hero(C_NPC);
