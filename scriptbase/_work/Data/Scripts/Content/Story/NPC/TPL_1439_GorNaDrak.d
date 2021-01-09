instance TPL_1439_GorNaDrak (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Drak";
	npctype =						npctype_Main;
	guild =							GIL_TPL;
	level =							21;
	
	voice =							9;
	id =							1439;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		100;
	attribute[ATR_DEXTERITY] =		80;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	292;
	attribute[ATR_HITPOINTS] =		292;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 63,  2, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	
	//-------- inventory --------
	EquipItem (self, ItMw_2H_Sword_Light_04);
	CreateInvItem (self, ItFoSoup);
	CreateInvItem (self, ItMiJoint_1);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1439;
};

FUNC VOID Rtn_start_1439 () //ST-OM-Pendler (MC-Jäger)
{
    TA_Smalltalk	(06,00,14,00,"PSI_WALK_05");
    TA_Smalltalk	(14,00,06,00,"OW_OM_ENTRANCE02");
};

func void Rtn_FMTaken_1439 () //OM ist vollgelaufen
{
	TA_Smalltalk	(06,00,14,00,"PSI_WALK_05");
    TA_Smalltalk	(14,00,06,00,"PSI_WALK_05");
};
