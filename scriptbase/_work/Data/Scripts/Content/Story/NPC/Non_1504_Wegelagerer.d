instance Non_1504_Wegelagerer (Npc_Default)

{
	//-------- primary data --------
	
	name 		=		"Tramp";
	npctype 	=		npctype_ambient;
	guild 		=		GIL_NONE;      
	level 		=		9;
	
	
	voice 		=		6;
	id 			=		1504;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	166;
	attribute[ATR_HITPOINTS] 		=	166;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"hum_body_Naked0", 	2, 			0,			"Hum_Head_Bald", 	10,  		3, 			-1);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talents  --------                                    
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);

	//-------- inventory --------                                    
	EquipItem 		(self, ItMw_1H_Axe_Old_01);
	CreateInvItems	(self, ItMiNugget, 54);
	CreateInvItems 	(self, ItFo_Potion_Health_01, 2);
	CreateInvItem 	(self, ItFoBeer);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1504;
	};

FUNC VOID Rtn_start_1504 ()
{
	// Angreifen bei Sichtung
	Npc_SetPermAttitude (self, ATT_HOSTILE);

	TA_StandAround		(22,00,06,00,"OW_PATH_BANDITOS01");
    TA_StandAround		(06,00,22,00,"OW_PATH_BANDITOS01");		
};
