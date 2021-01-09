func void B_Orc_AssessDamage()
{
	PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssessDamage" );
	
	AI_TurnToNpc( self, other );
	
	//wenn Gegner weit weg, hinspringen!
	if ( Npc_GetDistToNpc( self, other ) > 500 )
	{
		PrintDebugNpc( PD_ORC_FRAME, "B_Orc_AssessDamage: Gegner weit weg -> hinspringen" );
		AI_PlayAni( self, "T_STAND_2_JUMP" );		
	};

	B_FullStop			(self);
	Npc_SendPassivePerc	(self,	PERC_ASSESSWARN,	self, 	other);

	Npc_SetTempAttitude	(self,	ATT_HOSTILE );
	Npc_SetTarget		(self,	other);
	AI_StartState		(self,	ZS_Orc_Attack, 0, "" );
};