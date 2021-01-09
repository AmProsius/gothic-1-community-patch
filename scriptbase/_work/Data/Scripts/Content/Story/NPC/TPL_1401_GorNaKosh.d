
instance TPL_1401_GorNaKosh (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Kosh";
	npctype =						npctype_main;
	guild =							GIL_TPL;
	level =							17;
	flags =							0;
	
	voice =							13;
	id =							1401;
		
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
	//			Body-Mesh	Body-Tex  Skin-Color	Head-MMS    Head-Tex	Teeth-Tex Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 0,"Hum_Head_FatBald", 15 ,  2, TPL_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	
	//-------- inventory --------
	
	EquipItem (self, ItMw_2H_Sword_Light_02);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	
	
	
	      

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1401;
};

FUNC VOID Rtn_start_1401 ()
{
    TA_SitAround 	(00,00,12,00,"OM_207");	
	TA_SitAround	(12,00,24,00,"OM_207");
};

FUNC VOID Rtn_Gate_1401 ()
{
	TA_Guard	(00,00,12,00,"OM_CAVE3_19");	
	TA_Guard	(12,00,24,00,"OM_CAVE3_19");
};

