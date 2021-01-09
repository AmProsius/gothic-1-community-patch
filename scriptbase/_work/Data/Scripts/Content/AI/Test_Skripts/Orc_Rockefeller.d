INSTANCE Orc_Rockefeller (Mst_Default_OrcWarrior)
{
	//-------- primary data	--------
	name						=		"Orc Rockefeller";
	Set_OrcWarrior_Visuals();
	

	
//----------------------------------------
//Food.d
//----------------------------------------
	CreateInvItems(self,ItFo_mutton_01,20);		
	CreateInvItems(self,ItFoApple,5);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,20);
	CreateInvItems(self,ItFoCheese,5);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoSoup,5);
	CreateInvItems(self,ItFoMeatbugragout,5);
	CreateInvItems(self,ItFoCrawlersoup,5);
	CreateInvItems(self,ItFoBooze,10);
	CreateInvItems(self,ItFoWine,5);
	CreateInvItems(self,ItFo_wineberrys_01,5);
	CreateInvItems(self,ItFoBeer,5);
	
//PFLANZEN
	CreateInvItems(self,ItFo_Plants_Trollberrys_01,5);
	CreateInvItems(self,ItFo_Plants_Flameberry_01,5);
	CreateInvItems(self,ItFo_Plants_Nightshadow_01,5);
	CreateInvItems(self,ItFo_Plants_Nightshadow_02,5);
	CreateInvItems(self,ItFo_Plants_OrcHerb_01,5);
	CreateInvItems(self,ItFo_Plants_OrcHerb_02,5);
	CreateInvItems(self,ItFo_Plants_mushroom_01,5);
	CreateInvItems(self,ItFo_Plants_mushroom_02,5);
	CreateInvItems(self,ItFo_Plants_Stoneroot_01,5);
	CreateInvItems(self,ItFo_Plants_Stoneroot_02,5);
	CreateInvItems(self,ItFo_Plants_RavenHerb_01,5);
	CreateInvItems(self,ItFo_Plants_RavenHerb_02,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_01,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_02,5);
	CreateInvItems(self,ItFo_Plants_Berrys_01,5);
	CreateInvItems(self,ItFo_Plants_Bloodwood_01,5);
	CreateInvItems(self,ItFo_Plants_Towerwood_01,5);
	CreateInvItems(self,ItFo_Plants_Seraphis_01,5);
	CreateInvItems(self,ItFo_Plants_Velayis_01,5);
	CreateInvItems(self,ItFo_Plants_Herb_03,5);
	CreateInvItems(self,ItFo_Plants_Herb_02,5);
	CreateInvItems(self,ItFo_Plants_Herb_01,5);
	CreateInvItems(self,ItMi_Plants_Swampherb_01,5);

//---------------------------------------------------------------------
//Potions
//---------------------------------------------------------------------
	CreateInvItem(self,ItFo_Potion_Mana_01);
	CreateInvItem(self,ItFo_Potion_Mana_02);
	CreateInvItem(self,ItFo_Potion_Mana_03);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItFo_Potion_Health_02);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,ItFo_Potion_Elixier);
	CreateInvItem(self,ItFo_Potion_Elixier_Egg);
	CreateInvItem(self,ItFo_Potion_Strength_01);
	CreateInvItem(self,ItFo_Potion_Strength_02);
	CreateInvItem(self,ItFo_Potion_Strength_03);
	CreateInvItem(self,ItFo_Potion_Dex_01);
	CreateInvItem(self,ItFo_Potion_Dex_02);
	CreateInvItem(self,ItFo_Potion_Dex_03);
	CreateInvItem(self,ItFo_Potion_Health_Perma_01);
	CreateInvItem(self,ItFo_Potion_Health_Perma_02);
	CreateInvItem(self,ItFo_Potion_Health_Perma_03);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_01);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_02);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_03);
	CreateInvItem(self,ItFo_Potion_Master_01);
	CreateInvItem(self,ItFo_Potion_Master_02);
	CreateInvItem(self,ItFo_Potion_Water_01);
	CreateInvItem(self,ItFo_Potion_Haste_01);

//----------------------------------------
//Light_sources.d
//----------------------------------------
	CreateInvItems(self,ItLsTorch,5);
//----------------------------------------
//misc.d
//----------------------------------------
	CreateInvItem(self,ItMiAlarmhorn);
//----------------------------------------
//Ranged_weapons.d
//----------------------------------------
	EquipItem	(self,ItRw_Crossbow_01);
	EquipItem	(self, ItMw2hOrcAxe03);

	CreateInvItem(self,ItMw2hOrcSword01);
	CreateInvItem(self,ItMw2hOrcAxe01);
	CreateInvItem(self,ItMw2hOrcAxe02);
//	CreateInvItem(self,ItMw2hOrcAxe03);
	CreateInvItem(self,ItMw2hOrcMace01);
	
//----------------------------------------
//Ammunition.d
//----------------------------------------
	CreateInvItems(self,ItAmArrow,50);
	CreateInvItems(self,ItAmBolt,50);

	CreateInvItem	(self,	ItArRuneBreathOfDeath);
	CreateInvItems	(self,	ItArScrollSummonGolem,	20);
	CreateInvItem	(self,	ItArRuneFireball);
};


INSTANCE Shaman_Rockefeller (Mst_Default_OrcWarrior)
{
	//-------- primary data	--------
	name						=		"Shaman Rockefeller";
	attribute	[ATR_MANA_MAX] 		=	50;
	attribute	[ATR_MANA] 			=	50;

	fight_tactic					=	FAI_HUMAN_MAGE;
	
	Set_OrcShaman_Visuals();
	

	
//----------------------------------------
//Food.d
//----------------------------------------
	CreateInvItems(self,ItFo_mutton_01,20);		
	CreateInvItems(self,ItFoApple,5);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,20);
	CreateInvItems(self,ItFoCheese,5);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoSoup,5);
	CreateInvItems(self,ItFoMeatbugragout,5);
	CreateInvItems(self,ItFoCrawlersoup,5);
	CreateInvItems(self,ItFoBooze,10);
	CreateInvItems(self,ItFoWine,5);
	CreateInvItems(self,ItFo_wineberrys_01,5);
	CreateInvItems(self,ItFoBeer,5);
	
//PFLANZEN
	CreateInvItems(self,ItFo_Plants_Trollberrys_01,5);
	CreateInvItems(self,ItFo_Plants_Flameberry_01,5);
	CreateInvItems(self,ItFo_Plants_Nightshadow_01,5);
	CreateInvItems(self,ItFo_Plants_Nightshadow_02,5);
	CreateInvItems(self,ItFo_Plants_OrcHerb_01,5);
	CreateInvItems(self,ItFo_Plants_OrcHerb_02,5);
	CreateInvItems(self,ItFo_Plants_mushroom_01,5);
	CreateInvItems(self,ItFo_Plants_mushroom_02,5);
	CreateInvItems(self,ItFo_Plants_Stoneroot_01,5);
	CreateInvItems(self,ItFo_Plants_Stoneroot_02,5);
	CreateInvItems(self,ItFo_Plants_RavenHerb_01,5);
	CreateInvItems(self,ItFo_Plants_RavenHerb_02,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_01,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_02,5);
	CreateInvItems(self,ItFo_Plants_Berrys_01,5);
	CreateInvItems(self,ItFo_Plants_Bloodwood_01,5);
	CreateInvItems(self,ItFo_Plants_Towerwood_01,5);
	CreateInvItems(self,ItFo_Plants_Seraphis_01,5);
	CreateInvItems(self,ItFo_Plants_Velayis_01,5);
	CreateInvItems(self,ItFo_Plants_Herb_03,5);
	CreateInvItems(self,ItFo_Plants_Herb_02,5);
	CreateInvItems(self,ItFo_Plants_Herb_01,5);
	CreateInvItems(self,ItMi_Plants_Swampherb_01,5);

//---------------------------------------------------------------------
//Potions
//---------------------------------------------------------------------
	CreateInvItem(self,ItFo_Potion_Mana_01);
	CreateInvItem(self,ItFo_Potion_Mana_02);
	CreateInvItem(self,ItFo_Potion_Mana_03);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItFo_Potion_Health_02);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,ItFo_Potion_Elixier);
	CreateInvItem(self,ItFo_Potion_Elixier_Egg);
	CreateInvItem(self,ItFo_Potion_Strength_01);
	CreateInvItem(self,ItFo_Potion_Strength_02);
	CreateInvItem(self,ItFo_Potion_Strength_03);
	CreateInvItem(self,ItFo_Potion_Dex_01);
	CreateInvItem(self,ItFo_Potion_Dex_02);
	CreateInvItem(self,ItFo_Potion_Dex_03);
	CreateInvItem(self,ItFo_Potion_Health_Perma_01);
	CreateInvItem(self,ItFo_Potion_Health_Perma_02);
	CreateInvItem(self,ItFo_Potion_Health_Perma_03);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_01);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_02);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_03);
	CreateInvItem(self,ItFo_Potion_Master_01);
	CreateInvItem(self,ItFo_Potion_Master_02);
	CreateInvItem(self,ItFo_Potion_Water_01);
	CreateInvItem(self,ItFo_Potion_Haste_01);

//----------------------------------------
//Light_sources.d
//----------------------------------------
	CreateInvItems(self,ItLsTorch,5);
//----------------------------------------
//misc.d
//----------------------------------------
	CreateInvItem(self,ItMiAlarmhorn);
//----------------------------------------
//Ranged_weapons.d
//----------------------------------------
	EquipItem	(self, ItRwOrcstaff);

	CreateInvItem(self,ItMw2hOrcSword01);
	CreateInvItem(self,ItMw2hOrcAxe01);
	CreateInvItem(self,ItMw2hOrcAxe02);
	CreateInvItem(self,ItMw2hOrcAxe03);
	CreateInvItem(self,ItMw2hOrcMace01);
	
//----------------------------------------
//Ammunition.d
//----------------------------------------
	CreateInvItems(self,ItAmArrow,50);
	CreateInvItems(self,ItAmBolt,50);

	CreateInvItem	(self,	ItArRuneBreathOfDeath);
	CreateInvItems	(self,	ItArScrollSummonGolem,	20);
	CreateInvItem	(self,	ItArRuneFireball);
};


INSTANCE UdShaman_Rockefeller (Mst_Default_OrcWarrior)
{
	//-------- primary data	--------
	name						=		"Undead Shaman Rockefeller";
	attribute	[ATR_MANA_MAX] 		=	50;
	attribute	[ATR_MANA] 			=	50;

	fight_tactic					=	FAI_HUMAN_MAGE;
	
	Set_UndeadOrcShaman_Visuals();
	

	
//----------------------------------------
//Food.d
//----------------------------------------
	CreateInvItems(self,ItFo_mutton_01,20);		
	CreateInvItems(self,ItFoApple,5);
	CreateInvItems(self,ItFoLoaf,5);
	CreateInvItems(self,ItFoMutton,20);
	CreateInvItems(self,ItFoCheese,5);
	CreateInvItems(self,ItFoRice,5);
	CreateInvItems(self,ItFoSoup,5);
	CreateInvItems(self,ItFoMeatbugragout,5);
	CreateInvItems(self,ItFoCrawlersoup,5);
	CreateInvItems(self,ItFoBooze,10);
	CreateInvItems(self,ItFoWine,5);
	CreateInvItems(self,ItFo_wineberrys_01,5);
	CreateInvItems(self,ItFoBeer,5);
	
//PFLANZEN
	CreateInvItems(self,ItFo_Plants_Trollberrys_01,5);
	CreateInvItems(self,ItFo_Plants_Flameberry_01,5);
	CreateInvItems(self,ItFo_Plants_Nightshadow_01,5);
	CreateInvItems(self,ItFo_Plants_Nightshadow_02,5);
	CreateInvItems(self,ItFo_Plants_OrcHerb_01,5);
	CreateInvItems(self,ItFo_Plants_OrcHerb_02,5);
	CreateInvItems(self,ItFo_Plants_mushroom_01,5);
	CreateInvItems(self,ItFo_Plants_mushroom_02,5);
	CreateInvItems(self,ItFo_Plants_Stoneroot_01,5);
	CreateInvItems(self,ItFo_Plants_Stoneroot_02,5);
	CreateInvItems(self,ItFo_Plants_RavenHerb_01,5);
	CreateInvItems(self,ItFo_Plants_RavenHerb_02,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_01,5);
	CreateInvItems(self,ItFo_Plants_mountainmoos_02,5);
	CreateInvItems(self,ItFo_Plants_Berrys_01,5);
	CreateInvItems(self,ItFo_Plants_Bloodwood_01,5);
	CreateInvItems(self,ItFo_Plants_Towerwood_01,5);
	CreateInvItems(self,ItFo_Plants_Seraphis_01,5);
	CreateInvItems(self,ItFo_Plants_Velayis_01,5);
	CreateInvItems(self,ItFo_Plants_Herb_03,5);
	CreateInvItems(self,ItFo_Plants_Herb_02,5);
	CreateInvItems(self,ItFo_Plants_Herb_01,5);
	CreateInvItems(self,ItMi_Plants_Swampherb_01,5);

//---------------------------------------------------------------------
//Potions
//---------------------------------------------------------------------
	CreateInvItem(self,ItFo_Potion_Mana_01);
	CreateInvItem(self,ItFo_Potion_Mana_02);
	CreateInvItem(self,ItFo_Potion_Mana_03);
	CreateInvItem(self,ItFo_Potion_Health_01);
	CreateInvItem(self,ItFo_Potion_Health_02);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,ItFo_Potion_Elixier);
	CreateInvItem(self,ItFo_Potion_Elixier_Egg);
	CreateInvItem(self,ItFo_Potion_Strength_01);
	CreateInvItem(self,ItFo_Potion_Strength_02);
	CreateInvItem(self,ItFo_Potion_Strength_03);
	CreateInvItem(self,ItFo_Potion_Dex_01);
	CreateInvItem(self,ItFo_Potion_Dex_02);
	CreateInvItem(self,ItFo_Potion_Dex_03);
	CreateInvItem(self,ItFo_Potion_Health_Perma_01);
	CreateInvItem(self,ItFo_Potion_Health_Perma_02);
	CreateInvItem(self,ItFo_Potion_Health_Perma_03);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_01);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_02);
	CreateInvItem(self,ItFo_Potion_Mana_Perma_03);
	CreateInvItem(self,ItFo_Potion_Master_01);
	CreateInvItem(self,ItFo_Potion_Master_02);
	CreateInvItem(self,ItFo_Potion_Water_01);
	CreateInvItem(self,ItFo_Potion_Haste_01);

//----------------------------------------
//Light_sources.d
//----------------------------------------
	CreateInvItems(self,ItLsTorch,5);
//----------------------------------------
//misc.d
//----------------------------------------
	CreateInvItem(self,ItMiAlarmhorn);
//----------------------------------------
//Ranged_weapons.d
//----------------------------------------
	EquipItem	(self, ItRwUdOrcstaff);

	CreateInvItem(self,ItMw2hOrcSword01);
	CreateInvItem(self,ItMw2hOrcAxe01);
	CreateInvItem(self,ItMw2hOrcAxe02);
	CreateInvItem(self,ItMw2hOrcAxe03);
	CreateInvItem(self,ItMw2hOrcMace01);
	
//----------------------------------------
//Ammunition.d
//----------------------------------------
	CreateInvItems(self,ItAmArrow,50);
	CreateInvItems(self,ItAmBolt,50);

	CreateInvItem	(self,	ItArRuneBreathOfDeath);
	CreateInvItems	(self,	ItArScrollSummonGolem,	20);
	CreateInvItem	(self,	ItArRuneFireball);
};

