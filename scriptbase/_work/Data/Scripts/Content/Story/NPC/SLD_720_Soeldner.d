instance SLD_720_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLD;       
	level =					16;
	
	voice =					8;
	id =					720;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		75;
	attribute[ATR_DEXTERITY] =		55;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	232;
	attribute[ATR_HITPOINTS] =		232;


	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 1,"Hum_Head_Pony", 47, 2,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
	CreateInvItems (self, ItFoRice,6);
	CreateInvItems (self, ItFoLoaf,6);
	CreateInvItems (self, ItFoMutton,6);
	CreateInvItems(self, ItMiNugget, 16);
	CreateInvItems (self, ItFoBooze,6);
	CreateInvItems (self, ItLsTorch,6);
	CreateInvItems (self, ItFo_Potion_Health_02,6);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Mug_01);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_720;
};

FUNC VOID Rtn_start_720 ()
{
	TA_Sleep			(00,30,08,00,"NC_HUT07_IN");
	TA_RoastScavenger	(08,00,22,00,"NC_PLACE03_MOVEMENT");
	TA_SitAround		(22,00,00,30,"NC_PLACE03_MOVEMENT");
};










