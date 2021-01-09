instance ORG_851_Butch (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Butch";
	Npctype =						Npctype_Main;
	guild =							GIL_ORG;      
	level =							15;
	
	voice =							13;
	id =							851;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Bald", 36, 1, ORG_ARMOR_H);

	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);

	//------- Inventory ---------

	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 13);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 3);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_War_02);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_851;
	};

FUNC VOID Rtn_start_851 ()
{
	TA_Sleep		(01,00,07,30,"NC_HUT15_IN");
	TA_StandAround	(07,30,01,00,"NC_HUT16_OUT");
};
