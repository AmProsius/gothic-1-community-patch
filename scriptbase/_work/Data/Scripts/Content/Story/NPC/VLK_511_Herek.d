instance VLK_511_Herek (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Herek";
	npctype =						npctype_Main;
	guild =							GIL_NONE;      
	level =							2;
	
	
	voice =							1;
	id =							511;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				70hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 105,  3, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    

	////Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItems (self, ItMinugget,4);
	CreateInvItem (self, ItLsTorch);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_511;
	};

FUNC VOID Rtn_start_511 ()
{
	TA_Sleep		(22,00,07,00,"OCR_HUT_62");
	TA_Boss			(07,00,08,00,"OCR_OUTSIDE_HUT_62");
	TA_Smalltalk	(08,00,12,00,"OCR_OUTSIDE_HUT_63_SMALLTALK");
	TA_Smith_Sharp	(12,00,17,00,"OCR_OUTSIDE_HUT_63_SMALLTALK");
	TA_SitAround    (17,00,22,00,"OCR_OUTSIDE_HUT_62");  
};


