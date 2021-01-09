instance BAU_914_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	9;
	id 			=	914;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 15;
	attribute[ATR_DEXTERITY]	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 76;
	attribute[ATR_HITPOINTS] 	= 76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//		         body mesh,	body tex, skin,    headmms,            head tex, teeth, ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,2,"Hum_Head_Bald", 1,  1, -1);
	
	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------                                    
	
		
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,6);
	EquipItem (self, ItMw_1H_Scythe_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_914;
};

FUNC VOID Rtn_start_914 ()
{
	TA_Sleep		(20,20,07,20,"NC_PATH_PEASANT2");
	TA_PickRice		(07,20,20,20,"NC_PATH81");
};
















