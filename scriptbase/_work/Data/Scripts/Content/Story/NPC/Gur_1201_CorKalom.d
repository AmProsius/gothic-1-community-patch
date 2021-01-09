instance GUR_1201_CorKalom (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Cor Kalom";
	npctype 	= 	NPCTYPE_FRIEND;
	guild 		=	GIL_GUR;
	level 		=	30;
	voice 		=	10;
	id 			=	1201;
	flags		=	NPC_FLAG_IMMORTAL;	

	//-------- abilities --------
	attribute[ATR_STRENGTH] 			= 	80;
	attribute[ATR_DEXTERITY] 			= 	50;
	attribute[ATR_MANA_MAX] 			= 	50;
	attribute[ATR_MANA] 				= 	50;
	attribute[ATR_HITPOINTS_MAX]		= 	400;
	attribute[ATR_HITPOINTS] 			= 	400;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Mage.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 1, 0 ,"Hum_Head_Psionic", 19,  0, GUR_ARMOR_H);

	B_Scale (self);
	Mdl_SetModelFatness(self,0);

	//-------- Talente -------
	Npc_SetTalentSkill		( self, NPC_TALENT_MAGE,		6);
	
	//-------- inventory --------
	EquipItem		(self,Kaloms_Schwert);
	CreateInvItem	(self, ItArRuneSleep);
	
	//-------------Daily Routine-------------
	daily_routine = Rtn_start_1201;
	fight_tactic	=	FAI_HUMAN_MAGE;
};

FUNC VOID Rtn_start_1201 ()
{
    TA_PotionAlchemy  (15,00,22,00,"PSI_LABOR_IN");
    TA_PotionAlchemy  (22,00,15,00,"PSI_LABOR_IN");	
};

FUNC VOID Rtn_CallSleeper_1201 ()
{
	TA_Stay 	(00,00,12,00,"PSI_TEMPLE_STAIRS_RIGHT");
	TA_Stay 	(12,00,24,00,"PSI_TEMPLE_STAIRS_RIGHT");
};
FUNC VOID Rtn_Flee_1201 () //DAMIT IST ER NACHHER NUR NOCH IM ALTEN TEMPEL ZU FINDEN!!!
{
	TA_Stay 	(00,00,12,00,"");
	TA_Stay 	(12,00,24,00,"");
};