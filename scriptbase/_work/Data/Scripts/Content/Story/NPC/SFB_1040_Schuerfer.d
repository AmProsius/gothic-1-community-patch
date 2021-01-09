instance SFB_1040_Schuerfer (Npc_Default)
{
	//-------- primary data --------
	
	name =							NAME_Schuerfer;
	npctype = 						Npctype_ambient;
	guild =							GIL_SFB;      
	level =							6;
	flags =							0;
	
	voice =							2;
	id =							1040;


	//-------- abilities --------

	attribute[ATR_STRENGTH] =		30;
	attribute[ATR_DEXTERITY] =		10;
	attribute[ATR_MANA_MAX] =		0;
	attribute[ATR_MANA] =			0;
	attribute[ATR_HITPOINTS_MAX] =	112;
	attribute[ATR_HITPOINTS] =		112;

	//-------- visuals --------
	// 				animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	Mdl_ApplyOverlayMds	(self,"Humans_Tired.mds");
	//				body mesh,				head mesh,				hairmesh,	face-tex,	hair-tex,	skin	
	Mdl_SetVisualBody (self,"hum_body_Naked0",2,1,"Hum_Head_Pony", 43,  3,SFB_ARMOR_L);
	
	B_Scale (self);
	Mdl_SetModelFatness(self,0);
	
	fight_tactic	=	FAI_HUMAN_COWARD; 
	
	//-------- Talente --------                                    
	
	//-------- inventory --------                                    

	CreateInvItems (self, ItFoRice,2);
	CreateInvItems (self, ItMiNugget, 6);
	CreateInvItem (self, ItMi_Stuff_Plate_01);
	EquipItem (self, ItMwPickaxe);
	CreateInvItem (self, ItMw_1H_Sword_Short_01);
	
		
	//-------------Daily Routine-------------

	daily_routine = Rtn_FMCstart_1040;
	
	//------------- //MISSIONs-------------
};

FUNC VOID Rtn_FMCstart_1040 ()
{
	TA_SitAround	(01,00,13,00,	"FMC_HUT01_OUT");
	TA_SitAround	(13,00,01,00,	"FMC_HUT01_OUT");
};






