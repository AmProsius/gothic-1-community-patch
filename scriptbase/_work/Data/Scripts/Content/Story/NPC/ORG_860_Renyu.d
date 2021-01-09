instance ORG_860_Renyu (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Weed Mixer";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					8;
	
	voice =					6;
	id =					860;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
		
	CreateInvItems(self, ItMiNugget, 80);
	CreateInvItems (self, ItFo_Potion_Health_01, 2);
	EquipItem (self, ItMw_1H_Mace_03);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_860;
};

FUNC VOID Rtn_start_860 ()
{
    TA_Smoke		(00,00,08,00,"LOCATION_23_CAVE_1_IN");
	TA_Smoke		(08,00,24,00,"LOCATION_23_CAVE_1_IN");
};

FUNC VOID Rtn_arbeitslos_860 ()
{
    TA_Standaround		(20,00,08,00,"LOCATION_11_08");
	TA_Standaround		(08,00,20,00,"LOCATION_11_08");
};











