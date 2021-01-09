func int B_FetchWeapon ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "B_FetchWeapon");	
	Npc_PerceiveAll		(self);
	
	if (Wld_DetectItem	(self, ITEM_KAT_FF ) )
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...Fernkampfwaffe gefunden!");
		if (Npc_GetDistToNpc(self, item) < PERC_DIST_INTERMEDIAT )
		{
			C_StopLookAt(self);
			AI_SetWalkmode( self, NPC_RUN );						
			AI_TakeItem (self,item);		
			AI_EquipBestRangedWeapon(self);
			AI_ReadyRangedWeapon(self);			
		};
		C_LookAtNpc		(self, other);
		return			1;
	};
	
	if (Wld_DetectItem	(self, ITEM_KAT_NF))
	{
		PrintDebugNpc	(PD_ZS_CHECK, "...Nahkampfwaffe gefunden!");
		if (Npc_GetDistToNpc(self, item ) < PERC_DIST_INTERMEDIAT )
		{
			C_StopLookAt( self );
			AI_SetWalkmode( self, NPC_RUN );		
			AI_TakeItem ( self, item );		
			AI_EquipBestMeleeWeapon( self );
			AI_ReadyMeleeWeapon( self );			
		};
		C_LookAtNpc		(self, other );
		return			1;
	};
	
	return 0;
};
	
	