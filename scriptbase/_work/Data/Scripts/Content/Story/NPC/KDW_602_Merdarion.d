instance KDW_602_Merdarion (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Merdarion";
	npctype		=	npctype_main;
	guild 		=	GIL_KDW;      
	level 		=	26;
	voice 		=	14;
	id 			=	602;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 45;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 90;
	attribute[ATR_MANA] 		= 90;
	attribute[ATR_HITPOINTS_MAX]= 352;
	attribute[ATR_HITPOINTS] 	= 352;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Thief", 8,  0,KDW_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;	
			
	//-------- Talente --------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- Spells --------        
	CreateInvItem (self,ItArRuneChainlightning);
	
	//-------- inventory --------                                    

	CreateInvItem (self, ItFo_Potion_Health_03);
	CreateInvItems (self, ItFo_Potion_Mana_02,2);
	EquipItem (self, Lebensamulett);
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_602;

	//--------------- //MISSIONs----------------

};

FUNC VOID Rtn_start_602 ()
{
	TA_Sleep		(23,00,06,00,"NC_KDW01_IN");
	TA_ReadBook		(06,00,23,00,"NC_KDW01_IN");
};

FUNC VOID Rtn_KDWAUFNAHME_602 () // WECHSEL VOM KDF ZUM KDW
{
	TA_Position		(01,00,05,00,"NC_KDW_CAVE_STAIRS_MOVEMENT2");	
	TA_Position 	(05,00,01,00,"NC_KDW_CAVE_STAIRS_MOVEMENT2");	
};
