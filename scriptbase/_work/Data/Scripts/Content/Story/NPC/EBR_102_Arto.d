instance EBR_102_Arto (Npc_Default)
{
	//-------- primary data --------
	
	name 		=	"Arto";
	npctype 	= 	npctype_main;
   	guild 		=	GIL_EBR;
	level 		=	80;
	voice 		=	13;
	id 			=	102;
	
	//-------- abilities --------
	attribute[ATR_STRENGTH] 	= 70;
	attribute[ATR_DEXTERITY] 	= 70;
	attribute[ATR_MANA_MAX] 	= 0;
	attribute[ATR_MANA] 		= 0;
	attribute[ATR_HITPOINTS_MAX]= 388;
	attribute[ATR_HITPOINTS] 	= 388;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Arrogance.mds");
	//			body mesh     ,bdytex,skin,head mesh     ,headtex,teethtex,ruestung	
	Mdl_SetVisualBody (self,"hum_body_Naked0", 0, 1,"Hum_Head_Bald", 10, 1, EBR_ARMOR_H2);

	B_Scale (self); 
	Mdl_SetModelFatness(self,0);
	
	self.aivar[AIV_IMPORTANT] = TRUE;
	
	fight_tactic	=	FAI_HUMAN_MASTER;

	//-------- Talente --------  	
	Npc_SetTalentSkill (self, NPC_TALENT_2H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_1H,2);
	Npc_SetTalentSkill (self, NPC_TALENT_BOW,2);
			
	//-------- inventory --------                                    
	EquipItem(self,Artos_Schwert);
	CreateInvItem(self,ItFo_Potion_Health_03);
	CreateInvItem(self,Ring_des_Geschicks);

	//-------------Daily Routine-------------
	daily_routine = Rtn_start_102;
};

FUNC VOID Rtn_start_102 ()
{
	TA_Sleep			(02,05,07,35,"OCC_BARONS_UPPER_RIGHT_ROOM_BED2");
	TA_Smalltalk		(07,35,21,10,"OCC_BARONS_GREATHALL_CENTER_LEFT");
	TA_StandAround		(21,10,02,05,"OCC_BARONS_GREATHALL_CENTER_MOVEMENT4");
};

FUNC VOID Rtn_OT_102 ()
{
	TA_Guard    		(23,00,07,00,"OCC_BARONS_HALLWAY_FRONT");
	TA_Guard    		(23,00,07,00,"OCC_BARONS_HALLWAY_FRONT");
};
