INSTANCE PC_Psionic(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name			= "Lester";
	Npctype			= NPCTYPE_FRIEND;
	guild			= GIL_NOV;
	level			= 999;			// real 15, aber 999 damit er nicht vor dem Brückegolem flieht!
	voice			= 5;
	id			    = 4;
	flags			= NPC_FLAG_IMMORTAL;

	//--------- abilities --------
	attribute[ATR_STRENGTH] 	=	45;
	attribute[ATR_DEXTERITY] 	=	35;
	attribute[ATR_MANA_MAX] 	=	50;
	attribute[ATR_MANA] 		=	50;
	attribute[ATR_HITPOINTS_MAX]=	220;
	attribute[ATR_HITPOINTS] 	=	220;
	
	protection[PROT_FIRE]		=	1000;
	
	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS				Head-Tex	Teeth-Tex
	Mdl_SetVisualBody (self,	"hum_body_Naked0", 1,	0,			"Hum_Head_Bald", 	17, 		2,	NOV_ARMOR_M);

	MDL_APPLYOVERLAYMDS (self, "Humans_Mage.mds");

    fight_tactic	=	FAI_HUMAN_STRONG;
	
	self.aivar[AIV_IMPORTANT] = TRUE;

	//-------- talente --------
		
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);			
	
	//-------- inventory --------
	EquipItem     (self, Streitschlichter);
	CreateInvItem (self, ItFoSoup);
	
	//-------- ai --------
	daily_routine	=	Rtn_start_4;
	senses			=	SENSE_HEAR | SENSE_SEE |SENSE_SMELL;
	senses_range	=	1500;
};

// SN: Wichtig für Kapitel 2, daß Lester dort steht und auf den Spieler wartet !!!
// MH: Hab ihn nen Tick nach hinten versetzt
FUNC VOID Rtn_start_4 ()
{	
	TA_Smalltalk	(08,00,	23,00,"PSI_GUARD_TREE_EX");    
	TA_Smalltalk	(23,00,	08,00,"PSI_GUARD_TREE_EX");
};

// SN: Wichtig für Kapitel 3: Lester wartet vor Bergfestung auf den Spieler
FUNC VOID Rtn_FortressWait_4 ()
{	
	TA_Stay			(00,00,	23,00,"LOCATION_19_01");    
	TA_Stay			(23,00,	24,00,"LOCATION_19_01");     
};	

FUNC VOID Rtn_FortressFollow_4 ()
{	
	TA_FollowPC			(00,00,	23,00,"LOCATION_19_01");    
	TA_FollowPC			(23,00,	24,00,"LOCATION_19_01");  
};	

FUNC VOID Rtn_BALKON_4 ()
{	
	TA_Stay 			(00,00,	23,00,"LOCATION_19_03_SECOND_ETAGE_BALCON");    
	TA_Stay				(23,00,	24,00,"LOCATION_19_03_SECOND_ETAGE_BALCON");  
};	

FUNC VOID Rtn_WaitAtFocus_4 ()
{	
	TA_Stay 			(00,00,	23,00,"LOCATION_19_03_PATH_RUIN7");    
	TA_Stay				(23,00,	24,00,"LOCATION_19_03_PATH_RUIN7");  
};	

FUNC VOID Rtn_BOOK_4 ()
{	
	TA_ReadBook 		(00,00,	23,00,"LOCATION_19_03_ROOM6_BARRELCHAMBER");    
	TA_ReadBook			(23,00,	24,00,"LOCATION_19_03_ROOM6_BARRELCHAMBER");  
};	

// LESTER FÜHRT DEN SPIELER DURCH DAS SUMPFLAGER NUR IN DEN ERSTEN ZWEI KAPITELN
// AB DEM DRITTEN KAPITEL WIRD ER ANDERWEITIG (BERGFESTUNG) GEBRAUCHT
FUNC VOID Rtn_GuideToSmith_4 ()
{	
	TA_GuidePC		(08,00,23,00,"PSI_SMITH_IN");    
	TA_GuidePC		(23,00,08,00,"PSI_SMITH_IN");    
};

FUNC VOID Rtn_GuideToTempel_4 ()
{	
	TA_GuidePC		(08,00,23,00,"PSI_TEMPLE_NOVIZE_PR");    
	TA_GuidePC		(23,00,08,00,"PSI_TEMPLE_NOVIZE_PR");    
};

FUNC VOID Rtn_GuideToTrain_4 ()
{	
	TA_GuidePC		(08,00,23,00,"PSI_PATH_9_4");    
	TA_GuidePC		(23,00,08,00,"PSI_PATH_9_4");    
};

FUNC VOID Rtn_GuideToHerb_4 ()
{	
	TA_GuidePC		(08,00,23,00,"PSI_WALK_06");    
	TA_GuidePC		(23,00,08,00,"PSI_WALK_06");    
};
