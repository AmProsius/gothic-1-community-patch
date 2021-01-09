instance VLK_554_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
    npctype =						npctype_ambient;
    guild =							GIL_VLK; 
	level =							3;
	
	
	voice =							2;
	id =							554;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony", 0,  2, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_554;
};

FUNC VOID Rtn_start_554 () //Kyle-PLatz UNTEN
{
	TA_Sleep			(22,15,06,15,"OCR_HUT_72");
	TA_Boss				(06,15,07,15,"OCR_OUTSIDE_HUT_72");
	TA_WashSelf			(07,15,07,45,"OCR_WASH_2");
	TA_StandAround		(07,45,11,00,"OCR_OUTSIDE_HUT_72");
	TA_RepairHut		(11,00,13,00,"OCR_OUTSIDE_HUT_72");
	TA_Smalltalk		(13,00,16,00,"OCR_OUTSIDE_HUT_68_BENCH"); //mit 529
	TA_SitCampfire		(16,00,22,15,"OCR_OUTSIDE_HUT_72");
};






