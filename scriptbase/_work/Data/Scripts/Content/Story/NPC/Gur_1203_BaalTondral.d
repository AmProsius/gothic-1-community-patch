instance GUR_1203_BaalTondral (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Tondral";
	Npctype 		=		Npctype_Main;
	guild 		=		GIL_GUR;
	level 		=		28;
	flags 		=		0;
	
	voice 		=		13;
	id 			=		1203;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	60;
	attribute[ATR_DEXTERITY] 		=	40;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	388;
	attribute[ATR_HITPOINTS] 		=	388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1,1 ,"Hum_Head_Psionic", 24,  2, GUR_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);

	//-------- Talente --------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

	//-------- inventory --------
	CreateInvItem(self, ItArRuneWindfist);
	
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1203;
};

FUNC VOID Rtn_start_1203 ()
{
    TA_Sleep	(23,00,07,45,"PSI_28_HUT_IN");
    TA_Teaching	(07,45,23,00,"PSI_PLATFORM_TEACHER");	
};


