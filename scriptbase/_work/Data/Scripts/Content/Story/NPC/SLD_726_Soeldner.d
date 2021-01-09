instance SLD_726_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				NPCTYPE_GUARD;
	guild =					GIL_SLD;       
	level =					18;
	
	voice =					11;
	id =					726;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		90;
	attribute[ATR_DEXTERITY] =		70;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	256;
	attribute[ATR_HITPOINTS] =		256;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 53,  1,SLD_ARMOR_H);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);

	
	fight_tactic	=	FAI_HUMAN_STRONG; 
	
	//-------- Talente --------

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);	

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	EquipItem (self, ItRw_Bow_Long_01);
	CreateInvItems(self, ItAmArrow, 20);
	CreateInvItems (self, ItFoRice,9);
	CreateInvItems (self, ItFoLoaf,5);
	CreateInvItems (self, ItFoMutton,1);
	CreateInvItems(self, ItMiNugget, 25);
	CreateInvItems (self, ItFoBooze,3);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItFo_Potion_Health_02,10);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Mug_01);
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_726;
};

FUNC VOID Rtn_start_726 () //Vor Erzhaufen
{
	TA_GuardPassage		(23,00,07,00,"NC_PATH40_GUARD2");
	TA_GuardPassage		(07,00,23,00,"NC_PATH40_GUARD2");
};

FUNC VOID Rtn_loadsword_726 () 
{
	TA_Guard		(23,00,07,00,"NC_PLACE02");
	TA_Guard		(07,00,23,00,"NC_PLACE02");
};








