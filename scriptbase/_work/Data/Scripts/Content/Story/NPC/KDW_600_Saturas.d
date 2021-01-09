instance KDW_600_Saturas (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Saturas";
	npctype		=	NPCTYPE_FRIEND;
	guild 		=	GIL_KDW;      
	level 		=	29;
	voice 		=	14;
	id 			=	600;
	flags       =   NPC_FLAG_IMMORTAL;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 388;
	attribute[ATR_HITPOINTS] 	= 388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//							body mesh     		bdytex	skin	head mesh     		headtex		teethtex	ruestung	
	Mdl_SetVisualBody (self,	"hum_body_Naked0",	0, 		3,		"Hum_Head_FatBald", 7,  		0,			KDW_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);

	
	//-------- Talente --------
	Npc_SetTalentSkill	(self,	NPC_TALENT_MAGE,	6);

	//-------- Spells --------
	CreateInvItem 		(self,	ItArRuneChainLightning);
	CreateInvItem 		(self,	ItArRuneIceCube);

	//-------- inventory --------                                    
	CreateInvItem 		(self, 	ItFo_Potion_Health_01);
	CreateInvItem 		(self, 	ItFo_Potion_Mana_01);
	EquipItem 			(self, 	Schutzamulett_Feuer);
	EquipItem 			(self,	Machtring);
	CreateInvItem		(self,	ItFo_Plants_Flameberry_01 );

	//------------- ai -------------
	daily_routine 	= Rtn_start_600;
	fight_tactic	= FAI_HUMAN_MAGE;
	senses			= SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_600 ()
{
	TA_ReadBook		(01,00,05,00,"NC_KDW_CAVE_CENTER");	
	TA_ReadBook		(05,00,01,00,"NC_KDW_CAVE_CENTER");	
};


