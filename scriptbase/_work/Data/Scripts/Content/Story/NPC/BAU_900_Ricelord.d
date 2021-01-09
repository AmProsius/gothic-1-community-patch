instance BAU_900_Ricelord (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"The Rice Lord";
	npctype 	=	NPCTYPE_GUARD;	
	guild 		=	GIL_BAU;      
	level 		=	10;
	voice 		=	12;
	id 			=	900; 

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 50;
	attribute[ATR_DEXTERITY] 	= 10;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 170;
	attribute[ATR_HITPOINTS] 	= 170;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"Hum_Body_CookSmith",1,1,"Hum_Head_FatBald",91 ,  0,-1);
	
	B_Scale (self); 
	Mdl_SetModelFatness(self,2);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente --------                                    
	Npc_SetTalentSkill	(self,NPC_TALENT_1H,1);	
	

	//-------- inventory --------                                    
		
		CreateInvItems (self, ItFoRice,10);
		CreateInvItem (self, ItFoWine);
		CreateInvItems(self, ItMiNugget,40);
		EquipItem  (self, Heerscherstab); 		
		CreateInvItem (self, ItMi_Alchemy_Moleratlubric_01);
		//CreateInvItem (self,ItKey_RB_01);
		
		EquipItem (self, Ring_des_Lebens);
			
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_900;
	
};

FUNC VOID Rtn_start_900 ()
{
	TA_Boss			(07,00,20,00,"NC_RICELORD");
	TA_SitAround	(20,00,24,00,"NC_RICELORD_SIT");
	TA_Sleep		(24,00,07,00,"NC_RICEBUNKER_10");
};










