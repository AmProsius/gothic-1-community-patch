instance TPL_1435_Templer (Npc_Default)
{
	//-------- primary data --------
	name =							Name_Templer;
	Npctype =						NPCTYPE_GUARD;
	level =							17;
	
	voice =							13;
	id =							1435;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		85;
	attribute[ATR_DEXTERITY] =		65;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	244;
	attribute[ATR_HITPOINTS] =		244;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1 ,"Hum_Head_FatBald", 60 , 1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_01);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1435;
};

FUNC VOID Rtn_start_1435 ()
{
    TA_MCHunting	(00,00,12,00,"OM_031");	
	TA_MCHunting	(12,00,24,00,"OM_031");
};

FUNC VOID Rtn_PrepareRitual_1435 ()
{
	 TA_MCHunting	(00,00,12,00,"OM_031");	
	TA_MCHunting	(12,00,24,00,"OM_031");
};


	

