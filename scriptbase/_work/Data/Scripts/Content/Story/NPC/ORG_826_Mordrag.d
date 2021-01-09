instance ORG_826_Mordrag (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Mordrag";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					10;
	
	voice =					11;
	id =					826;


	//-------- abilities --------

	attribute[ATR_STRENGTH] 	= 36; 
	attribute[ATR_DEXTERITY] 	= 36; 
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 180;
	attribute[ATR_HITPOINTS] 	= 180;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1, "Hum_Head_FatBald", 36, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_COWARD;
	
	//-------- Talente ----------

	////Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	////Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems	(self, ItKeLockpick,2);		
	CreateInvItems	(self, ItMiNugget, 11);
	CreateInvItems	(self, ItFoRice,8);
	CreateInvItems	(self, ItFoBooze, 3);
	CreateInvItems	(self, ItLsTorch, 2);
	CreateInvItems	(self, ItFo_Potion_Health_01, 3);
	CreateInvItem	(self, ItMi_Stuff_Plate_01);
	CreateInvItem	(self, ItMi_Stuff_Cup_01);
	CreateInvItem	(self, ItFoLoaf);
	CreateInvItem	(self, ItAt_Teeth_01);
	EquipItem 		(self, ItMw_1H_Mace_02);
	EquipItem 		(self, ItRw_Bow_Long_01);
	CreateInvItems	(self, ItAmArrow, 10);
	//EquipItem		(self, MordragsRing);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_PreStart_826;
};

FUNC VOID Rtn_PreStart_826 ()
{
	TA_Smalltalk		(10,00,22,00,"OCR_OUTSIDE_HUT_44");
	TA_Stand			(22,00,10,00,"OCR_OUTSIDE_HUT_44");
};

FUNC VOID Rtn_Guide_826 ()
{
	TA_GuidePC (08,00,20,00,"OW_PATH_07_21");
	TA_GuidePC (20,00,08,00,"OW_PATH_07_21"); 
};

FUNC VOID Rtn_Start_826 ()
{
	TA_Stand (08,00,23,00,"NC_TAVERN_BAR");
	TA_Stand (23,00,08,00,"NC_TAVERN_BAR");
	//TA_Sleep (23,00,08,00,"NC_HUT21_IN"); 
};












