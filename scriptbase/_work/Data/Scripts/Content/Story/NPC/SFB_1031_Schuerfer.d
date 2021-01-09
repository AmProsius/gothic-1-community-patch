instance SFB_1031_Schuerfer (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Schuerfer;                            
	npctype =				npctype_ambient;                            
	guild =					GIL_SFB;      
	level =					3;
	voice =					2;
	id =					1031;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3, 1,"Hum_Head_Fighter", 44,  3, -1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    

	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItMiNugget, 5);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	EquipItem (self, ItMwPickaxe);
	CreateInvItem (self, ItMw_1H_Hatchet_01);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);
	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_1031;

};

FUNC VOID Rtn_FMCstart_1031 ()
{
	TA_PickOre	(01,00,13,00, "FMC_ORE_03");
	TA_PickOre	(13,00,01,00, "FMC_ORE_03");
};













