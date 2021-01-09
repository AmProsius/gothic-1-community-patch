//////////////////////////////////////////////////////////////////////////
//	B_AssessItem
//	============
//	Wird durch die aktive Wahrnehmung PERC_ASSESSITEM
//		
//////////////////////////////////////////////////////////////////////////
func void B_AssessItem ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "B_AssessItem" );
	PrintGLobals		(PD_ZS_FRAME);
	AI_LookAt 			(self,	item.name);
	self.aivar[AIV_WANTEDITEM] = Hlp_GetInstanceId (item);
	
	
	///////////Testdaten/////////////////////////////
	var string	wanteditem; wanteditem = IntToString	(self.aivar[AIV_WANTEDITEM]); PrintDebugNpc (PD_ZS_FRAME,wanteditem);
	///////////Testdaten/////////////////////////////
	
	if (Npc_GetDistToItem (self, item) < PERC_DIST_DIALOG)
	{
		PrintDebugNpc	(PD_ZS_FRAME, "...item in Dialogreichweite!");
		if (C_WantItem())
		{
			Npc_ClearAIQueue(self);
			AI_StartState	(self,	ZS_AssessItem, 0, "");
		};

		AI_Wait			(self,	1);		
	};
	// JP: StopLookAt hier, weil er sonst nicht abgebrochen wurde, wenn das Item zu weit weg war
	C_StopLookAt	(self);
	self.aivar[AIV_WANTEDITEM] = 0;
};
