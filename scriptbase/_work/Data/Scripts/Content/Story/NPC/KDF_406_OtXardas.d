// Nur für Kap.6 benutzen

instance KDF_406_OTXardas (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Xardas";
	npctype		=	npctype_main;
	guild 		=	GIL_NONE;      
	level 		=	30;
	voice 		=	14;
	id 			=	406;
	flags       =   NPC_FLAG_IMMORTAL;
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55;
	attribute[ATR_DEXTERITY] 	= 65;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 1,"Hum_Head_Bald", 82, 1, DMB_ARMOR_M);

	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
    	
    self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_MAGE;

	//-------- Talente --------                                    
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);


	//-------- Spells--------                                    
	CreateInvItems	(self, ItArScrollSummonDemon, 20);
	CreateInvItem	(self, ItArRuneFireball);
	
	//-------- inventory --------                                    
	CreateInvItems(self, ItFo_Potion_Health_03, 3);
	CreateInvItems(self, ItFo_Potion_Mana_03, 3);
	
	EquipItem (self,Amulett_der_Erleuchtung);
	EquipItem (self,Ring_der_Magie);
	EquipItem (self,Ring_der_Erleuchtung);

	//-------------AI-------------
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
	// Da gespawnde Gegner nicht auf SC reagieren
	Npc_PercEnable  	(self, 	PERC_ASSESSENEMY		,	B_AssessEnemy				);
	Npc_PercEnable  	(self, 	PERC_ASSESSFIGHTER		,	B_AssessFighter				);
	Npc_PercEnable  	(self, 	PERC_ASSESSPLAYER		,	B_AssessSC					);
	Npc_PercEnable  	(self,	PERC_ASSESSDAMAGE		,	ZS_ReactToDamage			);
	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic				);
	Npc_PercEnable  	(self, 	PERC_ASSESSCASTER		,	B_AssessCaster	 			);

	//------------- ai -------------
	daily_routine = Rtn_start_406;
};

FUNC VOID Rtn_start_406 ()
{
	TA_Intercept  (15,00,22,00,"TPL_331");
  	TA_Intercept  (22,00,15,00,"TPL_331");	
};

FUNC VOID Rtn_Drained_406 () 
{
	TA_Drained_YBerion	(23,00,07,00,"TPL_331");
    TA_Drained_YBerion	(07,00,23,00,"TPL_331");	
};
