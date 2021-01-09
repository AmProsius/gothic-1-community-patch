instance GRD_285_Gardist (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	NAME_Gardist;
	guild 		=	GIL_GRD;
	npctype		=	NPCTYPE_GUARD;
	level 		=	30;
	voice 		=	7;
	id 			=	285;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 60;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 200;
	attribute[ATR_HITPOINTS] 	= 200;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_FatBald", 19,  1, GRD_ARMOR_M);
        
   	B_Scale (self);
   	Mdl_SetModelFatness(self,0);
    	
   	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);		
			
	//-------- inventory --------
	EquipItem		(self, ItMw_1H_Sword_Broad_04);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);		        
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_FMTaken_285;
};

FUNC VOID Rtn_FMTaken_285 ()
{
	TA_StayNeutral	(01,00,13,00,	"FMC_PATH28");
	TA_StayNeutral	(13,00,01,00,	"FMC_PATH28");
};

FUNC VOID Rtn_FMTaken2_285 ()
{
	TA_Guard	(01,00,13,00,	"FMC_PATH28");
	TA_Guard	(13,00,01,00,	"FMC_PATH28");
};

