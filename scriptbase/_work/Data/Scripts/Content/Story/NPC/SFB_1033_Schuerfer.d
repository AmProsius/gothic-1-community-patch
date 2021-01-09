instance SFB_1033_Schuerfer (Npc_Default)
{
	//-------- primary data --------
	
	name =					NAME_Schuerfer;
	npctype = 				Npctype_main;
	guild =					GIL_SFB;      
	level =					6;
	flags =					0;
	
	voice =					1;
	id =					1033;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Psionic", 40,  1, SFB_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,5);
	CreateInvItems (self, ItMiNugget, 8);
	EquipItem (self, ItMwPickaxe);
	CreateInvItem (self, ItMw_1H_Nailmace_01);
	
	
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_FMCstart_1033;

};

FUNC VOID Rtn_FMCstart_1033 ()
{
	TA_PickOre	(01,00,13,00, "FMC_ORE_05");
	TA_PickOre	(13,00,01,00, "FMC_ORE_05");
};











