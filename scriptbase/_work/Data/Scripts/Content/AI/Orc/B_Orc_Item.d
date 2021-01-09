//######################################################################################
// item: Alarmhorn
func void B_Orc_ItemHorn()
{
	PrintDebugNpc( PD_TA_FRAME,"B_Orc_ItemHorn" );
	if ( Npc_HasItems( self, ItMiAlarmhorn ) )
	{
		//evtl. Waffe wegpacken
		if ( Npc_HasReadiedWeapon( self ) )
		{
			AI_RemoveWeapon( self );
		};
	
		AI_SetWalkmode( self, NPC_WALK );
	
		if ( Npc_GetBodyState( self ) != BS_ITEMINTERACT )
		{
			AI_UseItemToState( self, ItMiAlarmhorn, 1 );
		};
		AI_UseItemToState( self, ItMiAlarmhorn, -1 );
	};

};



//######################################################################################
// item: Futter fassen
func void B_Orc_ItemEat()
{
	PrintDebugNpc( PD_TA_FRAME, "B_Orc_ItemEat" );
	
	//evtl. Waffe wegpacken
	if ( Npc_HasReadiedWeapon( self ) )
	{
		AI_RemoveWeapon( self );
	};
	
	//Guten Appetitt
	if ( Hlp_Random ( 10 ) < 5 )
	{
		if (Npc_HasItems (self,ItFoCheese) == 0)
		{
			CreateInvItem (self,ItFoCheese);
		};
		if ( Npc_GetBodyState( self ) != BS_ITEMINTERACT )
		{
			AI_UseItemToState( self, ItFoCheese, 1 );
		};
		AI_UseItemToState( self, ItFoCheese, -1 );
	}
	else
	{
		if (Npc_HasItems (self,ItFoLoaf) == 0)
		{
			CreateInvItem (self,ItFoLoaf);
		};
		if ( Npc_GetBodyState( self ) != BS_ITEMINTERACT )
		{
			AI_UseItemToState( self, ItFoLoaf, 1 );
		};
		AI_UseItemToState( self, ItFoLoaf, -1 );
	};
	

};


//######################################################################################
// item: Potion trinken
func void B_Orc_ItemPotion()
{
	PrintDebugNpc( PD_TA_FRAME,"B_Orc_ItemPotion" );

	//evtl. Waffe wegpacken
	if ( Npc_HasReadiedWeapon( self ) )
	{
		AI_RemoveWeapon( self );
	};

	
	//evtl. in Inv packen
	if ( !Npc_HasItems( self, ItFoWine ) )
	{
		CreateInvItem( self, ItFoWine );
	};	
	
	//Prost
	if ( Npc_GetBodyState( self ) != BS_ITEMINTERACT )
	{
		EquipItem( self, ItFoBeer );
		AI_UseItemToState( self, ItFoWine, 1 );
	};
	AI_UseItemToState( self, ItFoWine, -1 );

};
