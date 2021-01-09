instance EBR_110_Seraphia (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Seraphia";
	npctype		= 	npctype_main;
	guild 		=	GIL_BAB;
	level 		=   1;
	voice 		=	16;
	id 			=	110; 
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
	Mdl_SetVisualBody	(self,"Bab_body_Naked0",	2, 			1,			"Bab_Head_Hair1", 	2,  		DEFAULT,	-1);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_COWARD;		

		
	//-------- inventory --------                                    
	CreateInvItem (self, ItMiBrush);
	CreateInvItem (self, ItMiWedel);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_110;
};

FUNC VOID Rtn_start_110 ()
{				
	TA_Babe_Sweep		(00,01,08,30,"OCC_BARONS_GREATHALL_CENTER_LEFT");
	TA_Babe_Fan			(08,30,00,01,"OCC_BARONS_GREATHALL_BERATER");
};











