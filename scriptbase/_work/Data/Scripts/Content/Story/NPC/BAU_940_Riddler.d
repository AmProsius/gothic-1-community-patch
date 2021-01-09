
//******************Der tote Riddler****************************Björn****

instance Bau_940_Riddler (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Leiche";  
	npctype		= 	npctype_main;
	guild 		=	GIL_BAU;
	level 		=	10;
	voice 		=	7;
	id 			=	940;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 13;
	attribute[ATR_DEXTERITY]	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 64;
	attribute[ATR_HITPOINTS] 	= 64;
	
	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex5,teethtex,ruestung		
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_Pony",110 , 1,-1);	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
        
  	//-------- Talente -------- 
			
	//-------- inventory --------

	CreateInvItems	(self, ItMiNugget, 302);	
	CreateInvItems 	(self, ItFoRice,6);
	CreateInvItem 	(self, ItFoBooze);
	CreateInvItem	(self, theriddle6);
	CreateInvItems 	(self, ItArScrollTrfBloodfly,2);
	CreateInvItem 	(self, Lebensamulett);	        
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_940;
};

FUNC VOID Rtn_start_940 ()
{
	TA_Stand (08,00,20,00,"OW_FOGDUNGEON_36_MOVEMENT");
	TA_Stand (20,00,08,00,"OW_FOGDUNGEON_36_MOVEMENT");
};
