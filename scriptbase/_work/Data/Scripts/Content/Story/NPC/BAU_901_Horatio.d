instance BAU_901_Horatio (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Horatio";
	npctype	 	=	npctype_main;
	guild 		=	GIL_BAU;      
	level 		=	8;
	voice 		= 	9;
	id 			=	901;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 45;
	attribute[ATR_DEXTERITY] 	= 11;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 136;
	attribute[ATR_HITPOINTS] 	= 136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//			body mesh	,bdytex,skin,head mesh,	1headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Fighter", 99,  2,-1);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD;
		
	//-------- Talente --------                                    
	
		Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);		
	
	//-------- inventory --------                                    

		
		CreateInvItems (self, ItFoRice,5);
		CreateInvItem (self, ItMi_Stuff_Plate_01);
		CreateInvItem (self, ItFoBooze);
		EquipItem (self, ItMw_1H_Scythe_01); 		
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_901;

};

FUNC VOID Rtn_start_901 ()
{
	TA_SitCampfire	(20,00,06,00,"NC_PATH_PEASANT_OUTSIDE10");//CF3
	TA_PickRice		(06,00,20,00,"NC_PATH78_A");
};











