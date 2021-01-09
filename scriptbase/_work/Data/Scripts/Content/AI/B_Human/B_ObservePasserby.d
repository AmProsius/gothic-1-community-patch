func void B_ObservePasserby()
{		
	if ( ! C_LookAtNpc( self, other ) ) {
		C_StopLookAt( self );
	};		
};


