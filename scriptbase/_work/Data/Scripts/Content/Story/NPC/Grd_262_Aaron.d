instance GRD_262_Aaron (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Aaron";
	npctype		=	npctype_Main;
	guild 		=	GIL_GRD;
	level 		=	15;
	voice 		=	9;
	id 			=	262;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 50;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 220;
	attribute[ATR_HITPOINTS] 	= 220;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 2,"Hum_Head_Thief", 3,  1, GRD_ARMOR_M);        
    	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
 
	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	EquipItem		(self, ItMw_1H_Sword_02);
	EquipItem		(self, ItRw_Crossbow_01);
	CreateInvItems	(self, ItAmBolt, 30);
	CreateInvItem	(self, ItFoCheese);
	CreateInvItem	(self, ItFoApple);
	CreateInvItems	(self, ItMiNugget, 10);
	CreateInvItem	(self, ItLsTorch);
 
	
	//-------------Daily Routine-------------
	daily_routine	=	Rtn_start_262;
   	fight_tactic	=	FAI_HUMAN_STRONG;
   	senses			=	SENSE_SEE|SENSE_HEAR|SENSE_SMELL;
};

FUNC VOID Rtn_start_262 ()
{
    TA_StandAround	(00,00,12,00,"OM_CAVE1_34");	
	TA_Standaround	(12,00,24,00,"OM_CAVE1_34");	
};

FUNC VOID Rtn_trick_262 ()
{
    TA_Stay			(00,00,12,00,"OM_CAVE1_47");	
	TA_Stay			(12,00,24,00,"OM_CAVE1_47");	
};






