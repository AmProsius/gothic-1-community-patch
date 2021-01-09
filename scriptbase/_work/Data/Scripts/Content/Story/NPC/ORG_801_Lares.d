instance ORG_801_Lares (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Lares";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					15;
	
	voice =					11;
	id =					801;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1 ,"Hum_Head_Pony", 87, 4,ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;		
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);

	//------- Inventory ---------

	CreateInvItems (self, ItKeLockpick,3);		
	CreateInvItems(self, ItMiNugget, 18);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 3);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 3);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Teeth_01);
	EquipItem (self, Lares_Axt);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_801;
	
	aivar[AIV_ITEMSCHWEIN] = TRUE;
};

FUNC VOID Rtn_start_801 ()
{
	TA_Sleep		(01,00,07,00,"NC_HUT22_IN");
	TA_StandAround	(07,00,01,00,"NC_HUT22_IN_MOVEMENT2");
};








