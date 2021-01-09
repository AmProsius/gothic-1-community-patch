func void B_Give_SkipChapter2Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Grd_211_Skip);
	
	//-------- Nahkampfwaffen --------
	CreateInvItems	(npc, ItKeLockpick,20);
	CreateInvItem (npc,ItMw_1H_Sword_01);
	CreateInvItem (npc,ItMw_1H_Sword_02);
	CreateInvItem (npc,ItMw_1H_Sword_03);
	CreateInvItem (npc,ItMw_1H_Sword_04);
	CreateInvItem (npc,ItMw_1H_Sword_04);
	
	CreateInvItems (npc,ItMiNugget,400); 
	
	CreateInvItems (npc,ItAmArrow,200);
	CreateInvItems (npc,ItAmBolt,200);

	//-------- Fernkampfwaffen --------
	
 
	//-------- Munition --------
  
};

func void B_Give_SkipChapter3Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(Grd_211_Skip);
	
	//-------- Nahkampfwaffen --------
	CreateInvItems	(npc, ItKeLockpick,30);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_01);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_02);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_03);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_04);
	CreateInvItem	(npc,	ItMw_1H_Sword_Long_04);
	
	CreateInvItems (npc,ItAmArrow,400);
	CreateInvItems (npc,ItAmBolt,400);
	
	CreateInvItems (npc,ItMiNugget,600); 
	//-------- Fernkampfwaffen --------
	

	//-------- Munition --------
  
};