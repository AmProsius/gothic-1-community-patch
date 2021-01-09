instance ORG_888_Erpresser (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Blackmailer";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					15;
	
	voice =					13;
	id =					888;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		80;
	attribute[ATR_DEXTERITY] =		60;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	220;
	attribute[ATR_HITPOINTS] =		220;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fatbald", 35, 2,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);

	//------- Inventory ---------

	CreateInvItems (self, ItKeLockpick,3);		
	CreateInvItems(self, ItMiNugget, 20);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 3);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 3);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_War_02);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);

	//-------------Daily Routine-------------

	start_aistate = ZS_Erpresser;
};	




//	daily_routine = Rtn_start_888;

/*
FUNC VOID Rtn_start_888 ()
{
	TA_StandAround	(03,00,11,00,"NC_PATH42");
	TA_StandAround	(11,00,03,00,"NC_PATH42");	
};
*/














