instance SLD_738_Soeldner (Npc_Default)
{
	//-------- primary data --------
	
	name =					Name_Soeldner;
	Npctype =				Npctype_Guard;
	guild =					GIL_SLD;       
	level =					16;
	
	voice =					8;
	id =					728;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Pony", 53,  1,SLD_ARMOR_M);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);

	
    fight_tactic	=	FAI_HUMAN_STRONG; 
			
	//-------- Talente --------
	
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	

	//-------- inventory --------                                    

	EquipItem (self, ItMw_1H_Mace_War_03);
	CreateInvItem (self, ItFoRice);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItMi_Stuff_Barbknife_01);
	CreateInvItems (self, ItMiNugget, 15);
	
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_738;
};

FUNC VOID Rtn_start_738 ()
{
	TA_GuardWheelOpen  (07,55,19,55,"NC_MAINGATE_VWHEEL");
	TA_GuardWheelOpen  (19,55,07,55,"NC_MAINGATE_VWHEEL");
};









