instance KDW_605_Riordian (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Riordian";
	npctype 	=	NPCTYPE_FRIEND;
	guild 		=	GIL_KDW;
	level 		=	25;
	voice 		=	14;
	id 			=	605;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		35;
	attribute[ATR_DEXTERITY] =		35;
	attribute[ATR_MANA_MAX] =		90;
	attribute[ATR_MANA] =			90;
	attribute[ATR_HITPOINTS_MAX] =	340;
	attribute[ATR_HITPOINTS] =		340;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0 ,"Hum_Head_Bald", 9, 1,KDW_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;	

	//-------- Talente --------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);
	
	
	//-------- Spells --------
	CreateInvItem (self,ItArRuneThunderball);
			
	//-------- inventory --------                                    
	B_GiveRiordianChapter1Potions ();
	

	//------------- ai -------------
	daily_routine = Rtn_start_605;
	senses = SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_605 ()
{

	TA_Sleep		    (23,00,04,00,"NC_KDW06_IN");
	TA_PotionAlchemy	(04,00,23,00,"NC_KDW06_IN");	
};

//Nachdem der Spieler UrShak gefunden hat, hält sich Riordian am Pentagramm auf, um den Spieler zu Gorn zu schicken
FUNC VOID Rtn_FoundUrShak_605 ()
{
	TA_PracticeMagic	(01,00,05,00,"NC_KDW_CAVE_STAIRS_MOVEMENT2");	
	TA_PracticeMagic	(05,00,01,00,"NC_KDW_CAVE_STAIRS_MOVEMENT2");	
};

