instance BAU_904_Bauer (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_BAUER;
	guild =							GIL_BAU;      
	level =							2;
	flags =							0;
	
	voice =							9;
	id =							904;


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
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Thief", 5, 1,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

		
	CreateInvItems (self, ItFoRice,4);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	EquipItem (self, ItMw_1H_Scythe_01);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_904;
};

FUNC VOID Rtn_start_904 ()
{
	TA_Sleep		(20,00,07,00,"NC_PATH_PEASANT3");
	TA_WashSelf		(07,00,07,20,"NC_PATH_PEASANT5");
	TA_PickRice		(07,20,20,00,"NC_DAM_BOTTOM");
};
















