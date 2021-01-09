func void B_Give_XardasChapter4Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDF_404_Xardas);
	
	//-------- Runen --------
	CreateInvItem (npc,ItArRuneDestroyUndead);
	
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollSummonSkeletons,8);	
	CreateInvItems (npc,ItArScrollSummonGolem,4);	
	CreateInvItems (npc,ItArScrollShrink,2);	
	
	//-------- Bücher --------
  


};

func void B_Give_XardasChapter5Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDF_404_Xardas);
	
	//-------- Runen --------
	CreateInvItem (npc,ItArRuneFireRain);
	
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollSummonDemon,4);	
	CreateInvItems (npc,ItArScrollSummonSkeletons,8);	
	CreateInvItems (npc,ItArScrollSummonGolem,4);	
	
	//-------- Bücher --------
};

func void B_Give_XardasChapter6Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDF_404_Xardas);
	
	//-------- Runen --------
	
		
	
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollSummonDemon,4);	
	CreateInvItems (npc,ItArScrollSummonSkeletons,8);	
	CreateInvItems (npc,ItArScrollSummonGolem,4);	
	CreateInvItems (npc,ItArScrollArmyOfDarkness,8);	
	
	CreateInvItem (npc,Amulett_der_Macht);
	CreateInvItem (npc,Amulett_der_Erleuchtung);

	//-------- Bücher --------

};