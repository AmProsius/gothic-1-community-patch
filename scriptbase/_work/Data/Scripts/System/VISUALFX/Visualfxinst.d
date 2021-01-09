// *****************************
// 			S L E E P E R
// *****************************

INSTANCE spellFX_SLEEPER_Fireball(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Fireball_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 JAWS";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Fireball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Fireball_SENDPERCEPTION";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
		emFXCreatedOwnTrj 		= 0; 
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		lightPresetname   		= "FIRESMALL";	
		
		};
		
		INSTANCE spellFX_SLEEPER_fireball_KEY_OPEN (C_ParticleFXEmitKey)
		{
				lightrange		= 0.01;
		};
		

		INSTANCE spellFX_SLEEPER_fireball_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Fireball_INIT";
				lightrange		= 0.01;
		};
		
		INSTANCE spellFX_SLEEPER_fireball_KEY_INVEST_1 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST";
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST1";
				lightrange		= 150;
				sfxid			= "MFX_Fireball_invest1";
				sfxisambient	= 1;
		}								;
		INSTANCE spellFX_SLEEPER_fireball_KEY_INVEST_2 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST_L2";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST2";
				sfxid			= "MFX_Fireball_invest2";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_SLEEPER_fireball_KEY_INVEST_3 (C_ParticleFXEmitKey)
		{
				visname_S 	= "MFX_Fireball_INVEST_L3";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST3";
				sfxid			= "MFX_Fireball_invest3";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_SLEEPER_fireball_KEY_INVEST_4 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST_L4";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST4";
				sfxid			= "MFX_Fireball_invest4";
				sfxisambient	= 1;
		};		
		INSTANCE spellFX_SLEEPER_FireBall_KEY_CAST (C_ParticleFXEmitKey)
		{
				lightrange				= 200;
				visname_S 				= "MFX_Fireball_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_Fireball_Cast";
	 			sfxisambient			= 1;
	 			emCheckCollision 		= 1;
		};
		INSTANCE spellFX_SLEEPER_FireBall_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
};


	
//////////////////////////////////////
//	
// 	Visual Effects
//	Instance-Definitions 
//	
//////////////////////////////////////

// visual effects config instance
// WICHTIG: 
// die Parameter der Keys verändern die effekte/visuals nur wenn ein Wert ungleich NULL angegeben wird,
// ausser bei INTEGER Variablen. Das heisst wenn ein KEY benutzt wird und ein Parameter den FX/das Visual ändern
// soll, so muss dieser bei Floats leicht von 0 verschieden sein (z.B. 0.000001).
//
// Parameter der Keys wirken sich immer nur auf den ersten definierten PFX aus, bei Multi-PFX's nicht auf die Childs


///   													XXXXXXXXXXXXXXXXX
///   													XX  L I G H T  XX
///   													XXXXXXXXXXXXXXXXX

// [EDENFELD] Die spellFX_Light_ACTIVE Instanz muss als Child mit eigener Trajectory an die Haupt spellFX_Light Instanz 
// gehängt werden, und darf erst beim Casten ein Visual bekommen.
// nur so kann getestet werden, ob ein etwaiges gecastetes Licht noch aktiv ist. Vorher wurde die spellFX_Light_ACTIVE
// Instanz über die emCreateFXID Variable getriggert. Die so erzeugten Effekte haben dann aber keinen Bezug mehr zum Licht Spell.

INSTANCE spellFX_Light(CFx_Base_Proto)
{
		visname_S 			= "MFX_Light_INIT";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		
		emFXCreate_S 		= "spellFX_Light_ACTIVE";
		emFXCreatedOwnTrj 	= 1;
		
		};

		INSTANCE spellFX_Light_KEY_CAST (C_ParticleFXEmitKey)
		{
				pfx_ppsIsLoopingChg = 1;

};


INSTANCE spellFX_Light_ACTIVE	(CFx_Base_Proto)
{
		visname_S 			= "";
		visAlpha			= 1;
		emtrjmode_s 		= "FOLLOW TARGET";
     	emtrjeasevel 		= 0.;
     	emTrjOriginNode 	= "BIP01 Head";
		emtrjloopmode_s 	= "HALT";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.4;
		emTrjTargetRange	= 1.2;
		emTrjTargetElev 	= 89;
		lightPresetname 	= "JUSTWHITE";

		};
		
		INSTANCE spellFX_Light_ACTIVE_KEY_OPEN (C_ParticleFXEmitKey)
		{
			lightRange 		= 0.01;
		};
		
		INSTANCE spellFX_Light_ACTIVE_KEY_INIT(C_ParticleFXEmitKey)
		{
			lightRange 		= 0.01;
		};
		
		INSTANCE spellFX_Light_ACTIVE_KEY_CAST 	(C_ParticleFXEmitKey)
		{
				visName_S		= "MFX_Light_ORIGIN";
				lightRange		= 1000;
				sfxid			= "MFX_Light_CAST";
				sfxisambient	= 1;
				emtrjeasevel 	= 1400.;
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B O L T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Firebolt	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firebolt_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	
     	emActionCollStat_S		= "COLLIDE CREATE CREATEQUAD";
     	emActionCollDyn_S		= "COLLIDE CREATEONCE";
     	emFXCollStat_S	   		= "spellFX_Firebolt_COLLIDEFX";
     	emFXCollDyn_S	   		= "spellFX_Firebolt_SENDPERCEPTION";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
				
		lightPresetname   		= "FIRESMALL";
		
		// quadmark
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "40 40";
		userString[2]			= "MUL";
				
		
		};

		INSTANCE spellFX_Firebolt_KEY_OPEN	(C_ParticleFXEmitKey)
		{
				lightrange = 0.001;
		};
		
		INSTANCE spellFX_Firebolt_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Firebolt_INIT";
				lightrange = 0.001;
		};
		
		INSTANCE spellFX_Firebolt_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "mfx_firebolt_cast";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "Torch_Enlight";
	 			lightrange 				= 200;
	 			emCheckCollision 		= 1;
		};

		INSTANCE spellFX_Firebolt_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	visname_S 				= "";		
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
	 			sfxid		  			= "TORCH_ENLIGHT";
};

instance spellFX_Firebolt_COLLIDEFX		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Firebolt_Collide";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";
};

instance spellFX_Firebolt_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Firebolt_Collide";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";
		sendassessmagic		= 1;
};


///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Fireball(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Fireball_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Fireball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Fireball_SENDPERCEPTION";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
		emFXCreatedOwnTrj 		= 0; 
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		lightPresetname   		= "FIRESMALL";	
		
		};
		
		INSTANCE spellFX_fireball_KEY_OPEN (C_ParticleFXEmitKey)
		{
				lightrange		= 0.01;
		};
		

		INSTANCE spellFX_fireball_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Fireball_INIT";
				lightrange		= 0.01;
		};
		
		INSTANCE spellFX_fireball_KEY_INVEST_1 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST";
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST1";
				lightrange		= 150;
				sfxid			= "MFX_Fireball_invest1";
				sfxisambient	= 1;
		}								;
		INSTANCE spellFX_fireball_KEY_INVEST_2 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST_L2";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST2";
				sfxid			= "MFX_Fireball_invest2";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_fireball_KEY_INVEST_3 (C_ParticleFXEmitKey)
		{
				visname_S 	= "MFX_Fireball_INVEST_L3";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST3";
				sfxid			= "MFX_Fireball_invest3";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_fireball_KEY_INVEST_4 (C_ParticleFXEmitKey)
		{	
				visname_S 	= "MFX_Fireball_INVEST_L4";	
				emCreateFXID	= "spellFX_Fireball_InVEST_BLAST4";
				sfxid			= "MFX_Fireball_invest4";
				sfxisambient	= 1;
		};		
		INSTANCE spellFX_FireBall_KEY_CAST (C_ParticleFXEmitKey)
		{
				lightrange				= 200;
				visname_S 				= "MFX_Fireball_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_Fireball_Cast";
	 			sfxisambient			= 1;
	 			emCheckCollision 		= 1;
		};
		INSTANCE spellFX_FireBall_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
};

instance spellFX_Fireball_InVEST_BLAST1		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Fireball_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest1";
		sfxisambient	= 1;
		visAlpha 		= 0.3;
};

instance spellFX_Fireball_InVEST_BLAST2	(CFx_Base_Proto)
{
		visname_S 		= "MFX_Fireball_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest2";
		sfxisambient	= 1;
		visAlpha 		= 0.5;
};

instance spellFX_Fireball_InVEST_BLAST3		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Fireball_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest3";
		sfxisambient	= 1;
		visAlpha 		= 0.8;
};

instance spellFX_Fireball_InVEST_BLAST4		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Fireball_INVEST_BLAST";
		visAlpha		= 1;
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest4";
		sfxisambient	= 1;
		visAlpha 		= 1;
};

// KOLLISION MIT STATISCHER WELT:  KEINE PERCEPTION

instance spellFX_Fireball_COLLIDE		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Fireball_Collide1";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode		= "BIP01";
		lightPresetname   	= "FIRESMALL";	
};
		
INSTANCE spellFX_Fireball_COLLIDE_KEY_INVEST_1	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide1";		sfxid	= "MFX_Fireball_Collide1";		};
INSTANCE spellFX_Fireball_COLLIDE_KEY_INVEST_2	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide2";		sfxid	= "MFX_Fireball_Collide2";		};
INSTANCE spellFX_Fireball_COLLIDE_KEY_INVEST_3	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide3";		sfxid	= "MFX_Fireball_Collide3";		};
INSTANCE spellFX_Fireball_COLLIDE_KEY_INVEST_4	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide4";		sfxid	= "MFX_Fireball_Collide4";		};

// KOLLISION MIT DYNAMISCHER WELT:  WOHL PERCEPTION

instance spellFX_Fireball_SENDPERCEPTION	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Fireball_Collide1";
		visAlpha			= 1;
		emTrjOriginNode		= "BIP01";
		emtrjmode_s 		= "FIXED";
		lightPresetname   	= "FIRESMALL";	
		sendAssessMagic		= 1;
};

INSTANCE spellFX_Fireball_SENDPERCEPTION_KEY_INVEST_1	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide1";		sfxid	= "MFX_Fireball_Collide1";		};
INSTANCE spellFX_Fireball_SENDPERCEPTION_KEY_INVEST_2	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide2";		sfxid	= "MFX_Fireball_Collide2";		};
INSTANCE spellFX_Fireball_SENDPERCEPTION_KEY_INVEST_3	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide3";		sfxid	= "MFX_Fireball_Collide3";		};
INSTANCE spellFX_Fireball_SENDPERCEPTION_KEY_INVEST_4	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Fireball_Collide4";		sfxid	= "MFX_Fireball_Collide4";		};



///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E S T O R M  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Firestorm	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firestorm_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Firestorm_SPREAD";
		emFXCollDyn_S     		= "spellFX_Firestorm_SPREAD";		
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emFXInvestORIGIN_S 		= "spellFX_Firestorm_INVESTSOUND";
		
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		
		lightPresetname   		= "FIRESMALL";
		};

		INSTANCE spellFX_Firestorm_KEY_OPEN(C_ParticleFXEmitKey)
		{
				lightrange			= 0.01;
		};

		INSTANCE spellFX_Firestorm_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Firestorm_INIT";
				lightrange			= 0.01;
		};
		
		INSTANCE spellFX_Firestorm_KEY_INVEST_1	(C_ParticleFXEmitKey)	{	lightrange	= 100;	emCreateFXID	= "spellFX_Firestorm_INVESTBLAST1";	};
		INSTANCE spellFX_Firestorm_KEY_INVEST_2	(C_ParticleFXEmitKey)	{	lightrange	= 200;	emCreateFXID	= "spellFX_Firestorm_INVESTBLAST2";	};
		INSTANCE spellFX_Firestorm_KEY_INVEST_3	(C_ParticleFXEmitKey)	{	lightrange	= 300;	emCreateFXID	= "spellFX_Firestorm_INVESTBLAST3";	};
		INSTANCE spellFX_Firestorm_KEY_INVEST_4	(C_ParticleFXEmitKey)	{	lightrange	= 400;	emCreateFXID	= "spellFX_Firestorm_INVESTBLAST4";	};
		
		INSTANCE spellFX_Firestorm_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_Firestorm_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_Firestorm_Cast";
	 			sfxisambient			= 1;
				emCheckCollision 		= 1;	 			
				lightrange				= 200;
		};

		INSTANCE spellFX_Firestorm_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
};


INSTANCE spellFX_FireStorm_INVESTSOUND	(CFX_Base_Proto)
{
		visname_s		= "simpleglow.tga";
		visalpha		= 0.01;
		sfxid			= "MFX_Firestorm_Invest";
		sfxisambient	= 1;		
};


INSTANCE spellFX_FireStorm_INVESTBLAST1	(CFX_Base_Proto)
{
		visname_S 		= "MFX_Firestorm_INVESTBLAST1";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest1";
		sfxisambient	= 1;
};

INSTANCE spellFX_FireStorm_INVESTBLAST2	(CFX_Base_Proto)
{
		visname_S 		= "MFX_Firestorm_INVESTBLAST2";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest2";
		sfxisambient	= 1;
};

INSTANCE spellFX_FireStorm_INVESTBLAST3	(CFX_Base_Proto)
{
		visname_S 		= "MFX_Firestorm_INVESTBLAST3";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest3";
		sfxisambient	= 1;
};

INSTANCE spellFX_FireStorm_INVESTBLAST4	(CFX_Base_Proto)
{
		visname_S 		= "MFX_Firestorm_INVESTBLAST4";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Fireball_invest4";
		sfxisambient	= 1;
};


INSTANCE spellFX_Firestorm_SPREAD	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firestorm_SPREAD";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "CREATE CREATEQUAD";
     	emActionCollDyn_S 		= "CREATEONCE";
		//emFXCollStat_S	   		= "spellFX_Firestorm_COLLIDE";		// [Edenfeld] Wenn einkommentiert, erzeugt sehr viele VFX -> nicht sichtbar/Performance Probs.
		//emFXCollDyn_S     		= "spellFX_Firespell_HUMANBURN";	// [Edenfeld] NSC Feuerschaden wird in der spell_params.d festgelegt, hier unnötig, (ausser für Item Collisionen und _ZUSÄTZLICHEN_ Effekten unabhängig vom Feuerschaden - ja ehrlich es ist wahr!)
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		emCheckCollision		= 1;
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "40 40";
		userString[2]			= "MUL";
		lightPresetname   		= "FIRESMALL";	
		
		emFXCreate_S			= "spellFX_Firestorm_COLLIDE";
		
		sfxid					= "MFX_FIrestorm_Collide";
		sfxisambient			= 1;
		
		
};

instance spellFX_Firestorm_COLLIDE		(CFx_Base_Proto)
{	
		visname_S 				= "MFX_Fireball_Collide3";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		lightPresetname   		= "FIRESMALL";	
		sfxid					= "MFX_Fireball_Collide3";
};

///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  F I R E R A I N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_FireRain(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Firerain_INIT";		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	
     	emFXInvestOrigin_S 		= "spellFX_FireRAin_INVESTGLOW";
		};

		INSTANCE spellFX_FireRain_KEY_CAST	(C_ParticleFXEmitKey)
		{
				emCreateFXID		= "spellFX_FireRain_RAIN";
				pfx_ppsIsLoopingChg = 1;
};

INSTANCE spellFX_FireRain_RAIN		(CFx_Base_Proto)
{
		visname_S 				= "MFX_FireRain_Rain";		
		emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	LightPresetName 		= "CATACLYSM";
     	sfxid					= "MFX_Firerain_rain";
     	sfxisambient			= 1;
};


INSTANCE spellFX_FireRain_SUB(CFx_Base_Proto)		// vorrübergehend, bis er hardcodiert nicht mehr gesucht wird
{
     	visname_S 				= "";
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 HEAD";
};
	

INSTANCE spellFX_FireRain_INVESTGLOW	(CFx_Base_Proto)
{
		visname_S 				= "MFX_FireRain_INVESTGLOW";
		emTrjOriginNode 		= "BIP01";
		emFXCreatedOwnTrj 		= 1;
		emtrjmode_s 			= "FIXED";
		lightPresetName 		= "REDAMBIENCE";
		sfxid					= "MFX_Firerain_INVEST";
		sfxisambient			= 1;
		emFXCreate_S			= "FX_EarthQuake";
};

///   													XXXXXXXXXXXXXXXXX
///   													XX  S P E E D  XX
///   													XXXXXXXXXXXXXXXXX

instance spellFX_Speed(CFx_Base_Proto)
{
		visname_S 			= "MFX_Heal_INIT";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emFXInvestOrigin_S 	= "spellFX_Speed_ORIGIN";

		};

		instance spellFX_Speed_KEY_INVEST_1 	(C_ParticleFXEmitKey)
		{	
			emCreateFXID		= "spellFX_Speed_START";
		};
		
		instance spellFX_Speed_KEY_CAST 	(C_ParticleFXEmitKey)
		{	
			pfx_ppsisloopingChg = 1;
};

instance spellFX_Speed_START		(CFx_Base_Proto)			// HEAL START wird im 1. Invest-Key getriggert. Säule aus dem Boden.
{
		visname_S 			= "MFX_Heal_Start";
		sfxID			  	= "MFX_Heal_CAST";
		sfxisambient		= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 R FOOT";
};

instance spellFX_Speed_ORIGIN	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 		= "MFX_Heal_Invest";
		visAlpha		= 1;
		LightPresetname 	= "AURA";
	
		emtrjmode_s 		= "FIXED";
};



///   													XXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E P O R T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXX

instance spellFX_Teleport(CFx_Base_Proto)
{
		visname_S 			= "MFX_Teleport_INIT";
		//visAlpha			= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
			
		emFXInvestOrigin_S 	= "spellFX_Teleport_ORIGIN";
		lightpresetname		= "AURA";

		};

		instance spellFX_Teleport_KEY_OPEN(C_ParticleFXEmitKey)
		{
			lightrange 		= 0.1;
		};

		instance spellFX_Teleport_KEY_INIT		(C_ParticleFXEmitKey)
		{
			lightrange 		= 0.1;
		};
		
		instance spellFX_Teleport_KEY_INVEST_1	(C_ParticleFXEmitKey)
		{
			lightrange		= 200;
		};
		
		instance spellFX_Teleport_KEY_CAST 	(C_ParticleFXEmitKey)
		{	
			emCreateFXID	= "spellFX_Teleport_CAST";
			pfx_ppsIsLoopingChg = 1;
			lightrange 		= 500;
		};

instance spellFX_Teleport_ORIGIN	(CFx_Base_Proto)		
{
		visname_S 			= "MFX_TELEPORT_INVEST";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		emFXCreate_S		= "spellFX_Teleport_Ring";
		sfxid			= "MFX_teleport_invest";
		sfxisambient	= 1;
};

instance spellFX_Teleport_RING	(CFx_Base_Proto)		
{
		visname_S 			= "MFX_TELEPORT_RING";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
};

instance spellFX_Teleport_CAST	(CFx_Base_Proto)		
{
		visname_S 			= "MFX_TELEPORT_CAST";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		sfxid				= "MFX_teleport_Cast";
		sfxisambient		= 1;
	
		emtrjmode_s 		= "FIXED";
};


///   													XXXXXXXXXXXXXXX
///   													XX  H E A L  XX
///   													XXXXXXXXXXXXXXX

instance spellFX_Heal(CFx_Base_Proto)
{
		visname_S 			= "MFX_Heal_INIT";
		
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emFXInvestOrigin_S 	= "spellFX_Heal_ORIGIN";

		};

		instance spellFX_Heal_KEY_CAST 	(C_ParticleFXEmitKey)
		{	
			pfx_ppsisloopingChg = 1;
};

instance spellFX_Heal_START		(CFx_Base_Proto)			// HEAL START wird im 1. Invest-Key getriggert. Säule aus dem Boden.
{
		visname_S 			= "MFX_Heal_Start";
		sfxID			  	= "MFX_Heal_CAST";
		sfxisambient		= 1;
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 R FOOT";
};

instance spellFX_Heal_ORIGIN	(CFx_Base_Proto)		// HEAL ORIGIN wird automatisch über emFXInvestOrigin_S getriggert. Aura um den Spieler
{
		visname_S 			= "MFX_Heal_Invest";
		emTrjOriginNode 	= "BIP01";
		visAlpha			= 1;
	    emFXCreate_S	 	= "spellFX_Heal_START";
		emtrjmode_s 		= "FIXED";
		LightPresetname		= "AURA";
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T R A N S F O R M   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Transform	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Transform_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 5000;
		};

		instance spellFX_transform_KEY_OPEN			(C_ParticleFXEmitKey)			// eigentlich INIT, warte auf bugfix
		{
				visname_S 			= "MFX_Transform_INIT";
		};

		instance spellFX_transform_KEY_INVEST_1		(C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Transform_ORIGIN";
				emCreateFXID		= "spellFX_Transform_GLOW_SFX";
		};
						
		instance spellFX_transform_KEY_CAST			(C_ParticleFXEmitKey)
		{
				pfx_ppsisloopingChg = 1;
				emCreateFXID		= "spellFX_Transform_BLEND";
};


instance spellFX_Transform_GLOW_SFX	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Transform_GLOW";
		emtrjmode_s 			= "FIXED";
		emtrjoriginnode 		= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
		sfxid					= "MFX_Transform_invest";
		sfxisambient			= 1;
};

instance spellFX_Transform_GLOW	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Transform_GLOW";
		emtrjmode_s 			= "FIXED";
		emtrjoriginnode 		= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
};

instance spellFX_Transform_BLEND	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Transform_BLEND";
		emtrjmode_s 			= "FIXED";
		emtrjoriginnode 		= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
		sfxid					= "MFX_Transform_Cast";
		sfxisambient			= 1;

};


///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  L I G H T N I N G  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Lightning	(CFx_Base_Proto)
{
		visName_S 			= "MFX_Lightning_Origin";
		visSize_S 			= "40 40";
		visAlphaBlendFunc_S = "ADD";
		visTexAniFPS 		= 17;
		visTexAniIsLooping 	= 1;
		
		emtrjmode_s 		= "FIXED";
		emtrjNumKeys    	= 4;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 20.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "PINGPONG";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.3;
		emselfrotvel_s 		= "0 0 50";
		emTrjTargetRange	= 20;
		emTrjTargetElev 	= 0;
		};

		INSTANCE spellFX_Lightning_KEY_INIT			(C_ParticleFXEmitKey)
		{
				visName_S 			= "MFX_Lightning_Origin";		
		};
		
		INSTANCE spellFX_Lightning_KEY_INVEST_1		(C_ParticleFXEmitKey)
		{
				visName_S 			= "Lightning_Single.ltn";
				emtrjmode_s 		= "TARGET LINE RANDOM";
				emtrjeasevel 			= 3000.;
		};
		
		INSTANCE spellFX_Lightning_KEY_CAST			(C_ParticleFXEmitKey)
		{
				
};
				

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  C H A I N - L I G H T N I N G  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_ChainLightning(CFx_Base_Proto)
{
		visName_S 			= "lightning_big_a0.tga";
		visSize_S 			= "3 3";
		visAlphaBlendFunc_S = "ADD";
		visTexAniFPS 		= 17;
		visTexAniIsLooping 	= 1;
		
		emFXCreate_S 		= "spellFX_ChainLightning_Origin";
		emtrjmode_s 		= "FIXED";
		emtrjNumKeys    	= 12;
		emtrjnumkeysvar 	= 3;
		emtrjangleelevvar 	= 20.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "none";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 200000.0;
		emselfrotvel_s 		= "0 0 50";
		emTrjTargetRange	= 20;
		emTrjTargetElev 	= 0;
		
};
		

INSTANCE spellFX_ChainLightning_ORIGIN	(CFx_Base_Proto)
{
		visname_S 			= "MFX_Lightning_Origin";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		lightPresetname   		= "AURA";
		};

		INSTANCE spellFX_ChainLightning_Origin_KEY_OPEN			(C_ParticleFXEmitKEy)
		{
				LightRange	= 0.01;
		};

		INSTANCE spellFX_ChainLightning_Origin_KEY_INIT			(C_ParticleFXEmitKEy)
		{
				LightRange	= 0.01;
		};
		
		INSTANCE spellFX_ChainLightning_Origin_KEY_INVEST_1		(C_ParticleFXEmitKey)
		{
				sfxID			= "MFX_Lightning_Origin";
				LightRange	= 200;
};
				

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R B O L T  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Thunderbolt	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Thunderebolt_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATE";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Thunderbolt_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Thunderbolt_SENDPERCEPTION";		
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;

		//visAlpha				= 0;
		
		};

		INSTANCE spellFX_Thunderbolt_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_Thunderbolt_INIT";
				scaleDuration			= 0.5;
		};
		
		INSTANCE spellFX_Thunderbolt_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_Thunderbolt_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			sfxid					= "MFX_Thunderbolt_Cast";
	 			emCheckCollision		= 1;
				//emCreateFXID 			= "FX_CAST2";
		};

		INSTANCE spellFX_Thunderbolt_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s		= "0 0.0002 0";
		     	emtrjeasevel 			= 0.000001;
	 			emCheckCollision		= 0;
};

instance spellFX_Thunderbolt_COLLIDE		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunderbolt_Collide";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		sfxid			= "Torch_Enlight";
};

instance spellFX_Thunderbolt_SENDPERCEPTION		(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunderbolt_Collide";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		sfxid			= "Torch_Enlight";
		SendAssessMagic	= 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T H U N D E R B A L L  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Thunderball	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Thunderball_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE CREATEQUAD";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Thunderball_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Thunderspell_TARGET";
		emFXCollStatAlign_S		= "COLLISIONNORMAL";
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		userString[0]			= "fireballquadmark.tga";
		userString[1]			= "100 100";
		userString[2]			= "MUL";
		lightPresetname   		= "AURA";	
		
		};

		INSTANCE spellFX_Thunderball_KEY_OPEN(C_ParticleFXEmitKey)
		{
				visname_S 		= "MFX_Thunderball_INIT";
				lightrange		= 0.01;
		};

		INSTANCE spellFX_Thunderball_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 		= "MFX_Thunderball_INIT";
				lightrange		= 0.01;
		};
		
		INSTANCE spellFX_Thunderball_KEY_INVEST_1 (C_ParticleFXEmitKey)
		{	
				visname_S 		= "MFX_Thunderball_INVEST";
				emCreateFXID	= "spellFX_Thunderball_InVEST_BLAST1";
				lightrange		= 50;
				sfxid			= "MFX_Thunderball_invest1";
				sfxisambient	= 1;
		}								;
		INSTANCE spellFX_Thunderball_KEY_INVEST_2 (C_ParticleFXEmitKey)
		{	
				visname_S 		= "MFX_Thunderball_INVEST_L2";	
				emCreateFXID	= "spellFX_Thunderball_InVEST_BLAST2";
				sfxid			= "MFX_Thunderball_invest2";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_Thunderball_KEY_INVEST_3 (C_ParticleFXEmitKey)
		{
				visname_S 		= "MFX_Thunderball_INVEST_L3";	
				emCreateFXID	= "spellFX_Thunderball_InVEST_BLAST3";
				sfxid			= "MFX_Thunderball_invest3";
				sfxisambient	= 1;
		};
		INSTANCE spellFX_Thunderball_KEY_INVEST_4 (C_ParticleFXEmitKey)
		{	
				visname_S 		= "MFX_Thunderball_INVEST_L4";	
				emCreateFXID	= "spellFX_Thunderball_InVEST_BLAST4";
				sfxid			= "MFX_Thunderball_invest4";
				sfxisambient	= 1;
		};
		
		
		INSTANCE spellFX_Thunderball_KEY_CAST (C_ParticleFXEmitKey)
		{
				lightrange		= 200;
				visname_S 		= "MFX_Thunderball_CAST";		
				emtrjmode_s 	= "TARGET";
		     	emtrjeasevel 	= 1400.;
	 			sfxid			= "MFX_Thunderball_Cast";
	 			sfxisambient	= 1;
	 			emCheckCollision = 1;
		};

		INSTANCE spellFX_Thunderball_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	pfx_flygravity_s= "0 0.0002 0";
		     	emtrjeasevel 	= 0.000001;
};

instance spellFX_Thunderball_InVEST_BLAST1		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_INVEST_BLAST";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		//lightPresetname 		= "WHITEBLEND";	
		sfxid					= "MFX_Thunderball_invest1";
		sfxisambient			= 1;
		visAlpha 				= 0.3;
};

instance spellFX_Thunderball_InVEST_BLAST2	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_INVEST_BLAST";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		//lightPresetname 		= "WHITEBLEND";	
		sfxid					= "MFX_Thunderball_invest2";
		sfxisambient			= 1;
		visAlpha 				= 0.5;
};

instance spellFX_Thunderball_InVEST_BLAST3		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_INVEST_BLAST";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		//lightPresetname 		= "WHITEBLEND";	
		sfxid					= "MFX_Thunderball_invest3";
		sfxisambient			= 1;
		visAlpha 				= 0.8;
};

instance spellFX_Thunderball_InVEST_BLAST4		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_INVEST_BLAST";
		visAlpha				= 1;
		emtrjmode_s 			= "FIXED";
		//lightPresetname 		= "WHITEBLEND";	
		sfxid					= "MFX_Thunderball_invest4";
		sfxisambient			= 1;
		visAlpha 				= 1;
};

// KOLLISION MIT STATISCHER WELT:  KEINE PERCEPTION

instance spellFX_Thunderball_COLLIDE		(CFx_Base_Proto)
{
		visname_S 				= "MFX_Thunderball_Collide1";
		visAlpha				= 1;
		emTrjOriginNode			= "BIP01";
		emtrjmode_s 			= "FIXED";
		lightPresetname   		= "FIRESMALL";	
		
};
		
INSTANCE spellFX_Thunderball_COLLIDE_KEY_INVEST_1	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Thunderball_Collide1";		sfxid	= "MFX_Thunderball_Collide1";		};
INSTANCE spellFX_Thunderball_COLLIDE_KEY_INVEST_2	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Thunderball_Collide2";		sfxid	= "MFX_Thunderball_Collide2";		};
INSTANCE spellFX_Thunderball_COLLIDE_KEY_INVEST_3	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Thunderball_Collide3";		sfxid	= "MFX_Thunderball_Collide3";		};
INSTANCE spellFX_Thunderball_COLLIDE_KEY_INVEST_4	(C_ParticleFXEmitKey)  {	visname_S 	= "MFX_Thunderball_Collide4";		sfxid	= "MFX_Thunderball_Collide4";		};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  I C E C U B E  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_IceCube	(CFx_Base_Proto)
{

     	visname_S 				= "MFX_Icecube_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATEONCE";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_IceCube_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Icespell_TARGET";		
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		
		emFXInvestOrigin_S		= "spellFX_Icespell_Invest";
		//visAlpha				= 0;
		
		lightPresetname   		= "AURA";
		};

		INSTANCE spellFX_IceCube_KEY_OPEN(C_ParticleFXEmitKey)
		{
				Lightrange				= 0.01;
		};

		INSTANCE spellFX_IceCube_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_Icecube_INIT";
				Lightrange				= 0.01;
				scaleDuration			= 0.5;
		};
		
		INSTANCE spellFX_IceCube_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_ICECUBE_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			emCheckCollision		= 1;
	 			sfxid					= "MFX_Icecube_cast";
	 			sfxisambient			= 1;
				//emCreateFXID 			= "FX_CAST2";
				Lightrange				= 200;
		};

		INSTANCE spellFX_IceCube_KEY_COLLIDE (C_ParticleFXEmitKey)
		{
		     	emtrjeasevel 			= 0.000001;
	 			//emCheckCollision		= 0;
};

instance spellFX_IceCube_COLLIDE		(CFx_Base_Proto)
{
		visname_S 			= "MFX_ICESPELL_Collide";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		sfxid				= "MFX_ICECUBE_COLLIDE";
};

instance spellFX_Icespell_Invest		(CFx_Base_Proto)
{
		visname_S 			= "";
		emtrjmode_s 		= "FIXED";
		sfxid				= "MFX_ICECUBE_INVEST";
		sfxisambient		= 1;
};




///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  I C E W A V E  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Icewave(CFx_Base_Proto)
{

     	visname_S 			= "MFX_IceCUBE_INIT";		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
     	
     	emFXInvestOrigin_S		= "spellFX_Icespell_Invest";
     	};

		INSTANCE spellFX_Icewave_KEY_INIT(C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_IceCUBE_INIT";		
		};

		INSTANCE spellFX_Icewave_KEY_CAST(C_ParticleFXEmitKey)
		{
				emCreateFXID		= "spellFX_Icewave_WAVE";
				pfx_ppsIsLoopingChg = 1;
				sfxid				= "MFX_Icewave_Cast";
				sfxisambient		= 1;				
};

INSTANCE spellFX_Icewave_WAVE	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Icewave_WAVE";		
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDyn_S			= "spellFX_IceSpell_TARGET";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	LightPresetName			= "WHITEBLEND";
};


INSTANCE spellFX_IceWave_WAVE_KEY_OPEN		(C_ParticleFXEmitKey)
{
		LightRange			= 0.01;
};

INSTANCE spellFX_IceWave_WAVE_KEY_INIT		(C_ParticleFXEmitKey)
{
		LightRange			= 0.01;
};


INSTANCE spellFX_IceWave_WAVE_KEY_CAST		(C_ParticleFXEmitKey)
{
		LightRange			= 200;
};



INSTANCE spellFX_Icewave_SUB(CFx_Base_Proto)		// vorrübergehend, bis er hardcodiert nicht mehr gesucht wird
{
     	visname_S 				= "";
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 HEAD";
};
	
		
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   D E M O N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


instance spellFX_Demon  (CFx_Base_Proto)
{
		visname_S 		= "MFX_Summondemon_INIT";
		visAlpha		= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		LightPresetname 	= "REDAMBIENCE";	//ToDo: "REDAMBIENCE"
		
		emFXInvestOrigin_S	= "spellFX_Demon_INVEST";
		
		};
		
		instance spellFX_Demon_KEY_OPEN(C_ParticleFXEmitKey)
		{	
				LightRange = 0.01;
		};


		instance spellFX_Demon_KEY_INIT		(C_ParticleFXEmitKey)
		{	
				LightRange = 0.01;
		};
		
		instance spellFX_Demon_KEY_INVEST_1 (C_ParticleFXEmitKey) {	LightRange = 400;	};		
		instance spellFX_Demon_KEY_INVEST_2 (C_ParticleFXEmitKey) {};
		instance spellFX_Demon_KEY_INVEST_3 (C_ParticleFXEmitKey) {		emCreateFXID = 	"FX_EarthQuake";	};

		instance spellFX_Demon_KEY_CAST		(C_ParticleFXEmitKey)
		{	
			//emCreateFXID		= "spellFX_Demon_ORIGIN";
			pfx_ppsisloopingchg = 1;
};

INSTANCE spellFX_Demon_INVEST	(CFx_Base_Proto)
{
		visname_S 				= "MFX_SummonDemon_Invest";		
		emTrjOriginNode 		= "Bip01";
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   S K E L E T O N  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


instance spellFX_Skeleton  (CFx_Base_Proto)
{
		visname_S 			= "MFX_Summondemon_INIT";
		visAlpha			= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		LightPresetname 	= "REDAMBIENCE";	
		
		emFXInvestOrigin_S	= "spellFX_Demon_INVEST";
		
		};
		
		instance spellfx_skeleton_KEY_OPEN(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};
		
		instance spellfx_skeleton_KEY_INIT		(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};
		
		instance spellFX_skeleton_KEY_INVEST_1 (C_ParticleFXEmitKey) {	LightRange = 400;	};		
		instance spellFX_skeleton_KEY_INVEST_2 (C_ParticleFXEmitKey) {};
		instance spellFX_skeleton_KEY_INVEST_3 (C_ParticleFXEmitKey) {		emCreateFXID = 	"FX_EarthQuake";	};

		
		instance spellFX_Skeleton_KEY_CAST		(C_ParticleFXEmitKey)
		{	
				//emCreateFXID		= "spellFX_Demon_ORIGIN";
				pfx_ppsisloopingchg = 1;
				LightRange = 200;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S U M M O N   G O L E M  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



instance spellFX_Golem	(CFx_Base_Proto)
{
		visname_S 		= "MFX_Summondemon_INIT";
		visAlpha		= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		LightPresetname 	= "REDAMBIENCE";
		
		emFXInvestOrigin_S	= "spellFX_Demon_INVEST";
		
		};
		

		instance spellFX_Golem_KEY_OPEN(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};

		instance spellFX_Golem_KEY_INIT		(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};
		
		instance spellFX_Golem_KEY_INVEST_1 (C_ParticleFXEmitKey) {		LightRange = 400;	};		
		instance spellFX_Golem_KEY_INVEST_2 (C_ParticleFXEmitKey) {};
		instance spellFX_Golem_KEY_INVEST_3 (C_ParticleFXEmitKey) {		emCreateFXID = 	"FX_EarthQuake";	};

		instance spellFX_Golem_KEY_CAST		(C_ParticleFXEmitKey)
		{	
				//emCreateFXID		= "spellFX_Golem_ORIGIN";
				pfx_ppsisloopingchg = 1;
				LightRange = 200;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  A R M Y   O F   D A R K N E S S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

instance spellFX_ArmyOfDarkness		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Summondemon_INIT";
		visAlpha			= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		LightPresetname 	= "REDAMBIENCE";
		
		emFXInvestOrigin_S	= "spellFX_Demon_INVEST";
		
		};
		
		instance spellFX_ArmyOfDarkness_KEY_OPEN(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};

		instance spellFX_ArmyOfDarkness_KEY_INIT		(C_ParticleFXEmitKey)
		{
				LightRange = 0.01;
		};
		
		instance spellFX_ArmyOfDarkness_KEY_INVEST_1 (C_ParticleFXEmitKey) {		LightRange = 400;		};		
		instance spellFX_ArmyOfDarkness_KEY_INVEST_2 (C_ParticleFXEmitKey) {};
		instance spellFX_ArmyOfDarkness_KEY_INVEST_3 (C_ParticleFXEmitKey) {		emCreateFXID = 	"FX_EarthQuake";	};
		
		instance spellFX_ArmyOfDarkness_KEY_CAST		(C_ParticleFXEmitKey)
		{	
			emCreateFXID		= "spellFX_ArmyOfDarkness_ORIGIN";
			pfx_ppsisloopingchg = 1;
};
		
/*instance spellFX_ArmyOfDarkness_ORIGIN  (CFx_Base_Proto)
{
		visname_S 		= "MFX_Summondemon_INVEST";
		visAlpha		= 1;

		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 L FOOT";
};*/



///   													XXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S S D E A T H  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_MassDeath(CFx_Base_Proto)
{

     	visname_S 				= "MFX_MassDeath_INIT";		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjloopmode_s 		= "NONE";
		emFXInvestOrigin_S	   	= "spellFX_Massdeath_INITGLOW";
		emFXCreatedOwnTrj 		= 0; 
		
		};

		INSTANCE spellFX_MassDeath_KEY_INIT(C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_MassDeath_INIT";		
		};

		INSTANCE spellFX_MassDeath_KEY_CAST(C_ParticleFXEmitKey)
		{
				emCreateFXID		= "spellFX_MassDeath_GROUND";
				pfx_ppsIsLoopingChg = 1;
};

INSTANCE spellFX_MassDeath_GROUND		(CFx_Base_Proto)
{
		visname_S 				= "MFX_MassDeath_CAST";		
		emTrjOriginNode 		= "BIP01 R Foot";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDyn_S			= "spellFX_MassDeath_Target";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	LightPresetName			= "REDAMBIENCE";
     	sfxid					= "MFX_Massdeath_Cast";
		sfxisambient			= 1;
};



INSTANCE spellFX_MassDeath_SUB(CFx_Base_Proto)		// vorrübergehend, bis er hardcodiert nicht mehr gesucht wird
{
     	visname_S 				= "";
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "BIP01 HEAD";
};
	
		
INSTANCE spellFX_MassDeath_Target(CFx_Base_Proto)
{
		visname_S 				= "MFX_Massdeath_TARGET";
		emTrjOriginNode 		= "BIP01";
		emFXCreatedOwnTrj 	= 1;
		emtrjmode_s 			= "FIXED";
		sfxid					= "MFX_MassdeatH_Target";
		sendassessmagic			= 1;
};

INSTANCE spellFX_MassDeath_INITGLOW	(CFx_Base_Proto)
{
		visname_S 				= "MFX_Massdeath_INIT_GLOW";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emFXCreatedOwnTrj 		= 0;
		emtrjmode_s 			= "FIXED";
		LightPresetName			= "REDAMBIENCE";
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  D E S T R O Y   U N D E A D  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



INSTANCE spellFX_DestroyUndead(CFx_Base_Proto)
{

     	visname_S 				= "MFX_DestroyUndead_INIT";
		
     	emtrjmode_s 			= "FIXED";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
     	emtrjtargetnode 		= "BIP01 FIRE";
     	emtrjloopmode_s 		= "NONE";
     	emtrjeasefunc_s 		= "LINEAR";
     	emActionCollStat_S		= "COLLIDE CREATE";
     	emActionCollDyn_S 		= "COLLIDE CREATEONCE";
		emFXCollStat_S	   		= "spellFX_Destroyundead_COLLIDE";
		emFXCollDyn_S     		= "spellFX_Destroyundead_SENDPERCEPTION";		
		emTrjTargetRange	 	= 20;
		emTrjTargetElev 		= 0;
		emTrjDynUpdateDelay		= 20000;
		};

		INSTANCE spellFX_DestroyUndead_KEY_INIT (C_ParticleFXEmitKey)
		{
				visname_S 			= "MFX_DestroyUndead_INIT";
		};
		
		INSTANCE spellFX_DestroyUndead_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_DestroyUndead_CAST";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 800.;
	 			sfxid					= "MFX_DestroyUndead_Cast";
	 			sfxisambient			= 1;
				//emCreateFXID 			= "FX_CAST2";
				emCheckCollision 		= 1;
};


INSTANCE spellFX_Destroyundead_COLLIDE		(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01";
	visname_S 			= "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "AURA";
	sfxid				= "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient		= 1;
}; 

INSTANCE spellFX_Destroyundead_SENDPERCEPTION	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01";
	visname_S 			= "MFX_DESTROYUNDEAD_COLLIDE";
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "AURA";
	sendassessmagic		= 1;
	sfxid				= "MFX_DESTROYUNDEAD_COLLIDE";
	sfxisambient		= 1;
}; 


///   													XXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  W I N D F I S T   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_WindFist(CFx_Base_Proto)
{
		visname_S 			= "MFX_WINDFIST_INIT";
		vissize_s				= "1 1";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 7;
		emtrjnumkeysvar 	= 3;
		emtrjangleelevvar 	= 5.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 200000;
		emTrjTargetRange	= 100;
		emTrjTargetElev 	= 1;
		emActionCollDyn_S 	= "CREATEONCE";
		emFXCollDyn_S	   	= "spellFX_Windfist_Target";	//Sendet perception
		emFXInvestOrigin_S	= "spellFX_Windfist_Invest";
		
		
		};
		
		INSTANCE spellFX_WINDFIST_KEY_INIT (C_ParticleFXEmitKey)
		{
				emCheckCollision	= 0;
		};
		
		INSTANCE spellFX_Windfist_KEY_INVEST_1	(C_ParticleFXEmitKey)	{	emCreateFXID	= "spellFX_Windfist_INVESTBLAST";	};
		INSTANCE spellFX_Windfist_KEY_INVEST_2	(C_ParticleFXEmitKey)	{	emCreateFXID	= "spellFX_Windfist_INVESTBLAST";	};
		INSTANCE spellFX_Windfist_KEY_INVEST_3	(C_ParticleFXEmitKey)	{	emCreateFXID	= "spellFX_Windfist_INVESTBLAST";	};
		INSTANCE spellFX_Windfist_KEY_INVEST_4	(C_ParticleFXEmitKey)	{	emCreateFXID	= "spellFX_Windfist_INVESTBLAST";	};
		
		
		INSTANCE spellFX_WINDFIST_KEY_CAST	 (C_ParticleFXEmitKey)
		{
				visname_S 				= "simpleglow.tga";
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			emCheckCollision		= 1;
				emCreateFXID			= "spellFX_WINDFIST_CAST";
};
		

INSTANCE spellFX_Windfist_Invest (CFx_Base_Proto)
{
		visname_S			= "MFX_WINDFIST_INVEST";
		sfxid				= "MFX_WINDFIST_INVEST";
		sfxisambient		= 1;
};

INSTANCE spellFX_Windfist_INVESTBLAST	(CFX_Base_Proto)
{
		visname_S			= "MFX_WINDFIST_INVEST_BLAST";
		sfxid				= "MFX_WINDFIST_INVESBLASTT";
		sfxisambient		= 1;
};


INSTANCE spellFX_Windfist_Cast (CFx_Base_Proto)
{
		visname_S			= "MFX_WINDFIST_Cast";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		sfxid				= "MFX_Windfist_Cast";
		sfxisambient		= 1;
};


INSTANCE spellFX_Windfist_Target (CFx_Base_Proto)	//Sendet perception
{
		visname_S			= "MFX_WINDFIST_COLLIDE";
		sendassessmagic		= 1;
};


///   													XXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  S T O R M F I S T   XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Stormfist	(CFx_Base_Proto)
{
		visname_S 			= "MFX_WINDFIST_INIT";
		vissize_s			= "1 1";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 7;
		emtrjnumkeysvar 	= 3;
		emtrjangleelevvar 	= 5.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 200000;
		emTrjTargetRange	= 100;
		emTrjTargetElev 	= 1;
		
		emActionCollDyn_S 	= "CREATEONCE";
		emFXCollDyn_S	   	= "spellFX_Windfist_Target";
		emFXInvestOrigin_S	= "spellFX_Windfist_Invest";
		};
		
		INSTANCE spellFX_Stormfist_KEY_INIT (C_ParticleFXEmitKey)
		{
				emCheckCollision	= 0;
		};
		
		INSTANCE spellFX_Stormfist_KEY_CAST	 (C_ParticleFXEmitKey)
		{
				visname_s			= "MFX_STORMFIST_CAST";
				emcheckcollision	= 1;
				sfxid				= "MFX_Stormfist_Cast";
				sfxisambient		= 1;
};
		

INSTANCE spellFX_Stormfist_Invest (CFx_Base_Proto)
{
		visname_S			= "MFX_WINDFIST_INVEST";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
};


/* INSTANCE spellFX_Stormfist_Cast (CFx_Base_Proto)
{
		visname_S			= "MFX_STORMFIST_Cast";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		sfxid				= "MFX_Stormfist_Cast";
		sfxisambient		= 1;
}; */


/* INSTANCE spellFX_Stormfist_SUB(CFx_Base_Proto)		// vorrübergehend, bis er hardcodiert nicht mehr gesucht wird
{
     	visname_S 				= "";
     	emtrjmode_s 			= "TARGET LINE";
		emTrjOriginNode 		= "ZS_RIGHTHAND";
		emtrjeasevel			= 0.01;
		emActionCollDyn_S 	= "CREATEONCE";
		emFXCollDyn_S	   	= "spellFX_Windfist_Target";
		emFXInvestOrigin_S	= "spellFX_Windfist_Invest";
		};
		
		INSTANCE spellFX_Stormfist_SUB_KEY_CAST	(C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_STORMFIST_CAST";
				emtrjeasevel			= 1000;
				emCheckCollision		= 1;
};*/





///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  T E L E K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX


INSTANCE spellFX_telekinesis(CFx_Base_Proto)
{
		visname_S 			= "MFX_Telekinesis_INIT";
		emtrjmode_s 		= "TARGET";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 2;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 2.;
		emtrjangleheadvar 	= 0.;
		emtrjeasefunc_s 	= "LINEAR";
		emtrjloopmode_s 	= "HALT";
		emtrjdynupdatedelay = 0.;
		emFXInvestOrigin_S 	= "spellFX_Telekinesis_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_Telekinesis_TARGET";
		//lightPresetname 	= "POISON";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
};

INSTANCE spellFX_telekinesis_KEY_INIT (C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_INIT";
		emtrjeasevel	  	= 0.01;
};

INSTANCE spellFX_telekinesis_KEY_INVEST_1	(C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TARGET";
		emtrjeasevel	  	= 2000;
		sfxid				= "MFX_TELEKINESIS_STARTINVEST";
		sfxisambient		= 1;
};


INSTANCE spellFX_telekinesis_KEY_CAST	(C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TargetEnd";
		
};

/*INSTANCE spellFX_telekinesis_KEY_STOP (C_ParticleFXEmitKey)
{
		visname_s			= "MFX_Telekinesis_TargetEnd";
		
};*/

INSTANCE spellFX_telekinesis_Origin		(CFx_Base_Proto)
{
		visname_S 			= "MFX_Telekinesis_BRIDGE";
		emtrjmode_s 		= "TARGET LINE";
		emtrjeasevel	  	= 0.001;
		emTrjOriginNode 	= "BIP01 R Hand";
		emtrjdynupdatedelay = 0.;
		lightPresetname 	= "AURA";
		sfxid				= "MFX_TELEKINESIS_INVEST";
		sfxisambient		= 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  M A S T E R   T E L E K I N E S I S  XX		// kann auch NPCs anheben
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX


/* INSTANCE spellFX_telekinesis2(CFx_Base_Proto)
{
	visname_S 			= "spell_telekinesis";
	emtrjmode_s 		= "FIXED";
	emTrjOriginNode 	= "ZS_RIGHTHAND";
	emtrjnumkeys 		= 2;
	emtrjnumkeysvar 	= 1;
	emtrjangleelevvar 	= 2.;
	emtrjangleheadvar 	= 0.;
	emtrjeasefunc_s 	= "PINGPONG";
	emtrjdynupdatedelay = 0.;
	emFXInvestOrigin_S 	= "FX_telekinesis_origin";
	emFXInvestTarget_S 	= "FX_telekinesis_target";
	lightPresetname 	= "POISON";
	emTrjTargetRange	= 0;
	emTrjTargetElev 	= 0;
};

INSTANCE spellFX_telekinesis2_KEY_INVEST_1(C_ParticleFXEmitKey)
{
	pfx_dirmode_s 		= "TARGET";
	emtrjeasevel	  	= 700.;
	pfx_velAvg    		= 0.4;
	emCreateFXID 		= "FX_CAST3";
	emCheckCollision 	= 0;
	//sfxid			  = "telekinesis_CAST";
};

INSTANCE spellFX_telekinesis2_KEY_CAST (C_ParticleFXEmitKey)
{
	pfx_ppsIsLoopingChg = 1;
}; */

///   													XXXXXXXXXXXXXXXXXX
///   													XX  C H A R M   XX
///   													XXXXXXXXXXXXXXXXXX


INSTANCE spellFX_Charm	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CHARM_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
				
		//emFXInvestOrigin_S 	= "spellFX_Sleep_ORIGIN";
		
		};
		
		INSTANCE spellFX_Charm_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_CHARM_ORIGIN";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_Charm_Cast";
		     	sfxisambient			= 1;
				//emCreateFXID 			= "FX_CAST2";
};



///   													XXXXXXXXXXXXXXXXX
///   													XX  S L E E P  XX
///   													XXXXXXXXXXXXXXXXX


INSTANCE spellFX_Sleep	(CFx_Base_Proto)
{
		visname_S 			= "MFX_SLEEP_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
				
		//emFXInvestOrigin_S 	= "spellFX_Sleep_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_Sleep_TARGET";
		
		};
		
		INSTANCE spellFX_Sleep_KEY_INIT	(C_ParticleFXEmitKey)
		{
				visname_S				= "MFX_SLEEP_INIT";
		};
		
		INSTANCE spellFX_Sleep_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_SLEEP_ORIGIN";		
				//emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_Sleep_Cast";
		     	
				//emCreateFXID 			= "FX_CAST2";
};


		
instance spellFX_Sleep_ORIGIN	(CFx_Base_Proto)
{
		visname_S 		= "MFX_SLEEP_ORIGIN";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};

instance spellFX_Sleep_TARGET	(CFx_Base_Proto)
{
		lightPresetname 	= "AURA";
		visname_S 		= "MFX_SLEEP_TARGET";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "BIP01";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  P Y R O K I N E S I S  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXX



INSTANCE spellFX_Pyrokinesis(CFx_Base_Proto)
{
		visname_S 		= "MFX_Pyrokinesis_INIT";
		visAlpha		= 1;
		
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjtargetnode 	= "BIP01 HEAD";
		emtrjnumkeys 		= 1;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 15.;
		emtrjangleheadvar 	= 0.;
		emtrjdynupdatedelay 	= 0.;
		emFXInvestTarget_S 	= "spellFX_Pyrokinesis_target";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
		};

		INSTANCE spellFX_Pyrokinesis_KEY_CAST (C_ParticleFXEmitKey)
		{
				pfx_ppsIsLoopingChg = 1; 			
};

INSTANCE spellFX_Pyrokinesis_TARGET(CFx_Base_Proto)
{
	visname_S 		= "MFX_Pyrokinesis_TARGET";
	
	emtrjmode_s 		= "FIXED";
	emTrjOriginNode 	= "BIP01 HEAD";
	lightPresetname 	= "FIRESMALL";
	emTrjTargetRange	= 0;
	emTrjTargetElev 	= 0;
	sendAssessMagic		= 1;
	emtrjdynupdatedelay = 0.01;
	
	sfxid				= "MFX_Pyrokinesis_target";
	sfxisambient		= 1;
};




///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  C O N T R O L  XX
///   													XXXXXXXXXXXXXXXXXXXXX




INSTANCE spellFX_Control(CFx_Base_Proto)
{
		visName_S			=  "MFX_CONTROL_INIT";
		vissize_s			= "1 1";
		
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjtargetnode 	= "BIP01 HEAD";
		emtrjloopmode_s 	= "none";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
		//lightPresetname 	= "POISON";
		//emselfrotvel_s 	= "0 0 50";
		emTrjTargetRange 	= 0;
		emTrjTargetElev  	= 0;
		
		emFXInvestTarget_S 	= "spellFX_Control_TARGET";	
		emFXInvestOrigin_S	= "spellFX_Control_BRIDGE";
		};

		INSTANCE spellFX_Control_KEY_INVEST_1	(C_ParticleFXEmitKey)
		{
				visname_s	= "simpleglow.tga";
				sfxid		= "MFX_CONTROL_STARTINVEST";
				sfxisambient= 1;
				
		};
		
		INSTANCE spellFX_Control_KEY_CAST		(C_ParticleFXEmitKey)
		{
				pfx_ppsIsLoopingChg 	= 1;
				emCreateFXID			= "CONTROL_CASTBLEND";
				sfxid					= "MFX_CONTROL_CAST";
				sfxisambient			= 1;
};

INSTANCE spellFX_Control_TARGET(CFx_Base_Proto)
{
		visname_S 			= "MFX_CONTROL_TARGET";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 HEAD";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
		sendAssessMagic		= 1;
};

INSTANCE spellFX_Control_BRIDGE	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CONTROL_BRIDGE";
		
		emtrjmode_s 		= "TARGET LINE";
		emTrjOriginNode 	= "BIP01 HEAD";
		emtrjtargetnode 	= "BIP01 HEAD";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
		emFXCreate_S		= "spellFX_Control_ORIGIN";
		
		sfxid				= "MFX_CONTROL_INVEST";
		sfxisambient		= 1;
		
		};
		
		INSTANCE spellFX_Control_BRIDGE_KEY_INIT	(C_ParticleFXEmitKey)
		{
				emtrjeasevel	= 0.01;
};



/* INSTANCE spellFX_Control_ORIGIN	(CFx_Base_Proto)
{
		visname_S 			= "MFX_CONTROL_ORIGIN";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01 HEAD";
		emtrjtargetnode 	= "BIP01 HEAD";
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
}; */



///   													XXXXXXXXXXXXXXX
///   													XX  F E A R  XX
///   													XXXXXXXXXXXXXXX


INSTANCE spellFX_Fear(CFx_Base_Proto)
{
		visname_S 			= "MFX_FEAR_INIT";
		emtrjmode_s 		= "FIXED";
		emtrjeasefunc_s 	= "linear";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay = 10000;
		};
	
		INSTANCE spellFX_Fear_KEY_OPEN (C_ParticleFXEmitKey)
		{
		     	emtrjeasevel 	= 0.;
		};
		
		INSTANCE spellFX_Fear_KEY_INVEST_1	(C_ParticleFXEmitKey)
		{
				emCreateFXID	= "FX_EarthQuake";
		};
		
		INSTANCE spellFX_Fear_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_s 		= "MFX_FEAR_ORIGIN";
		     	emCreateFXID	= "spellFX_Fear_Face";
};
		

INSTANCE spellFX_Fear_Face		(CFx_Base_Proto)
{
		emtrjmode_s 		= "FIXED";
		emtrjeasefunc_s 	= "linear";
		emTrjOriginNode 	= "BIP01 HEAD";
		emtrjdynupdatedelay = 10000;
		lightPresetname 	= "REDAMBIENCE";
		sfxid				= "MFX_FEAR_CAST";
		sfxisambient		= 1;
		visname_S 			= "MFX_FEAR_FACE";
		emFXCreate_S		= "spellFX_Fear_WAVE";
};

INSTANCE spellFX_Fear_WAVE	(CFx_Base_Proto)
{
		visname_S 				= "MFX_FEAR_WAVE";		
		emTrjOriginNode 		= "BIP01";
		emActionCollDyn_S		= "CREATEONCE";
     	emFXCollDyn_S			= "spellFX_Fear_SENDPERCEPTION";
     	emFXCollDynAlign_S		= "COLLISIONNORMAL";
     	emCheckCollision		= 1;
     	//LightPresetName			= "WHITEBLEND";
};

INSTANCE spellFX_FEAR_SENDPERCEPTION	(CFx_Base_Proto)	//Sendet perception
{
		visname_S			= "";
		sfxid				= "HAMMER";
		sendassessmagic		= 1;
};


///   													XXXXXXXXXXXXXXXXXXXXX
///   													XX  B E R Z E R K  XX
///   													XXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Berzerk	(CFx_Base_Proto)
{
		visname_S 			= "MFX_BERZERK_INIT";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjmode_s 		= "fixed";
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 0.;
				
		//emFXInvestOrigin_S 	= "spellFX_Sleep_ORIGIN";
		//emFXInvestTarget_S 	= "spellFX_Sleep_TARGET";
		
		};
		
		INSTANCE spellFX_Berzerk_KEY_CAST (C_ParticleFXEmitKey)
		{
				visname_S 				= "MFX_BERZERK_ORIGIN";		
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
		     	sfxid					= "MFX_Berzerk_Cast";
		     	sfxisambient			= 1;
				//emCreateFXID 			= "FX_CAST2";
};


		
instance spellFX_Berzerk_ORIGIN	(CFx_Base_Proto)
{
		visname_S 		= "MFX_CHARM_ORIGIN";
		emtrjmode_s 		= "FIXED";
		emtrjoriginnode 	= "ZS_RIGHTHAND";
		emtrjdynupdatedelay 	= 0;
	
		//sendAssessMagic	= 1;
};

///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
///   													XX  B R E A T H   O F   D E A T H  XX
///   													XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_BreathOfDeath	(CFx_Base_Proto)
{
		visname_S 			= "MFX_BREATHOFDEATH_INIT";
		vissize_s				= "1 1";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjnumkeys 		= 7;
		emtrjnumkeysvar 	= 3;
		emtrjangleelevvar 	= 5.;
		emtrjangleheadvar 	= 20.;
		emtrjloopmode_s 	= "NONE";
		emtrjeasefunc_s 	= "LINEAR";
		emtrjdynupdatedelay = 200000;
		emTrjTargetRange	= 100;
		emTrjTargetElev 	= 1;
		emActionCollDyn_S 	= "CREATEONCE";
		emFXCollDyn_S	   	= "spellFX_BreathOfDeath_Target";
		
		emFXInvestOrigin_S	= "spellFX_BreathOfDeath_Invest";
		
		
		};
		
		INSTANCE spellFX_BreathOfDeath_KEY_INIT (C_ParticleFXEmitKey)
		{
				emCheckCollision	= 0;
		};
		
		INSTANCE spellFX_BreathOfDeath_KEY_CAST	 (C_ParticleFXEmitKey)
		{
				visname_S 				= "simpleglow.tga";
				emtrjmode_s 			= "TARGET";
		     	emtrjeasevel 			= 1400.;
	 			emCheckCollision		= 1;
				emCreateFXID			= "spellFX_BreathOfDeath_CAST";
};
		

INSTANCE spellFX_BreathOfDeath_Invest (CFx_Base_Proto)
{
		visname_S			= "MFX_BREATHOFDEATH_INVEST";
		sfxid				= "MFX_BREATHOFDEATH_INVEST";
		sfxisambient		= 1;
};


INSTANCE spellFX_BreathOfDeath_Cast (CFx_Base_Proto)
{
		visname_S			= "MFX_BREATHOFDEATH_Cast";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		sfxid				= "MFX_BreathOfDeath_Cast";
		sfxisambient		= 1;
};


INSTANCE spellFX_BreathOfDeath_Target (CFx_Base_Proto)
{
		visname_S			= "MFX_BREATHOFDEATH_COLLIDE";
		sfxid				= "MFX_BREATHOFDEATH_TARGET";
		sfxisambient		= 1;
		sendassessmagic		= 1;
};


///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  S H R I N K   XX
///   													XXXXXXXXXXXXXXXXXXXX

INSTANCE spellFX_Shrink(CFx_Base_Proto)
{
		visname_S 			= "MFX_SHRINK_INIT";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "ZS_RIGHTHAND";
		emtrjtargetnode 	= "BIP01";
		emtrjnumkeys 		= 5;
		emtrjnumkeysvar 	= 1;
		emtrjangleelevvar 	= 15.;
		emtrjangleheadvar 	= 0.;
		emtrjeasefunc_s 	= "LINEAR";
		emtrjloopmode_s		= "HALT";
		emtrjdynupdatedelay = 0.;
		emTrjTargetRange	= 0;
		emTrjTargetElev 	= 0;
		lightpresetname		= "AURA";
		emFXInvestOrigin_S	= "spellFX_SHRINK_ORIGIN";
		
		};


		INSTANCE spellFX_Shrink_KEY_OPEN(C_ParticleFXEmitKey)
		{
				emtrjeasevel		= 0.01;
				LightRange			= 0.01;
		};

		INSTANCE spellFX_Shrink_KEY_INIT	(C_ParticleFXEmitKey)
		{
				emtrjeasevel		= 0.01;
				LightRange			= 0.01;
		};
		
		INSTANCE spellFX_Shrink_KEY_CAST	(C_ParticleFXEmitKey)
		{
				emtrjmode_s 		= "TARGET LINE";
				visname_S 			= "MFX_SHRINK_TARGET";
				emtrjeasevel		= 6000;
				LightRange			= 200;
				sfxid				= "MFX_SHRINK_CAST";
				sfxisambient		= 1;

};

INSTANCE spellFX_Shrink_Origin (CFx_Base_Proto)
{
		emFXCreatedOwnTrj 	= 0;
		visname_S			= "";
		emtrjmode_s 		= "FIXED";
		emTrjOriginNode 	= "BIP01";
		sfxid				= "MFX_SHRINK_INVEST";
		sfxisambient		= 1;
};



///   													XXXXXXXXXXXXXXXXXXXX
///   													XXXXXXXXXXXXXXXXXXXX
///   													XX  G L O B A L   XX
///   													XXXXXXXXXXXXXXXXXXXX
///   													XXXXXXXXXXXXXXXXXXXX



// HUMAN oder VOB brennt nach Feuerschaden (-> diese Instanz wird auf einem NSC/Monster gestartet, wenn er mit einem Feuerschaden Visual/Spell getroffen wird

INSTANCE VOB_BURN			(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 FIRE";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD1";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	lightpresetname		= "FIRESMALL";
	sfxid				= "MFX_Firespell_Humanburn";
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD1	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R UPPERARM";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD2";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD2	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L UPPERARM";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD3";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD3	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L HAND";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD4";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD4	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R HAND";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD5";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD5	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 L FOOT";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "VOB_BURN_CHILD6";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};

INSTANCE VOB_BURN_CHILD6	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 R FOOT";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	emFXCreate_S 		= "spellFX_Firespell_HUMANSMOKE";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	//emAdjustShpToOrigin = 1;
};


INSTANCE spellFX_Firespell_HUMANBURN		(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 FIRE";
	visname_S 			= "MFX_Firespell_HUMANBURN";
	//emFXCreate_S 		= "spellFX_Firespell_HUMANSMOKE";
	emFXCreatedOwnTrj 	= 1;
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	emAdjustShpToOrigin = 1;
	//sendAssessMagic		= 1;
};

INSTANCE spellFX_Firespell_HUMANSMOKE	(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 FIRE";
	visname_S 			= "MFX_Firespell_HUMANSMOKE";
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay = 0.;
	emAdjustShpToOrigin = 1;
};

// ChainLightning Effekt auf Target, wird vom Programm direkt angesprochen
instance FX_Electric	(CFx_Base_Proto)		
{				
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 Head";
		emtrjmode_s 	= "FIXED";
		sfxid			= "MFX_Lightning_Target";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD1";
		emFXCreatedOwnTrj 	= 1;
};

// HUMAN oder VOB ist elektrisiert von ThunderSpell

instance spellFX_Lightning_TARGET			(CFx_Base_Proto)
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 Head";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		sfxid			= "MFX_Lightning_Target";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD1";
};

instance spellFX_Thunderspell_TARGET			(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 Head";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		sendAssessMagic		= 1;
		sfxid			= "MFX_Lightning_Target";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD1";
		emFXCreatedOwnTrj 	= 1;
};


instance spellFX_Thunderspell_TARGET_CHILD1		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R UPPERARM";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD2";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD2		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L UPPERARM";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD3";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD3		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L HAND";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD4";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD4		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R HAND";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD5";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD5		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L FOOT";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD6";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD6		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R FOOT";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD7";
		emFXCreatedOwnTrj 	= 1;
};
instance spellFX_Thunderspell_TARGET_CHILD7		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L THIGH";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD8";
		emFXCreatedOwnTrj 	= 1;
};
instance spellFX_Thunderspell_TARGET_CHILD8		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R THIGH";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD9";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD9		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 L CALF";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD10";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD10		(CFx_Base_Proto)			// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01 R CALF";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderspell_TARGET_CHILD11";
		emFXCreatedOwnTrj 	= 1;
};

instance spellFX_Thunderspell_TARGET_CHILD11		(CFx_Base_Proto)		// gehört zu FX-Kette. DO NOT DELETE
{
		visname_S 		= "MFX_Thunderball_Target";
		emTrjOriginNode = "BIP01";
		visAlpha		= 1;
		emtrjmode_s 		= "FIXED";
		emfxcreate_s	= "spellFX_Thunderball_COLLIDE";
		emFXCreatedOwnTrj 	= 1;
};


// HUMAN oder VOB ist eingefroren von IceSpell


instance spellFX_IceSpell_TARGET			(CFx_Base_Proto)
{
		visname_S 			= "MFX_IceSpell_Target";
		visAlpha			= 1;
		emtrjmode_s 		= "FIXED";
		sendAssessMagic		= 1;
		emAdjustShpToOrigin = 1;
		sfxid				= "MFX_Icecube_Target";
		
};

// Earth Quake FX

INSTANCE FX_EarthQuake(CFx_Base_Proto)
{
	visName_S 		= 	"earthquake.eqk";
	userString[0]	= 	"1000";
	userString[1]	=	"5";
	userString[2]	=	"5 5 5";
	sfxid			= 	"MFX_EarthQuake";
	sfxIsAmbient	=	1;
};

// Various FX

INSTANCE CONTROL_LEAVERANGEFX(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "1";
	userString[1]	=	"0 100 0 100";
	userString[2]	=	"0.5";
};

INSTANCE CONTROL_CASTBLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "0.5";
	userString[1]	=	"255 255 255 255";
	userString[2]	=	"0.5";
	emFXLifeSpan    =	0.6;
};

INSTANCE TRANSFORM_CASTBLEND(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "0.5";
	userString[1]	=	"255 0 0 255";
	userString[2]	=	"0.5";
	emFXLifeSpan    =	0.6;	
};

INSTANCE TRANSFORM_NOPLACEFX(CFx_Base_Proto)
{
	visName_S 		= 	"screenblend.scx";
	userString[0]	=   "1";
	userString[1]	=	"255 0 0 100";
	userString[2]	=	"1.5";
	emFXLifeSpan    =	0.6;		
};


// -------------------------------------------------------------------------------------------------------
// Seperate Collision Childs
// -------------------------------------------------------------------------------------------------------

INSTANCE FX_COLL_Small(CFx_Base_Proto)
{
		visname_S 		= "coldummy.3ds";
		emActionCollStat_S	= "NORESP";						// no collision response, as this fx is a child. collision response will be handled by parents
		emActionCollDyn_S	= "NORESP CREATEONCE";			// no collision response, as this fx is a child. collision response will be handled by parents
		visAlpha		= 0;
		};

		INSTANCE FX_COLL_Small_KEY_CAST(C_ParticleFXEmitKey)
		{
				emCheckCollision 	= 1;
};


// -------------------------------------------------------------------------------------------------------
// Magische Barriere
// -------------------------------------------------------------------------------------------------------


INSTANCE BARRIERE_PC_SHOOT(CFx_Base_Proto)
{
	visname_S 		= "Blast";
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay 	= 0;
	sfxID			= "MFX_Lightning_Origin";
};

INSTANCE BARRIERE_PC_WARNING(CFx_Base_Proto)
{
	emTrjOriginNode 	= "BIP01 TOE";
	visname_S 		= "MFX_lightning_target";	
	emtrjmode_s 		= "FIXED";
	emtrjdynupdatedelay 	= 0.;
	lightPresetname 	= "AURA";
};
