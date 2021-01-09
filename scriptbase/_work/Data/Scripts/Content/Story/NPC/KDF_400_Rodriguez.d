instance KDF_400_Rodriguez (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Rodriguez";
	npctype		=	npctype_main;
	guild 		=	GIL_KDF;      
	level 		=	25;
	voice 		=	12;
	id 			=	400;

	//-------- abilities --------
	attribute[ATR_STRENGTH] =		45;
	attribute[ATR_DEXTERITY] =		35;
	attribute[ATR_MANA_MAX] =		90;
	attribute[ATR_MANA] =			90;
	attribute[ATR_HITPOINTS_MAX] =	340;
	attribute[ATR_HITPOINTS] =		340;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Pony", 6, 1, KDF_ARMOR_L);

    B_Scale (self);
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//-------- Talente --------                                    
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);


	//-------- Spells--------                                    
	CreateInvItem(self,ItArRuneFirebolt);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
	
	
	//-------- inventory --------                                    
	/*
	CreateInvItem (self, ItFoMutton);
	CreateInvItems(self, ItFoHealingPotion, 2);
	CreateInvItems(self, ItFoManaPotion, 2);
	CreateInvItems(self, ItFoWine, 2);
	*/


	//-------------Daily Routine-------------
	daily_routine = Rtn_start_400;
};

FUNC VOID Rtn_start_400 ()
{
	TA_SitCampfire	(22,00,07,00,"OCC_CHAPEL_MAGE_03");
	TA_Smalltalk	(07,00,22,00,"OCC_CENTER_2");
};

FUNC VOID Rtn_KDFRITUAL_400 ()
{
	TA_Position		    (08,00,20,00,"OCC_CHAPEL_MAGE_01");
	TA_Position		    (20,00,08,00,"OCC_CHAPEL_MAGE_01");
};













