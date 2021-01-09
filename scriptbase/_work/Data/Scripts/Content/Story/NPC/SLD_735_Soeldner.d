instance SLD_735_Soeldner (Npc_Default)
//###Frei Mine-Waypoints eintragen
{
	//-------- primary data --------
	
	name =							Name_Soeldner;
	Npctype =						NPCTYPE_GUARD;
	guild =							GIL_SLD;       
	level =							11;
	
	voice =							11;
	id =							735;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		35;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_FatBald", 13, 1,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_02);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
	CreateInvItems (self, ItFoRice,7);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,4);
	CreateInvItems(self, ItMiNugget, 20);
	CreateInvItems (self, ItFoBooze,7);
	CreateInvItems (self, ItLsTorch,3);
	CreateInvItems (self, ItFo_Potion_Health_02,6);
	CreateInvItem (self, ItMi_Stuff_Amphore_01);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_735;

};

FUNC VOID Rtn_start_735 ()
{
	TA_Sleep		(20,55,07,05,"NC_HUT08_IN");
	TA_PracticeSword(07,05,20,55,"NC_WATERFALL_TOP01");
};

FUNC VOID Rtn_FMTaken_735 () 
{
	TA_Stay		(00,00,	23,00,"OW_PATH_075_GUARD2");    
	TA_Stay		(23,00,	24,00,"OW_PATH_075_GUARD2");     
};










