instance SLD_753_Baloro (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Baloro";
	Npctype =					    Npctype_Main;
	guild =							GIL_SLD;       
	level =							16;
	
	voice =							8;
	id =							753;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Fighter", 51, 2,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MASTER; 
	
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	CreateInvItems (self, ItFoRice,8);
	CreateInvItems (self, ItFoLoaf,8);
	CreateInvItems (self, ItFoMutton,6);
	CreateInvItems(self, ItMiNugget, 15);
	CreateInvItems (self, ItFoBooze,6);
	CreateInvItems (self, ItLsTorch,5);
	CreateInvItems (self, ItFo_Potion_Health_02,7);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItem (self, ItMi_Stuff_Amphore_01);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_753;
	
	//------------- //MISSIONs------------------

};

FUNC VOID Rtn_FMCstart_753 ()
{
	TA_GuardPalisade	(01,00,13,00, "FMC_HUT07_OUT");
	TA_GuardPalisade	(13,00,01,00, "FMC_HUT07_OUT");
};










