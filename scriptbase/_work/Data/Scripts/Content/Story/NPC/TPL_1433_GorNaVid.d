instance TPL_1433_GorNaVid (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Vid";
	npctype =						npctype_Main;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							1433;
		
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
	//			body mesh     ,bdytex,skin,head mesh     ,64headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 20 ,  1, TPL_ARMOR_M);

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
	daily_routine = Rtn_start_1433;
};

FUNC VOID Rtn_start_1433 ()
{
    TA_SitAround	(00,00,12,00,"OM_CAVE1_81");	
	TA_SitAround	(12,00,24,00,"OM_CAVE1_81");		
};

func void Rtn_Gate_1433 ()
{
	TA_Guard (00,00,12,00,"OM_CAVE3_21");
	TA_Guard (12,00,24,00,"OM_CAVE3_21");
};

