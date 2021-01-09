instance STT_335_Santino (Npc_Default)
{
	//-------- primary data --------
	name 	=	"Santino";
	npctype =	NPCTYPE_MAIN;
	guild 	=	GIL_STT;
	level 	=	7;
	
	
	voice 	=	7;
	id 		=	335;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	30;
	attribute[ATR_DEXTERITY] 		=	18;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA] 			=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	124;
	attribute[ATR_HITPOINTS] 		=	124;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 2,"Hum_Head_Bald", 12,  1, STT_ARMOR_M);
        
        B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 

	
	Npc_SetTalentSkill 	( self, NPC_TALENT_1H,1 );	
		
	//-------- inventory --------
	
	
	CreateInvItems	(self, ItFo_Potion_Water_01,5);
	
	CreateInvItems	(self, ItKeLockpick,5);
	CreateInvItems	(self, ItMinugget,50);
	CreateInvItems	(self, Itlstorch,10);
	
	CreateInvItems	(self, ItFoBeer,7);
	CreateInvItems	(self, ItFo_Potion_Mana_01,5);
	CreateInvItems	(self, ItFo_Potion_Health_01,5);
	
	
	

	
	
	CreateInvItems	(self, ItAmArrow,100);
	CreateInvItems	(self, ItAmBolt,100);
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_335;
};

FUNC VOID Rtn_start_335 ()
{
    TA_Stay	(00,00,12,00,"OM_202");	
	TA_Stay	(12,00,24,00,"OM_202");	
};




