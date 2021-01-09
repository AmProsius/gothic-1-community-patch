////////////////
// SPECIES.D //
//////////////


// ACHTUNG! die Turn-Speed ist durch einen "hack" im kampfmodus auf die doppelte geschwindigkeit gesetzt.
//		    deshalb ist die Turn-Speed der Monster im Spiel doppelt so schnell wie hier angegeben, da sie immer im Kampfmode sind!


INSTANCE Gil_Values(C_GILVALUES)
{
// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// HUMAN
	SWIM_TIME		 		[GIL_HUMAN] = TIME_INFINITE;	// Verweildauer im Wasser ohne Schaden (in Sek.)
	DIVE_TIME		 		[GIL_HUMAN] = 30;				// Verweildauer im Dive ohne Schaden (in Sek.)
	WATER_DEPTH_KNEE 		[GIL_HUMAN] = 65;				// Wassertiefe ab der WWalk-Mode aktiv (in cm)
	WATER_DEPTH_CHEST		[GIL_HUMAN] = 140;				// Wassertiefe ab der Swim-Mode aktiv (in cm)

	STEP_HEIGHT		 		[GIL_HUMAN] = 60;				// Stufenhöhe für autom. Höhenüberwindung
	JUMPLOW_HEIGHT	 		[GIL_HUMAN] = 105;				// Höhe bis zu der JumpUpLow benutzt wird (in cm)
	JUMPMID_HEIGHT	 		[GIL_HUMAN] = 205;				// Höhe bis zu der JumpUpMid benutzt wird (in cm)
	JUMPUP_HEIGHT 			[GIL_HUMAN] = 200; 				// Sprunghöhe wenn höher als JumpUpMid (in cm) Ist effektiv höher, da von Boden bis Körpermitte gemessen!!!

	SLIDE_ANGLE		 		[GIL_HUMAN] = 45;				// Winkel ab der Model in Slide (in Grad)
	DISABLE_AUTOROLL		[GIL_HUMAN] = 0;
	SURFACE_ALIGN			[GIL_HUMAN] = 0;

// Turn-Speed für den Spieler ist PROGRAMMINTERN auf 100° im Normalmodus und 200° im Kampfmodus eingestellt!
// der Wert gilt nur für NSCs!
	TURN_SPEED				[GIL_HUMAN] = 270;
	
	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_HUMAN] = 45;
	CLIMB_HORIZ_ANGLE		[GIL_HUMAN] = 30;
	CLIMB_GROUND_ANGLE  	[GIL_HUMAN] = 30;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_HUMAN] = 500;				// Fallhöhe in cm ohne Schaden zu nehmen
	FALLDOWN_DAMAGE			[GIL_HUMAN] = 20;				// Schaden in HPs für jeden weiteren Meter

	// Kampf
	FIGHT_RANGE_BASE		[GIL_HUMAN]	= 60;				// Bip01 bis BBox
	FIGHT_RANGE_FIST		[GIL_HUMAN] = 50;				// BBox bis  "Attack-Limb"
	
	//FIGHT_RANGE_1HS			[GIL_HUMAN] = 160;			// Reichweite 1hS (Komplettrange, keine Kombination von Waffenlänge und Fist-Range!)
	//FIGHT_RANGE_1HA			[GIL_HUMAN] = 160;
	//FIGHT_RANGE_2HS			[GIL_HUMAN] = 200;
	//FIGHT_RANGE_2HA			[GIL_HUMAN] = 200;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// BLOODFLY

	SWIM_TIME				[GIL_BLOODFLY] = TIME_INFINITE;
	DIVE_TIME				[GIL_BLOODFLY] = 0;

// .Der Wert "999999" für fiegende Monster führt dazu, dass Wasserpolys wie statische Polys behandelt werden
//	auch auf diesen "laufen" und niemals ins Schwimmen/Tauchen kommen können.
	WATER_DEPTH_KNEE		[GIL_BLOODFLY] = 999999;
	WATER_DEPTH_CHEST		[GIL_BLOODFLY] = 999999;

	STEP_HEIGHT		 		[GIL_BLOODFLY] = 100;
	JUMPLOW_HEIGHT	 		[GIL_BLOODFLY] = 800;


	SLIDE_ANGLE				[GIL_BLOODFLY] = 75;
	DISABLE_AUTOROLL		[GIL_BLOODFLY] = 0;
	SURFACE_ALIGN			[GIL_BLOODFLY] = 0;
	TURN_SPEED				[GIL_BLOODFLY] = 130;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_BLOODFLY] = 9999;
	FALLDOWN_DAMAGE			[GIL_BLOODFLY] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_BLOODFLY] = 80;
	FIGHT_RANGE_FIST		[GIL_BLOODFLY] = 80;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// CRAWLER

	SWIM_TIME		 		[GIL_MINECRAWLER] = 0;
	DIVE_TIME		 		[GIL_MINECRAWLER] = 0;
	WATER_DEPTH_KNEE 		[GIL_MINECRAWLER] = 75;
	WATER_DEPTH_CHEST		[GIL_MINECRAWLER] = 100;

//	JUMPUP_HEIGHT 			[GIL_MINECRAWLER] = 200;

	SLIDE_ANGLE		 		[GIL_MINECRAWLER] = 60;
	DISABLE_AUTOROLL 		[GIL_MINECRAWLER] = 1;
	SURFACE_ALIGN	 		[GIL_MINECRAWLER] = 2;
	TURN_SPEED				[GIL_MINECRAWLER] = 100;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_MINECRAWLER] = 1000;
	FALLDOWN_DAMAGE			[GIL_MINECRAWLER] = 1;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_MINECRAWLER] = 100;
	FIGHT_RANGE_FIST		[GIL_MINECRAWLER] = 170;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// DEMON

	SWIM_TIME		 		[GIL_DEMON] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_DEMON] = 0;

// .Der Wert "999999" für fiegende Monster führt dazu, dass Wasserpolys wie statische Polys behandelt werden
//	auch auf diesen "laufen" und niemals ins Schwimmen/Tauchen kommen können.
	WATER_DEPTH_KNEE 		[GIL_DEMON] = 999999;
	WATER_DEPTH_CHEST		[GIL_DEMON] = 999999;

	STEP_HEIGHT		 		[GIL_DEMON] = 150;
	JUMPLOW_HEIGHT 			[GIL_DEMON] = 800;

	SLIDE_ANGLE		 		[GIL_DEMON] = 75;
	DISABLE_AUTOROLL 		[GIL_DEMON] = 0;
	SURFACE_ALIGN	 		[GIL_DEMON] = 0;
	TURN_SPEED				[GIL_DEMON] = 120;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_DEMON] = 9999;
	FALLDOWN_DAMAGE			[GIL_DEMON] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_DEMON] = 100;
	FIGHT_RANGE_FIST		[GIL_DEMON] = 140;

	//Blut
	BLOOD_EMITTER			[GIL_DEMON] = "BFX_Demon";
	BLOOD_TEXTURE			[GIL_DEMON] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_DEMON] = 1;
	BLOOD_AMOUNT			[GIL_DEMON] = 10;
	BLOOD_MAX_DISTANCE		[GIL_DEMON] = 200;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// GOBBO

	SWIM_TIME				[GIL_GOBBO] = TIME_INFINITE;
	DIVE_TIME				[GIL_GOBBO] = 30;
	WATER_DEPTH_KNEE 		[GIL_GOBBO] = 30;
	WATER_DEPTH_CHEST		[GIL_GOBBO] = 80;

	STEP_HEIGHT				[GIL_GOBBO] = 25;
	JUMPLOW_HEIGHT			[GIL_GOBBO] = 105;
	JUMPMID_HEIGHT			[GIL_GOBBO] = 155;
	JUMPUP_HEIGHT 			[GIL_GOBBO] = 200;

	SLIDE_ANGLE		 		[GIL_GOBBO] = 45;
	TURN_SPEED				[GIL_GOBBO] = 100;
	
	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_GOBBO] = 45;
	CLIMB_HORIZ_ANGLE		[GIL_GOBBO] = 30;
	CLIMB_GROUND_ANGLE  	[GIL_GOBBO] = 30;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_GOBBO] = 500;
	FALLDOWN_DAMAGE			[GIL_GOBBO] = 10;

	// Kampf
	FIGHT_RANGE_FIST		[GIL_GOBBO] = 50;
	FIGHT_RANGE_BASE		[GIL_GOBBO] = 40;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// GOLEM

	SWIM_TIME		 		[GIL_GOLEM] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_GOLEM] = 0;
	WATER_DEPTH_KNEE 		[GIL_GOLEM] = 50000;
	WATER_DEPTH_CHEST		[GIL_GOLEM] = 51000;

	SLIDE_ANGLE		 		[GIL_GOLEM] = 55;
	DISABLE_AUTOROLL 		[GIL_GOLEM] = 1;
	SURFACE_ALIGN	 		[GIL_GOLEM] = 0;
	TURN_SPEED				[GIL_GOLEM] = 80;


	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_GOLEM] = 9999;
	FALLDOWN_DAMAGE			[GIL_GOLEM] = 0;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_GOLEM] = 100;
	FIGHT_RANGE_FIST		[GIL_GOLEM] = 120;

	//Blut
	BLOOD_EMITTER			[GIL_GOLEM] = "BFX_Golem";
	BLOOD_TEXTURE			[GIL_GOLEM] = "BQM_Golem.tga";
	//BLOOD_FLOW				[GIL_GOLEM] = 1;
	BLOOD_AMOUNT			[GIL_GOLEM] = 5;
	BLOOD_MAX_DISTANCE		[GIL_GOLEM] = 60;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// LURKER

	SWIM_TIME				[GIL_LURKER] = TIME_INFINITE;
	DIVE_TIME				[GIL_LURKER] = TIME_INFINITE;
	WATER_DEPTH_KNEE 		[GIL_LURKER] = 50;
	WATER_DEPTH_CHEST		[GIL_LURKER] = 120;

	STEP_HEIGHT		 		[GIL_LURKER] = 55;
	JUMPLOW_HEIGHT	 		[GIL_LURKER] = 205;
	JUMPUP_HEIGHT 			[GIL_LURKER] = 300;

	SLIDE_ANGLE		 		[GIL_LURKER] = 45;
	DISABLE_AUTOROLL 		[GIL_LURKER] = 1;
	SURFACE_ALIGN	 		[GIL_LURKER] = 1;
	TURN_SPEED				[GIL_LURKER] = 200;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_LURKER] = 400;
	FALLDOWN_DAMAGE			[GIL_LURKER] = 20;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_LURKER] = 100;
	FIGHT_RANGE_FIST		[GIL_LURKER] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// MEATBUG

	SWIM_TIME		 		[GIL_MEATBUG] = 0;
	DIVE_TIME		 		[GIL_MEATBUG] = 0;
	WATER_DEPTH_KNEE 		[GIL_MEATBUG] = 5;
	WATER_DEPTH_CHEST		[GIL_MEATBUG] = 10;

	SLIDE_ANGLE		 		[GIL_MEATBUG] = 70;
	DISABLE_AUTOROLL 		[GIL_MEATBUG] = 1;
	SURFACE_ALIGN	 		[GIL_MEATBUG] = 2;
	TURN_SPEED				[GIL_MEATBUG] = 140;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_MEATBUG] = 800;
	FALLDOWN_DAMAGE			[GIL_MEATBUG] = 1;

	// Kampf
	FIGHT_RANGE_FIST		[GIL_MEATBUG] = 10;
	FIGHT_RANGE_BASE		[GIL_MEATBUG] = 15;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_MEATBUG] = "BFX_Preset2";
	BLOOD_TEXTURE			[GIL_MEATBUG] = "BQM_Meatbug.tga";
	BLOOD_FLOW				[GIL_MEATBUG] = 1;
	BLOOD_AMOUNT			[GIL_MEATBUG] = 2;
	BLOOD_MAX_DISTANCE		[GIL_MEATBUG] = 50;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// MOLERAT

	SWIM_TIME		 		[GIL_MOLERAT] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_MOLERAT] = 0;
	WATER_DEPTH_KNEE 		[GIL_MOLERAT] = 25;
	WATER_DEPTH_CHEST		[GIL_MOLERAT] = 50;

	JUMPLOW_HEIGHT 			[GIL_MOLERAT] = 105;
	JUMPMID_HEIGHT 			[GIL_MOLERAT] = 200;

	SLIDE_ANGLE		 		[GIL_MOLERAT] = 50;
	DISABLE_AUTOROLL 		[GIL_MOLERAT] = 1;
	SURFACE_ALIGN	 		[GIL_MOLERAT] = 1;
	TURN_SPEED				[GIL_MOLERAT] = 120;


	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_MOLERAT] = 400;
	FALLDOWN_DAMAGE			[GIL_MOLERAT] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_MOLERAT] = 130;
	FIGHT_RANGE_FIST		[GIL_MOLERAT] = 95;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_MOLERAT] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_MOLERAT] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_MOLERAT] = 1;
	BLOOD_AMOUNT			[GIL_MOLERAT] = 10;
	BLOOD_MAX_DISTANCE		[GIL_MOLERAT] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ORC_SHAMAN

	SWIM_TIME		 		[GIL_ORCSHAMAN] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_ORCSHAMAN] = 30;
	WATER_DEPTH_KNEE 		[GIL_ORCSHAMAN] = 120;
	WATER_DEPTH_CHEST		[GIL_ORCSHAMAN] = 170;

	STEP_HEIGHT		 		[GIL_ORCSHAMAN] = 65;
	JUMPLOW_HEIGHT	 		[GIL_ORCSHAMAN] = 105;
	JUMPMID_HEIGHT	 		[GIL_ORCSHAMAN] = 205;
	JUMPUP_HEIGHT 			[GIL_ORCSHAMAN] = 300;

	SLIDE_ANGLE		 		[GIL_ORCSHAMAN] = 45;
	TURN_SPEED				[GIL_ORCSHAMAN] = 200;

	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_ORCSHAMAN] = 45;
	CLIMB_HORIZ_ANGLE		[GIL_ORCSHAMAN] = 30;
	CLIMB_GROUND_ANGLE  	[GIL_ORCSHAMAN] = 30;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_ORCSHAMAN] = 600;
	FALLDOWN_DAMAGE			[GIL_ORCSHAMAN] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_ORCSHAMAN] = 50;
	FIGHT_RANGE_FIST		[GIL_ORCSHAMAN] = 90;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ORC_WARRIOR

	SWIM_TIME		 		[GIL_ORCWARRIOR] = TIME_INFINITE; 
	DIVE_TIME		 		[GIL_ORCWARRIOR] = 30;            
	WATER_DEPTH_KNEE 		[GIL_ORCWARRIOR] = 120;           
	WATER_DEPTH_CHEST		[GIL_ORCWARRIOR] = 170;           
                                                              
	STEP_HEIGHT		 		[GIL_ORCWARRIOR] = 65;            
	JUMPLOW_HEIGHT	 		[GIL_ORCWARRIOR] = 105;           
	JUMPMID_HEIGHT	 		[GIL_ORCWARRIOR] = 205;           
	JUMPUP_HEIGHT 			[GIL_ORCWARRIOR] = 300;           
                                                              
	SLIDE_ANGLE		 		[GIL_ORCWARRIOR] = 45;            
	TURN_SPEED				[GIL_ORCWARRIOR] = 200;           
                                                              
	// Kletterkanten - Winkel                                 
	CLIMB_HEADING_ANGLE		[GIL_ORCWARRIOR] = 45;            
	CLIMB_HORIZ_ANGLE		[GIL_ORCWARRIOR] = 30;            
	CLIMB_GROUND_ANGLE  	[GIL_ORCWARRIOR] = 30;            
                                                              
	// Fallhöhe / Fallschaden                                 
	FALLDOWN_HEIGHT			[GIL_ORCWARRIOR] = 600;           
	FALLDOWN_DAMAGE			[GIL_ORCWARRIOR] = 10;            
                                                              
	// Kampf                                                  
	FIGHT_RANGE_BASE		[GIL_ORCWARRIOR] = 50;            
	FIGHT_RANGE_FIST		[GIL_ORCWARRIOR] = 90;            

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ORC_SCOUT

	SWIM_TIME		 		[GIL_ORCSCOUT] = TIME_INFINITE; 
	DIVE_TIME		 		[GIL_ORCSCOUT] = 30;            
	WATER_DEPTH_KNEE 		[GIL_ORCSCOUT] = 120;           
	WATER_DEPTH_CHEST		[GIL_ORCSCOUT] = 170;           
                                                            
	STEP_HEIGHT		 		[GIL_ORCSCOUT] = 65;            
	JUMPLOW_HEIGHT	 		[GIL_ORCSCOUT] = 105;           
	JUMPMID_HEIGHT	 		[GIL_ORCSCOUT] = 205;           
	JUMPUP_HEIGHT 			[GIL_ORCSCOUT] = 300;           
                                                            
	SLIDE_ANGLE		 		[GIL_ORCSCOUT] = 45;            
	TURN_SPEED				[GIL_ORCSCOUT] = 200;           
                                                            
	// Kletterkanten - Winkel                               
	CLIMB_HEADING_ANGLE		[GIL_ORCSCOUT] = 45;            
	CLIMB_HORIZ_ANGLE		[GIL_ORCSCOUT] = 30;            
	CLIMB_GROUND_ANGLE  	[GIL_ORCSCOUT] = 30;            
                                                            
	// Fallhöhe / Fallschaden                               
	FALLDOWN_HEIGHT			[GIL_ORCSCOUT] = 600;           
	FALLDOWN_DAMAGE			[GIL_ORCSCOUT] = 10;            
                                                            
	// Kampf                                                
	FIGHT_RANGE_BASE		[GIL_ORCSCOUT] = 50;            
	FIGHT_RANGE_FIST		[GIL_ORCSCOUT] = 90;            

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ORC_SLAVE

	SWIM_TIME		 		[GIL_ORCSLAVE] = TIME_INFINITE; 
	DIVE_TIME		 		[GIL_ORCSLAVE] = 30;            
	WATER_DEPTH_KNEE 		[GIL_ORCSLAVE] = 120;           
	WATER_DEPTH_CHEST		[GIL_ORCSLAVE] = 170;           
                                                            
	STEP_HEIGHT		 		[GIL_ORCSLAVE] = 65;            
	JUMPLOW_HEIGHT	 		[GIL_ORCSLAVE] = 105;           
	JUMPMID_HEIGHT	 		[GIL_ORCSLAVE] = 205;           
	JUMPUP_HEIGHT 			[GIL_ORCSLAVE] = 300;           
                                                            
	SLIDE_ANGLE		 		[GIL_ORCSLAVE] = 45;            
	TURN_SPEED				[GIL_ORCSLAVE] = 200;           
                                                            
	// Kletterkanten - Winkel                               
	CLIMB_HEADING_ANGLE		[GIL_ORCSLAVE] = 45;            
	CLIMB_HORIZ_ANGLE		[GIL_ORCSLAVE] = 30;            
	CLIMB_GROUND_ANGLE  	[GIL_ORCSLAVE] = 30;            
                                                            
	// Fallhöhe / Fallschaden                               
	FALLDOWN_HEIGHT			[GIL_ORCSLAVE] = 600;           
	FALLDOWN_DAMAGE			[GIL_ORCSLAVE] = 10;            
                                                            
	// Kampf                                                
	FIGHT_RANGE_BASE		[GIL_ORCSLAVE] = 50;            
	FIGHT_RANGE_FIST		[GIL_ORCSLAVE] = 90;            

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// UNDEAD ORC

	SWIM_TIME		 		[GIL_UNDEADORC] = 0;
	DIVE_TIME		 		[GIL_UNDEADORC] = 0;
	WATER_DEPTH_KNEE 		[GIL_UNDEADORC] = 120;
	WATER_DEPTH_CHEST		[GIL_UNDEADORC] = 170;

	STEP_HEIGHT		 		[GIL_UNDEADORC] = 65;
	JUMPLOW_HEIGHT	 		[GIL_UNDEADORC] = 105;
	JUMPMID_HEIGHT	 		[GIL_UNDEADORC] = 205;
	JUMPUP_HEIGHT 			[GIL_UNDEADORC] = 300;

	SLIDE_ANGLE		 		[GIL_UNDEADORC] = 45;
	TURN_SPEED				[GIL_UNDEADORC] = 200;
	
	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_UNDEADORC] = 45;
	CLIMB_HORIZ_ANGLE		[GIL_UNDEADORC] = 30;
	CLIMB_GROUND_ANGLE  	[GIL_UNDEADORC] = 30;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_UNDEADORC] = 9999;
	FALLDOWN_DAMAGE			[GIL_UNDEADORC] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_UNDEADORC] = 50;
	FIGHT_RANGE_FIST		[GIL_UNDEADORC] = 90;

	//Blut
	BLOOD_DISABLED			[GIL_UNDEADORC] = 1;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ORCDOG (WOLF-VARIANTE)

	SWIM_TIME		 		[GIL_ORCDOG] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_ORCDOG] = 0;
	WATER_DEPTH_KNEE 		[GIL_ORCDOG] = 40;
	WATER_DEPTH_CHEST		[GIL_ORCDOG] = 70;

	STEP_HEIGHT		 		[GIL_ORCDOG] = 50;
	JUMPLOW_HEIGHT	 		[GIL_ORCDOG] = 100;
	JUMPMID_HEIGHT	 		[GIL_ORCDOG] = 200;

	SLIDE_ANGLE		 		[GIL_ORCDOG] = 45;
	DISABLE_AUTOROLL 		[GIL_ORCDOG] = 1;
	SURFACE_ALIGN	 		[GIL_ORCDOG] = 1;
	TURN_SPEED				[GIL_ORCDOG] = 150;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_ORCDOG] = 500;
	FALLDOWN_DAMAGE			[GIL_ORCDOG] = 10;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_ORCDOG] = 100;
	FIGHT_RANGE_FIST		[GIL_ORCDOG] = 100;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_ORCDOG] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_ORCDOG] = "BQM_Scavenger2.tga";
	BLOOD_FLOW				[GIL_ORCDOG] = 1;
	BLOOD_AMOUNT			[GIL_ORCDOG] = 5;
	BLOOD_MAX_DISTANCE		[GIL_ORCDOG] = 80;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SCAVENGER

	SWIM_TIME		 		[GIL_SCAVENGER] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_SCAVENGER] = 0;
	WATER_DEPTH_KNEE 		[GIL_SCAVENGER] = 50;
	WATER_DEPTH_CHEST		[GIL_SCAVENGER] = 120;

	STEP_HEIGHT		 		[GIL_SCAVENGER] = 50;
	JUMPLOW_HEIGHT	 		[GIL_SCAVENGER] = 200;

	SLIDE_ANGLE		 		[GIL_SCAVENGER] = 45;
	DISABLE_AUTOROLL 		[GIL_SCAVENGER] = 0;
	SURFACE_ALIGN	 		[GIL_SCAVENGER] = 0;
	TURN_SPEED				[GIL_SCAVENGER] = 130; 

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SCAVENGER] = 400;
	FALLDOWN_DAMAGE			[GIL_SCAVENGER] = 10;

	// Kampf
	
	FIGHT_RANGE_BASE		[GIL_SCAVENGER] = 100;
	FIGHT_RANGE_FIST		[GIL_SCAVENGER] = 100;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_SCAVENGER] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_SCAVENGER] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_SCAVENGER] = 1;
	BLOOD_AMOUNT			[GIL_SCAVENGER] = 10;
	BLOOD_MAX_DISTANCE		[GIL_SCAVENGER] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SHADOW

	SWIM_TIME		 		[GIL_SHADOWBEAST] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_SHADOWBEAST] = 0;
	WATER_DEPTH_KNEE 		[GIL_SHADOWBEAST] = 50;
	WATER_DEPTH_CHEST		[GIL_SHADOWBEAST] = 120;

	STEP_HEIGHT		 		[GIL_SHADOWBEAST] = 60;
	JUMPLOW_HEIGHT	 		[GIL_SHADOWBEAST] = 150;
	JUMPMID_HEIGHT 			[GIL_SHADOWBEAST] = 300;

	SLIDE_ANGLE		 		[GIL_SHADOWBEAST] = 45;
	DISABLE_AUTOROLL 		[GIL_SHADOWBEAST] = 1;
	SURFACE_ALIGN	 		[GIL_SHADOWBEAST] = 2;
	TURN_SPEED				[GIL_SHADOWBEAST] = 150;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SHADOWBEAST] = 600;
	FALLDOWN_DAMAGE			[GIL_SHADOWBEAST] = 10;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_SHADOWBEAST] = 150;
	FIGHT_RANGE_FIST		[GIL_SHADOWBEAST] = 200;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SLEEPER

	// Kampf

	TURN_SPEED				[GIL_SLF] = 80;
	
	FIGHT_RANGE_BASE		[GIL_SLF] = 100;
	FIGHT_RANGE_FIST		[GIL_SLF] = 140;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SKELETON

	SWIM_TIME				[GIL_SKELETON] = 0;
	DIVE_TIME		 		[GIL_SKELETON] = 0;
	WATER_DEPTH_KNEE 		[GIL_SKELETON] = 80;
	WATER_DEPTH_CHEST		[GIL_SKELETON] = 150;

	STEP_HEIGHT		 		[GIL_SKELETON] = 60;
	JUMPLOW_HEIGHT	 		[GIL_SKELETON] = 105;
	JUMPMID_HEIGHT	 		[GIL_SKELETON] = 205;
	JUMPUP_HEIGHT 			[GIL_SKELETON] = 300;

	SLIDE_ANGLE		 		[GIL_SKELETON] = 45;
	TURN_SPEED				[GIL_SKELETON] = 180;
	
	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_SKELETON] = 45;
	CLIMB_HORIZ_ANGLE		[GIL_SKELETON] = 30;
	CLIMB_GROUND_ANGLE  	[GIL_SKELETON] = 30;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SKELETON] = 400;
	FALLDOWN_DAMAGE			[GIL_SKELETON] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_SKELETON] = 60;
	FIGHT_RANGE_FIST		[GIL_SKELETON] = 50;

	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_SKELETON] = "BFX_Skeleton";

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SNAPPER

	SWIM_TIME				[GIL_SNAPPER] = TIME_INFINITE;
	DIVE_TIME				[GIL_SNAPPER] = TIME_INFINITE;
	WATER_DEPTH_KNEE 		[GIL_SNAPPER] = 50;
	WATER_DEPTH_CHEST		[GIL_SNAPPER] = 120;

	STEP_HEIGHT		 		[GIL_SNAPPER] = 60;
	JUMPLOW_HEIGHT	 		[GIL_SNAPPER] = 300;
//	JUMPMID_HEIGHT 			[GIL_SNAPPER] = 200;
//	JUMPUP_HEIGHT 			[GIL_SNAPPER] = 200;

	SLIDE_ANGLE		 		[GIL_SNAPPER] = 50;
	DISABLE_AUTOROLL 		[GIL_SNAPPER] = 1;
	SURFACE_ALIGN	 		[GIL_SNAPPER] = 1;
	TURN_SPEED				[GIL_SNAPPER] = 130;
	
	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SNAPPER] = 400;
	FALLDOWN_DAMAGE			[GIL_SNAPPER] = 10;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_SNAPPER] = 100;
	FIGHT_RANGE_FIST		[GIL_SNAPPER] = 150;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_SNAPPER] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_SNAPPER] = "BQM_Scavenger2.tga";
	//BLOOD_FLOW				[GIL_SNAPPER] = 1;
	BLOOD_AMOUNT			[GIL_SNAPPER] = 10;
	BLOOD_MAX_DISTANCE		[GIL_SNAPPER] = 100;
	

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// SWAMPSHARK

	SWIM_TIME				[GIL_SWAMPSHARK]	= TIME_INFINITE;
	DIVE_TIME				[GIL_SWAMPSHARK] 	= TIME_INFINITE;
	WATER_DEPTH_KNEE		[GIL_SWAMPSHARK] 	= 100000;
	WATER_DEPTH_CHEST		[GIL_SWAMPSHARK] 	= 100005;

	STEP_HEIGHT		 		[GIL_SWAMPSHARK] 	= 100;
	SLIDE_ANGLE				[GIL_SWAMPSHARK] 	= 60;

	DISABLE_AUTOROLL		[GIL_SWAMPSHARK]	= 1;

// Alex: Finger weg von Einstellungen, bei denen man nicht weiß was sie tun!!!!
// SURFACE_ALIGN 2 ist WICHTIG damit der Swampshark nich an jeder Kante hängenbleibt!
	SURFACE_ALIGN			[GIL_SWAMPSHARK]	= 2;
	TURN_SPEED				[GIL_SWAMPSHARK] 	= 80;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_SWAMPSHARK] = 500;
	FALLDOWN_DAMAGE			[GIL_SWAMPSHARK] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_SWAMPSHARK] = 200;
	FIGHT_RANGE_FIST		[GIL_SWAMPSHARK] = 200;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// TROLL

	SWIM_TIME				[GIL_TROLL] = 0;
	DIVE_TIME		 		[GIL_TROLL] = 0;
	WATER_DEPTH_KNEE 		[GIL_TROLL] = 100;
	WATER_DEPTH_CHEST		[GIL_TROLL] = 300;

	STEP_HEIGHT		 		[GIL_TROLL] = 100;
	SLIDE_ANGLE		 		[GIL_TROLL] = 45;

	DISABLE_AUTOROLL 		[GIL_TROLL] = 1;
	TURN_SPEED				[GIL_TROLL] = 60;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_TROLL] = 800;
	FALLDOWN_DAMAGE			[GIL_TROLL] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_TROLL] = 200;
	FIGHT_RANGE_FIST		[GIL_TROLL] = 220;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// WARAN

	SWIM_TIME		 		[GIL_WARAN] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_WARAN] = 0;
	WATER_DEPTH_KNEE 		[GIL_WARAN] = 50;
	WATER_DEPTH_CHEST		[GIL_WARAN] = 120;

	STEP_HEIGHT		 		[GIL_WARAN] = 60;
	JUMPLOW_HEIGHT	 		[GIL_WARAN] = 100;
	JUMPMID_HEIGHT 			[GIL_WARAN] = 200;
//	JUMPUP_HEIGHT 			[GIL_WARAN] = 200;

	SLIDE_ANGLE		 		[GIL_WARAN] = 45;
	DISABLE_AUTOROLL 		[GIL_WARAN] = 1;
	SURFACE_ALIGN	 		[GIL_WARAN] = 1;
	TURN_SPEED				[GIL_WARAN] = 200;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_WARAN] = 500;
	FALLDOWN_DAMAGE			[GIL_WARAN] = 10;

	// Kampf

	FIGHT_RANGE_BASE		[GIL_WARAN] = 195;
	FIGHT_RANGE_FIST		[GIL_WARAN] = 65;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_WARAN] = "BFX_Preset2";
	BLOOD_TEXTURE			[GIL_WARAN] = "BQM_Meatbug.tga";
	//BLOOD_FLOW				[GIL_WARAN] = 1;
	BLOOD_AMOUNT			[GIL_WARAN] = 10;
	BLOOD_MAX_DISTANCE		[GIL_WARAN] = 100;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// WOLF

	SWIM_TIME		 		[GIL_WOLF] = TIME_INFINITE;
	DIVE_TIME		 		[GIL_WOLF] = 0;
	WATER_DEPTH_KNEE 		[GIL_WOLF] = 40;
	WATER_DEPTH_CHEST		[GIL_WOLF] = 70;

	STEP_HEIGHT		 		[GIL_WOLF] = 60;
	JUMPLOW_HEIGHT	 		[GIL_WOLF] = 100;
	JUMPMID_HEIGHT	 		[GIL_WOLF] = 200;

	SLIDE_ANGLE		 		[GIL_WOLF] = 45;
	DISABLE_AUTOROLL 		[GIL_WOLF] = 1;
	SURFACE_ALIGN	 		[GIL_WOLF] = 1;
	TURN_SPEED				[GIL_WOLF] = 130;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_WOLF] = 500;
	FALLDOWN_DAMAGE			[GIL_WOLF] = 10;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_WOLF] = 100;
	FIGHT_RANGE_FIST		[GIL_WOLF] = 100;
	
	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_WOLF] = "BFX_Preset1";
	BLOOD_TEXTURE			[GIL_WOLF] = "BQM_Scavenger2.tga";
	BLOOD_FLOW				[GIL_WOLF] = 1;
	BLOOD_AMOUNT			[GIL_WOLF] = 5;
	BLOOD_MAX_DISTANCE		[GIL_WOLF] = 80;

// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ZOMBIE

	SWIM_TIME		 		[GIL_ZOMBIE] = 0;
	DIVE_TIME		 		[GIL_ZOMBIE] = 0;
	WATER_DEPTH_KNEE 		[GIL_ZOMBIE] = 90;
	WATER_DEPTH_CHEST		[GIL_ZOMBIE] = 150;

	STEP_HEIGHT		 		[GIL_ZOMBIE] = 60;
	JUMPLOW_HEIGHT	 		[GIL_ZOMBIE] = 200;

	SLIDE_ANGLE		 		[GIL_ZOMBIE] = 45;
	TURN_SPEED				[GIL_ZOMBIE] = 90;

	// Kletterkanten - Winkel
	CLIMB_HEADING_ANGLE		[GIL_ZOMBIE] = 45;
	CLIMB_HORIZ_ANGLE		[GIL_ZOMBIE] = 30;
	CLIMB_GROUND_ANGLE  	[GIL_ZOMBIE] = 30;

	// Fallhöhe / Fallschaden
	FALLDOWN_HEIGHT			[GIL_ZOMBIE] = 9999;
	FALLDOWN_DAMAGE			[GIL_ZOMBIE] = 0;

	// Kampf
	FIGHT_RANGE_BASE		[GIL_ZOMBIE] = 60;
	FIGHT_RANGE_FIST		[GIL_ZOMBIE] = 50;

	// Bluteffekte by KaiRo
	BLOOD_EMITTER			[GIL_ZOMBIE] = "BFX_Zombie";
	BLOOD_TEXTURE			[GIL_ZOMBIE] = "BQM_Zombie.tga";
	BLOOD_FLOW				[GIL_ZOMBIE] = 0;
	BLOOD_AMOUNT			[GIL_ZOMBIE] = 10;
	BLOOD_MAX_DISTANCE		[GIL_ZOMBIE] = 100;
};

