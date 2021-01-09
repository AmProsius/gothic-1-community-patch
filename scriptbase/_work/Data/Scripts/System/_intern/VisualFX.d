	
//////////////////////////////////////
//	
// 	Visual-Effects	v0.02
//	Class - Definition
//	Author: Carsten Edenfeld
//	
//////////////////////////////////////

const int VFX_NUM_USERSTRINGS = 3;

CLASS C_ParticleFXEmitKey {

	// particle effect related key vars

	// vars which influence all particles all time
	VAR STRING	visName_S;
	VAR FLOAT   visSizeScale;
	VAR FLOAT   scaleDuration;						// time to reach full scale at this key for relevant vars (size, alpha, etc.)

	VAR FLOAT	pfx_ppsValue;
	VAR INT		pfx_ppsIsSmoothChg;					// changes pps smoothing of pfx if set to 1 and pfx pps scale keys are set
	VAR INT     pfx_ppsIsLoopingChg;					// changes looping of pfx if set to 1
	VAR FLOAT	pfx_scTime;
	VAR STRING	pfx_flyGravity_S;

	// vars which influence particles at creation level only
	VAR STRING	pfx_shpDim_S;
	VAR INT		pfx_shpIsVolumeChg;					// changes volume rendering of pfx if set to 1
	VAR FLOAT	pfx_shpScaleFPS;
	VAR FLOAT	pfx_shpDistribWalkSpeed;
	VAR STRING	pfx_shpOffsetVec_S;
	VAR STRING	pfx_shpDistribType_S;
	VAR STRING	pfx_dirMode_S;
	VAR STRING	pfx_dirFOR_S;
	VAR STRING	pfx_dirModeTargetFOR_S;
	VAR STRING	pfx_dirModeTargetPos_S;
	VAR FLOAT	pfx_velAvg;
	VAR FLOAT	pfx_lspPartAvg;
	VAR FLOAT	pfx_visAlphaStart;

	VAR STRING	lightPresetName;
	VAR FLOAT	lightRange;
	VAR STRING	sfxID;
	VAR INT		sfxIsAmbient;
	VAR STRING	emCreateFXID;

	VAR float	emFlyGravity;
	VAR STRING	emSelfRotVel_S;
	VAR STRING	emTrjMode_S;
	VAR FLOAT	emTrjEaseVel;
	VAR INT		emCheckCollision;
	VAR FLOAT	emFXLifeSpan;
};


CLASS CFx_Base {

	VAR STRING	visName_S;
	VAR STRING	visSize_S;
	VAR FLOAT	visAlpha;
	VAR STRING	visAlphaBlendFunc_S;
	VAR FLOAT   visTexAniFPS;
	VAR INT     visTexAniIsLooping;
	VAR STRING	emTrjMode_S;						// none, target, line, spline, random
	VAR STRING	emTrjOriginNode;
	VAR STRING	emTrjTargetNode;
	VAR FLOAT   emTrjTargetRange;
	VAR FLOAT	emTrjTargetAzi;
	VAR FLOAT   emTrjTargetElev;
	VAR INT		emTrjNumKeys;
	VAR INT		emTrjNumKeysVar;
	VAR FLOAT	emTrjAngleElevVar;
	VAR FLOAT	emTrjAngleHeadVar;
	VAR FLOAT	emTrjKeyDistVar;
	VAR STRING  emTrjLoopMode_S;
	VAR STRING  emTrjEaseFunc_S;
	VAR FLOAT	emTrjEaseVel;
	VAR FLOAT	emTrjDynUpdateDelay;
	VAR INT		emTrjDynUpdateTargetOnly;
	VAR STRING	emFXCreate_S;
	VAR STRING	emFXInvestOrigin_S;
	VAR STRING	emFXInvestTarget_S;
	VAR FLOAT	emFXTriggerDelay;
	VAR INT		emFXCreatedOwnTrj;
	VAR STRING  emActionCollDyn_S;			// CREATE, BOUNCE, CREATEONCE, NORESP, COLLIDE
	VAR STRING  emActionCollStat_S;			// CREATE, BOUNCE, CREATEONCE, NORESP, COLLIDE, CREATEQUAD
	VAR STRING	emFXCollStat_S;
	VAR STRING	emFXCollDyn_S;
	VAR STRING	emFXCollStatAlign_S;			// TRAJECTORY, COLLISIONNORMAL
	VAR STRING	emFXCollDynAlign_S;
	VAR FLOAT	emFXLifeSpan;
	VAR INT		emCheckCollision;
	VAR INT		emAdjustShpToOrigin;
	VAR FLOAT	emInvestNextKeyDuration;
	VAR FLOAT	emFlyGravity;
	VAR STRING  emSelfRotVel_S;
	VAR STRING  userString[VFX_NUM_USERSTRINGS];
	VAR STRING	lightPresetName;
	VAR STRING	sfxID;
	VAR INT 	sfxIsAmbient;
	VAR INT		sendAssessMagic;
	VAR float	secsPerDamage;
	
};

PROTOTYPE CFx_Base_Proto(CFx_Base) {

	visName_S			= "";
	visAlpha			= 1;
	emTrjMode_S			= "FIXED";		// none, target, line, spline, random
	emTrjOriginNode			= "ZS_RIGHTHAND";
	emTrjTargetNode			= "";
	emTrjTargetRange		= 10;
	emTrjTargetAzi			= 0;
	emTrjTargetElev			= 0;
	emTrjNumKeys			= 10;
	emTrjNumKeysVar			= 0;
	emTrjAngleElevVar		= 0;
	emTrjAngleHeadVar		= 0;
	emTrjKeyDistVar			= 0;
	emTrjLoopMode_S			= "NONE";
	emTrjEaseFunc_S			= "LINEAR";
	emTrjEaseVel			= 100;
	emTrjDynUpdateDelay		= 2000000;
	emTrjDynUpdateTargetOnly	= 0;
	emFXCreate_S			= "";
	emFXTriggerDelay		= 0;
	emFXCreatedOwnTrj		= 0;
	emActionCollDyn_S		= "";			// CREATE, BOUNCE
	emActionCollStat_S		= "";			// CREATE, BOUNCE
	emFXCollStat_S			= "";
	emFXCollDyn_S			= "";
	emFXCollStatAlign_S		= "";			// TRAJECTORY, COLLISIONNORMAL
	emFXCollDynAlign_S		= "";
	emCheckCollision		= 0;
	emAdjustShpToOrigin		= 0;
	emInvestNextKeyDuration		= 0;
	emFlyGravity			= 0;
	emFXLifeSpan			= -1;			// -1: forever 
	emSelfRotVel_S			= "0 0 0";
	lightPresetName			= "";
	sfxID					= "";
	sendAssessMagic			= 0;
	secsPerDamage			= -1;
};

