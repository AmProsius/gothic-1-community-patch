instance ORG_843_Sharky (Npc_Default)
{
	//-------- primary data --------
	
	name =			"Sharky";
	Npctype =		NPCTYPE_MAIN;
	guild =			GIL_ORG;      
	level =			8;
	
	voice =			10;
	id =			843;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		40;
	attribute[ATR_DEXTERITY] =		30;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	136;
	attribute[ATR_HITPOINTS] =		136;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Relaxed.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",0,3,"Hum_Head_FatBald", 6, 1, ORG_ARMOR_L);
	
	B_Scale (self);	
	Mdl_SetModelFatness (self, 0);		
	
	fight_tactic	=	FAI_HUMAN_STRONG;			
	
	//-------- Talente ----------

	Npc_SetTalentSkill (self, NPC_TALENT_BOW,1);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
				
	
	//-------- inventory --------   
		
	B_Give_SharkyChapter1Weapons ();                                 
	
	CreateInvItems (self, ItKeLockpick,15);		
	CreateInvItems(self,  ItMiNugget, 50);
	CreateInvItems (self, ItFoRice,10);
	CreateInvItems (self, ItFoBooze, 5);
	CreateInvItems (self, ItLsTorch, 5);
	CreateInvItems (self, ItFo_Potion_Health_01, 5);
	
	
	
	

	//-------------Daily Routine-------------

	daily_routine = Rtn_start_843;
	};

FUNC VOID Rtn_start_843 ()
{
	TA_Sleep			(03,00,08,00,"NC_HUT25_IN");
	TA_SitAround		(08,00,00,00,"NC_HUT25_OUT");
	TA_StandAround		(00,00,03,00,"NC_TAVERN_BAR"); //trifft Cipher
};













