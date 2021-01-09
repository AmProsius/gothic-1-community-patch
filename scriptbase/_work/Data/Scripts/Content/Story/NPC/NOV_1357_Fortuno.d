instance NOV_1357_Fortuno (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Fortuno";
	Npctype 		=		Npctype_Main;
	guild 		=	        GIL_NOV;
	level 		=	        9;
	
	voice 		=     		5;
	id 			=     		1357;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	15;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	148;
	attribute[ATR_HITPOINTS] 		=	148;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 27 ,  1, NOV_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_MASTER;
	
	//-------- Talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);			
	
	//-------- inventory --------

	EquipItem (self, Fortunos_Keule);
	CreateInvItems(self, itmijoint_1, 30);
	CreateInvItems(self, itmijoint_2, 20);
	CreateInvItems(self, itmijoint_3, 10);
 	CreateInvItems(self, ItMiNugget,	237);
 
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1357;
};

FUNC VOID Rtn_start_1357 ()
{
    TA_Sleep 	(01,00,06,00,"PSI_32_HUT_IN");
	TA_Stand	(06,00,01,00,"PSI_HERB_SHOP");	
};

