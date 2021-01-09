instance EBR_108_Velaya (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Velaya";
	npctype		= 	npctype_main;
	guild 		=	GIL_BAB;
	level 		=	1;
	voice 		=	16;
	id 			=	108;
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
	Mdl_SetVisual		(self,"BABE.MDS");
	//							Body-Mesh			Body-Tex	Skin-Color	Head-MMS			Head-Tex	Teeth-Tex	ARMOR	
	Mdl_SetVisualBody	(self,	"Bab_body_Naked0", 	0, 			1,			"Bab_Head_Hair1", 	0,  		DEFAULT, 	-1);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD;

	//-------- Talente -------- 		
	
	//-------- inventory --------                                    
	CreateInvItem (self, ItMiBrush);
	CreateInvItem (self, ItMiWedel);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_108;
};

FUNC VOID Rtn_start_108 () //Gomez Zimmer 24h
{
	TA_Babe_Sleep		(01,00,10,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_LEFT_BACK"); 	//Bei Gomez

	TA_Babe_SitAround	(10,00,11,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	TA_Bathing_Babe		(11,00,14,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	TA_Babe_SitAround	(14,00,16,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	TA_Bathing_Babe		(16,00,19,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	TA_Babe_SitAround	(19,00,01,00,	"OCC_BARONS_UPSTAIRS_LEFT_BACK_ROOM_FRONT");
	
};











