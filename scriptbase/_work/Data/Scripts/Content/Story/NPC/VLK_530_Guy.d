instance VLK_530_Guy (Npc_Default)
{
	//-------- primary data --------
	
	name =							"Guy";
	npctype =						npctype_Main;
	guild =							GIL_VLK;      
	level =							2;
	
	
	voice =							3;
	id =							530;


	//-------- abilities --------              
                                                   
	attribute[ATR_STRENGTH] =		13; 
	attribute[ATR_DEXTERITY] =		10; 
	attribute[ATR_MANA_MAX] =		0; 
	attribute[ATR_MANA] =			0; 
	 attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Psionic", 72,  1, -1);

	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
  
	//-------- Talents --------               
                                                                                                            
	//-------- inventory --------             
                                                  
	EquipItem (self, ItMwPickaxe);       
	CreateInvItems (self, ItMiNugget, 2);
	CreateInvItem (self, Itfo_Potion_Water_01);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_530;
};

FUNC VOID Rtn_start_530 ()
{
	TA_Sleep		(23,00,07,00,"OCR_HUT_25");
	TA_SitAround	(07,00,08,00,"OCR_OUTSIDE_HUT_25");
	TA_Smalltalk	(08,00,17,00,"OCR_OUTSIDE_HUT_27"); //mit Stt 306
	TA_SitAround	(17,00,19,05,"OCR_OUTSIDE_ARENA_BENCH_2");
	TA_ArenaSpectator(19,05,23,00,"OCR_ARENA_07");
};









