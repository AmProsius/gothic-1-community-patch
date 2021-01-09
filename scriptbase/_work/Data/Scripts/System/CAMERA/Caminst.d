/*********************************************
**	Camera Instanzen				**
*********************************************/

/* Standard Camera loaded at beginning */
// minRange besser nicht unter 1.5



INSTANCE CamModRun(CCamSys_Def)
{
	bestRange 			= 2.5 ;  
	minRange  			= 1.4 ;  
	maxRange  			= 6.0 ;  
	bestElevation		= 25.0 ;
	minElevation		= 0.0;
	maxElevation		= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 20.0;   
	rotOffsetY			= 0.0;  
};

INSTANCE CamModLookBack(CCamSys_Def)
{
	bestRange 			= 0.5 ;  
	minRange  			= 1.0 ;  
	maxRange  			= 6.0 ;  
	bestElevation			= 35.0 ;
	minElevation			= 0.0;
	maxElevation			= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 20.0;   
	rotOffsetY			= 180.0;  
	veloRot 			= 5;
};

/* Tombraider Style - Azimuth Grenzen 0/0/0 - Rotations-Stop-Geschw. langsam, Offset X -15 Grad */

INSTANCE CAMMODNORMAL (CCAMSYS_DEF)
{
     bestrange = 2.5;
     minrange = 2.0;
     maxrange = 6.0;
     bestelevation = 25.0;
     maxelevation = 90.000000000;
     minazimuth = -90.000000000;
     maxazimuth = 90.000000000;
     rotoffsetx = 20.0;
};


INSTANCE CamModDialog(CCamSys_Def)
{
	bestRange 			= 3.0 ;
	minRange  			= 2.5 ;
	maxRange  			= 3.5 ;
	bestElevation		= 10.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0;
	bestAzimuth			= 45.0;
	minAzimuth			= -45.0;  
	maxAzimuth			= 45.0;   
	rotOffsetX			= 0.0;
	rotOffsetY			= -20.0;
};


INSTANCE CamModInventory(CCamSys_Def)
{
	bestrange = 2.200000000;
    minrange = 2.900000095;
    maxrange = 3.099999905;
    bestelevation = 20.000000000;
    maxelevation = 90.000000000;
    bestazimuth = 0.000000000;
    minazimuth = -90.000000000;
    maxazimuth = 90.000000000;
    rotoffsetx = 0.000000000;
    rotoffsety = 0.000000000;
};


INSTANCE CAMMODMELEE (CCAMSYS_DEF)
{
	bestRange 			= 2.5 ;  
	minRange  			= 1.4 ;  
	maxRange  			= 6.0 ;  
	bestElevation		= 35.0 ;
	minElevation		= 0.0;
	maxElevation		= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 20.0;   
	rotOffsetY			= 0.0;  
};

INSTANCE CamModMeleeMult(CCamSys_Def)
{
	bestRange 			= 6.0 ;
	minRange  			= 2.5 ;
	maxRange  			= 10.0 ;
	bestElevation		= 15.0 ;
	minElevation		= 0.0;
	maxElevation		= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
};


INSTANCE CamModRanged(CCamSys_Def)
{
	bestRange 			= 3.5 ; 
	minRange  			= 2.0 ; 
	maxRange  			= 4.5 ; 
	bestElevation		= 45.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0; 
	bestAzimuth			= 30.0;  
	minAzimuth			= -30.0;
	maxAzimuth			= 30.0; 
	rotOffsetX			= 20.0; 
	rotOffsetY			= 0.0;  
};


INSTANCE CamModMagic(CCamSys_Def)
{
	bestRange 			= 2.5 ;  
	minRange  			= 1.4 ;  
	maxRange  			= 6.0 ;  
	bestElevation		= 35.0 ;
	minElevation		= 0.0;
	maxElevation		= 89.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 20.0;   
	rotOffsetY			= 0.0;  
};


INSTANCE CamModSwim(CCamSys_Def)
{
	bestRange 			= 3.0 ;
	minRange  			= 2.9 ;
	maxRange  			= 3.1 ;
	bestElevation		= 20.0 ;
	minElevation		= 10.0;
	maxElevation		= 45.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -45.0;
	maxAzimuth			= 45.0;
	rotOffsetX			= 15.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModDive(CCamSys_Def)
{
	bestRange 			= 3.0 ;
	minRange  			= 3.0 ;
	maxRange  			= 3.0 ;
	bestElevation		= -20.0 ;
	minElevation		= -60.0;
	maxElevation		= -10.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -45.0;
	maxAzimuth			= 45.0;
	rotOffsetX			= -10.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModJump(CCamSys_Def)
{
	bestRange 			= 2.0 ; 
	minRange  			= 1.0 ; 
	maxRange  			= 2.5 ; 
	bestElevation		= 35.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
};


INSTANCE CamModJumpUp(CCamSys_Def)
{
	bestRange 			= 2.0 ;
	minRange  			= 1.0 ;
	maxRange  			= 2.5 ;
	bestElevation		= -30.0 ;
	minElevation		= -90.0;
	maxElevation		= 0.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0;
};


INSTANCE CamModClimb(CCamSys_Def)
{
	bestRange 			= 2.0 ;
	minRange  			= 1.5 ;
	maxRange  			= 2.5 ;
	bestElevation		= 30.0 ;
	minElevation		= -90.0;
	maxElevation		= 90.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0;
};


INSTANCE CamModFall(CCamSys_Def)
{
	bestRange 			= 2.0 ;
	minRange  			= 1.5 ;
	maxRange  			= 2.5 ;
	bestElevation		= 60.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -30.0;
	maxAzimuth			= 30.0;
	rotOffsetX			= -10.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModDeath(CCamSys_Def)
{
	bestRange 			= 3.0 ;
	minRange  			= 2.0 ;
	maxRange  			= 10.0 ;
	bestElevation		= 80.0 ;
	minElevation		= 0.0;
	maxElevation		= 90.0;
	bestAzimuth			= 180.0;
	minAzimuth			= -89.0;
	maxAzimuth			= 89.0;
	rotOffsetX			= 0.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModFocus(CCamSys_Def)
{
	bestRange 			= 2.5 ; 
	minRange  			= 1.9 ; 
	maxRange  			= 3.5 ; 
	bestElevation			= 25.0 ;
	minElevation			= 0.0;
	maxElevation			= 90.0; 
	bestAzimuth			= 45.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 0.0; 
	rotOffsetY			= 0.0;  
};


// MOBSI Cam-Modes

// DEFAULT
INSTANCE CamModMOBDefault(CCamSys_Def)
{
	bestRange 			= 2.0 ; 
	minRange  			= 1.4 ; 
	maxRange  			= 3.0 ; 
	bestElevation		= 35.0 ;
	minElevation		= 15.0;
	maxElevation		= 90.0; 
	bestAzimuth			= 45.0;  
	minAzimuth			= 0.0;
	maxAzimuth			= 90.0; 
	rotOffsetX			= 0.0; 
	rotOffsetY			= 5.0;  
};

// Tür aufziehen (FRONT)
INSTANCE CAMMODMOBDOOR_FRONT (CCAMSYS_DEF)
{
     bestrange = 1.250000000;
     minrange = 0.750000000;
     maxrange = 2.000000000;
     bestelevation = 40.000000000;
     maxelevation = 90.000000000;
     minelevation = 30.000000000;
     bestazimuth = 45.000000000;
     minazimuth = 30.000000000;
     maxazimuth = 60.000000000;
     rotoffsetx = 30.000000000;
     rotoffsety = -40.000000000;
};

// Tür aufstossen (BACK)
INSTANCE CAMMODMOBDOOR_BACK (CCAMSYS_DEF)
{
     bestrange = 1.250000000;
     minrange = 0.750000000;
     maxrange = 2.000000000;
     bestelevation = 40.000000000;
     maxelevation = 60.000000000;
     minelevation = 30.000000000;
     bestazimuth = -45.000000000;
     minazimuth = -30.000000000;
     maxazimuth = -60.000000000;
     rotoffsetx = 30.000000000;
     rotoffsety = 40.000000000;
};

// Leiterbenutzung
INSTANCE CAMMODMOBLADDER (CCAMSYS_DEF)
{
     bestrange = 3.50000000;
     minrange = 1.500000000;
     maxrange = 6.000000000;
     bestelevation = 0.000000000;
     maxelevation = 30.000000000;
     minelevation = -30.000000000;
     bestazimuth = 0.000000000;
     minazimuth = -90.000000000;
     maxazimuth = 90.000000000;
     rotoffsetx = 0.000000000;
     rotoffsety = 0.000000000;
};

// Betten

// Schema: BED_FRONT)
INSTANCE CAMMODMOBBED_FRONT (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
     rotoffsetx = 0.000000000;
     rotoffsety = 0.000000000;
};
// Schema: BED_BACK)
INSTANCE CAMMODMOBBED_BACK (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};

// Schema: BEDHIGH_FRONT
INSTANCE CAMMODMOBBEDHIGH_FRONT (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};
// Schema: BEDHIGH_BACK
INSTANCE CAMMODMOBBEDHIGH_BACK (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};

// Schema: BEDLOW_FRONT
INSTANCE CAMMODMOBBEDLOW_FRONT (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};
// Schema: BEDLOW_BACK
INSTANCE CAMMODMOBBEDLOW_BACK (CCAMSYS_DEF)
{
     bestrange = 2.00000000;
     minrange = 1.000000000;
     maxrange = 3.000000000;
     bestelevation = 80.000000000;
     maxelevation = 90.000000000;
     minelevation = 60.000000000;
     bestazimuth = 90.000000000;
     minazimuth = 0.000000000;
     maxazimuth = 180.000000000;
};

// auf Stuhl sitzen (CHAIR)
/*	[EDENFELD] Auskommentiert. Macht noch Probs...
INSTANCE CAMMODMOBCHAIR (CCAMSYS_DEF)
{
     bestrange = 1.50000000;
     minrange = 0.500000000;
     maxrange = 2.500000000;
     bestelevation = -10.000000000;
     minelevation = 30.000000000;
     maxelevation = 90.000000000;
     bestazimuth = 180.000000000;
     minazimuth = -180.000000000;
     maxazimuth = 180.000000000;
     rotoffsetx = 0.000000000;
};
*/
// auf Bank sitzen (BENCH)
INSTANCE CAMMODMOBBENCH (CCAMSYS_DEF)
{
     bestrange = 1.20000000;
     minrange = 0.500000000;
     maxrange = 1.900000000;
     bestelevation = 10.000000000;
     minelevation = 30.000000000;
     maxelevation = 90.000000000;
     bestazimuth = 0.000000000;
     minazimuth = -180.000000000;
     maxazimuth = 180.000000000;
     rotoffsetx = 0.000000000;
};

// im Faß verstecken
INSTANCE CAMMODMOBBARRELO (CCAMSYS_DEF)
{
     bestrange = 1.5000000;
     minrange = 0.500000000;
     maxrange = 3.000000000;
     bestelevation = 75.000000000;
     maxelevation = 90.000000000;
     minelevation = 0.000000000;
     bestazimuth = -30.000000000;
     minazimuth = -90.000000000;
     maxazimuth = 90.000000000;
     rotoffsetx = 20.000000000;
     rotoffsety = 0.000000000;
};

// internal Cameras. Change at own risk

// Firstperson Camera
// bis auf die Trägheitsconstanten indolenceTrans & indolenceHead sind die Vars irrelevant
// vielleicht sind auch noch andere Parameter sinnvoll

INSTANCE CamModFirstPerson(CCamSys_Def)
{
	bestRange 			= 2.0 ; 
	minRange  			= 1.5 ;
	maxRange  			= 2.5 ;
	bestElevation		= 0.0 ;
	minElevation		= -90.0;
	maxElevation		= 90.0;
	bestAzimuth			= 0.0;
	minAzimuth			= -45.0;
	maxAzimuth			= 45.0;
	rotOffsetX			= 60.0;
	rotOffsetY			= 0.0;
};


INSTANCE CamModLook(CCamSys_Def)
{
	bestRange 			= 3.0 ; 
	minRange  			= 1.5 ; 
	maxRange  			= 6.5 ; 
	bestElevation		= 30.0 ;
	minElevation		= -55.0;
	maxElevation		= 80.0; 
	bestAzimuth			= 0.0;  
	minAzimuth			= -90.0;
	maxAzimuth			= 90.0; 
	veloTrans			= 5;
};


INSTANCE CamModRangedShort(CCamSys_Def)
{
	bestRange 			= 0.5 ;
	minRange  			= 0.4 ;
	maxRange  			= 1.2 ;
	bestElevation		= 60.0 ;
	minElevation		= 40.0;
	maxElevation		= 90.0;		// CHANGED
	bestAzimuth			= 34.0;
	minAzimuth			= 34.0;
	maxAzimuth			= 34.0;
	rotOffsetX			= 55.0;
	rotOffsetY			= -27.0;
};

INSTANCE CamModShoulder(CCamSys_Def)
{
	bestRange 			= 0.75 ;
	minRange  			= 0.4 ;
	maxRange  			= 1.2 ;
	bestElevation		= 80.0 ;
	minElevation		= 40.0;
	maxElevation		= 90.0;		// CHANGED
	bestAzimuth			= 90.0;
	minAzimuth			= 0.0;
	maxAzimuth			= 0.0;
};

