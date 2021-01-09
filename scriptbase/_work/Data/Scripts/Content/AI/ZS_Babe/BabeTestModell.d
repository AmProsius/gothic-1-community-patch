prototype TestBabe (C_NPC)
{
	
	name 	= "Babe";
	guild 	= GIL_NONE;
	level	= 1;
	
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	=	5;
	attribute[ATR_DEXTERITY] 	=	5;
	attribute[ATR_MANA_MAX] 	=	0;
	attribute[ATR_MANA] 		=	0;
	
	protection	[PROT_EDGE]		=		5;
	protection	[PROT_BLUNT]	=		5;
	protection	[PROT_POINT]	=		5;
	protection	[PROT_FIRE]		=		5;
	protection	[PROT_MAGIC]	=		5;

	attribute[ATR_HITPOINTS_MAX] = 5;
	attribute[ATR_HITPOINTS] 	 = 5;

	// talents	=						0;

	//-------- senses --------
	senses			=	SENSE_HEAR | SENSE_SEE ;
	senses_range	=	4000;
	
	//Npc_LearnTalent	(self,TAL_SNEAK);	
	//Npc_LearnTalent	(self,TAL_STEAL);	
	//Npc_LearnTalent	(self,TAL_PICKLOCK);	
	////Npc_LearnTalent	(self,TAL_ACROBAT);	
	//Npc_LearnTalent	(self,TAL_MUSHROOMS);	
	//Npc_LearnTalent	(self,TAL_HEAL);	
	//Npc_LearnTalent	(self,TAL_MANA);	
	//Npc_LearnTalent	(self,TAL_IRONWILL);	
	
};  
    
    
    
instance ABabeTestmodell (TestBabe)
{   
	//-------- primary data --------
	
	name =							"ATestmodell";
	guild =							GIL_NONE;      
	level =							10;
	voice =							11;//4
	id =							3001;
	


	//-------- abilities --------
	attribute[ATR_STRENGTH] 		= 10;
	attribute[ATR_DEXTERITY] 		=  7;
	attribute[ATR_MANA_MAX] 		=  0;
	attribute[ATR_MANA] 			=  0;
	attribute[ATR_HITPOINTS_MAX] 	= 18;
	attribute[ATR_HITPOINTS] 		= 18;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"BABE.MDS");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin			
	Mdl_SetVisualBody (self,"Bab_body_Naked0",DEFAULT, DEFAULT ,"Bab_Head_Hair1", DEFAULT ,  DEFAULT,-1);	
	
	//Npc_LearnFightTalent	(self,TAL_1H_SWORD2);	
	//Npc_LearnTalent	(self,TAL_MUSHROOMS);	
	
	Npc_SetAttitude (self,ATT_HOSTILE);
	
	//-------- inventory --------                                    

	
	
		
	// FAI
	
	fight_tactic = FAI_HUMAN_COWARD;
	
	//-------------Daily Routine-------------
	daily_routine = A_FF;
};

FUNC VOID A_FF ()
{	
	
};
