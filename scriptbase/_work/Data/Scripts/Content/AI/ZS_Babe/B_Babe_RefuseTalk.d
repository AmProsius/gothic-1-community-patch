func void B_Babe_RefuseTalk()
{
	PrintDebugNpc	( PD_ZS_FRAME, "B_Babe_RefuseTalk" );	

	B_Say   		( self, other, "$NOTNOW");
	AI_StopLookAt	( self);
};


