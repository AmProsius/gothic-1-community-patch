instance ORG_844_Lefty (Npc_Default)
{
	//-------- primary data --------
	
	name =						"Lefty";
	Npctype =					NPCTYPE_MAIN;	
	guild =						GIL_ORG;      
	level =						8;
	voice =						7;
	id =						844;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 37, 2, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);	
	
	fight_tactic	=	FAI_HUMAN_STRONG;	
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	

	//-------- inventory --------   
	                                 
	CreateInvItems (self, ItKeLockpick,3);		
	CreateInvItems(self, ItMiNugget, 13);
	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItFoBooze, 3);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 3);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItem (self, ItAt_Claws_01);
	EquipItem (self, ItMw_1H_Mace_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 20);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_844;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_844 ()
{
	TA_SitCampfire 	(19,00,08,00,"NC_PATH86_MOVEMENT");
	TA_Smalltalk 	(08,00,19,00,"NC_PATH53");

};










