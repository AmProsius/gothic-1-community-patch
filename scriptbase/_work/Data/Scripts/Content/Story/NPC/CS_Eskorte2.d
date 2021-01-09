instance CS_Eskorte2 (Npc_Default)
{
	//-------- primary data --------
	name =							"Eskorte2";
	slot =							"guard";
	guild =							GIL_GRD;
	level =							5;
	flags =							0;
	voice =							11;//9;
	id =							3023;
		
	//-------- abilities --------
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		9;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	26;
	attribute[ATR_HITPOINTS] =		26;

	//-------- visuals --------
	// 			animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Militia.MDS");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Fighter", 18, 2, GRD_ARMOR_I);
        
	B_Scale (self);
    	Mdl_SetModelFatness(self,0);
    	
    	fight_tactic	=	FAI_HUMAN_STRONG;

	//-------- Talente -------- 
				
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_2H,1);
	Npc_SetTalentSkill (self, NPC_TALENT_CROSSBOW,1);		
			
	//-------- inventory --------
	
	//CreateInvItem	(self, ItMw2hSword02);
	//CreateInvItem	(self, ItRwCrossbow);
	////CreateInvItems	(self, ItAmBolt, 15);

	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_3023;
};

FUNC VOID Rtn_start_3023 ()
{

TA_Position		(00,00,24,00,"WP_INTRO07");	
	
};



