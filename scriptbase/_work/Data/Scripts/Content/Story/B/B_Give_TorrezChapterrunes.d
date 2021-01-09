
func void B_Give_TorrezChapter1Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDF_405_Torrez);
	
	//-------- Runen --------

	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,10);
	CreateInvItems (npc,ItArScrollLight,16);
	CreateInvItems (npc,ItArScrollFirebolt,18);

	//-------- Bücher --------
  	//-------- Tränke --------
	CreateInvItems (npc,ItFo_Potion_Mana_01 ,6);
	CreateInvItems (npc,ItFo_Potion_Health_01 ,8);
	CreateInvItems (npc,ItFo_Potion_Water_01 ,10);

	CreateInvItem (npc,ItWr_Book_Circle_02);
	CreateInvItem (npc,ItWr_Book_Circle_03);
	
	CreateInvItem (npc,Lehren_der_Goetter1);
	CreateInvItem (npc,Lehren_der_Goetter2);
	CreateInvItem (npc,Lehren_der_Goetter3);

};
func void B_Give_TorrezChapter2Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDF_405_Torrez);
	
	//-------- Runen --------
	CreateInvItem (npc,ItArRuneLight);
	CreateInvItem (npc,ItArRuneFirebolt);
	CreateInvItem (npc,ItArRuneHeal);
	CreateInvItem (npc,ItArRuneFireball);

	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollFirebolt,12);
	CreateInvItems (npc,ItArScrollLight,14);
	CreateInvItems (npc,ItArScrollHeal,16);
	
	
	CreateInvItems (npc,ItArScrollFireball,4);
	CreateInvItems (npc,ItArScrollFirestorm,2);
	CreateInvItems (npc,ItArScrollTrfWolf,3);
	CreateInvItems (npc,ItArScrollTrfLurker,4);
	CreateInvItems (npc,ItArScrollTrfScavenger,2);
	CreateInvItems (npc,ItArScrollTrfMolerat,6);
	CreateInvItems (npc,ItArScrollTrfCrawler,3);
	CreateInvItems (npc,ItArScrollTrfBloodfly,3);
	//-------- Bücher --------
  	CreateInvItem (npc,ItWr_Book_Circle_04);
	CreateInvItem (npc,ItWr_Book_Circle_05);
	CreateInvItem (npc,ItWr_Book_Circle_06);
  	//-------- Tränke --------
	CreateInvItems (npc,ItFo_Potion_Mana_01 ,12);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,8);
   
   CreateInvItems (npc,ItFo_Potion_Health_01 ,16);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,10);
   
   CreateInvItems (npc,ItFo_Potion_Water_01 ,20);
	
   CreateInvItems (npc,ItFo_Potion_Haste_01 ,6);
};

func void B_Give_TorrezChapter3Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(KDF_405_Torrez);
	
	//-------- Runen --------
	CreateInvItem (npc,ItArRuneFirestorm);

	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollFirebolt,16);
	CreateInvItems (npc,ItArScrollLight,12);
	CreateInvItems (npc,ItArScrollHeal,16);
	
	CreateInvItems (npc,ItArScrollFireball,4);
	CreateInvItems (npc,ItArScrollFirestorm,3);
	CreateInvItems (npc,ItArScrollTrfWolf,3);
	CreateInvItems (npc,ItArScrollTrfLurker,4);
	CreateInvItems (npc,ItArScrollTrfScavenger,2);
	CreateInvItems (npc,ItArScrollTrfMolerat,6);
	CreateInvItems (npc,ItArScrollTrfCrawler,3);
	CreateInvItems (npc,ItArScrollTrfBloodfly,3);
	CreateInvItems (npc,ItArScrollTrfMeatbug,2);
	CreateInvItems (npc,ItArScrollTrfWaran,4);

	CreateInvItems (npc,ItArScrollFirerain,2); 

	//-------- Bücher --------
  	//-------- Tränke --------
	CreateInvItems (npc,ItFo_Potion_Mana_01 ,24);
	CreateInvItems (npc,ItFo_Potion_Mana_02 ,16);
	CreateInvItems (npc,ItFo_Potion_Mana_03 ,10);
    
	CreateInvItems (npc,ItFo_Potion_Health_01 ,32);
	CreateInvItems (npc,ItFo_Potion_Health_02 ,20);
	CreateInvItems (npc,ItFo_Potion_Health_03 ,12); 
	
	CreateInvItems (npc,ItFo_Potion_Haste_01 ,12);	
	CreateInvItems (npc,ItFo_Potion_Haste_02 ,6);
};


