instance NOV_1330_BaalParvez (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Baal Parvez";
	Npctype 	=		Npctype_Main;
	guild 		=		GIL_NOV;
	level 		=		18;

	voice 		=		10;
	id 			=		1330;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	30;
	attribute[ATR_MANA_MAX] 		=	50;
	attribute[ATR_MANA] 			=	50;
	attribute[ATR_HITPOINTS_MAX] 	=	200;
	attribute[ATR_HITPOINTS] 		=	200;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Psionic", 25 ,  2, NOV_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Mace_04);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
	CreateInvItems	(self, ItMiNugget, 50);
	CreateInvItems	(self, ItFo_Potion_Health_03, 1);
	CreateInvItems	(self, ItFoRice, 1);
	 
	
        
	//-------- inventory --------
	
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1330;
};

FUNC VOID Rtn_start_1330 ()
{
	TA_Sleep		(22,35,07,45,"OCR_HUT_59");
	TA_WashSelf		(07,45,08,00,"OCR_WASH_8");
	TA_StandAround	(08,00,22,35,"OCR_MARKETPLACE_HANGAROUND");
};

FUNC VOID Rtn_Guide_1330 ()
{
	TA_GuidePC (08,00,20,00,"PATH_OC_PSI_18");
	TA_GuidePC (20,00,08,00,"PATH_OC_PSI_18"); 
};
