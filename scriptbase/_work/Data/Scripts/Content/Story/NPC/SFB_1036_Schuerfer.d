instance SFB_1036_Schuerfer (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Schuerfer;
	npctype = 						Npctype_ambient;
	guild =							GIL_SFB;      
	level =							6;
	flags =							0;
	
	voice =							1;
	id =							1006;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,3,"Hum_Head_FatBald", 7,  1,SFB_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,3);
	CreateInvItems (self, ItMiNugget, 5);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	EquipItem (self, ItMwPickaxe);
	
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_1036;

};

FUNC VOID Rtn_FMCstart_1036 ()
{
	TA_PickOre	(01,00,13,00, "FMC_ORE_01");
	TA_PickOre	(13,00,01,00, "FMC_ORE_01");
};










