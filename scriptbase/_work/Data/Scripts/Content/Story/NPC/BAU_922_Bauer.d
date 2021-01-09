instance BAU_922_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	4;
	id 			=	922;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex 2,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Pony",51,  2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
		     
	
	//-------- inventory --------                                    

		
	CreateInvItems (self, ItFoRice,4);
	CreateInvItem (self, ItFoBooze);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	EquipItem (self, ItMw_1H_Scythe_01);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_922;
};

FUNC VOID Rtn_start_922 ()
{
	TA_SitCampfire  (20,00,07,00,"NC_PATH59"); //CF1
	TA_WashSelf 	(07,00,07,18,"NC_PATH_PEASANT_OUTSIDE8_WASH");
	TA_PickRice		(07,18,20,00,"NC_PATH82");
};














