	

//////////////////////////////////////

// 	 

//	Cam_sys Class

//	

//////////////////////////////////////

CLASS CCamSys 
{
	// angles -180 to 180 
	VAR FLOAT bestRange;
	VAR FLOAT minRange;
	VAR FLOAT maxRange;
	VAR FLOAT bestElevation;
	VAR FLOAT minElevation;
	VAR FLOAT maxElevation;
	VAR FLOAT bestAzimuth;
	VAR FLOAT minAzimuth;
	VAR FLOAT maxAzimuth;
	VAR FLOAT bestRotZ;
	VAR FLOAT minRotZ;
	VAR FLOAT maxRotZ;
	VAR FLOAT rotOffsetX;
	VAR FLOAT rotOffsetY;
	VAR FLOAT rotOffsetZ;
	VAR FLOAT targetOffsetX;
	VAR FLOAT targetOffsetY;
	VAR FLOAT targetOffsetZ;

	// dynamic 
	VAR	FLOAT veloTrans;				  	// velocity while easing   to best position
	VAR FLOAT veloRot;			  			// velocity while rotating to best orientation

	VAR INT	  translate;			    	// rotate around target, 1: on, 0:off
	VAR INT	  rotate;			    		// rotate around target, 1: on, 0:off
	VAR INT	  collision;					// disable collision for this mode (ideal pos must be near player)
};



PROTOTYPE CCamSys_Def(CCamSys) {

	bestRange 			= 2.0 ; 

	minRange  			= 1.99 ; 

	maxRange  			= 4.01 ; 

	bestElevation			= 0.0 ;

	minElevation			= 0.0;

	maxElevation			= 89.0; 

	bestAzimuth			= 0.0;  

	minAzimuth			= -90.0;

	maxAzimuth			= 90.0; 

	bestRotZ			= 0.0;  

	minRotZ				= 0.0;  

	maxRotZ				= 0.0;  

	rotOffsetX			= 20.0; 

	rotOffsetY			= 0.0;  

	rotOffsetZ			= 0.0;  

	targetOffsetX			= 0.0;
	targetOffsetY			= 0.0;
	targetOffsetZ			= 0.0;

	translate			= 1;    // translate to target, 1: on, 0: off

	rotate				= 1;    // rotate around target, 1: on, 0:off

	collision			= 1;	// disable collision for this mode (ideal pos must be near player)

	// dynamic 
	veloTrans			= 30;				  	// velocity while easing   to best position
	veloRot				= 2;			  		// velocity while rotating to best orientation

};









