instance EBR_109_Syra (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Syra";
	npctype		= 	npctype_main;
	guild 		=	GIL_BAB;
	level 		=	1;
	voice 		=	16;
	id 			=	109;
	flags      	=   NPC_FLAG_IMMORTAL; // wichtig, weil man sie nicht finishen kann!

	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 20;
	attribute[ATR_DEXTERITY] 	= 20;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 40;
	attribute[ATR_HITPOINTS] 	= 40;

	//-------- visuals --------
	// 					animations
	Mdl_SetVisual		(self,"Babe.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody 	(self,	"Bab_body_Naked0", 	1, 			1,			"Bab_Head_Hair1", 	1,  		DEFAULT,	-1);

    	
    	self.aivar[AIV_IMPORTANT] = TRUE;
    	
    	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente -------- 
	
	//-------- inventory --------                                    
	CreateInvItem (self, ItMiBrush);
	CreateInvItem (self, ItMiWedel);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_109;
};

FUNC VOID Rtn_start_109 ()
{
	TA_Babe_Sweep		(22,00,06,00, 	"OCC_BARONS_LEFT_ROOM_FRONT");
	TA_Babe_Sweep		(06,00,16,00, 	"OCC_BARONS_RIGHT_ROOM_TABLE");
	TA_Babe_Dance		(16,00,22,00, 	"OCC_BARONS_DANCE");
};
