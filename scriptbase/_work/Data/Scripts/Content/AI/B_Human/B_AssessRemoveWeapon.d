func void B_AssessRemoveWeapon ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "B_AssessRemoveWeapon" );	
	
	C_StopLookAt		(self);
	B_RemoveWeapon	 	(self);

	if (Npc_GetDistToNpc(self,other) < PERC_DIST_DIALOG)
	{
		B_Say 			(self, other,  "$WISEMOVE");
	};

	AI_ContinueRoutine 	(self);
};

