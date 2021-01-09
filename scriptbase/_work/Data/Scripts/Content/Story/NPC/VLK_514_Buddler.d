instance VLK_514_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
  	npctype =						npctype_ambient;
	guild =							GIL_VLK;    
	level =							2;
	
	
	voice =							3;
	id =							514;


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
	daily_routine = Rtn_start_514;
};

FUNC VOID Rtn_start_514 () //Arenaplatz
{
	TA_Sleep		(23,00,08,00,"OCR_HUT_17");
	TA_Smalltalk	(08,00,19,00,"OCR_OUTSIDE_HUT_17");
	TA_ArenaSpectator(19,00,23,00,"OCR_ARENA_09");
};









