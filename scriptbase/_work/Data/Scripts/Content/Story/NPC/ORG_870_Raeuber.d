instance ORG_870_Raeuber (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Raeuber;
	Npctype =				NPCTYPE_ROGUE;
	guild =					GIL_NONE;      
	level =					12;
	
	voice =					7;
	id =					870;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		60;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Fighter", 9, 3, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	
	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 11);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_870;
	
	//------------ //MISSIONs-------------------
};

FUNC VOID Rtn_start_870 ()
{
    TA_SitAround		(13,00,14,00,"LOCATION_11_12");	
    TA_SitAround		(14,00,13,00,"LOCATION_11_12");
};

FUNC VOID Rtn_OMFull_870 ()
{
	 TA_SitAround		(13,00,14,00,"LOCATION_11_12");	
    TA_SitAround		(14,00,13,00,"LOCATION_11_12");
};

FUNC VOID Rtn_FMTaken_870 () 
{
	 TA_SitAround		(13,00,14,00,"LOCATION_11_12");	
    TA_SitAround		(14,00,13,00,"LOCATION_11_12");
};

FUNC VOID Rtn_OrcAssault_870 () 
{
	 TA_SitAround		(13,00,14,00,"LOCATION_11_12");	
    TA_SitAround		(14,00,13,00,"LOCATION_11_12");
};
