instance VLK_572_Gravo (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Gravo";
	npctype =						npctype_Main;
	guild =							GIL_VLK;      
	level =							4;
	
	
	voice =							4;
	id =							572;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,0,"Hum_Head_Psionic", 0,  1, -1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Hatchet_01);
	CreateInvItem (self, Itfo_Potion_Water_01);
	CreateInvItems (self, ItMiNugget,5);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_572;
};

FUNC VOID Rtn_start_572 ()
{
	TA_Sleep		(22,30,06,00,"OCR_HUT_4");
	TA_SitAround 	(06,00,11,00,"OCR_AUDIENCE_01");
	TA_CookForMe	(11,00,15,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_StandAround	(15,00,17,00,"OCR_OUTSIDE_HUT_4_INSERT");
	TA_SitAround	(17,00,22,30,"OCR_AUDIENCE_01");
};




