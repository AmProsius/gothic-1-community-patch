instance VLK_536_Kyle (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Kyle";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							3;
	
	
	voice =							10;
	id =							536;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	76;
	attribute[ATR_HITPOINTS] =		76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 72,  1,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	CreateInvItem (self, ItMi_Stuff_Plate_01);
	EquipItem (self, ItMwPickaxe);
	CreateInvItem (self, ItLsTorch);
	CreateInvItem (self, Itfo_Potion_Water_01);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_536;
};

FUNC VOID Rtn_start_536 ()
{
	TA_Sleep		(22,00,08,00,"OCR_HUT_68");
	TA_Stand		(08,00,22,00,"OCR_HUT_68_BACK");
};












