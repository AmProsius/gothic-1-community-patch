instance NOV_1316_Novize (Npc_Default)
{
	//-------- primary data --------
	name 		=		Name_Novize;
	Npctype	 	=		Npctype_Ambient;
	guild 		=		GIL_NOV;
	level 		=		3;
	
	voice 		=		2;
	id 			=		1316;
	
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
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 1 ,"Hum_Head_Bald", 32 ,  1, NOV_ARMOR_L);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente --------
	
		
	//-------- inventory --------

	EquipItem (self, ItMw_1H_Hatchet_01);
	//CreateInvItem (self, ItFoSoup);
	//CreateInvItem (self, ItMiJoint);
	
	//-------------Daily Routine-------------

	daily_routine = Rtn_start_1316;

	//------------ //MISSIONs-------------------
	

};

FUNC VOID Rtn_start_1316 ()
{

    TA_Smith_Fire	(08,00,08,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(08,10,08,20,"PSI_SMITH_01");
	TA_Smith_Fire	(08,20,08,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(08,30,08,40,"PSI_SMITH_01");
	TA_Smith_Cool	(08,40,08,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(08,50,08,55,"PSI_SMITH_01");
    TA_SitAround	(08,55,09,00,"PSI_SMITH_01");

	TA_Smith_Fire	(09,00,09,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(09,10,09,20,"PSI_SMITH_01");
	TA_Smith_Fire	(09,20,09,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(09,30,09,40,"PSI_SMITH_01");
	TA_Smith_Cool	(09,40,09,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(09,50,09,55,"PSI_SMITH_01");
    TA_SitAround	(09,55,10,00,"PSI_SMITH_01");

	TA_Smith_Fire	(10,00,10,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(10,10,10,20,"PSI_SMITH_01");
	TA_Smith_Fire	(10,20,10,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(10,30,10,40,"PSI_SMITH_01");
	TA_Smith_Cool	(10,40,10,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(10,50,10,55,"PSI_SMITH_01");
    TA_SitAround	(10,55,11,00,"PSI_SMITH_01");
          
	TA_Smith_Fire	(11,00,11,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(11,10,11,20,"PSI_SMITH_01");
	TA_Smith_Fire	(11,20,11,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(11,30,11,40,"PSI_SMITH_01");
	TA_Smith_Cool	(11,40,11,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(11,50,11,55,"PSI_SMITH_01");
    TA_SitAround	(11,55,12,00,"PSI_SMITH_01");

	TA_Smith_Fire	(12,00,12,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(12,10,12,20,"PSI_SMITH_01");
	TA_Smith_Fire	(12,20,12,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(12,30,12,40,"PSI_SMITH_01");
	TA_Smith_Cool	(12,40,12,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(12,50,12,55,"PSI_SMITH_01");
    TA_SitAround	(12,55,13,00,"PSI_SMITH_01");
          
	TA_Smith_Fire	(13,00,13,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(13,10,13,20,"PSI_SMITH_01");
	TA_Smith_Fire	(13,20,13,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(13,30,13,40,"PSI_SMITH_01");
	TA_Smith_Cool	(13,40,13,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(13,50,13,55,"PSI_SMITH_01");
    TA_SitAround	(13,55,14,00,"PSI_SMITH_01");

	TA_Smith_Fire	(14,00,14,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(14,10,14,20,"PSI_SMITH_01");
	TA_Smith_Fire	(14,20,14,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(14,30,14,40,"PSI_SMITH_01");
	TA_Smith_Cool	(14,40,14,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(14,50,14,55,"PSI_SMITH_01");
    TA_SitAround	(14,55,15,00,"PSI_SMITH_01");

	TA_Smith_Fire	(15,00,15,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(15,10,15,20,"PSI_SMITH_01");
	TA_Smith_Fire	(15,20,15,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(15,30,15,40,"PSI_SMITH_01");
	TA_Smith_Cool	(15,40,15,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(15,50,15,55,"PSI_SMITH_01");
    TA_SitAround	(15,55,16,00,"PSI_SMITH_01");

	TA_Smith_Fire	(16,00,16,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(16,10,16,20,"PSI_SMITH_01");
	TA_Smith_Fire	(16,20,16,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(16,30,16,40,"PSI_SMITH_01");
	TA_Smith_Cool	(16,40,16,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(16,50,16,55,"PSI_SMITH_01");
    TA_SitAround	(16,55,17,00,"PSI_SMITH_01");

	TA_Smith_Fire	(17,00,17,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(17,10,17,20,"PSI_SMITH_01");
	TA_Smith_Fire	(17,20,17,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(17,30,17,40,"PSI_SMITH_01");
	TA_Smith_Cool	(17,40,17,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(17,50,17,55,"PSI_SMITH_01");
    TA_SitAround	(17,55,18,00,"PSI_SMITH_01");

	TA_Smith_Fire	(18,00,18,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(18,10,18,20,"PSI_SMITH_01");
	TA_Smith_Fire	(18,20,18,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(18,30,18,40,"PSI_SMITH_01");
	TA_Smith_Cool	(18,40,18,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(18,50,18,55,"PSI_SMITH_01");
    TA_SitAround	(18,55,19,00,"PSI_SMITH_01");

	TA_Smith_Fire	(19,00,19,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(19,10,19,20,"PSI_SMITH_01");
	TA_Smith_Fire	(19,20,19,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(19,30,19,40,"PSI_SMITH_01");
	TA_Smith_Cool	(19,40,19,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(19,50,19,55,"PSI_SMITH_01");
    TA_SitAround	(19,55,20,00,"PSI_SMITH_01");
    
    TA_Smith_Fire	(20,00,20,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(20,10,20,20,"PSI_SMITH_01");
	TA_Smith_Fire	(20,20,20,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(20,30,20,40,"PSI_SMITH_01");
	TA_Smith_Cool	(20,40,20,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(20,50,20,55,"PSI_SMITH_01");
    TA_SitAround	(20,55,21,00,"PSI_SMITH_01");

	TA_Smith_Fire	(21,00,21,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(21,10,21,20,"PSI_SMITH_01");
	TA_Smith_Fire	(21,20,21,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(21,30,21,40,"PSI_SMITH_01");
	TA_Smith_Cool	(21,40,21,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(21,50,21,55,"PSI_SMITH_01");
    TA_SitAround	(21,55,22,00,"PSI_SMITH_01");

	TA_Smith_Fire	(22,00,22,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(22,10,22,20,"PSI_SMITH_01");
	TA_Smith_Fire	(22,20,22,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(22,30,22,40,"PSI_SMITH_01");
	TA_Smith_Cool	(22,40,22,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(22,50,22,55,"PSI_SMITH_01");
    TA_SitAround	(22,55,23,00,"PSI_SMITH_01");
          
	TA_Smith_Fire	(23,00,23,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(23,10,23,20,"PSI_SMITH_01");
	TA_Smith_Fire	(23,20,23,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(23,30,23,40,"PSI_SMITH_01");
	TA_Smith_Cool	(23,40,23,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(23,50,23,55,"PSI_SMITH_01");
    TA_SitAround	(23,55,24,00,"PSI_SMITH_01");

	TA_Smith_Fire	(00,00,00,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(00,10,00,20,"PSI_SMITH_01");
	TA_Smith_Fire	(00,20,00,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(00,30,00,40,"PSI_SMITH_01");
	TA_Smith_Cool	(00,40,00,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(00,50,00,55,"PSI_SMITH_01");
    TA_SitAround	(00,55,01,00,"PSI_SMITH_01");
          
	TA_Smith_Fire	(01,00,01,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(01,10,01,20,"PSI_SMITH_01");
	TA_Smith_Fire	(01,20,01,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(01,30,01,40,"PSI_SMITH_01");
	TA_Smith_Cool	(01,40,01,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(01,50,01,55,"PSI_SMITH_01");
    TA_SitAround	(01,55,02,00,"PSI_SMITH_01");

	TA_Smith_Fire	(02,00,02,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(02,10,02,20,"PSI_SMITH_01");
	TA_Smith_Fire	(02,20,02,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(02,30,02,40,"PSI_SMITH_01");
	TA_Smith_Cool	(02,40,02,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(02,50,02,55,"PSI_SMITH_01");
    TA_SitAround	(02,55,03,00,"PSI_SMITH_01");

	TA_Smith_Fire	(03,00,03,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(03,10,03,20,"PSI_SMITH_01");
	TA_Smith_Fire	(03,20,03,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(03,30,03,40,"PSI_SMITH_01");
	TA_Smith_Cool	(03,40,03,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(03,50,03,55,"PSI_SMITH_01");
    TA_SitAround	(03,55,04,00,"PSI_SMITH_01");

	TA_Smith_Fire	(04,00,04,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(04,10,04,20,"PSI_SMITH_01");
	TA_Smith_Fire	(04,20,04,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(04,30,04,40,"PSI_SMITH_01");
	TA_Smith_Cool	(04,40,04,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(04,50,04,55,"PSI_SMITH_01");
    TA_SitAround	(04,55,05,00,"PSI_SMITH_01");

	TA_Smith_Fire	(05,00,05,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(05,10,05,20,"PSI_SMITH_01");
	TA_Smith_Fire	(05,20,05,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(05,30,05,40,"PSI_SMITH_01");
	TA_Smith_Cool	(05,40,05,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(05,50,05,55,"PSI_SMITH_01");
    TA_SitAround	(05,55,06,00,"PSI_SMITH_01");

	TA_Smith_Fire	(06,00,06,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(06,10,06,20,"PSI_SMITH_01");
	TA_Smith_Fire	(06,20,06,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(06,30,06,40,"PSI_SMITH_01");
	TA_Smith_Cool	(06,40,06,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(06,50,06,55,"PSI_SMITH_01");
    TA_SitAround	(06,55,07,00,"PSI_SMITH_01");

	TA_Smith_Fire	(07,00,07,10,"PSI_SMITH_01");
	TA_Smith_Anvil	(07,10,07,20,"PSI_SMITH_01");
	TA_Smith_Fire	(07,20,07,30,"PSI_SMITH_01");
	TA_Smith_Anvil	(07,30,07,40,"PSI_SMITH_01");
	TA_Smith_Cool	(07,40,07,50,"PSI_SMITH_01");
    TA_Smith_Sharp	(07,50,07,55,"PSI_SMITH_01");
    TA_SitAround	(07,55,08,00,"PSI_SMITH_01");	
};

FUNC VOID Rtn_PrepareRitual_1316 ()
{
	
};

FUNC VOID Rtn_OMFull_1316 ()
{
	
};

FUNC VOID Rtn_FMTaken_1316 ()
{
	
};

FUNC VOID Rtn_OrcAssault_1316 ()
{
	
};


