instance SLD_729_Kharim (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Kharim";
	Npctype =				Npctype_Main;
	guild =					GIL_NONE;       
	level =					11;
	
	voice =					9;
	id =					729;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		70;
	attribute[ATR_DEXTERITY] =		20;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 3,"Hum_Head_FatBald", 9, 1, SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
		
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);	
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_02);
	//EquipItem (self, ItRw_Bow_Long_01);
	//CreateInvItems(self, ItAmArrow, 20);
	CreateInvItems (self, ItFoRice,7);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 19);
	CreateInvItems (self, ItFoBooze,5);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItFo_Potion_Health_01,7);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Amphore_01);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_729;

};

FUNC VOID Rtn_start_729 ()
{
	TA_Sleep 		(00,00,07,30,"OCR_HUT_31");
	TA_StandAround	(07,30,11,00,"OCR_CAMPFIRE_I_2");
	TA_Smith_Sharp	(11,00,14,00,"OCR_ARENABATTLE_OUTSIDE");
	TA_PracticeSword(14,00,15,00,"OCR_ARENABATTLE");
	TA_StandAround	(15,00,17,00,"OCR_ARENABATTLE_OUTSIDE");
	TA_SitCampfire	(17,00,00,00,"OCR_CAMPFIRE_I_2");
};

func VOID Rtn_Guide_729 ()
{
	TA_GuidePC (08,00,20,00,"OCR_ARENABATTLE_TRAIN");
	TA_GuidePC (20,00,08,00,"OCR_ARENABATTLE_TRAIN");
};





