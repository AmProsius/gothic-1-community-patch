func void ZS_High ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_High" );
	NPC_PercEnable  ( self,PERC_ASSESSDEFEAT,ZS_AssessDefeat);
	NPC_PercEnable  (self, PERC_ASSESSTALK,B_RefuseTalk );
};

func void ZS_High_Loop ()
{
	PrintDebugNpc (PD_TA_LOOP,"ZS_High_Loop" );

};

func void ZS_High_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_High_End" );
};