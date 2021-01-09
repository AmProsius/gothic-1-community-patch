instance VLK_501_Buddler (Npc_Default)
{
	//-------- primary data --------
	
	name =							Name_Buddler;
	npctype =						npctype_Ambient;
	guild =							GIL_VLK;      
	level =							2;
	
	voice =							1;
	id =							501;


	//-------- abilities --------
	attribute[ATR_STRENGTH] =		13;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	64;
	attribute[ATR_HITPOINTS] =		64;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",3,1,"Hum_Head_FatBald", 67,  1, VLK_ARMOR_M);

	B_Scale (self); 
	Mdl_SetModelFatness (self, 0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
			
	//-------- Talents --------                                    

	////Npc_SetTalentSkill (self, NPC_TALENT_1H,1);
	
	//-------- inventory --------                                    

	
	EquipItem (self, ItMwPickaxe);
	
	CreateInvItem (self, ItFoBeer);
	CreateInvItem (self, ItLsTorch);
	

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_501;
	};

FUNC VOID Rtn_start_501 ()
{
	TA_Sleep		(22,00,08,00,"OCR_HUT_79");
	TA_Smalltalk	(08,00,22,00,"OCR_OUTSIDE_HUT_79");
};













