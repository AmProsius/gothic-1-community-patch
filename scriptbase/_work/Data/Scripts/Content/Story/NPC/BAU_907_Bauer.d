instance BAU_907_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	9;
	id 			=	907;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 20;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 88;
	attribute[ATR_HITPOINTS] 	= 88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 4,  1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	
	CreateInvItems (self, ItFoRice,4);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItFoBooze);
	EquipItem (self, ItMw_1H_Scythe_01); 		
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_907;
};

FUNC VOID Rtn_start_907 ()
{
	TA_Sleep		(20,10,07,10,"NC_PATH_PEASANT3");
	TA_PickRice		(07,10,20,10,"NC_PATH82");
};













