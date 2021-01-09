func void ZS_TestArming ()
{
};	

func void ZS_TestArming_Loop ()
{
	Print( "Arming" );
	AI_EquipBestRangedWeapon( self );
	AI_ReadyRangedWeapon	( self );
};

func void ZS_TestArming_End ()
{
};
