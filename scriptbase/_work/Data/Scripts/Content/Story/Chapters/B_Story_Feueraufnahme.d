func void B_Story_Feueraufnahme ()
{
	if (Corristo_KDFAufnahme == 4) // Alle Feuermagier in die Kapelle beamen
	{
		Npc_ExchangeRoutine (self,"KDFRITUAL");
		
		var C_NPC Magier_1;
		Magier_1= Hlp_GetNpc (KDF_400_Rodriguez);
		AI_Teleport (Magier_1,"OCC_CHAPEL_MAGE_01");
		Npc_ExchangeRoutine (Magier_1,"KDFRITUAL");
		AI_ContinueRoutine (Magier_1);
		
		var C_NPC Magier_2;
		Magier_2= Hlp_GetNpc (KDF_401_Damarok);
		AI_Teleport (Magier_2,"OCC_CHAPEL_MAGE_04");
		Npc_ExchangeRoutine (Magier_2,"KDFRITUAL");
		AI_ContinueRoutine (Magier_2);
		
		var C_NPC Magier_3;
		Magier_3= Hlp_GetNpc (KDF_403_Drago);
		AI_Teleport (Magier_3,"OCC_CHAPEL_MAGE_03");
		Npc_ExchangeRoutine (Magier_3,"KDFRITUAL");
		AI_ContinueRoutine (Magier_3);
		
		var C_NPC Magier_4;
		Magier_4= Hlp_GetNpc (KDF_405_Torrez); 
		AI_Teleport (Magier_4,"OCC_CHAPEL_MAGE_02");
		Npc_ExchangeRoutine (Magier_4,"KDFRITUAL");
		AI_ContinueRoutine (Magier_4);
	}
			
	else if (Corristo_KDFAufnahme == 5)// die Feuermagier am Pentagramm ausrichten
	{

		Magier_1= Hlp_GetNpc (KDF_400_Rodriguez);
		AI_AlignToWP (Magier_1);
		
		Magier_2= Hlp_GetNpc (KDF_401_Damarok);
		AI_AlignToWP (Magier_2);
		
		Magier_3= Hlp_GetNpc (KDF_403_Drago);
		AI_AlignToWP (Magier_3);
		
		Magier_4= Hlp_GetNpc (KDF_405_Torrez); 
		AI_AlignToWP (Magier_4);
	
	
	}
				
	else if (Corristo_KDFAufnahme == 6) // DIE AUFNAHME BEENDEN
	{
		Npc_ExchangeRoutine (self,"START");
		
		Magier_1= Hlp_GetNpc (KDF_400_Rodriguez);
		//AI_Teleport (Magier_1,"START");
		Npc_ExchangeRoutine (Magier_1,"START");
		AI_ContinueRoutine (Magier_1);
		
		Magier_2= Hlp_GetNpc (KDF_401_Damarok);
		//AI_Teleport (Magier_2,"START");
		Npc_ExchangeRoutine (Magier_2,"START");
		//AI_ContinueRoutine (Magier_2);
		
		Magier_3= Hlp_GetNpc (KDF_403_Drago);
		//AI_Teleport (Magier_3,"START");
		Npc_ExchangeRoutine (Magier_3,"START");
		AI_ContinueRoutine (Magier_3);
		
		Magier_4= Hlp_GetNpc (KDF_405_Torrez); 
		//AI_Teleport (Magier_4,"START");
		Npc_ExchangeRoutine (Magier_4,"START");
		AI_ContinueRoutine (Magier_4);
	};
};