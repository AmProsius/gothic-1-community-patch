instance VLK_592_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_mine_ambient;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							1;
	id =							592;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,0,"Hum_Head_Psionic", 16, 3, VLK_ARMOR_L);

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
	daily_routine = Rtn_start_592;
	};

FUNC VOID Rtn_start_592 ()
{
	TA_PickOre		(21,00,04,00,"OM_CAVE3_34");
    TA_PickOre	    (04,00,21,00,"OM_CAVE3_34");
};







