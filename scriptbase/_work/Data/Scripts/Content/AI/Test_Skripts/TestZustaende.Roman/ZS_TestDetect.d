var string strObstacle;
var string strOwner;
var string strGuild;

func void ZS_TestDetect ()
{
  	strObstacle = "None";
  	strOwner    = "Unknown";
  	strGuild    = "Unknown";
};	

func void ZS_TestDetect_Loop ()
{
	//----------------------------------------------------------------
	//-------------------------------------------------- FOLLOW PLAYER
	//----------------------------------------------------------------
	var C_NPC npcPlayer;
	npcPlayer = Hlp_GetNpc( PC_ROCKEFELLER );
	AI_GotoNpc( self, npcPlayer );

	//----------------------------------------------------------------
	//--------------------------------------------- CHECK FOR OBSTACLE
	//----------------------------------------------------------------
	var string strObst;
	strObst = Npc_GetDetectedMob( self );	
	if ( Hlp_StrCmp( strObst, "" ) != TRUE )
	{
		//--------------------------------------------------------
		//------------- OBSTACLE FOUND - DETERMINE OWNER AND GUILD
		//--------------------------------------------------------
		strObstacle 	= strObst;

		//--------------------------------------------------------
		//--------------------------- DOES IT BELONG TO SNAPPERS ?
		//--------------------------------------------------------
		var C_NPC npcSnapper;
		npcSnapper = Hlp_GetNpc( SNAPPER );
		
		if ( Npc_IsDetectedMobOwnedByNpc(self, npcSnapper) )
		{
			strOwner = "Snapper";
		};

		if ( Npc_IsDetectedMobOwnedByGuild(self, npcSnapper.guild) )
		{
			strGuild = "Snappers' Guild";
		};
	};
	
	//----------------------------------------------------------------
	//---------------------------------------------- SHOW INFO STRINGS
	//----------------------------------------------------------------
	Print( ConcatStrings( "Name : ", strObstacle 	) );
	Print( ConcatStrings( "Owner: ", strOwner	) );
	Print( ConcatStrings( "Guild: ", strGuild	) );
};

func void ZS_TestDetect_End ()
{
};
