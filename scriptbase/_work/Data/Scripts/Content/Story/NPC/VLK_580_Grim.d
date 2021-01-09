instance VLK_580_Grim (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Grim";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							6;
	id =							580;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;  
	attribute[ATR_HITPOINTS] =		100;  

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 72,  2, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	
	//-------- Talents  --------                                    
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Club_01);
	CreateInvItem (self, Itfo_Potion_Water_01);
	CreateInvItem (self, ItLsTorch);


	//-------------Daily Routine-------------
	daily_routine = Rtn_Start_580;
};

FUNC VOID Rtn_Start_580 ()
{
	TA_Sleep		(23,01,06,30,"OCR_HUT_2");
	TA_WashSelf		(06,30,07,00,"OCR_LAKE_1");
	TA_StandAround	(07,00,10,00,"OCR_CAMPFIRE_A_MOVEMENT2");
	TA_Smalltalk	(10,00,12,00,"OCR_CAMPFIRE_A_MOVEMENT1"); //mit Diego
	TA_Cook			(12,00,12,30,"OCR_AT_HUT_2");
	TA_Smalltalk	(12,30,15,30,"OCR_CAMPFIRE_A_MOVEMENT3"); //mit Stt_322
	TA_Cook			(15,30,18,05,"OCR_AT_HUT_2");
	TA_SitCampfire	(18,05,23,01,"OCR_CAMPFIRE_A_MOVEMENT2");	
};

func void Rtn_Guide_580 ()
{
	TA_GuidePC (10,00,22,00,"OC_ROUND_22_CF_2_MOVEMENT");
	TA_GuidePC (22,00,10,00,"OC_ROUND_22_CF_2_MOVEMENT");
};

func void Rtn_InExtremo_580 ()
{
	TA_WatchInextremo (10,00,22,00,"OCR_AUDIENCE_01");
	TA_WatchInextremo (22,00,10,00,"OCR_AUDIENCE_01");
};












