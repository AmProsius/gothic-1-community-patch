instance NOV_1351_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype 		=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		3;
	flags 		=		0;
	
	voice 		=		3;
	id 			=		1351;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	10;
	attribute[ATR_DEXTERITY] 		=	10;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	76;
	attribute[ATR_HITPOINTS] 		=	76;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",1, 2 ,"Hum_Head_Bald", 6 ,  0, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
 
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1351;
	
	//------------- //MISSIONs-------------
	

};

FUNC VOID Rtn_start_1351 ()
{
	TA_Smith_Fire	(08,10,08,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(08,20,08,30,"PSI_SMITH_01");
	TA_Smith_Fire	(08,30,08,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(08,30,08,40,"PSI_SMITH_01");
	TA_Smith_Cool	(08,50,09,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(09,00,09,05,"PSI_SMITH_01");
    TA_SitAround	(09,05,09,10,"PSI_SMITH_01");

	TA_Smith_Fire	(09,10,09,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(09,20,09,30,"PSI_SMITH_01");
	TA_Smith_Fire	(09,30,09,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(09,30,09,40,"PSI_SMITH_01");
	TA_Smith_Cool	(09,50,10,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(10,00,10,05,"PSI_SMITH_01");
    TA_SitAround	(10,05,10,10,"PSI_SMITH_01");

	TA_Smith_Fire	(10,10,10,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(10,20,10,30,"PSI_SMITH_01");
	TA_Smith_Fire	(10,30,10,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(10,30,10,40,"PSI_SMITH_01");
	TA_Smith_Cool	(10,50,11,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(11,00,11,05,"PSI_SMITH_01");
    TA_SitAround	(11,05,11,10,"PSI_SMITH_01");
          
	TA_Smith_Fire	(11,10,11,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(11,20,11,30,"PSI_SMITH_01");
	TA_Smith_Fire	(11,30,11,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(11,40,11,50,"PSI_SMITH_01");
	TA_Smith_Cool	(11,50,12,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(12,00,12,05,"PSI_SMITH_01");
    TA_SitAround	(12,05,12,10,"PSI_SMITH_01");
    
	TA_Smith_Fire	(12,10,12,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(12,20,12,30,"PSI_SMITH_01");
	TA_Smith_Fire	(12,30,12,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(12,40,12,50,"PSI_SMITH_01");
	TA_Smith_Cool	(12,50,13,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(13,00,13,05,"PSI_SMITH_01");
    TA_SitAround	(13,05,13,10,"PSI_SMITH_01");
          
	TA_Smith_Fire	(13,10,13,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(13,20,13,30,"PSI_SMITH_01");
	TA_Smith_Fire	(13,30,13,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(13,40,13,50,"PSI_SMITH_01");
	TA_Smith_Cool	(13,50,14,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(14,00,14,05,"PSI_SMITH_01");
    TA_SitAround	(14,05,14,10,"PSI_SMITH_01");

	TA_Smith_Fire	(14,10,14,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(14,20,14,30,"PSI_SMITH_01");
	TA_Smith_Fire	(14,30,14,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(14,40,14,50,"PSI_SMITH_01");
	TA_Smith_Cool	(14,50,15,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(15,00,15,05,"PSI_SMITH_01");
    TA_SitAround	(15,05,15,10,"PSI_SMITH_01");

	TA_Smith_Fire	(15,10,15,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(15,20,15,30,"PSI_SMITH_01");
	TA_Smith_Fire	(15,30,15,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(15,40,15,50,"PSI_SMITH_01");
	TA_Smith_Cool	(15,50,16,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(16,00,16,05,"PSI_SMITH_01");
    TA_SitAround	(16,05,16,10,"PSI_SMITH_01");

	TA_Smith_Fire	(16,10,16,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(16,20,16,30,"PSI_SMITH_01");
	TA_Smith_Fire	(16,30,16,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(16,40,16,50,"PSI_SMITH_01");
	TA_Smith_Cool	(16,50,16,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(17,00,17,05,"PSI_SMITH_01");
    TA_SitAround	(17,05,17,10,"PSI_SMITH_01");

	TA_Smith_Fire	(17,10,17,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(17,20,17,30,"PSI_SMITH_01");
	TA_Smith_Fire	(17,30,17,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(17,40,17,50,"PSI_SMITH_01");
	TA_Smith_Cool	(17,50,17,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(18,00,18,05,"PSI_SMITH_01");
    TA_SitAround	(18,05,18,10,"PSI_SMITH_01");
    
	TA_Smith_Fire	(18,10,18,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(18,20,18,30,"PSI_SMITH_01");
	TA_Smith_Fire	(18,30,18,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(18,40,18,50,"PSI_SMITH_01");
	TA_Smith_Cool	(18,50,19,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(19,00,19,05,"PSI_SMITH_01");
    TA_SitAround	(19,05,19,10,"PSI_SMITH_01");

	TA_Smith_Fire	(19,10,19,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(19,20,19,30,"PSI_SMITH_01");
	TA_Smith_Fire	(19,30,19,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(19,40,19,50,"PSI_SMITH_01");
	TA_Smith_Cool	(19,50,19,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(20,00,20,05,"PSI_SMITH_01");
    TA_SitAround	(20,05,20,10,"PSI_SMITH_01");
    
    TA_Smith_Fire	(20,10,20,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(20,20,20,30,"PSI_SMITH_01");
	TA_Smith_Fire	(20,30,20,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(20,40,20,50,"PSI_SMITH_01");
	TA_Smith_Cool	(20,50,21,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(21,00,21,05,"PSI_SMITH_01");
    TA_SitAround	(21,05,21,10,"PSI_SMITH_01");

	TA_Smith_Fire	(21,10,21,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(21,20,21,30,"PSI_SMITH_01");
	TA_Smith_Fire	(21,30,21,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(21,40,21,50,"PSI_SMITH_01");
	TA_Smith_Cool	(21,50,22,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(22,00,22,05,"PSI_SMITH_01");
    TA_SitAround	(22,05,22,10,"PSI_SMITH_01");

	TA_Smith_Fire	(22,10,22,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(22,20,22,30,"PSI_SMITH_01");
	TA_Smith_Fire	(22,30,22,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(22,40,22,50,"PSI_SMITH_01");
	TA_Smith_Cool	(22,50,22,60,"PSI_SMITH_01");
    TA_Smith_Sharp	(23,00,23,05,"PSI_SMITH_01");
    TA_SitAround	(23,05,23,10,"PSI_SMITH_01");
          
	TA_Smith_Fire	(23,10,23,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(23,20,23,30,"PSI_SMITH_01");
	TA_Smith_Fire	(23,30,23,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(23,40,23,60,"PSI_SMITH_01");
	TA_Smith_Cool	(23,50,00,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(00,00,00,05,"PSI_SMITH_01");
    TA_SitAround	(00,05,00,10,"PSI_SMITH_01");

	TA_Smith_Fire	(00,10,00,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(00,20,00,30,"PSI_SMITH_01");
	TA_Smith_Fire	(00,30,00,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(00,40,00,50,"PSI_SMITH_01");
	TA_Smith_Cool	(00,50,01,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(01,00,01,05,"PSI_SMITH_01");
    TA_SitAround	(01,05,01,10,"PSI_SMITH_01");
          
	TA_Smith_Fire	(01,10,01,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(01,20,01,30,"PSI_SMITH_01");
	TA_Smith_Fire	(01,30,01,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(01,40,01,50,"PSI_SMITH_01");
	TA_Smith_Cool	(01,50,02,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(02,00,02,05,"PSI_SMITH_01");
    TA_SitAround	(02,05,02,10,"PSI_SMITH_01");

	TA_Smith_Fire	(02,10,02,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(02,20,02,30,"PSI_SMITH_01");
	TA_Smith_Fire	(02,30,02,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(02,40,02,50,"PSI_SMITH_01");
	TA_Smith_Cool	(02,50,03,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(03,00,03,05,"PSI_SMITH_01");
    TA_SitAround	(03,05,03,10,"PSI_SMITH_01");

	TA_Smith_Fire	(03,10,03,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(03,20,03,30,"PSI_SMITH_01");
	TA_Smith_Fire	(03,30,03,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(03,40,03,50,"PSI_SMITH_01");
	TA_Smith_Cool	(03,50,04,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(04,00,04,05,"PSI_SMITH_01");
    TA_SitAround	(04,05,04,10,"PSI_SMITH_01");

	TA_Smith_Fire	(04,10,04,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(04,20,04,30,"PSI_SMITH_01");
	TA_Smith_Fire	(04,30,04,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(04,40,04,50,"PSI_SMITH_01");
	TA_Smith_Cool	(04,50,05,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(05,00,05,05,"PSI_SMITH_01");
    TA_SitAround	(05,05,05,10,"PSI_SMITH_01");

	TA_Smith_Fire	(05,10,05,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(05,20,05,30,"PSI_SMITH_01");
	TA_Smith_Fire	(05,30,05,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(05,40,05,50,"PSI_SMITH_01");
	TA_Smith_Cool	(05,50,06,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(06,00,06,05,"PSI_SMITH_01");
    TA_SitAround	(06,05,06,10,"PSI_SMITH_01");

	TA_Smith_Fire	(06,10,06,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(06,20,06,30,"PSI_SMITH_01");
	TA_Smith_Fire	(06,30,06,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(06,40,06,50,"PSI_SMITH_01");
	TA_Smith_Cool	(06,50,07,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(07,00,07,05,"PSI_SMITH_01");
    TA_SitAround	(07,05,07,10,"PSI_SMITH_01");

	TA_Smith_Fire	(07,10,07,20,"PSI_SMITH_01");
	TA_Smith_Anvil	(07,20,07,30,"PSI_SMITH_01");
	TA_Smith_Fire	(07,30,07,40,"PSI_SMITH_01");
	TA_Smith_Anvil	(07,40,07,50,"PSI_SMITH_01");
	TA_Smith_Cool	(07,50,08,00,"PSI_SMITH_01");
    TA_Smith_Sharp	(08,00,08,05,"PSI_SMITH_01");
    TA_SitAround	(08,05,08,10,"PSI_SMITH_01");
};

FUNC VOID Rtn_PrepareRitual_1351 ()
{
};

FUNC VOID Rtn_OMFull_1351 ()
{
	
};

FUNC VOID Rtn_FMTaken_1351 ()
{
	
};

FUNC VOID Rtn_OrcAssault_1351 () 
{
	
};
