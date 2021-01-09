//********************************************************************************************************//
// 3 SKLAVEN MÜSST IHR SEIN...DIE ORKSKLAVEN IN DER ALTEN MINE
//*********************************************************************************************************//
instance Orc_2001_Sklave(Npc_Default)
{
	//-------- primary data --------
	
	name =							"Orc Slave";
	slot =							"Orc Slave";
	guild =							GIL_ORCSLAVE;      
	level =							3;
	flags =							0;
	voice =							17;
	ID	  =							2001;

		//---------	abilities --------
	attribute[ATR_STRENGTH]			=		90;
	attribute[ATR_DEXTERITY]		=		20;
	
	attribute[ATR_HITPOINTS_MAX]	=		250;
	attribute[ATR_HITPOINTS]		=		250;

	protection[PROT_EDGE]			=		15;
	protection[PROT_BLUNT]			=		15;
	protection[PROT_POINT]			=		5;
	protection[PROT_FIRE]			=		7;
	protection[PROT_MAGIC]			=		0;

//	talents					=		0;
	

	//-------- visuals --------
	Mdl_SetVisual		(self,"orc.mds");
	Mdl_SetVisualBody	(self,"Orc_BodySlave",DEFAULT,DEFAULT,"Orc_HeadSlave", DEFAULT,  DEFAULT,-1);


	//-------- ai --------
//	start_aistate				=		ZS_Orc_Stomper;//SN: wegen Überarbeitung Ork-AI entfernt
	fight_tactic				=		FAI_ORC;
	senses_range				=		2000;	

// 			daily routine
	
	daily_routine = rtn_Nothing_2001;
};
	
func void rtn_Nothing_2001()
{
	TA_Orc_SitOnFloor  (00,00,12,00,"OM_CAVE3_15"); 
	TA_Orc_SitOnFloor  (12,00,00,00,"OM_CAVE3_15");  
};

func void rtn_Stomper_2001()
{
	TA_Orc_Stomper (00,00,12,00,"OM_CAVE3_15"); 
	TA_Orc_Stomper (12,00,00,00,"OM_CAVE3_15");                                                     
};
//*********************************************************************************************************//
instance Orc_2002_Sklave(Npc_Default)
{
	//-------- primary data --------
	
	name =							"Orc Slave";
	slot =							"Orc Slave";
	guild =							GIL_ORCSLAVE;      
	level =							3;
	flags =							0;
	voice =							17;
	ID	  =							2002;

		//---------	abilities --------
	attribute[ATR_STRENGTH]			=		85;
	attribute[ATR_DEXTERITY]		=		20;
	
	attribute[ATR_HITPOINTS_MAX]	=		250;
	attribute[ATR_HITPOINTS]		=		250;

	protection[PROT_EDGE]			=		15;
	protection[PROT_BLUNT]			=		15;
	protection[PROT_POINT]			=		5;
	protection[PROT_FIRE]			=		7;
	protection[PROT_MAGIC]			=		0;

//	talents					=		0;
	

	//-------- visuals --------
	Mdl_SetVisual		(self,"orc.mds");
	Mdl_SetVisualBody	(self,"Orc_BodySlave",DEFAULT,DEFAULT,"Orc_HeadSlave", DEFAULT,  DEFAULT,-1);


	//-------- ai --------
//	start_aistate				=		ZS_Orc_Stomper;//SN: wegen Überarbeitung Ork-AI entfernt
	fight_tactic				=		FAI_ORC;
	senses_range				=		2000;	

// 			daily routine
	
	daily_routine = rtn_stonemill_2002;
};
	
func void rtn_stonemill_2002()
{
	TA_Orc_Stonemill (00,00,12,00,"OM_CAVE1_BELLOWS"); 
	TA_Orc_Stonemill (12,00,00,00,"OM_CAVE1_BELLOWS");  
};







