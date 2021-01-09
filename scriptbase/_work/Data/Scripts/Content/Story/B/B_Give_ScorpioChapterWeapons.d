
func void B_Give_ScorpioChapter4Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GRD_205_Scorpio);
	//-------- Nahkampfwaffen --------
	CreateInvItem	(npc,	ItMw_1H_Sword_Broad_01);
	CreateInvItem	(npc,	ItMw_1H_Sword_Broad_02);
	CreateInvItem	(npc,	ItMw_1H_Sword_Broad_03);
	CreateInvItem	(npc,	ItMw_1H_Sword_Broad_04);
	
	CreateInvItem	(npc,	ItMw_1H_Sword_Bastard_01);
	CreateInvItem	(npc,	ItMw_1H_Sword_Bastard_02);
	CreateInvItem	(npc,	ItMw_1H_Sword_Bastard_03);
	CreateInvItem	(npc,	ItMw_1H_Sword_Bastard_03);
	CreateInvItem	(npc,	ItMw_1H_Sword_Bastard_04);
	CreateInvItem	(npc,	ItMw_1H_Sword_Bastard_04);

	CreateInvItem	(npc,	ItMw_2H_Sword_Old_01);
	CreateInvItem	(npc,	ItMw_2H_Sword_Light_01);
	CreateInvItem	(npc,	ItMw_2H_Sword_Light_01);
	CreateInvItem	(npc,	ItMw_2H_Sword_Light_02);
	CreateInvItem	(npc,	ItMw_2H_Sword_Light_03);

	CreateInvItems (npc,ItMiNugget,800);
	
	CreateInvItem (npc,Gewandtheitsamulett2);
	CreateInvItem (npc,Staerkeamulett2);
	
	//-------- Fernkampfwaffen --------
	CreateInvItem (npc,ItRw_Crossbow_01);
	CreateInvItem (npc,ItRw_Crossbow_02);
	CreateInvItem (npc,ItRw_Crossbow_03);
 
	//-------- Munition --------
 
};

func void B_Give_ScorpioChapter5Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GRD_205_Scorpio);
	
	//-------- Nahkampfwaffen --------
	 
	CreateInvItem	(npc,	ItMw_2H_Sword_Light_02);// Kapitel 5 und 6 zusammengefasst
	CreateInvItem	(npc,	ItMw_2H_Sword_Light_03);
	CreateInvItem	(npc,	ItMw_2H_Sword_Light_04);
	CreateInvItem	(npc,	ItMw_2H_Sword_Light_05);
	CreateInvItem	(npc,	ItMw_2H_Sword_01);
	CreateInvItem	(npc,	ItMw_2H_Sword_02);
	CreateInvItem 	(npc,	ItMw_2H_Sword_03); 
	CreateInvItem 	(npc,	ItMw_2H_Sword_Heavy_01); 
	CreateInvItem 	(npc,	ItMw_2H_Sword_Heavy_02); 
	CreateInvItem 	(npc,	ItMw_2H_Sword_Heavy_03); 
	CreateInvItem 	(npc,	ItMw_2H_Sword_Heavy_04); 
	
	CreateInvItems (npc,ItMiNugget,1000);
	//-------- Fernkampfwaffen --------
	
	CreateInvItems (npc,ItRw_Crossbow_04,2);

	//-------- Munition --------
  
};

func void B_Give_ScorpioChapter6Weapons ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GRD_205_Scorpio);
	
	//-------- Nahkampfwaffen --------
	
	CreateInvItems (npc,ItMiNugget,600);
	//-------- Fernkampfwaffen --------


	//-------- Munition --------
  
};