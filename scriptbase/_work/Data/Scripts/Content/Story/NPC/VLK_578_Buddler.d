instance VLK_578_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							4;
	
	
	voice =							2;
	id =							578;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 67,  1, -1);
        
        B_Scale (self); 
        Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
  	//-------- Talents --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Club_01);
	CreateInvItem (self, ItFoApple);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_578;
};

FUNC VOID Rtn_start_578 () //Kyle-Platz Koch
{
	TA_Sleep		(23,00,06,30,"OCR_HUT_70");
	TA_Smalltalk	(06,30,12,00,"OCR_OUTSIDE_HUT_68_BENCH");
	TA_Cook			(12,00,17,30,"OCR_OUTSIDE_HUT_68");
	TA_SitCampfire  (17,30,23,00,"OCR_OUTSIDE_CAMPFIRE_D_3");
};









