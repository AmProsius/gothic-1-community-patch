instance Non_1503_Wegelagerer (Npc_Default)

{
	//-------- primary data --------
	
	name 		=		"Wegelagerer";
	npctype 	=		npctype_ambient;
	guild 		=		GIL_NONE;      
	level 		=		9;
	
	
	voice 		=		6;
	id 			=		1503;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	170;
	attribute[ATR_HITPOINTS] 		=	170;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0", 	3, 			2,			"Hum_Head_FatBald", 	9,  		3, 			-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talents  --------                                    

	//-------- inventory --------                                    
	EquipItem 		(self, ItMw_1H_Nailmace_01);
	CreateInvItems	(self, ItMiNugget, 11);
	CreateInvItem 	(self, ItFoLoaf);
	CreateInvItem 	(self, ItFoBeer);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1503;
	};

FUNC VOID Rtn_start_1503 ()
{
	// Angreifen bei Sichtung
	Npc_SetPermAttitude (self, ATT_HOSTILE);

	TA_StandAround		(22,00,06,00,"OW_PATH_BANDITOS01");
    TA_StandAround		(06,00,22,00,"OW_PATH_BANDITOS01");		
};
