instance VLK_503_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =					npctype_Ambient;
	guild =							GIL_VLK;      
	level =							2;
	
	
	voice =							2;
	id =							503;


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
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Bald", 0,  4, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	////Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_503;

};

FUNC VOID Rtn_start_503 ()
{
	TA_Sleep		(22,45,07,00,"OCR_HUT_53");
	TA_SitAround	(07,00,08,00,"OCR_OUTSIDE_HUT_53");
	TA_StandAround	(08,00,11,00,"OCR_OUTSIDE_HUT_53");
	TA_Smalltalk	(11,00,17,00,"OCR_OUTSIDE_HUT_53");
	TA_StandAround	(17,00,22,45,"OCR_OUTSIDE_HUT_53");
};








