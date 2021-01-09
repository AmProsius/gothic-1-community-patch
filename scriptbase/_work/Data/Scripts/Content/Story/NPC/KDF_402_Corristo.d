instance KDF_402_Corristo (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Corristo";
	npctype		=	npctype_main;
	guild 		=	GIL_KDF;      
	level 		=	30;
	voice 		=	14;
	id 			=	402;
	flags       =   NPC_FLAG_IMMORTAL;
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 30;
	attribute[ATR_DEXTERITY] 	= 40;
	attribute[ATR_MANA_MAX] 	= 100;
	attribute[ATR_MANA] 		= 100;
	attribute[ATR_HITPOINTS_MAX]= 400;
	attribute[ATR_HITPOINTS] 	= 400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,1,"Hum_Head_Pony", 84, 1, KDF_ARMOR_H);

	B_Scale (self);		
	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_MAGE;
		
	//-------- Talente --------                                    
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);


	//-------- Spells--------                                    
	CreateInvItem(self,ItArRuneFireball);
		
	//-------- inventory --------                                    
	CreateInvItems(self, ItFo_Potion_Health_02, 2);
	CreateInvItems(self, ItFo_Potion_Mana_02, 2);
	CreateInvItems(self, ItFoWine, 2);
	EquipItem (self, Schutzring_Magie2_Fire2);
 	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	
   

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_402;
};

FUNC VOID Rtn_start_402 ()
{
	TA_SitCampfire	(19,05,06,55,"OCC_CHAPEL_MAGE_02");
	TA_ReadBook		(06,55,19,05,"OCC_CHAPEL_UPSTAIRS_RIGHT");
};

FUNC VOID Rtn_KDFRITUAL_402 ()
{
	TA_Position		    (08,00,20,00,"OCC_CHAPEL_UPSTAIRS");
	TA_Position		    (20,00,08,00,"OCC_CHAPEL_UPSTAIRS");
};

FUNC VOID Rtn_WAITFORSC_402 ()
{
	TA_Position		    (08,00,20,00,"OCC_CHAPEL_HALL");
	TA_Position		    (20,00,08,00,"OCC_CHAPEL_HALL");
};







