func void B_RefuseTalkAngry ()
{
	PrintDebugNpc( PD_ZS_FRAME, "B_RefuseTalkAngry" );
	B_Say 			( self, other, "$NOTNOW");
};