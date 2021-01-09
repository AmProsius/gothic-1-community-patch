instance VLK_526_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							2;
	
	
	voice =							3;
	id =							526;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 74,  1, -1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    
	EquipItem (self, ItMw_1h_Nailmace_01);
	EquipItem (self, ItMw_1h_Club_01);
	CreateInvItem (self, ItFoApple);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_526;
};

FUNC VOID Rtn_start_526 () //Bloodwyn-Platz
{
	TA_Sleep		(23,30,06,30,"OCR_HUT_67");
	TA_Boss			(06,30,07,30,"OCR_OUTSIDE_HUT_67");
	TA_StandAround	(07,30,17,00,"OCR_CAMPFIRE_E_1_MOVEMENT");
	TA_SitAround	(17,00,18,00,"OCR_HUT_67");
	TA_SitCampfire	(18,00,23,30,"OCR_CAMPFIRE_E_1_MOVEMENT");
};













