func void ZS_TestKill ()
{
	Npc_PercEnable  ( self,	PERC_ASSESSITEM, KillItem );
};	

func void ZS_TestKill_Loop ()
{
};

func void ZS_TestKill_End ()
{
};

func void KillItem ()
{
	Wld_RemoveItem( item );
};