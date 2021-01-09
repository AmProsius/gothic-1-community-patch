instance TPL_1402_GorNaToth (Npc_Default)
{
	//-------- primary data --------
	name =							"Gor Na Toth";
	npctype =						npctype_Main;
	guild =							GIL_TPL;
	level =							21;
	
	
	voice =							11;
	id =							1402;
		
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
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1 ,"Hum_Head_Psionic", 86 ,  1, TPL_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente -------- 

	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	
	//-------- inventory --------					
	//EquipItem (self, ItMw_2H_Sword_Light_04);
	
	CreateInvItem (self, ItMw_2H_Sword_Old_01); // HÄNDLER
	CreateInvItem (self, ItMw_2H_Sword_Light_01);
	CreateInvItem (self, ItMw_2H_Sword_Light_02);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1402;
};

FUNC VOID Rtn_start_1402 ()
{
    TA_Sleep	(01,00,05,00,"PSI_33_HUT_IN");
    TA_Boss		(05,00,01,00,"PSI_MEETING_BRIDGE_MOVEMENT");
};
