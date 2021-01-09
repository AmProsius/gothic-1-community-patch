func int C_PCIsInMyRoom ()
{
	PrintDebugNpc( PD_ZS_FRAME, "C_PCIsInMyRoom" );
	var C_Npc owner;
	owner = Wld_GetPlayerPortalOwner ();	
	var int portalowner;
	portalowner = Wld_GetPlayerPortalGuild ();	
 	if ((self == owner) || (Wld_GetGuildAttitude( self.guild, portalowner ) == ATT_FRIENDLY) )
 	{ 		
 		return 1;
 	} 	
 	else
 	{ 		
 		return 0;
 	};
};