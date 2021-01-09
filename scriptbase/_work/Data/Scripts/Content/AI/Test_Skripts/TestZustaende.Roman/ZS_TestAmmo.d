func void ZS_TestAmmo ()
{
	Print( "Arming" );
	AI_EquipBestRangedWeapon( self );
	AI_ReadyRangedWeapon	( self );
};	

func void ZS_TestAmmo_Loop ()
{
	Print( "Targeting" );
	var C_NPC enemy;
	enemy = Hlp_GetNpc( SLD3_Testmodell );
	Npc_SetTarget( self, enemy );
	
	Print( "Attacking" );
	AI_Attack( self );
};

func void ZS_TestAmmo_End ()
{
};
