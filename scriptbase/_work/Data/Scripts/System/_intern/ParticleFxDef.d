	
//////////////////////////////////////
//	
// 	Particle-Effects	v0.01 (<=>Docs)
//	Class - Definitions 
//	Author: Dieter Hildebrandt
//	
//////////////////////////////////////

CLASS C_ParticleFX {

	// 1) Emitter: zeitliches  Austoss-Verhalten, particles-per-second
	VAR FLOAT					ppsValue;
	VAR STRING					ppsScaleKeys_S;
	VAR INT						ppsIsLooping;
	VAR INT						ppsIsSmooth;
	VAR FLOAT					ppsFPS;
	VAR STRING					ppsCreateEm_S;
	VAR FLOAT					ppsCreateEmDelay;

	// 2) Emitter: raeumliches Austoss-Verhalten
	VAR STRING					shpType_S;					//	"point, line, box, circle, sphere, mesh"
	VAR STRING					shpFOR_S;					//	"object,world"
	VAR STRING					shpOffsetVec_S;
	VAR STRING					shpDistribType_S;				//	"RAND, UNIFORM, WALK"
	VAR FLOAT					shpDistribWalkSpeed;
	VAR INT						shpIsVolume;
	VAR STRING					shpDim_S;					//	"", "30", "10 20 30", "30", "30", "" //	line: nur 1 Dimension !=0 // shape Dimensions
	VAR STRING					shpMesh_S;					//	"cross.3ds"
	VAR INT						shpMeshRender_B;
	VAR STRING					shpScaleKeys_S;				//	"[1.0] [0.8 0.9 0.2] [1.0]"
	VAR INT						shpScaleIsLooping;
	VAR INT						shpScaleIsSmooth;
	VAR FLOAT					shpScaleFPS;

	// 3) Partikel: Start Richtung/Speed:
	VAR STRING					dirMode_S;					//	"DIR, TARGET, MESH_POLY"
	VAR STRING					dirFOR_S;					//	"OBJECT, WORLD"
	VAR STRING					dirModeTargetFOR_S;
	VAR STRING					dirModeTargetPos_S;			//	"30 23 67"
	VAR FLOAT					dirAngleHead;
	VAR FLOAT					dirAngleHeadVar;
	VAR FLOAT					dirAngleElev;
	VAR FLOAT					dirAngleElevVar;
	VAR FLOAT					velAvg;
	VAR FLOAT					velVar;

	// 4) Partikel: Lebensdauer
	VAR FLOAT					lspPartAvg;
	VAR FLOAT					lspPartVar;

	// 5) Partikel: Flugverhalten (gravity, nicht-linear?, mesh-selfRot?,..)
	// grav: a) nur Y, b) XYZ, c) auf Ziel zu steuern
	// VAR STRING  flyMode_S;								//	"LINEAR, LIN_SINUS,.."
	// flyMeshSelfRotSpeedMin, flyMeshSelfRotSpeedMax
	VAR STRING					flyGravity_S;
	VAR INT						flyCollDet_B;

	// 6) Partikel: Visualisierung
	VAR STRING					visName_S;					//	"NAME_V0_A0.TGA/.3DS"	(Variation, Animation)
	VAR STRING					visOrientation_S;			//	"NONE, VELO"
	VAR INT						visTexIsQuadPoly;			//	0=triMesh, 1=quadMesh
	VAR FLOAT					visTexAniFPS;
	VAR INT						visTexAniIsLooping;			//	0=oneShot, 1=looping
	// color		(nur Tex, lifeSpan-Sync)			
	VAR STRING					visTexColorStart_S;
	VAR STRING					visTexColorEnd_S;
	// size-ani		(nur Tex, lifeSpan-Sync)
	VAR STRING					visSizeStart_S;
	VAR FLOAT					visSizeEndScale;
	// alpha		(lifeSpan-Sync)
	VAR STRING					visAlphaFunc_S;
	VAR FLOAT					visAlphaStart;
	VAR FLOAT					visAlphaEnd;

	// 7) misc effects
	
	// trail
	VAR FLOAT					trlFadeSpeed;
	VAR STRING					trlTexture_S;
	VAR FLOAT					trlWidth;

	// marks
	VAR FLOAT					mrkFadeSpeed;
	VAR STRING					mrkTexture_S;
	VAR FLOAT					mrkSize;
};
