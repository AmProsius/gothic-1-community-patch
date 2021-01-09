// SFX.D
// Soundsystem related preferences & Class-Definitions

CONST STRING PROV_DOLBY_SURR	= "Dolby Surround";
CONST STRING PROV_A3D		= "Aureal A3D Interactive(TM)";
CONST STRING PROV_D3D_HW	= "DirectSound3D Hardware Support";
CONST STRING PROV_D3D_SW	= "DirectSound3D Software Emulation";
CONST STRING PROV_D3D_EAX	= "DirectSound3D with Creative Labs EAX(TM)";
CONST STRING PROV_D3D7_FULL_HRTF= "DirectSound3D 7+ Software - Full HRTF";
CONST STRING PROV_D3D7_LIGHT_HRTF="DirectSound3D 7+ Software - Light HRTF";
CONST STRING PROV_D3D7_PAN	= "DirectSound3D 7+ Software - Pan and Volume";
CONST STRING PROV_EAX		= "Creative Labs EAX (TM)";
CONST STRING PROV_EAX2		= "Creative Labs EAX 2 (TM)";
CONST STRING PROV_MILES_2D	= "Miles Fast 2D Positional Audio";
CONST STRING PROV_RSX		= "RAD Game Tools RSX 3D Audio";



CLASS C_SNDSYS_CFG
{
	VAR FLOAT	volume;
	VAR INT		bitResolution;
	VAR INT		sampleRate;
	VAR INT		useStereo;
	VAR INT		numSFXChannels;
	VAR STRING  	used3DProviderName;
};

// Base Class
CLASS C_SFX
{
    VAR STRING      file;				// sfx filename
    VAR INT         pitchOff;			// pitchoffset in semitones
    VAR INT         pitchVar;			// semitone-variance
    VAR INT         vol;				// 0..1
    VAR INT         loop;				// 0/1
    VAR INT	    loopStartOffset;
    VAR INT	    loopEndOffset;
    VAR FLOAT       reverbLevel;		// 0..1
    VAR STRING	    pfxName;
};

// SFX Prototype with default parameters
PROTOTYPE C_SFX_DEF(C_SFX)
{
    	file                    = "";
    	pitchOff                = 0;
    	pitchVar                = 0;
    	vol                     = 127;   // 0..127
 	loop                    = 0;	 // 0=off; 1=on
	loopStartOffset		= 0;
	loopEndOffset		= -1;
	reverbLevel		= 1;
};

INSTANCE sndSysConfig(C_SNDSYS_CFG)
{
	volume 			= 1;   		// 0..1
	bitResolution		= 16;		// 8 / 16
	sampleRate		= 22100;	// 11050 - 44100 prefered
	useStereo		= 1;		// 1 / 0			// Must be enabled for various 3d provider!!
	numSFXChannels		= 16;		// 1 - 32
	used3DProviderName  	= PROV_MILES_2D;
};
