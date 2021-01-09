instance KDW_601_Myxir (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Myxir";
	npctype		=	npctype_main;
	guild 		=	GIL_KDW;      
	level 		=	24;
	voice 		=	10;
	id 			=	601;

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 55;
	attribute[ATR_DEXTERITY] 	= 35;
	attribute[ATR_MANA_MAX] 	= 96;
	attribute[ATR_MANA] 		= 96;
	attribute[ATR_HITPOINTS_MAX]= 328;
	attribute[ATR_HITPOINTS] 	= 328;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0, 0,"Hum_Head_Pony", 7,  4,KDW_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_MAGE;
	
	//-------- Talente --------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);

			
	
	//-------- Spells --------        
	CreateInvItem (self, ItArRuneThunderbolt);
	
	//-------- inventory --------                                    
	CreateInvItem (self, ItFo_Potion_Health_02);
	CreateInvItem (self, ItFo_Potion_Mana_03);
	CreateInvItem(self,ItFo_Plants_Flameberry_01 );
	CreateInvItem(self, ItFo_Plants_RavenHerb_01);
	//-------------Daily Routine-------------
	
	daily_routine = Rtn_start_601;

	//--------------- //MISSIONs----------------

};

FUNC VOID Rtn_start_601 ()
{
			
	TA_Sleep		(01,00,04,00,"NC_KDW03_IN");
	TA_ReadBook		(04,00,01,00,"NC_KDW03_IN");	
};

