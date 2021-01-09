//
// zEngine Music-Script File


// direct music specific motif names
const STRING MOTIF_DEATH					= "J_DEATH";
const STRING MOTIF_RESURRECTION				= "J_RESURRECT";
const STRING MOTIF_FOUNDITEM				= "J_FOUNDITEM";
const STRING MOTIF_SOLVEDMISSION			= "J_MISSOLVED";
const STRING MOTIF_FAILEDMISSION			= "J_MISFAILED";
const STRING MOTIF_KILLEDENEMY				= "J_KILLEDENEMY";
const STRING MOTIF_KILLEDBIGENEMY			= "J_KILLEDBIGENEMY";
const STRING MOTIF_LEVEL_GAIN				= "J_LEVELGAIN";
const STRING MOTIF_ATTITUDE_INCREASE		= "J_INC_AT";
const STRING MOTIF_ATTITUDE_DECREASE		= "J_DEC_AT";
const STRING MOTIF_TRAP_ACTIVATE			= "J_TRAP_ACTIVATE";
const STRING MOTIF_STEAL_FAIL				= "J_STEAL_FAIL";
const STRING MOTIF_REFRESH_MANA				= "J_MANA_REFRESH";
const STRING MOTIF_REFRESH_HEALTH			= "J_HEALTH_REFRESH";
const STRING MOTIF_REFRESH_PSI				= "J_PSI_REFRESH";
const STRING MOTIF_HEALTHLOW				= "J_HEALTH_LOW";


// main transition defines
const INT TRANSITION_TYPE_NONE  = 1;
const INT TRANSITION_TYPE_GROOVE= 2;
const INT TRANSITION_TYPE_FILL  = 3;
const INT TRANSITION_TYPE_BREAK = 4;
const INT TRANSITION_TYPE_INTRO = 5;
const INT TRANSITION_TYPE_END	= 6;
const INT TRANSITION_TYPE_ENDANDINTRO = 7;

// sub transition type defines
const INT TRANSITION_SUB_TYPE_IMMEDIATE = 1;
const INT TRANSITION_SUB_TYPE_BEAT		= 2;
const INT TRANSITION_SUB_TYPE_MEASURE	= 3;


// global music configuration class
CLASS C_MUSICSYS_CFG
{
	VAR float volume;
	VAR INT   bitResolution;
	VAR INT   globalReverbEnabled;
	VAR INT   sampleRate;
	VAR INT   numChannels;
	VAR INT	  reverbBufferSize;
};


// base theme class
CLASS C_MUSICTHEME {

    VAR STRING      file;
	VAR float       vol;
	VAR INT         loop;
	VAR float	reverbMix;
	VAR float	reverbTime;
	VAR INT			transType;
	VAR INT			transSubType;
};

// base jingle class
CLASS C_MUSICJINGLE {
    VAR STRING      name;
	VAR INT         loop;
	VAR float       vol;
	VAR INT			transSubType;
};

// theme Prototype with default parameters
PROTOTYPE C_MUSICTHEME_DEF(C_MUSICTHEME)
{
        //file                    = "";	 // midi file or direct music segment
        vol                     = 1;     // 0..1
        loop                    = 1;	 // 0=off; 1=on
	transType		= TRANSITION_TYPE_NONE;
	transSubType		= TRANSITION_SUB_TYPE_MEASURE;
	reverbMix		= -10;
	reverbTime		= 8500;
};

// jingle Prototype with default parameters
PROTOTYPE C_MUSICJINGLE_DEF(C_MUSICJINGLE)
{
        name                    = "";    // motif - name or wave
        vol                     = 1;     // 0..1
		loop					= 0;
		transSubType			= TRANSITION_SUB_TYPE_BEAT;
};


