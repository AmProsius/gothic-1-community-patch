instance VLK_544_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mine_ambient;
	guild =							GIL_VLK;      
	level =							3;
	
	
	voice =							2;
	id =							544;


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
	//				body mesh,				head mesh,				74hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_FatBald",98 ,  1, VLK_ARMOR_L);

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
	daily_routine = Rtn_start_544;
	};

FUNC VOID Rtn_start_544 ()
{
	TA_PickOre		(00,00,23,00,"OM_CAVE3_31");
	TA_PickOre		(23,00,24,00,"OM_CAVE3_31");
};













