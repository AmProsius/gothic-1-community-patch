instance GUR_1208_BaalCadar (Npc_Default)
{
	//-------- primary data --------
	name		=	"Baal Cadar";
	Npctype		=	NPCTYPE_MAIN;
	guild		=	GIL_GUR;
	level 		=	28;
	
	voice 		=	2;
	id 			=	1208;
		
	///-------- abilities --------
	attribute[ATR_STRENGTH] 		=	70;
	attribute[ATR_DEXTERITY] 		=	55;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	376;
	attribute[ATR_HITPOINTS] 		=	376;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 20,  1, GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- inventory --------
	CreateInvItem(self, ItArRuneWindfist);

	B_Give_BaalCadarChapter1Runes ();
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1208;
};

FUNC VOID Rtn_start_1208 ()
{
    TA_Sleep	(02,00,08,00,"PSI_23_HUT_IN");
    TA_Teaching	(08,00,02,00,"PSI_TEACH_CADAR");
};

