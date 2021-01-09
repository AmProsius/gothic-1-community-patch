instance VLK_517_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Buddler;
	npctype =						NPCTYPE_AMBIENT;
	guild =							GIL_VLK;      
	level =							2;
	
	
	voice =							1;
	id =							517;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 0,  1, -1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents --------                                    
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);

	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Club_01);
	CreateInvItem (self, Itfo_Potion_Water_01);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_517;
};

FUNC VOID Rtn_start_517 () //Marktplatz Bank
{
	TA_Sleep		(23,30,07,00,"OCR_HUT_46");
	TA_Smalltalk	(07,00,11,00,"OCR_OUTSIDE_HUT_47_SMALT2");
	TA_SitAround	(11,00,13,00,"OCR_OUTSIDE_MCAMP_01");
	TA_Smalltalk	(13,00,16,00,"OCR_OUTSIDE_HUT_47_SMALT2");
	TA_SitAround	(16,00,23,30,"OCR_OUTSIDE_MCAMP_01");
};










