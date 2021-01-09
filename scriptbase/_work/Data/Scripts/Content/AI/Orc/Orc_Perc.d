//#####################################################################################
//  Orc-Perceptions

func void OrcSlavePerc()
{
	Npc_PercEnable( self, PERC_ASSESSDAMAGE,		ZS_OrcSlave_AssessDamage	);
	Npc_PercEnable( self, PERC_OBSERVEINTRUDER,		B_OrcSlave_Quicklook		);	
	Npc_PercEnable( self, PERC_DRAWWEAPON,			B_OrcSlave_Quicklook		);
	Npc_PercEnable( self, PERC_ASSESSSURPRISE,		B_OrcSlave_Quicklook		);

};

func void OrcDefaultPerc()
{
	//der olle Sklave tut fast nix
	if ( self.guild == GIL_ORCSLAVE )
	{
		OrcSlavePerc();
		return;
	}
	else
	{
		ObservingPerception();	// Menschen-AI !!!
	};
};


// beschaeftigt und laesst sich kaum stoeren
func void OrcDefaultPercDoing()
{
	//der olle Sklave tut fast nix
	if ( self.guild == GIL_ORCSLAVE )
	{
		OrcSlavePerc();
		return;
	}
	else
	{
		OccupiedPerception();	// Menschen-AI !!!
	};
};


//////////////////////////////////////////////////////////////////////////
//	DeepSleepPerception
//	===================
//	Minimalste Wahrnehmungen während eines tiefen Schlafes. Diese Jungs
//	wachen wirklich nur bei Schaden am eigenen Körper auf.
//////////////////////////////////////////////////////////////////////////
func void OrcDeepSleepPerc()
{
	//der olle Sklave tut fast nix
	if ( self.guild == GIL_ORCSLAVE )
	{
		OrcSlavePerc();
		return;
	}
	else
	{
		DeepSleepPerception();	// Menschen-AI !!!
	};
};	


//////////////////////////////////////////////////////////////////////////
//	LightSleepPerception
//	====================
//	Unruhiger Schlaf, der von der geringsten Störung unterbrochen wird.
//////////////////////////////////////////////////////////////////////////

func void OrcLightSleepPerc()
{
	//der olle Sklave tut fast nix
	if ( self.guild == GIL_ORCSLAVE )
	{
		OrcSlavePerc();
		return;
	}
	else
	{
		LightSleepPerception();	// Menschen-AI !!!
	};
};	
