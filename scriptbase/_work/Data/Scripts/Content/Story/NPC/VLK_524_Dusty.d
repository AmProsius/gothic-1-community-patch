instance VLK_524_Dusty (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Dusty";
	npctype =						NPCTYPE_FRIEND;
	guild =							GIL_VLK;      
	level =							10;
	
	
	voice =							3;
	id =							524;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Psionic", 68,  0, -1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
    	
   	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    

	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Club_01);
	CreateInvItem (self, Itfo_Potion_Water_01);


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_524;
	
	//------------ //MISSIONs------------------
	
};

FUNC VOID Rtn_start_524 ()
{
	TA_Sleep			(22,00,07,00,"OCR_HUT_58");
	TA_SitAround 		(07,00,22,00,"OCR_OUTSIDE_HUT_58");
};

func void Rtn_Follow_524 ()
{
	TA_FollowPC	(23,00,16,00,"OCR_OUTSIDE_HUT_58");
	TA_FollowPC	(16,00,23,00,"OCR_OUTSIDE_HUT_58");
};


FUNC VOID Rtn_PrepareRitual_524 ()
{
    TA_Sleep	(23,00,07,45,"PSI_25_HUT_IN");
    TA_Listen	(07,45,23,00,"PSI_PLATFORM_1");	
};






