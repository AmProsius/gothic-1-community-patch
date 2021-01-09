instance VLK_538_Huno (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Huno";
	npctype =						npctype_Main;
	guild =							GIL_VLK;      
	level =							12;
	
	
	voice =							9;
	id =							538;


	//-------- abilities --------
	
	attribute[ATR_STRENGTH] =		55;
	attribute[ATR_DEXTERITY] =		15;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	184;
	attribute[ATR_HITPOINTS] =		184;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Bald", 71,  4, VLK_ARMOR_L);

        B_Scale (self); 
        Mdl_SetModelFatness (self, 1);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talents  --------                                    

	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    
	EquipItem 		(self,	ItMw_1H_Sledgehammer_01);

	CreateInvItems	(self,	ItMiSwordRaw,		10);
	CreateInvItems	(self,	ItMiSwordRawHot,	10);
	CreateInvItems	(self,	ItMiSwordBladeHot,	10);
	CreateInvItems	(self,	ItMiSwordBlade,		10);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_538;
};

FUNC VOID Rtn_start_538 ()
{
	TA_Sleep		(22,00,08,00,"OCR_HUT_35");
	
	TA_Smith_Fire	(08,00,08,10,"OCR_HUT_34");
	TA_Smith_Anvil	(08,10,08,20,"OCR_HUT_34");
	TA_Smith_Fire	(08,20,08,30,"OCR_HUT_34");
	TA_Smith_Anvil	(08,30,08,40,"OCR_HUT_34");
	TA_Smith_Cool	(08,40,08,50,"OCR_HUT_34");
	TA_Smith_Anvil	(08,50,09,00,"OCR_HUT_34");

	TA_Smith_Fire	(09,00,09,10,"OCR_HUT_34");
	TA_Smith_Anvil	(09,10,09,20,"OCR_HUT_34");
	TA_Smith_Fire	(09,20,09,30,"OCR_HUT_34");
	TA_Smith_Anvil	(09,30,09,40,"OCR_HUT_34");
	TA_Smith_Cool	(09,40,09,50,"OCR_HUT_34");
	TA_Smith_Anvil	(09,50,10,00,"OCR_HUT_34");

	TA_Smith_Fire	(10,00,10,10,"OCR_HUT_34");
	TA_Smith_Anvil	(10,10,10,20,"OCR_HUT_34");
	TA_Smith_Fire	(10,20,10,30,"OCR_HUT_34");
	TA_Smith_Anvil	(10,30,10,40,"OCR_HUT_34");
	TA_Smith_Cool	(10,40,10,50,"OCR_HUT_34");
	TA_Smith_Anvil	(10,50,11,00,"OCR_HUT_34");    
          
	TA_Smith_Fire	(11,00,11,10,"OCR_HUT_34");
	TA_Smith_Anvil	(11,10,11,20,"OCR_HUT_34");
	TA_Smith_Fire	(11,20,11,30,"OCR_HUT_34");
	TA_Smith_Anvil	(11,30,11,40,"OCR_HUT_34");
	TA_Smith_Cool	(11,40,11,50,"OCR_HUT_34");
	TA_Smith_Anvil	(11,50,12,00,"OCR_HUT_34");


	TA_Smith_Fire	(12,00,12,10,"OCR_HUT_34");
	TA_Smith_Anvil	(12,10,12,20,"OCR_HUT_34");
	TA_Smith_Fire	(12,20,12,30,"OCR_HUT_34");
	TA_Smith_Anvil	(12,30,12,40,"OCR_HUT_34");
	TA_Smith_Cool	(12,40,12,50,"OCR_HUT_34");
	TA_Smith_Anvil	(12,50,13,00,"OCR_HUT_34");
          
	TA_Smith_Fire	(13,00,13,10,"OCR_HUT_34");
	TA_Smith_Anvil	(13,10,13,20,"OCR_HUT_34");
	TA_Smith_Fire	(13,20,13,30,"OCR_HUT_34");
	TA_Smith_Anvil	(13,30,13,40,"OCR_HUT_34");
	TA_Smith_Cool	(13,40,13,50,"OCR_HUT_34");
	TA_Smith_Anvil	(13,50,14,00,"OCR_HUT_34");

	TA_Smith_Fire	(14,00,14,10,"OCR_HUT_34");
	TA_Smith_Anvil	(14,10,14,20,"OCR_HUT_34");
	TA_Smith_Fire	(14,20,14,30,"OCR_HUT_34");
	TA_Smith_Anvil	(14,30,14,40,"OCR_HUT_34");
	TA_Smith_Cool	(14,40,14,50,"OCR_HUT_34");
	TA_Smith_Anvil	(14,50,15,00,"OCR_HUT_34");

	TA_Smith_Fire	(15,00,15,10,"OCR_HUT_34");
	TA_Smith_Anvil	(15,10,15,20,"OCR_HUT_34");
	TA_Smith_Fire	(15,20,15,30,"OCR_HUT_34");
	TA_Smith_Anvil	(15,30,15,40,"OCR_HUT_34");
	TA_Smith_Cool	(15,40,15,50,"OCR_HUT_34");
 	TA_Smith_Anvil	(15,50,16,00,"OCR_HUT_34");

	TA_Smith_Fire	(16,00,16,10,"OCR_HUT_34");
	TA_Smith_Anvil	(16,10,16,20,"OCR_HUT_34");
	TA_Smith_Fire	(16,20,16,30,"OCR_HUT_34");
	TA_Smith_Anvil	(16,30,16,40,"OCR_HUT_34");
	TA_Smith_Cool	(16,40,16,50,"OCR_HUT_34");
	TA_Smith_Anvil	(16,50,17,00,"OCR_HUT_34");

	TA_Smith_Fire	(17,00,17,10,"OCR_HUT_34");
	TA_Smith_Anvil	(17,10,17,20,"OCR_HUT_34");
	TA_Smith_Fire	(17,20,17,30,"OCR_HUT_34");
	TA_Smith_Anvil	(17,30,17,40,"OCR_HUT_34");
	TA_Smith_Cool	(17,40,17,50,"OCR_HUT_34");
	TA_Smith_Anvil	(17,50,18,00,"OCR_HUT_34");

	TA_Smith_Fire	(18,00,18,10,"OCR_HUT_34");
	TA_Smith_Anvil	(18,10,18,20,"OCR_HUT_34");
	TA_Smith_Fire	(18,20,18,30,"OCR_HUT_34");
	TA_Smith_Anvil	(18,30,18,40,"OCR_HUT_34");
	TA_Smith_Cool	(18,40,18,50,"OCR_HUT_34");
	TA_Smith_Anvil	(18,50,19,00,"OCR_HUT_34");

	TA_Smith_Fire	(19,00,19,10,"OCR_HUT_34");
	TA_Smith_Anvil	(19,10,19,20,"OCR_HUT_34");
	TA_Smith_Fire	(19,20,19,30,"OCR_HUT_34");
	TA_Smith_Anvil	(19,30,19,40,"OCR_HUT_34");
	TA_Smith_Cool	(19,40,19,50,"OCR_HUT_34");
	TA_Smith_Anvil	(19,50,20,00,"OCR_HUT_34");

	TA_Smith_Fire	(20,00,20,10,"OCR_HUT_34");
	TA_Smith_Anvil	(20,10,20,20,"OCR_HUT_34");
	TA_Smith_Fire	(20,20,20,30,"OCR_HUT_34");
	TA_Smith_Anvil	(20,30,20,40,"OCR_HUT_34");
	TA_Smith_Cool	(20,40,20,50,"OCR_HUT_34");
	TA_Smith_Anvil	(20,50,21,00,"OCR_HUT_34");
	
	TA_Smith_Fire	(21,00,21,10,"OCR_HUT_34");
	TA_Smith_Anvil	(21,10,21,20,"OCR_HUT_34");
	TA_Smith_Fire	(21,20,21,30,"OCR_HUT_34");
	TA_Smith_Anvil	(21,30,21,40,"OCR_HUT_34");
	TA_Smith_Cool	(21,40,21,50,"OCR_HUT_34");
	TA_Smith_Anvil	(21,50,22,00,"OCR_HUT_34");
};








