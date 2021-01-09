instance KDF_403_Drago (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Drago";
	npctype		=	npctype_main;
	guild 		=	GIL_KDF;      
	level 		=	28;
	voice 		=	13;
	id 			=	403;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 40;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 90;
	attribute[ATR_MANA] 		= 90;
	attribute[ATR_HITPOINTS_MAX]= 376;
	attribute[ATR_HITPOINTS] 	= 376;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,0,"Hum_Head_Thief", 4,  0, KDF_ARMOR_L);
         
	B_Scale (self);
 	Mdl_SetModelFatness (self, 0);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_MAGE;
        
	//-------- Talente --------                                    
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);


	//-------- Spells--------                                    
	CreateInvItem (self, ItArRuneFireball);
	
	//-------- inventory --------                                    
	CreateInvItems(self, ItFo_Potion_Health_02, 3);
	CreateInvItems(self, ItFo_Potion_Health_01, 4);
	EquipItem (self, Schutzring_Total2);
	CreateInvItem	(self,ItMi_Stuff_OldCoin_02);	


	//-------------Daily Routine-------------

	daily_routine = Rtn_start_403;
	
	

};

FUNC VOID Rtn_start_403 ()
{
	TA_SitCampfire	(18,50,07,10,"OCC_CHAPEL_MAGE_04");	
	TA_PracticeMagic(07,10,18,50,"OCC_CHAPEL_MAGE_04");
};

FUNC VOID Rtn_KDFRITUAL_403 ()
{
	TA_Position		    (08,00,20,00,"OCC_CHAPEL_MAGE_03");
	TA_Position		    (20,00,08,00,"OCC_CHAPEL_MAGE_03");
};















