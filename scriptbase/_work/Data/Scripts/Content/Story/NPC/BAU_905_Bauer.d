instance BAU_905_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	name_Bauer;
	npctype		=	npctype_ambient;
	guild 		=	GIL_BAU;      
	level 		=	2;
	voice 		=	2;
	id 			=	905;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		20;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	88;
	attribute[ATR_HITPOINTS] =		88;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",5 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
		CreateInvItems (self, ItFoRice,5);
		CreateInvItem (self, ItMi_Stuff_Plate_01);
		EquipItem (self, ItMw_1H_Scythe_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_905;
};

FUNC VOID Rtn_start_905 ()
{
	TA_Sleep		(20,05,07,05,"NC_PATH_PEASANT3");
	TA_WashSelf		(07,05,07,25,"NC_PATH_PEASANT5");
	TA_PickRice		(07,25,20,05,"NC_PATH69");
};












