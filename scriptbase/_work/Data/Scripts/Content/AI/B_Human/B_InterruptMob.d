func void B_InterruptMob ( var string mobsi)
{
	AI_UseMob	( self, mobsi, -1);
	var int randomize_mob;
	randomize_mob	= Hlp_Random ( 7);
	if (randomize_mob == 1 && (! C_NpcIsBoss (self)))
	{
		AI_PlayAni	( self, "T_BORINGKICK");
	};
	if (randomize_mob == 2)
	{
		AI_PlayAni	( self, "T_SEARCH");
	};
	if (randomize_mob == 3)
	{
		AI_PlayAni	( self, "R_SCRATCHHEAD");
	};
	if (randomize_mob == 4)
	{
		AI_PlayAni	( self, "R_LEGSHAKE");
	};
	if (randomize_mob == 5)
	{
		AI_PlayAni	( self, "R_SCRATCHRSHOULDER");
	};
	if (randomize_mob == 6)
	{
		AI_PlayAni	( self, "R_SCRATCHLSHOULDER");
	};
	Npc_SetStateTime	( self, 0);
	AI_UseMob	( self, mobsi,1);
	self.aivar[AIV_DONTUSEMOB] = 1;
	
};