func void ZS_TestInv ()
{
	Npc_PercEnable  ( self,	PERC_ASSESSPLAYER, InvItem );	// sobald der NPC mich sieht ...
};	

func void ZS_TestInv_Loop ()
{
};

func void ZS_TestInv_End ()
{
};

func void InvItem ()
{
	var int bFound;
	bFound = Npc_GetInvItemBySlot( self, INV_ARMOR, 1 ); 		
	if ( bFound != 0 )
	{
		CreateInvItems( other, Hlp_GetInstanceID( item ), 10 );	// ... bekomme ich die gleiche Waffe, wie er in slot 1 hat 10 mal (hehe)
	};
};