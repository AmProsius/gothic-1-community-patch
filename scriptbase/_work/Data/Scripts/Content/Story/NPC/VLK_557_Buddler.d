instance VLK_557_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							3;
	
	voice =							1;
	id =							557;


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
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald", 71,  1,VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_557;
};

FUNC VOID Rtn_start_557 ()
{
	TA_Sleep		(23,15,06,30,"OCR_HUT_75");
	TA_WashSelf		(06,30,07,06,"OCR_LAKE_4");
	TA_StandAround	(07,06,12,00,"OCR_OUTSIDE_HUT_77_MOVEMENT2");
	TA_SitAround	(12,00,13,00,"OCR_OUTSIDE_HUT_75");
	TA_Cook			(13,00,14,00,"OCR_OUTSIDE_HUT_75");
	TA_StandAround	(14,00,16,00,"OCR_OUTSIDE_HUT_77_MOVEMENT2");
	TA_SitAround	(16,00,17,55,"OCR_OUTSIDE_HUT_75");
	TA_SitCampfire	(17,55,23,15,"OCR_OUTSIDE_HUT_77_MOVEMENT2");
};





