// ***********************************************************************************
// News	soll verbreitet	werden ?
// ***********************************************************************************

FUNC INT B_CanNewsBeSpread()
// Beachte : Name der Funktion darf	nicht geändert werden
// News	ist	auf	jeden Fall "Witness" !
// Und ich bin das Opfer..."self" /	"victim"
{
	PrintDebugNpc( PD_ZS_FRAME, "B_CanNewsBeSpread" );
	//if ((self.guild	== GIL_EBR)	|| (self.guild == GIL_GUR) || 
		//(self.guild	== GIL_KDW)	|| (self.guild == GIL_KDF))	{
		// Yes,	spread it, cos i'm muchos importante !
		return 1;
	//};
	//return 0;
};
