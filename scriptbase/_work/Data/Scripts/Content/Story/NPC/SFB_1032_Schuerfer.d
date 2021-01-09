instance SFB_1032_Schuerfer (Npc_Default)
{
	//-------- primary data --------
	
	name =						NAME_Schuerfer;
	npctype = 					Npctype_ambient;
	guild =						GIL_SFB;      
	level =						6;
	voice =						2;
	id =						1032;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 40,  1, SFB_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	EquipItem (self, ItMwPickaxe);
	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItMiNugget, 7);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItMw_1H_Sword_Short_01);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_1032;

};

FUNC VOID Rtn_FMCstart_1032 ()
{
	TA_PickOre	(01,00,13,00, "FMC_ORE_04");
	TA_PickOre	(13,00,01,00, "FMC_ORE_04");
};












