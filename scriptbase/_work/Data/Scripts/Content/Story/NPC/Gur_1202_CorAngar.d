instance GUR_1202_CorAngar (Npc_Default)
{
	//-------- primary data --------
	
	name 			=		"Cor Angar";
	npctype 		= 		NPCTYPE_FRIEND;
	guild 			=		GIL_TPL;
	level 			=		30;
	flags			= 		NPC_FLAG_IMMORTAL;
	voice 			=		8;
	id 				=		1202;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	85;
	attribute[ATR_DEXTERITY] 		= 	65;
	attribute[ATR_MANA_MAX] 		= 	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX]	= 	400;
	attribute[ATR_HITPOINTS] 		= 	400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 3 ,"Hum_Head_Bald", 11,  0, TPL_ARMOR_H);

	B_Scale (self);

	//-------- Talente -------

	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_2H,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_BOW,2);			
	Npc_SetTalentSkill	(self,NPC_TALENT_CROSSBOW,2);		
	Npc_SetTalentSkill	( self, NPC_TALENT_MAGE,		6);
		
	//-------- inventory --------
	CreateInvItem(self, ItArRuneSleep);
	CreateInvItem (self, Roter_Wind);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	//CreateInvItem (self, ItLsTorch);
	//CreateInvItem (self, ItFoHealingPotion);
 
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1202;
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//------------- //MISSION-------------------
};

FUNC VOID Rtn_start_1202 ()
{
	TA_Sleep	(01,00,05,00,"PSI_17_HUT_IN");
    TA_Teaching	(05,00,01,00,"PSI_TRAINING_TEACHER");
};

FUNC VOID Rtn_CallSleeper_1202 () 
{
	TA_Stay	(23,00,21,00,"PSI_TEMPLE_STAIRS_LEFT");
    TA_Stay	(21,00,23,00,"PSI_TEMPLE_STAIRS_LEFT");	
};
