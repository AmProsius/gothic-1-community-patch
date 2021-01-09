instance ORG_855_Wolf (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Wolf";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					11;
	
	voice =					9;
	id =					855;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		90;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 38,  1, ORG_ARMOR_H);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;
	
	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	 B_Give_WolfChapter1Weapons ();                                   
	CreateInvItems (self, ItKeLockpick,1);		
	CreateInvItems (self, ItMiNugget, 12);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoBooze, 1);
	CreateInvItems (self, ItLsTorch, 1);
	CreateInvItems (self, ItFo_Potion_Health_01, 3);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItFoMutton);
	CreateInvItem (self, ItAt_Claws_01);	
	EquipItem (self, ItMw_1H_Mace_War_01);		
	CreateInvItems (self, ItAmArrow, 20);
	CreateInvItems (self, ItFo_wineberrys_01, 5);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_855;
};

FUNC VOID Rtn_start_855 ()
{
	TA_Sleep 			(01,00,07,30,"NC_HUT11_IN");
	TA_Boss 			(07,30,10,30,"NC_HUT11_OUT");
	TA_RoastScavenger 	(10,30,20,30,"NC_PLACE04");
	TA_SitAround		(20,30,01,00,"NC_PLACE04");
};











