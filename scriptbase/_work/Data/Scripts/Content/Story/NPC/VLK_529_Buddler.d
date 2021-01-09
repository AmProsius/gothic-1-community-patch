instance VLK_529_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_ambient;
	guild =							GIL_VLK;      
	level =							2;
	
	
	voice =							2;
	id =							529;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic", 71,  1, VLK_ARMOR_L);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1h_Nailmace_01);
	CreateInvItem (self, ItMwPickaxe);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_529;
	};

FUNC VOID Rtn_start_529 () //Kyle-Platz
{
	TA_Sleep		(22,00,06,00,"OCR_HUT_69");
	TA_Boss			(06,00,06,30,"OCR_OUTSIDE_HUT_69");
	TA_Smalltalk	(06,30,12,00,"OCR_OUTSIDE_HUT_69"); //mit Kyle
	TA_Stand		(12,00,13,00,"OCR_OUTSIDE_HUT_69"); 
	TA_Smalltalk	(13,00,16,00,"OCR_OUTSIDE_HUT_69"); //mit 554 von UNTEN
	TA_Standaround	(16,00,22,00,"OCR_OUTSIDE_HUT_69");
};











