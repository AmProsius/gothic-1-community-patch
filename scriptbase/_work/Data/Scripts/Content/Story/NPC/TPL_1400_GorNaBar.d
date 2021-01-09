instance TPL_1400_GorNaBar (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Bar";
	npctype =						npctype_main;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							9;
	id =							1400;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2 ,"Hum_Head_FatBald", 16 ,  1, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	CreateInvItem (self, ItMi_Amulet_Psi_01);
	EquipItem (self, ItMw_2H_Sword_Light_03);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_3);
	CreateInvItem (self, ItLsTorch);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1400;
};

FUNC VOID Rtn_start_1400 ()
{

    TA_SmallTalk	(00,00,12,00,"OM_CAVE1_56");	
	TA_SmallTalk	(12,00,24,00,"OM_CAVE1_56");	
};

FUNC VOID Rtn_Gate_1400 ()
{
	 TA_Guard	(00,00,12,00,"OM_CAVE3_26");	
	 TA_Guard	(12,00,24,00,"OM_CAVE3_26");	   
};

