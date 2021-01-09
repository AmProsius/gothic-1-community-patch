instance KDW_604_Cronos (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Cronos";
	npctype		=	NPCTYPE_MAIN;
	flags		=	NPC_FLAG_IMMORTAL|NPC_FLAG_FRIEND;
	guild 		=	GIL_KDW;      
	level 		=	28;
	voice 		=	8;
	id 			=	604;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 45;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 376;
	attribute[ATR_HITPOINTS] 	= 376;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Thief", 7,  1,KDW_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;	
	
	//-------- Talente --------
	Npc_SetTalentSkill	( self, NPC_TALENT_MAGE,		6);
			
	//-------- Spells --------        
	CreateInvItem 		(self, ItArRuneIceCube);
	CreateInvItem 		(self, ItArRuneThunderbolt);

	//-------- inventory --------                                    
	B_Give_CronosChapter1Runes ();
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_604;
};

FUNC VOID Rtn_start_604 ()
{
	TA_Sleep		(23,00,08,00,"NC_PATH_TO_PIT_03");
	TA_Orepile		(08,00,23,00,"NC_PATH_TO_PIT_03");
};








