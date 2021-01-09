instance STT_325_Omid (Npc_Default)
{
	//-------- primary data --------
	name 		=		"Omid";
	npctype 	=		NPCTYPE_AMBIENT;
	guild 		=		GIL_VLK;
	level 		=		3;
	
	
	voice 		=		2;
	id 			=		325;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 		=	20;
	attribute[ATR_DEXTERITY] 		=	15;
	attribute[ATR_MANA_MAX] 		=	0;
	attribute[ATR_MANA]		 		=	0;
	attribute[ATR_HITPOINTS_MAX] 	=	100;
	attribute[ATR_HITPOINTS] 		=	100;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//							body mesh,				bdytex,	skin,	head mesh,			headtex,	teethtex,	ruestung
	Mdl_SetVisualBody 	(self,	"Hum_Body_CookSmith", 	0, 		1,		"Hum_Head_Psionic", 16,			1,			-1);

	B_Scale (self);
	Mdl_SetModelFatness(self,-1);
    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD; 

	//-------- Talente -------- 

	////Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);	
		
	//-------- inventory --------
	
//	EquipItem	(self, ItMw_1H_Sword_Short_02);
	
	CreateInvItem	(self, ItFoApple);
	
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_325;
};

FUNC VOID Rtn_start_325 ()
{
	TA_Cook		(08,05,18,05,"OCC_BARONS_RIGHT_ROOM_FRONT");
	TA_Cook		(18,05,08,05,"OCC_KITCHEN");
};

