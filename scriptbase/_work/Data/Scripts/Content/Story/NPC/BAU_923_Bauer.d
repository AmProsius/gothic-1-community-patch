instance BAU_923_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	2;
	id 			=	923;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Bald", 5, 2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente --------                                    
	
	//-------- inventory --------                                    
		
		CreateInvItems (self, ItFoRice,3);
		EquipItem (self, ItMw_1H_Scythe_01);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_923;

};

FUNC VOID Rtn_start_923 ()
{
	TA_SitCampfire  (20,05,07,05,"NC_PATH_PEASANT_OUTSIDE20"); //CF1
	TA_WashSelf 	(07,05,07,23,"NC_PATH_PEASANT_OUTSIDE8_WASH");
	TA_PickRice		(07,23,20,05,"NC_PATH83_MOVEMENT");
};

