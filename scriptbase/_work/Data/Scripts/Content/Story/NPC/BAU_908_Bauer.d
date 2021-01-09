instance BAU_908_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	4;
	id 			=	908;

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
	//			body mesh     ,bdytex,skin,head mesh     ,headtex2,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,2,"Hum_Head_Pony", 1,  2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
		     
	//-------- inventory --------                                    

		
	CreateInvItems (self, ItFoRice,5);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	CreateInvItem (self, ItFoBooze);
	EquipItem (self, ItMw_1H_Scythe_01);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_908;
};

FUNC VOID Rtn_start_908 ()
{
	TA_Sleep		(20,15,07,15,"NC_PATH_PEASANT3");
	TA_PickRice		(07,15,20,15,"NC_PATH69");
};














