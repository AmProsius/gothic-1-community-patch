instance BAU_917_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	9;
	id 			=	917;

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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Bald", 2, 1, -1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	                            	
	//-------- Talente -------- 	                                  
	
	//-------- inventory --------                                    

		
	EquipItem (self, ItMw_1H_Scythe_01);
	CreateInvItems (self, ItFoRice,5);
	
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_917;
};

FUNC VOID Rtn_start_917 ()
{
	TA_Sleep		(20,35,07,35,"NC_PATH_PEASANT_SLEEP");
	TA_PickRice		(07,35,20,35,"NC_PATH80");
};











