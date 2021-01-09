func void B_Give_BaalCadarChapter1Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GUR_1208_BaalCadar);
	
	//-------- Runen --------
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,8);
	CreateInvItems (npc,ItArScrollLight,10);
	CreateInvItems (npc,ItArScrollWindfist,4);
	//-------- Tränke --------	
	CreateInvItems (npc,ItFo_Potion_Mana_01 ,6);
	CreateInvItems (npc,ItFo_Potion_Health_01 ,8);
	CreateInvItems (npc,ItFo_Potion_Water_01 ,10);
	//-------- Ringe/Amulette --------
  	CreateInvItem (npc,Schutzring_Waffen1);
	CreateInvItem (npc,Schutzring_Magie1);
	CreateInvItem (npc,Schutzring_Geschosse1);
	CreateInvItem (npc,Schutzring_Feuer1);
	//-----Bücher
	CreateInvItem (npc,ItWr_Bloodfly_01);
	CreateInvItem (npc,ItWrPSImap);
	
};
func void B_Give_BaalCadarChapter2Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GUR_1208_BaalCadar);
	
	//-------- Runen --------
	CreateInvItem (npc,ItArRuneLight);
	CreateInvItem (npc,ItArRuneWindfist);
	CreateInvItem (npc,ItArRuneHeal);
	
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,8);
	CreateInvItems (npc,ItArScrollLight,10);
	CreateInvItems (npc,ItArScrollWindfist,6);
	CreateInvItems (npc,ItArScrollTelekinesis,4);
	CreateInvItems (npc,ItArScrollTrfWolf,5);
	CreateInvItems (npc,ItArScrollTrfLurker,3);
	CreateInvItems (npc,ItArScrollTrfScavenger,1);
	CreateInvItems (npc,ItArScrollTrfMolerat,5);
	CreateInvItems (npc,ItArScrollTrfCrawler,3);
	CreateInvItems (npc,ItArScrollTrfBloodfly,2);
	CreateInvItems (npc,ItArScrollCharm,4);

	//-------- Ringe/Amulette --------
	CreateInvItem (npc,Schutzring_Feuer2);
	CreateInvItem (npc,Schutzring_Waffen2);
	CreateInvItem (npc,Schutzring_Geschosse2);
	CreateInvItem (npc,Schutzring_Magie2);
 	CreateInvItem (npc,Schutzring_Waffen1);
 	//-------- Tränke --------
   CreateInvItems (npc,ItFo_Potion_Mana_01 ,12);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,8);
   
   CreateInvItems (npc,ItFo_Potion_Health_01 ,16);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,10);
   
   CreateInvItems (npc,ItFo_Potion_Water_01 ,20);
	
   CreateInvItems (npc,ItFo_Potion_Haste_01 ,6);
 };

func void B_Give_BaalCadarChapter3Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GUR_1208_BaalCadar);
	
	//-------- Runen --------
	CreateInvItem (npc,ItArRuneSleep);
	CreateInvItem (npc,ItArRuneTelekinesis);
	CreateInvItem (npc,ItArRuneCharm);

	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,8);
	CreateInvItems (npc,ItArScrollLight,10);
	CreateInvItems (npc,ItArScrollWindfist,6);
	CreateInvItems (npc,ItArScrollTrfWolf,4);
	CreateInvItems (npc,ItArScrollTrfLurker,4);
	CreateInvItems (npc,ItArScrollTrfScavenger,2);
	CreateInvItems (npc,ItArScrollTrfMolerat,4);
	CreateInvItems (npc,ItArScrollTrfCrawler,3);
	CreateInvItems (npc,ItArScrollTrfBloodfly,1);
	CreateInvItems (npc,ItArScrollFear,4);
	CreateInvItems (npc,ItArScrollSleep,5);
	CreateInvItems (npc,ItArScrollStormfist,3);
	CreateInvItems (npc,ItArScrollTrfMeatbug,2);
	CreateInvItems (npc,ItArScrollTrfWaran,2);
	CreateInvItems (npc,ItArScrollPyrokinesis,5);
	CreateInvItems (npc,ItArScrollControl,3);
	CreateInvItems (npc,ItArScrollCharm,5);
	
	//-------- Ringe/Amulette --------
	CreateInvItem (npc,Schutzring_Geschosse1_Waffen1);
	CreateInvItem (npc,Schutzring_Total1);
	CreateInvItem (npc,Schutzring_Magie1_Fire1);
	
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
func void B_Give_BaalCadarChapter4Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GUR_1208_BaalCadar);
	
	//-------- Runen --------
	CreateInvItem (npc,ItArRuneControl);
	CreateInvItem (npc,ItArRunePyrokinesis);
	CreateInvItem (npc,ItArRuneStormfist);

	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,8);
	CreateInvItems (npc,ItArScrollLight,10);
	CreateInvItems (npc,ItArScrollWindfist,6);
	CreateInvItems (npc,ItArScrollTelekinesis,4);
	CreateInvItems (npc,ItArScrollTrfWolf,4);
	CreateInvItems (npc,ItArScrollTrfLurker,4);
	CreateInvItems (npc,ItArScrollTrfScavenger,2);
	CreateInvItems (npc,ItArScrollTrfCrawler,4);
	CreateInvItems (npc,ItArScrollTrfBloodfly,2);
	CreateInvItems (npc,ItArScrollFear,4);
	CreateInvItems (npc,ItArScrollSleep,5);
	CreateInvItems (npc,ItArScrollStormfist,3);
	CreateInvItems (npc,ItArScrollTrfMeatbug,3);
	CreateInvItems (npc,ItArScrollTrfWaran,5);
	CreateInvItems (npc,ItArScrollPyrokinesis,5);
	CreateInvItems (npc,ItArScrollControl,3);
	CreateInvItems (npc,ItArScrollCharm,4);
	CreateInvItems (npc,ItArScrollTrfSnapper,3);
	CreateInvItems (npc,ItArScrollTrfOrcdog,5);
	
	//-------- Ringe/Amulette --------
	CreateInvItem (npc,Schutzring_Magie2_Fire2);
	CreateInvItem (npc,Schutzring_Geschosse2_Waffen2);
	CreateInvItem (npc,Schutzring_Total2);
	
	//-------- Tränke --------
	 CreateInvItems (npc,ItFo_Potion_Mana_01 ,48);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,32);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,20);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,64);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,40);
   CreateInvItems (npc,ItFo_Potion_Health_03 ,24); 
	
    CreateInvItems (npc,ItFo_Potion_Haste_01 ,24);	
    CreateInvItems (npc,ItFo_Potion_Haste_02 ,12); 
	CreateInvItems (npc,ItFo_Potion_Haste_02 ,6);
};
func void B_Give_BaalCadarChapter5Runes ()
{
	var C_NPC npc;
	npc = Hlp_GetNpc(GUR_1208_BaalCadar);
	
	//-------- Ringe/Amulette --------
	
	//-------- Scrolls --------
	CreateInvItems (npc,ItArScrollHeal,8);
	CreateInvItems (npc,ItArScrollLight,10);
	CreateInvItems (npc,ItArScrollWindfist,4);
	CreateInvItems (npc,ItArScrollTelekinesis,4);
	CreateInvItems (npc,ItArScrollTrfWolf,4);
	CreateInvItems (npc,ItArScrollTrfLurker,4);
	CreateInvItems (npc,ItArScrollTrfScavenger,3);
	CreateInvItems (npc,ItArScrollTrfCrawler,3);
	CreateInvItems (npc,ItArScrollTrfMeatbug,4);
	CreateInvItems (npc,ItArScrollTrfWaran,5);
	CreateInvItems (npc,ItArScrollTrfBloodfly,2);
	CreateInvItems (npc,ItArScrollTrfShadowbeast,3);

	CreateInvItems (npc,ItArScrollFear,4);
	CreateInvItems (npc,ItArScrollSleep,4);
	CreateInvItems (npc,ItArScrollStormfist,3);
	CreateInvItems (npc,ItArScrollPyrokinesis,5);
	CreateInvItems (npc,ItArScrollControl,2);
	CreateInvItems (npc,ItArScrollCharm,4);
	CreateInvItems (npc,ItArScrollDestroyUndead,16);

	//-------- Bücher --------
	//-------- Tränke --------
	CreateInvItems (npc,ItFo_Potion_Mana_01 ,18);
   CreateInvItems (npc,ItFo_Potion_Mana_02 ,16);
   CreateInvItems (npc,ItFo_Potion_Mana_03 ,10);
    
   CreateInvItems (npc,ItFo_Potion_Health_01 ,32);
   CreateInvItems (npc,ItFo_Potion_Health_02 ,20);
   CreateInvItems (npc,ItFo_Potion_Health_03 ,48); 
	
    CreateInvItems (npc,ItFo_Potion_Haste_01 ,48);	
	CreateInvItems (npc,ItFo_Potion_Haste_02 ,24);
	CreateInvItems (npc,ItFo_Potion_Haste_03 ,12);
};










