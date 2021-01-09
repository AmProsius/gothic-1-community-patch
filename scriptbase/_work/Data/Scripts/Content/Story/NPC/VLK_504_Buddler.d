instance VLK_504_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Buddler;
	npctype =						NPCTYPE_AMBIENT;
	guild =							GIL_VLK;      
	level =							2;

	voice =							2;
	id =							504;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =	    64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Thief", 74,  1, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
 	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	////Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, Itfo_Potion_Water_01);
	CreateInvItem (self, ItLsTorch);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_504;
};

FUNC VOID Rtn_start_504 ()
{
	TA_Sleep		(22,00,06,30,"OCR_HUT_12");
	TA_SitAround	(06,30,10,30,"OCR_HUT_12");
	TA_RepairHut	(10,30,17,30,"OCR_OUTSIDE_HUT_12");
	TA_SitAround	(17,30,22,00,"OCR_HUT_12");
};










