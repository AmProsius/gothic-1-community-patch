instance Org_829_Organisator (Npc_Default)
//###Frei Mine-Waypoints eintragen
{
	//-------- primary data --------
	
	name =					Name_Torwache;
	Npctype =				NPCTYPE_MAIN;
	guild =							GIL_ORG;       
	level =							4;
	
	voice =							6;
	id =							829;



	//-------- abilities --------

	attribute[ATR_STRENGTH] =		15;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
//	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_FatBald", 13, 1,ORG_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
	
	Npc_SetTalentSkill (self, NPC_TALENT_SNEAK,	1);	
	
	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_01);
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems(self, ItMiNugget, 9);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 2);
	CreateInvItems (self, ItLsTorch, 2);
	CreateInvItems (self, ItFo_Potion_Health_01, 1);
	CreateInvItem (self, ItMi_Stuff_Cup_01);
	CreateInvItem (self, ItAt_Teeth_01);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_829;

};

FUNC VOID Rtn_start_829 ()
{
	TA_GuardPassage	(08,00,20,00,"OW_PATH_07_21_GUARD_RIGHT");
	TA_GuardPassage	(20,00,08,00,"OW_PATH_07_21_GUARD_RIGHT");
};










