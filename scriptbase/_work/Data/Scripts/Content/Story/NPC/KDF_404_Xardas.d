instance KDF_404_Xardas (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Xardas";
	npctype		=	NPCTYPE_FRIEND;
	guild 		=	GIL_DMB;      
	level 		=	30;
	voice 		=	14;
	id 			=	404;
	flags       =   NPC_FLAG_IMMORTAL;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55;
	attribute[ATR_DEXTERITY] 	= 65;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 82, 1, DMB_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- talents --------                                    
	Npc_SetTalentSkill	(self, NPC_TALENT_MAGE,			6);


	//SN: Inventory deaktiviert, da Xardas 1. sowieso nicht kämpft und 2. sonst diese Dinge auch dem SC zum Verkauf anbietet
	//-------- spells--------                                     
	//CreateInvItems		(self,	ItArScrollSummonDemon,	20);
	//CreateInvItem		(self,	ItArRuneFireball);
	
	//-------- inventory --------                                    
	//CreateInvItems		(self,	ItFo_Potion_Health_03,	3);
	//CreateInvItems		(self,	ItFo_Potion_Mana_03, 	3);
	
	//EquipItem 			(self,	Amulett_der_Erleuchtung);
	//EquipItem 			(self,	Ring_der_Magie);
	//EquipItem 			(self,	Ring_der_Erleuchtung);

	//------------- ai -------------
	daily_routine = Rtn_start_404;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_404 ()
{
	TA_ReadBook_Xardas			(06,00,08,00,"DT_E3_07");	
	TA_ReadBook_Xardas			(08,00,06,00,"DT_E3_07");	
};

FUNC VOID Rtn_Study_404 ()
{
	TA_Stay				(21,00,06,00,"DT_PLATFORM_02");
	TA_ReadBook_Xardas			(06,00,09,00,"DT_E3_07");	
	TA_ReadBook_Xardas			(09,00,10,00,"DT_E3_05");	
	TA_ReadBook_Xardas			(10,00,11,00,"DT_E3_07");
	TA_ReadBook_Xardas			(11,00,13,00,"DT_E3_04");
	TA_ReadBook_Xardas			(13,00,15,00,"DT_E3_07");
	TA_ReadBook_Xardas			(15,00,17,00,"DT_E3_05");
	TA_ReadBook_Xardas			(17,00,21,00,"DT_E3_07");
};









































