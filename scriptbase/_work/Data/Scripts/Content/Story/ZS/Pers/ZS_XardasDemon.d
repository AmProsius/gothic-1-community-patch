//////////////////////////////////////////////////////////////////////////
//	ZS_XardasDemon
//	==============
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP
//	und reagiert auf nichts. Wird verwendet, damit der NSC beim
//	herannahen des Spielers von einem nahen Monster sofort mit einem
//	getötet werden kann. 
//////////////////////////////////////////////////////////////////////////
func void ZS_XardasDemon ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_XardasDemon");
	
	//-------- Wahrnehmungen --------
	Npc_PercEnable  		(self, 	PERC_ASSESSPLAYER,	B_AssessSC	);
	Npc_PercEnable			(self,	PERC_ASSESSTALK, 	ZS_Talk		);
	
	//-------- Attitüden --------
	Npc_SetPermAttitude		(self, ATT_FRIENDLY);

	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func void ZS_XardasDemon_Loop ()
{
	PrintDebugNpc			(PD_TA_LOOP,	"ZS_XardasDemon_Loop");
	
	AI_Wait					(self,	1);
};

func void ZS_XardasDemon_End ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_XardasDemon_End");
};
