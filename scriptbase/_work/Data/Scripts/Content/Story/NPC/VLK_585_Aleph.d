instance VLK_585_Aleph (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Aleph";
	npctype =						npctype_main;
	guild =							GIL_VLK;      
	level =							5;
	
	
	voice =							5;
	id =							585;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		25;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	100;
	attribute[ATR_HITPOINTS] =		100;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Thief", 71,  0, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents --------                                    
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	EquipItem		(self, ItMw_1h_Nailmace_01);
	CreateInvItem	(self, ItMwPickaxe);

	CreateInvItems	(self, ItKe_OM_03,	1);	// Mission-Item!
	EquipItem		(self, Staerkering);
	
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_585;
	};

FUNC VOID Rtn_start_585 ()
{
   
	TA_SitAround(04,00,16,00,"OM_PICKORE_05"); 
	TA_SitAround(16,00,04,00,"OM_PICKORE_05");
	
	
};
FUNC VOID Rtn_Busy_585 ()
{
   
	TA_PickOre	(16,00,04,00,"OM_PICKORE_05");
	TA_PickOre	(04,00,16,00,"OM_PICKORE_05");
	
};












