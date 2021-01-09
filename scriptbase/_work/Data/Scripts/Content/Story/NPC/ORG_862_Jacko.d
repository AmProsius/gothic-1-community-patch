instance ORG_862_Jacko (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Jacko";
	Npctype =				Npctype_Main;
	guild =						GIL_ORG;      
	level =						8;
	
	voice =						6;
	id =						862;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 37, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,3);		
	CreateInvItems(self, ItMiNugget, 95);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Small_03);
	CreateInvItems (self, ItAmArrow, 20);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_862;
};

FUNC VOID Rtn_start_862 ()
{
    TA_Guard		(20,00,08,00,"LOCATION_23_CAVE_1_IN");
	TA_Guard		(08,00,20,00,"LOCATION_23_CAVE_1_IN");
};
	
FUNC VOID Rtn_arbeitslos_862 ()
{
    TA_Standaround		(20,00,08,00,"LOCATION_11_08");
	TA_Standaround		(08,00,20,00,"LOCATION_11_08");
};












