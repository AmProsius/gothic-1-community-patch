//////////////////////////////////////////////////////////////////////////
//	ZS_StayNeutral
//	==============
//	Der NSC steht bei diesem Tagesablauf-Zustand FEST auf seinem WP.
//	Zusätzlich wird der NSC auf NEUTRAL gegenüber dem Spieler gesetzt.
//////////////////////////////////////////////////////////////////////////
func void ZS_StayNeutral ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_StayNeutral");
	
	//-------- Attitüden --------
	Npc_SetAttitude			(self,	ATT_NEUTRAL);
	Npc_SetTempAttitude		(self,	ATT_NEUTRAL);

	//-------- Wahrnehmungen --------
	B_SetPerception			(self);
	self.senses = 			SENSE_SEE|SENSE_HEAR|SENSE_SMELL;

	//-------- Vorbereitungen --------
	if (Npc_HasReadiedWeapon(self))
	{
		AI_SetWalkmode			(self,	NPC_RUN);
	}
	else
	{
		AI_SetWalkmode			(self,	NPC_WALK);
	};
	
	//-------- Grobpositionierung --------
	AI_GotoWP				(self,	self.wp);						// Gehe zum Tagesablaufstart
	AI_AlignToWP			(self);
};

func void ZS_StayNeutral_Loop ()
{
	PrintDebugNpc			(PD_TA_LOOP,	"ZS_StayNeutral_Loop");
	
	AI_Wait					(self,	1);
};

func void ZS_StayNeutral_End ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_StayNeutral_End");
	self.senses	=			hero.senses;
	
	C_StopLookAt			(self);
};
