//////////////////////////////////////////////////////////////////////////
//	ZS_SittingDuck
//	==============
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP
//	und reagiert auf nichts. Wird verwendet, damit der NSC beim
//	herannahen des Spielers von einem nahen Monster sofort mit einem
//	getötet werden kann. 
//////////////////////////////////////////////////////////////////////////
func void ZS_SittingDuck ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_SittingDuck");
	
	//-------- Wahrnehmungen --------
	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	//-------- Vorbereitungen --------
	AI_SetWalkmode			(self,	NPC_WALK);

	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func void ZS_SittingDuck_Loop ()
{
	PrintDebugNpc			(PD_TA_LOOP,	"ZS_SittingDuck_Loop");
	
	AI_Wait					(self,	1);
};

func void ZS_SittingDuck_End ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_SittingDuck_End");
};
