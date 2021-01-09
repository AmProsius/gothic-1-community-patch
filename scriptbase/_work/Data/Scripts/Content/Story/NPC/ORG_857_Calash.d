instance ORG_857_Calash (Npc_Default)
{
	//-------- primary data --------
	
	name =					"Calash";
	Npctype =				Npctype_Main;
	guild =					GIL_ORG;      
	level =					11;
	
	voice =					2;
	id =					857;

	//-------- abilities --------

	attribute[ATR_STRENGTH] =		50;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	172;
	attribute[ATR_HITPOINTS] =		172;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//	body mesh,	head mesh,	hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 2,"Hum_Head_Pony", 8,  1, ORG_ARMOR_M);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;		


	//-------- Talente --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	

	//-------- inventory --------
	                                    
	CreateInvItem (self, ItFoRice);
	CreateInvItem (self, ItFoLoaf);
	CreateInvItems(self, ItMiNugget, 5);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItKeLockpick);		
	EquipItem (self, ItMw_1H_Mace_War_01);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems (self, ItAmArrow, 10);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_prestart_857;
};



FUNC VOID Rtn_prestart_857 () 
{
 	TA_Position	(00,00,12,00,"OM_85");	
	TA_Position	(12,00,24,00,"OM_85");
};

FUNC VOID Rtn_start_857 ()
{
    TA_Position	(00,00,12,00,"OM_85");	
	TA_Position	(12,00,24,00,"OM_85");
};

FUNC VOID Rtn_OMFull_857 ()
{
	TA_Position	(00,00,12,00,"OM_85");	
	TA_Position	(12,00,24,00,"OM_85");
};






