// ****************************************
// 					FIRST 
// ****************************************

instance  GUR_1201_CorKalom_FIRST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_FIRST_Condition;
	information		= GUR_1201_CorKalom_FIRST_Info;
	permanent		= 1;
	important		= 1;
};

FUNC int  GUR_1201_CorKalom_FIRST_Condition()
{
	if (Npc_IsInState(self,ZS_TALK))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIRST_Info()
{
	AI_Output (self, other,"GUR_1201_CorKalom_FIRST_10_00"); //Was willst du?
	Kalom_TalkedTo = TRUE;
};  

// ****************************************
// 				Wanna Join
// ****************************************

instance  GUR_1201_CorKalom_WannaJoin (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_WannaJoin_Condition;
	information		= GUR_1201_CorKalom_WannaJoin_Info;
	permanent		= 0;
	description		= "Ich will in die Bruderschaft aufgenommen werden."; 
};

FUNC int  GUR_1201_CorKalom_WannaJoin_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_WannaJoin_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_00"); //Ich will in die Bruderschaft aufgenommen werden.
	AI_Output (other, self,"GUR_1201_CorKalom_WannaJoin_15_01"); //Ich habe geh�rt, du bist der Meister der Novizen, und entscheidest, wer aufgenommen wird.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_02"); //Ich habe keine Zeit! Meine Experimente sind zu wichtig, als dass ich mich um neue Novizen k�mmern k�nnte.
	AI_Output (self, other,"GUR_1201_CorKalom_WannaJoin_10_03"); //Ich verlasse mich auf das Urteil der Baals. Wenn sie sagen, dass du bereit bist, die Robe eines Novizen zu tragen, kehre zu mir zur�ck.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"Cor Kalom nimmt mich als Novize in die Bruderschaft auf, wenn ich mindestens vier der Baal's davon �berzeugen kann, f�r mich zu sprechen.");
};  

// ****************************************
// 				Kaloms Recipe
// ****************************************

instance  GUR_1201_CorKalom_Recipe (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 20;
	condition		= GUR_1201_CorKalom_Recipe_Condition;
	information		= GUR_1201_CorKalom_Recipe_Info;
	permanent		= 0;
	description		= "Einer der H�ndler aus dem alten Lager will ein Rezept von dir haben."; 
};

FUNC int  GUR_1201_CorKalom_Recipe_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Recipe_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Recipe_15_00"); //Einer der H�ndler aus dem Alten Lager will das Rezept f�r einen Heiltrank von dir haben.
	AI_Output (self, other,"GUR_1201_CorKalom_Recipe_10_01"); //Meine Rezepte sind unverk�uflich!

	B_LogEntry	(CH1_KalomsRecipe,	"Cor Kalom will das Rezept nicht herausr�cken. Aber in seinem Labor stehen Truhen... Und er schien ziemlich besch�ftigt zu sein...");
};  

// ****************************************
// 				Experimente (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Experimente (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_Experimente_Condition;
	information		= GUR_1201_CorKalom_Experimente_Info;
	permanent		= 1;
	description		= "Was machst du f�r Experimente?"; 
};

FUNC int  GUR_1201_CorKalom_Experimente_Condition()
{
	if	(Kapitel <= 2)
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_Experimente_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Experimente_15_00"); //Was machst du f�r Experimente?
	AI_Output (self, other,"GUR_1201_CorKalom_Experimente_10_01"); //Meine Forschung befindet sich auf einer Ebene, von der du nichts verstehst, Bursche. Also verschwende nicht meine Zeit!
};  

// ****************************************
// Info BRINGWEED
// ****************************************

instance  GUR_1201_CorKalom_BRINGWEED (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 2;
	condition		= GUR_1201_CorKalom_BRINGWEED_Condition;
	information		= GUR_1201_CorKalom_BRINGWEED_Info;
	permanent		= 1;
	description		= "Ich bringe die t�gliche Sumpfkrauternte!"; 
};

FUNC int  GUR_1201_CorKalom_BRINGWEED_Condition()
{
	if	(BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  GUR_1201_CorKalom_BRINGWEED_Info()
{
	AI_Output				(other, self,"GUR_1201_CorKalom_BRINGWEED_15_00"); //Ich bringe die t�gliche Sumpfkrauternte!

	if	(Npc_HasItems(hero, ItMi_Plants_Swampherb_01) < 100)
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_01"); //Und DAS soll alles sein??? Ich erwarte die KOMPLETTE Ernte, das sind mindestens 100 Stengel!!!
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"GUR_1201_CorKalom_BRINGWEED_10_02"); //Ah, gib her. Und verzieh dich wieder!

		B_GiveInvItems	(hero, self, ItMi_Plants_Swampherb_01, 100);
        Npc_RemoveInvItems (self, ItMi_Plants_Swampherb_01, 100);
		BaalOrun_FetchWeed = LOG_SUCCESS;
		B_LogEntry			(CH1_DeliverWeed,	"Cor Kalom war unaustehlich wie immer, als ich ihm die heutige Sumpfkrauternte �bergab.");
		Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_SUCCESS);
		B_GiveXP			(XP_DeliveredWeedHarvest);
		
		BaalOrun_FetchWeed = LOG_SUCCESS;		
		AI_StopProcessInfos	(self);
	};
};  

// ****************************************
// 				Crawlerzangen (PERM)
// ****************************************

instance  GUR_1201_CorKalom_Crawlerzangen (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 800;
	condition		= GUR_1201_CorKalom_Crawlerzangen_Condition;
	information		= GUR_1201_CorKalom_Crawlerzangen_Info;
	permanent		= 1;
	description		= "Ich habe Crawlerzangen f�r dich..."; 
};

FUNC int  GUR_1201_CorKalom_Crawlerzangen_Condition()
{
	if (Npc_HasItems(other, ItAt_Crawler_01)>0)
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_Crawlerzangen_Info()
{
	AI_Output (other, self,"GUR_1201_CorKalom_Crawlerzangen_15_00"); //Ich habe Crawlerzangen f�r dich...
	
	if (Npc_HasItems(other,ItAt_Crawler_01) > 9)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_01"); //Sehr gut. Nimm einige meiner besten Tr�nke als Belohnung.
		CreateInvItems(self, ItFo_Potion_Mana_03, 3);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_03, 3);
	}
	else if (Npc_HasItems(other,ItAt_Crawler_01) > 2)
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_02"); //Gut. Nimm ein paar Tr�nke als Belohnung.
		CreateInvItems(self, ItFo_Potion_Mana_02, 2);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_02, 2);
	}
	else
	{
		AI_Output (self, other,"GUR_1201_CorKalom_Crawlerzangen_10_03"); //Hm. Das soll alles sein? Hier, nimm einen Manatrank und verschwinde.
		CreateInvItems(self, ItFo_Potion_Mana_01, 1);
		B_GiveInvItems(self, hero,ItFo_Potion_Mana_01, 1);
		AI_StopProcessInfos(self);
	};
	
	B_GiveInvItems(other, self, ItAt_Crawler_01, Npc_HasItems(other,ItAt_Crawler_01));
}; 




// ****************************************
// 				Join PSI
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI_Condition;
	information		= GUR_1201_CorKalom_JoinPSI_Info;
	permanent		= 1;
	description		= "Ich glaube, ich habe die Baals �berzeugt!"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	Npc_KnowsInfo(hero, GUR_1201_CorKalom_WannaJoin) 
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI_Info()
{
	var int counter;
	counter = 0;	//Counter l�schen, da er noch den Stand der letzten Analyse hat!
	
	AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_00"); //Ich glaube, ich habe die Baals �berzeugt!
	
	if (Npc_KnowsInfo(hero,DIA_BaalOrun_GotWeed))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_01"); //Baal Orun sagt, ich habe mich als w�rdiger Diener des Schl�fers erwiesen.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalCadar_SleepSpell))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_02"); //Weiter ...
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_03"); //Baal Cadar h�lt mich f�r einen gelehrigen Sch�ler.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalNamib_FirstTalk))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_04"); //Baal Namib ist �berzeugt, dass ich ein wahrer Anh�nger des Glaubens bin.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTyon_Vision))
	{
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_05"); //Baal Tyon hatte dank mir eine Vision.
		counter = counter + 1;
	};
	if (Npc_KnowsInfo(hero,	DIA_BaalTondral_SendToKalom))
	{
		AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_10_06"); //Und?
		AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_15_07"); //Baal Tondral sagt, ich soll die Robe erhalten. Ich habe einen neuen Sch�ler zu ihm gef�hrt.
		counter = counter + 1;
	};
	//-------------------------------------	
	if	(hero.level >= 5)
	{	
		if (counter >= 4)
		{
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_08"); //Gut. Wenn die Baals f�r dich sprechen, dann soll mir das reichen.
			AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_09"); //Hier, zieh das an. Und jetzt geh und mach dich n�tzlich.
	
			// Ernennung zum Novizen
			CreateInvItem		(self, NOV_ARMOR_M);
			B_GiveInvItems      (self,hero, NOV_ARMOR_M, 1);
			AI_EquipBestArmor	(other);
			Npc_SetTrueGuild	(hero,GIL_NOV);
			hero.guild = GIL_NOV;
			B_LogEntry			(CH1_JoinPsi,	"Heute hat mich Cor Kalom zum Novizen ernannt. Er war zwar unausstehlich wie immer, doch nun geh�re ich endlich fest zur Bruderschaft im Sumpflager.");
			B_LogEntry			(GE_TraderPSI,	"Bessere NOVIZENR�STUNGEN bekomme ich von Baal Namib.");
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_SUCCESS);
			B_GiveXP			(XP_BecomeNovice);
	
			// Canceln der anderen Aufnahmen
			Log_CreateTopic		(CH1_JoinOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinOC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinOC,	"Da ich mich nun endg�ltig f�r die Bruderschaft des Schl�fers im Sumpflager entschieden habe, kann ich kein Schatten Gomez' mehr werden");
			
			Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
			B_LogEntry			(CH1_JoinNC,	"Eine Aufnahme bei den Banditen des Neuen Lagers ist nun nicht mehr m�glich, denn meine neue Heimat ist die Bruderschaft des Schl�fers");
			
			//Log_SetTopicStatus	(CH1_LostNek,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_FiskNewDealer,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_KalomsRecipe,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_BringList,	LOG_FAILED);
			//Log_SetTopicStatus	(CH1_MordragKO,	LOG_FAILED);
		}
		else
		{
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_00"); //Und?
			AI_Output (other, self,"GUR_1201_CorKalom_JoinPSI_NOT_15_01"); //Das war alles.
			AI_Output (self, other,"GUR_1201_CorKalom_JoinPSI_NOT_10_02"); //Du stiehlst mir meine kostbare Zeit! Komm wieder, wenn mindestens vier der Baals dich f�r w�rdig erachten!
		};
	}
	else
	{	
		B_PrintGuildCondition(5);
	};
};

// ****************************************
// 				Join PSI2
// ****************************************

instance  GUR_1201_CorKalom_JoinPSI2 (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	nr 				= 1;
	condition		= GUR_1201_CorKalom_JoinPSI2_Condition;
	information		= GUR_1201_CorKalom_JoinPSI2_Info;
	permanent		= 0;
	description		= "Das war alles? Kein 'Herzlich Willkommen', kein gar nichts?"; 
};

FUNC int  GUR_1201_CorKalom_JoinPSI2_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NOV)
	{
		return 1;
	};
};

func void  GUR_1201_CorKalom_JoinPSI2_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_10"); //Das war alles? Kein "Herzlich Willkommen", kein gar nichts?
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_11"); //Herzlich willkommen.
	AI_Output			(other, self,"GUR_1201_CorKalom_JoinPSI_15_12"); //Gef�llt mir schon viel besser.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_13"); //Steh hier nicht rum! Tu was. Hier, nimm dieses Kraut und bring es zu Gomez ins alte Lager.
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_14"); //Wenn dich seine Schergen nicht durchlassen wollen, sag ihnen Cor Kalom schickt dich.
	
	CreateInvItems		(self, itmijoint_3, 30);
	B_GiveInvItems      (self, hero, itmijoint_3, 30);

	KALOM_KRAUTBOTE = LOG_RUNNING;
	Log_CreateTopic		(CH1_KrautBote,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_KrautBote,	LOG_RUNNING);
	B_LogEntry			(CH1_KrautBote,	"Auf seine charmante Art und Weise schickte Cor Kalom mich zu Gomez ins Alte Lager, um ihm eine Lieferung Kraut zu bringen."); 
	
	AI_Output			(self, other,"GUR_1201_CorKalom_JoinPSI_10_15"); //Du bist ja immer noch hier!
	AI_StopProcessInfos	(self);
};  

// **************************************************************************
// 							MISSION: 	Drug Monopol
// **************************************************************************



// --------------------------------------------------------------------------

INSTANCE Info_Kalom_DrugMonopol (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_DrugMonopol_Condition;
	information	= Info_Kalom_DrugMonopol_Info;
	permanent 	= 0; 
	description = "Hast DU noch eine Aufgabe f�r mich?";
};


FUNC INT Info_Kalom_DrugMonopol_Condition()
{
	if (Npc_GetTrueGuild(other)==GIL_NOV)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_DrugMonopol_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_00"); //Hast DU noch eine Aufgabe f�r mich?
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_01"); //Im Neuen Lager gibt es eine kleine Gruppe von M�nnern, die ihre eigene Krautproduktion angefangen haben.
	//AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_02"); //Sie wollen unsere Kunden im Neuen Lager abwerben, Das werden wir nicht zulassen.
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_03"); //K�mmere dich darum, dass sie die Produktion einstellen.
	AI_Output (other, self,"Mis_1_Psi_Kalom_DrugMonopol_15_04"); //Und wie ...
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_05"); //Bel�stige mich nicht mit Details!
	AI_Output (self, other,"Mis_1_Psi_Kalom_DrugMonopol_10_06"); //Die Krautmischer m�ssen ihr Lager irgendwo au�erhalb des Neuen Lagers haben. Du wei�t, was du zu tun hast.

	Kalom_DrugMonopol = LOG_RUNNING;
	Log_CreateTopic		(CH1_DrugMonopol,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_RUNNING);
	B_LogEntry			(CH1_DrugMonopol,	"Cor Kalom will, dass ich eine konkurrierende Krautproduktion einiger Leute im Neuen Lager unterbinde. Ich hab' keine Ahnung, wo genau ich anfangen soll zu suchen, aber ich sollte VOR dem Neuen Lager anfangen.");

	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
	
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] = FALSE;
};

// **************************************************************************
// 							SUCCESS
// **************************************************************************

INSTANCE Info_Kalom_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_Kalom_Success_Condition;
	information	= Info_Kalom_Success_Info;
	permanent	= 1;
	description = "Wegen der Krautherstellung im Neuen Lager...";
};


FUNC INT Info_Kalom_Success_Condition()
{
	if	(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Kalom_Success_Info()
{
	var C_NPC Killian; 	Killian = Hlp_GetNpc(ORG_861_Killian);
	var C_NPC Renyu; 	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	var C_NPC Jacko; 	Jacko = Hlp_GetNpc(ORG_862_Jacko);
		
	AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_00"); //Wegen der Krautherstellung im Neuen Lager ...
	AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_01"); //Ja?
	
	if (Stooges_Fled != TRUE)
	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_02"); //Ich finde die M�nner nicht.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_03"); //Ich hatte nichts anderes von dir erwartet.
	}
	else if (Stooges_Fled == TRUE)
	||		(Npc_IsDead(Jacko)&&Npc_IsDead(Renyu)&&Npc_IsDead(Killian))
 	{
		AI_Output (other, self,"Mis_1_Psi_Kalom_Success_15_04"); //Es gibt sie nicht mehr.
		AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_05"); //Du �berraschst mich. Ich hatte dich untersch�tzt. Vielleicht k�nntest du uns doch zu etwas n�tzen.
		//AI_Output (self, other,"Mis_1_Psi_Kalom_Success_10_06"); //Rede mit den Baals.
		
		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_DrugMonopol,	"Ich habe Cor Kalom die Einstellung der konkurrierenden Krautproduktion im Neuen Lager gemeldet. Er reagierte 'freundlich' wie immer.");
		Log_SetTopicStatus	(CH1_DrugMonopol,	LOG_SUCCESS);
		B_GiveXP			(XP_DrugMonopol);
	};
};

// ****************************************************************
// 							KRAUTBOTE ZUR�CK
// ****************************************************************

INSTANCE Info_Kalom_KrautboteBACK(C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr 			= 1;
	condition	= Info_Kalom_KrautboteBACK_Condition;
	information	= Info_Kalom_KrautboteBACK_Info;
	permanent 	= 1;
	description = "Ich habe das Kraut abgeliefert.";
};

func INT Info_Kalom_KrautboteBACK_Condition()
{
	if	Kalom_DeliveredWeed
	{
		return TRUE;
	};
};

FUNC VOID Info_Kalom_KrautboteBACK_Info()
{
	AI_Output (other, self,"Mis_1_Psi_Kalom_KrautboteBACK_15_00"); //Ich habe das Kraut abgeliefert.
	
	if (Npc_HasItems (hero,itminugget)>=500)
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_01"); //Gut. Mach dich anderweitig n�tzlich.

		Kalom_DrugMonopol = LOG_SUCCESS;
		B_LogEntry			(CH1_KrautBote,	"Cor Kalom hat das Geld f�r die Krautlieferung an die Erzbarone erhalten.");
		Log_SetTopicStatus	(CH1_KrautBote,	LOG_SUCCESS);
		B_GiveInvItems		(hero, self, ItMiNugget, 500);
		B_GiveXP			(XP_WeedShipmentReported);

		Info_Kalom_KrautboteBACK.permanent = 0;
	}
	else
	{
		AI_Output (self, other,"Mis_1_Psi_Kalom_KrautboteBACK_10_02"); //Wo sind die 500 Erz, Bursche? Beeil dich besser, sie mir zu bringen!
	}; 
};














// **************************************************************************
//
// 									KAPITEL 2
//
// **************************************************************************
instance Info_CorKalom_BringFocus (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringFocus_Condition;
	information	= Info_CorKalom_BringFocus_Info;
	permanent	= 0;
	important 	= 0;
	description = "Y'Berion schickt mich. Ich habe den Fokus.";
};

FUNC INT Info_CorKalom_BringFocus_Condition()
{	
	if  (YBerion_BringFocus == LOG_SUCCESS) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BringFocus_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_Info3_15_01"); //Y'Berion schickt mich. Ich habe den Fokus.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_02"); //Ahhhh - der Fokus ... Jetzt kann ich mich endlich den Studien �ber die Magie dieser Artefakte widmen.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_Info3_10_03"); //Wenn ich nur ausreichend Sekret h�tte ... Verflucht!
	
	B_LogEntry		(CH2_Focus,	"Ich habe den omin�sen Fokus bei Cor Kalom abgeliefert!");		
	Log_SetTopicStatus	(CH2_Focus,	LOG_SUCCESS);
	
	B_GiveInvItems	    (hero, self, Focus_1, 1);
	Npc_RemoveInvItem   (self, Focus_1);
	B_GiveXP			(XP_BringFocusToCorKalom);
};

// ------------------------------ 2. Belohnung f�r Fokus ergaunern ----------------------------------
instance Info_CorKalom_BLUFF (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 10;
	condition	= Info_CorKalom_BLUFF_Condition;
	information	= Info_CorKalom_BLUFF_Info;
	permanent	= 0;
	description = "Y'Berion sagte mir, du w�rdest mich entlohnen";
};

FUNC INT Info_CorKalom_BLUFF_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringFocus)) 
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_BLUFF_Info()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BLUFF_Info3_15_01"); //Y'Berion sagte mir, du w�rdest mich entlohnen, wenn ich dir den Fokus bringe!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BLUFF_Info3_10_02"); //Tats�chlich? Hat er das gesagt? Nun gut. Ich denke, 50 Erz sollten reichen!
	
	CreateInvItems (self,Itminugget,50);
	B_GiveInvItems (self, other, Itminugget,50);
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_SACHE (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_SACHE_Condition;
	information		= GUR_1201_CorKalom_SACHE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sekret?"; 
};

FUNC int  GUR_1201_CorKalom_SACHE_Condition()
{	
	if (Npc_KnowsInfo ( hero,Info_CorKalom_BringFocus))
	{
		return 1;
	};

};
FUNC VOID  GUR_1201_CorKalom_SACHE_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_Info_15_01"); //Sekret?
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_02"); //Ja. Wie du sicher schon wei�t, stelle ich die Elixiere f�r die Anrufung des Schl�fers her. Ich benutze daf�r das Sekret aus den Zangen der Minecrawler.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_Info_10_03"); //Du wei�t doch, was Minecrawler sind?

	Info_Clearchoices	(GUR_1201_CorKalom_SACHE);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Nein",GUR_1201_CorKalom_SACHE_NEIN);
	Info_Addchoice		(GUR_1201_CorKalom_SACHE,"Ja",GUR_1201_CorKalom_SACHE_JA);
};  
//------------------------------------------------------
FUNC VOID GUR_1201_CorKalom_SACHE_NEIN ()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_NEIN_15_01"); //Nein
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_02"); //Das sind gef�hrliche Bestien, die durch die dunklen Minen kriechen und jeden Menschen verspeisen, den sie fassen k�nnen.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_03"); //Ihre Zangen enthalten ein ganz besonderes Sekret.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_NEIN_10_04"); //Aus diesem Sekret stelle ich ein Elixier her, das uns den spirituellen Weg zum Schl�fer zeigt.
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
//------------------------------------------------------
func void GUR_1201_CorKalom_SACHE_JA()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_SACHE_JA_15_01"); //Ja.
	AI_Output			(self, other,"GUR_1201_CorKalom_SACHE_JA_10_02"); //Ausgezeichnet!
	Info_ClearChoices (GUR_1201_CorKalom_SACHE);
};
// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_VISION (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_VISION_Condition;
	information		= GUR_1201_CorKalom_VISION_Info;
	important		= 0;
	permanent		= 0;
	description		= "Erz�hl weiter!"; 
};

FUNC int  GUR_1201_CorKalom_VISION_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_SACHE))
	{
		return 1;
	};

};
FUNC void  GUR_1201_CorKalom_VISION_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_01"); //Erz�hl weiter!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_02"); //Also, ich hatte vor kurzem eine Vision vom Schl�fer pers�nlich. Er gab mir ein Zeichen.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_03"); //Er gab mir zu verstehen, dass es ein anderes Mittel gibt als das Sekret der Zangen.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_04"); //Und er w�hlte mich, diese Mission weiterzugeben. Du bekommst diese Mission nicht von mir. Du bekommst sie vom Schl�fer!
	AI_Output			(other, self,"GUR_1201_CorKalom_VISION_Info_15_05"); //Nicht m�glich!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_06"); //Schweig, Narr!
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_07"); //Er gab mir zu verstehen, dass mein Weg richtig ist, nur dass das Mittel nicht stark genug sei.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_08"); //Das bedeutet, das Mittel, was wir suchen, finden wir bei den Minecrawlern, nur die Zangen sind nicht ausreichend.
	AI_Output			(self, other,"GUR_1201_CorKalom_VISION_Info_10_09"); //Es muss etwas anderes geben.
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_NEST (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_NEST_Condition;
	information		= GUR_1201_CorKalom_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Habt ihr die Minecrawler nie untersucht?"; 
};

FUNC int  GUR_1201_CorKalom_NEST_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_VISION))
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_NEST_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_NEST_Info_15_01"); //Habt ihr die Minecrawler nie untersucht? Ich meine, vielleicht gibt es ein anders K�rperteil, das mehr von dem Sekret enth�lt.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_02"); //Nat�rlich haben wir schon einige Minecrawler seziert, aber nur ihre Zangen scheinen das Sekret zu enthalten.
	AI_Output			(self, other,"GUR_1201_CorKalom_NEST_Info_10_03"); //Es muss etwas anderes geben. Finde ihr Nest und du findest die Antwort!

	CorKalom_BringMCQBalls = LOG_RUNNING;

};  


// ***************************** Mission MCEggs annehmen ****************************************//
func void GUR_1201_CorKalom_WEG_ACCEPT()
{
	Log_CreateTopic		(CH2_MCEggs,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_RUNNING);
	B_LogEntry		(CH2_MCEggs,	"Der Guru Cor Kalom hat mich beauftragt in der Alten Mine nach einer Quelle f�r Minecrawlersekret zu suchen. Bisher wurden daf�r die Zangen dieser Monster benutzt, doch ich soll etwas anderes, besonderes finden, aus dem man ein besonders starkes Sekret herstellen k�nnte");

	if (PresseTourJanuar2001)
	{
		CreateInvItems	(hero,	ItAt_Crawlerqueen,	3);
	};
};


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_WEG (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_WEG_Condition;
	information		= GUR_1201_CorKalom_WEG_Info;
	nr				= 21;
	important		= 0;
	permanent		= 0;
	description		= "Das wird bestimmt eine finstere Suche!"; 
};

FUNC int  GUR_1201_CorKalom_WEG_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_RAT)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_WEG_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_WEG_Info_15_01"); //Das wird bestimmt eine finstere Suche!
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_02"); //Nimm diese Spruchrollen des Lichts, du wirst sie in den dunklen Stollen gut gebrauchen k�nnen.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_03"); //Die Templer in den Minen werden dir helfen.
	AI_Output			(self, other,"GUR_1201_CorKalom_WEG_Info_10_04"); //M�ge der Schl�fer dir Kraft schenken, m�ge sein Licht auf deinem Weg leuchten, deinen Geist erhellen und deinen Willen festigen!

	CreateInvItems		(self, ItArScrollLight, 5);
	B_GiveInvItems      (self, other, ItArScrollLight, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  


// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RAT (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RAT_Condition;
	information		= GUR_1201_CorKalom_RAT_Info;
	nr				= 20;
	important		= 0;
	permanent		= 0;
	description		= "Das wird bestimmt ein blutiges Abenteuer!"; 
};

FUNC int  GUR_1201_CorKalom_RAT_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1201_CorKalom_NEST)) && !( Npc_KnowsInfo (hero,GUR_1201_CorKalom_WEG)) 
	{
		return 1;
	};

};
func void  GUR_1201_CorKalom_RAT_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RAT_Info_15_01"); //Das wird bestimmt ein blutiges Abenteuer!
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_02"); //Nimm diese Heiltr�nke mit.
	AI_Output			(self, other,"GUR_1201_CorKalom_RAT_Info_10_03"); //Ich gebe sie dir nicht, weil ich unbedingt will, das du am Leben bleibst, sondern weil diese Aufgabe erf�llt werden muss.

	CreateInvItems		(self, ItFo_Potion_Health_02, 5);
	B_GiveInvItems      (self, other, ItFo_Potion_Health_02, 5);

	GUR_1201_CorKalom_WEG_ACCEPT();
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_RUN (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_RUN_Condition;
	information		= GUR_1201_CorKalom_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wo finde ich die Minecrawler?"; 
};

FUNC int  GUR_1201_CorKalom_RUN_Condition()
{	
	if ((CorKalom_BringMCQBalls == LOG_RUNNING) 
	&&	(Npc_HasItems(hero, ItAt_Crawlerqueen)< 1)) 
	{
		return 1;
	};
};

FUNC void  GUR_1201_CorKalom_RUN_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_RUN_Info_15_01"); //Wo finde ich die Minecrawler?
	AI_Output			(self, other,"GUR_1201_CorKalom_RUN_Info_10_02"); //In der Alten Mine.

	if	!EnteredOldMine
	{
		AI_Output		(other, self,"GUR_1201_CorKalom_RUN_Info_15_03"); //Wo ist die Alte Mine?
		AI_Output		(self, other,"GUR_1201_CorKalom_RUN_Info_10_04"); //Nimm diese Karte. Dort sind alle wichtigen Orte innerhalb der Barriere eingezeichnet.
		CreateInvItem	(self,ItWrWorldmap);   
		B_GiveInvItems  (self, other, ItWrWorldmap, 1);
	};
};  

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_CRAWLER (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_CRAWLER_Condition;
	information		= GUR_1201_CorKalom_CRAWLER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie k�mpfe ich am besten gegen die Minecrawler?"; 
};

FUNC int  GUR_1201_CorKalom_CRAWLER_Condition()
{
	if Npc_KnowsInfo (hero, GUR_1201_CorKalom_RUN)
	&& (CorKalom_BringMCQBalls != LOG_SUCCESS) 
	{
	return 1;
	};
};


FUNC void  GUR_1201_CorKalom_CRAWLER_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_CRAWLER_Info_15_01"); //Wie k�mpfe ich am besten gegen die Minecrawler?
	AI_Output			(self,other, "GUR_1201_CorKalom_CRAWLER_Info_10_02"); //In der Mine sind Templer. Sie jagen die Crawler wegen ihrer Zangen. Wende dich an Gor Na Vid. Er wird dir helfen.
};

// ***************************** INFOS ****************************************//
instance  GUR_1201_CorKalom_FIND (C_INFO)
{
	npc				= GUR_1201_CorKalom;
	condition		= GUR_1201_CorKalom_FIND_Condition;
	information		= GUR_1201_CorKalom_FIND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie soll ich in der Mine das Nest finden?"; 
};

FUNC int  GUR_1201_CorKalom_FIND_Condition()
{
	if ( Npc_KnowsInfo (hero, GUR_1201_CorKalom_CRAWLER))
	{
		return 1;
	};
};


FUNC void  GUR_1201_CorKalom_FIND_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_01"); //Wie soll ich in der Mine das Nest finden?
	AI_Output			(self,other, "GUR_1201_CorKalom_FIND_Info_10_02"); //Das ist der schwierige Teil der Mission. Ich kann dir weder sagen wo, noch was du suchen musst. Aber der Schl�fer wird bei dir sein.
	AI_Output			(other, self,"GUR_1201_CorKalom_FIND_Info_15_03"); //Na dann bin ich ja beruhigt.
};
// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringMCQBalls_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringMCQBalls_Success_Condition;
	information	= Info_CorKalom_BringMCQBalls_Success_Info;
	permanent	= 0;
	description	= "Ich habe Eier einer Crawler-K�nigin gefunden";
};                       

FUNC INT Info_CorKalom_BringMCQBalls_Success_Condition()
{
	if (  Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3 )
	{
		return 1;
	};
};
FUNC VOID Info_CorKalom_BringMCQBalls_Success_Info()
{	
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_01"); //Ich habe Eier einer Crawler-K�nigin gefunden
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_02"); //Ich wusste es. Meine Vision war ein Zeichen. Die Eier ihrer K�nigin enthalten also das starke Sekret!
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_03"); //Ausgezeichnet, damit kann ich ein Elixier brauen, das uns den Kontakt zum Schl�fer erm�glicht!
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_04"); //Was ist mit der Belohnung?
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_05"); //Ah, ja richtig ... Danke.
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_15_06"); //Ich meine eine HANDFESTE Belohnung.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_10_07"); //Na gut, na gut. Was willst du?
	CorKalom_BringMCQBalls = LOG_SUCCESS;
	B_GiveInvItems	(hero, self, ItAt_Crawlerqueen,3);
	Npc_RemoveInvItems(self, ItAt_Crawlerqueen,3);
	B_GiveXP			(XP_BringMCEggs);
	B_LogEntry		(CH2_MCEggs,	"Ich habe Cor Kalom 3 der Minecrawler-Eier �bergeben. Er war recht unh�flich und ich mu�te meine karge Belohnung erst penetrant einfordern!");
	Log_SetTopicStatus	(CH2_MCEggs,	LOG_SUCCESS);
	
	B_LogEntry	(CH1_GotoPsiCamp, "Ich glaube, ich wei� jetzt genug �ber die Sektensache, da� ich Mordrag etwas dar�ber erz�hlen kann.");
	B_LogEntry	(CH1_GotoPsi, "Ich glaube, ich wei� jetzt genug �ber die Sektensache. Ich sollte Raven davon erz�hlen, sobald ich wieder im alten Lager bin.");
	
	Info_ClearChoices (Info_CorKalom_BringMCQBalls_Success);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Eine Rune"	,Info_CorKalom_BringMCQBalls_Success_RUNE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Eine Waffe"	,Info_CorKalom_BringMCQBalls_Success_WAFFE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Heilmittel"	,Info_CorKalom_BringMCQBalls_Success_HEAL);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Erz"		,Info_CorKalom_BringMCQBalls_Success_ORE);
	Info_Addchoice(Info_CorKalom_BringMCQBalls_Success,"Manatrank"	,Info_CorKalom_BringMCQBalls_Success_MANA);
};
func void Info_CorKalom_BringMCQBalls_Success_RUNE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_15_01"); //Eine Rune.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_RUNE_10_02"); //M�ge diese Rune hier deinen Weg erleuchten!
	CreateInvItem		(self,ItArRuneLight);
	B_GiveInvItems      (self, hero, ItArRuneLight, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);

};	
func void Info_CorKalom_BringMCQBalls_Success_WAFFE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_15_01"); //Eine Waffe.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_WAFFE_10_02"); //M�ge diese Waffe deine Feinde niederstrecken!
	CreateInvItem		(self, ItMw_1H_Mace_War_03);
	B_GiveInvItems      (self, hero, ItMw_1H_Mace_War_03, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_HEAL()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_15_01"); //Ein Heilmittel.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_HEAL_10_02"); //M�ge dieser Trank dein Leben verl�ngern !
	CreateInvItem		(self,ItFo_Potion_Health_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_ORE ()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_15_01"); //Erz.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_ORE_10_02"); //Nimm dieses Erz als Zeichen der Dankbarkeit der gesamten Bruderschaft!
	CreateInvItems		(self,ItMinugget,100);
	B_GiveInvItems      (self, hero, ItMinugget, 100);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	
func void Info_CorKalom_BringMCQBalls_Success_MANA()
{
	AI_Output			(other, self,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_15_01"); //Mana.
	AI_Output			(self, other,"Mis_2_PSI_Kalom_BringMCQEggs_Success_MANA_10_02"); //M�ge dieser Trank die magische Energie in dir st�rken!
	CreateInvItem		(self,ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems      (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(Info_CorKalom_BringMCQBalls_Success);
};	

// **************************************************************************
// 				MISSION: Bring Book
// **************************************************************************
INSTANCE Info_CorKalom_BringBook (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Condition;
	information	= Info_CorKalom_BringBook_Info;
	permanent	= 0;
	description = "Kann nun die Anrufung des Schl�fers beginnen?";
};

func INT Info_CorKalom_BringBook_Condition()
{
	if ( CorKalom_BringMCQBalls == LOG_SUCCESS )
	{
		return 1;
	};	
};
func VOID Info_CorKalom_BringBook_Info()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_01"); //Kann nun die Anrufung des Schl�fers beginnen?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_02"); //Nein! Es ist mir noch nicht gelungen, eine Methode zu entwickeln, den Fokus aufzuladen.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_03"); //Uns fehlt das Alte Wissen �ber diese Artefakte.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Info_15_04"); //Hei�t das, es war vergebens, die Eier zu holen?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_05"); //Nein, h�r mir zu. Es gibt einen Almanach, in dem das steht, was wir wissen m�ssen.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_06"); //Wir haben dieses Buch dem Feuermagier Corristo aus dem Alten Lager abgekauft.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_07"); //Allerdings ist es beim Transport vom Alten Lager hierher geraubt worden.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_08"); //Ich hatte Talas, einen Novizen, damit beauftragt, das Buch zu mir zu bringen, aber er wurde �berfallen.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_09"); //Er hat mich entt�uscht, aber ich habe ihm noch eine Chance gegeben. Er hat nun den Auftrag, den gestohlenen Almanach zur�ckzuholen.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Info_10_10"); //Sprich mit ihm. Er wird alle Hilfe brauchen, die er bekommen kann.
	
	CorKalom_BringBook = LOG_RUNNING;
	Log_CreateTopic		(CH2_Book,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Book,	LOG_RUNNING);
	B_LogEntry		(CH2_Book,	"Cor Kalom ben�tigt einen letzten Gegenstand f�r die gro�e Anrufung des Schl�fers. Es handelt sich um ein Buch �ber die Benutzung der Fokus-Steine. Der Novize Talas war wohl so ungeschickt, sich den Almanach von Goblins rauben zu lassen. Er sucht derzeit auf dem Tempelvorplatz nach Hilfe bei der Wiederbeschaffung des Buches");

	Info_ClearChoices (Info_CorKalom_BringBook);
	
	Info_Addchoice(Info_CorKalom_BringBook,DIALOG_BACK						,Info_CorKalom_BringBook_BACK);
	Info_Addchoice(Info_CorKalom_BringBook,"Was ist f�r mich drin?"			,Info_CorKalom_BringBook_EARN);
	Info_Addchoice(Info_CorKalom_BringBook,"Wer hat den Almanach gestohlen?",Info_CorKalom_BringBook_WHO);
	Info_Addchoice(Info_CorKalom_BringBook,"Wo finde ich Talas?"			,Info_CorKalom_BringBook_WHERE);
};
func void Info_CorKalom_BringBook_BACK ()
{
	Info_ClearChoices (Info_CorKalom_BringBook);
};

func void Info_CorKalom_BringBook_WHERE ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Where_15_01"); //Wo finde ich Talas?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Where_10_02"); //Er versucht auf dem Vorplatz des Tempelbergs Leute zu finden, die ihm helfen.
};
func void Info_CorKalom_BringBook_WHO ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Who_15_01"); //Wer hat den Almanach gestohlen?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Who_10_02"); //Talas hat berichtet, dass er von schwarzen Goblins �berfallen wurde. Merkw�rdig, aber nicht unm�glich.
};
func void Info_CorKalom_BringBook_EARN ()
{
	AI_Output			(other, self,"Info_CorKalom_BringBook_Earn_15_01"); //Was ist f�r mich drin?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Earn_10_02"); //Habe ich nicht schon mehr als einmal meine Gro�z�gigkeit bewiesen? Du wirst angemessen entlohnt werden.
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_CorKalom_BringBook_Success (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	condition	= Info_CorKalom_BringBook_Success_Condition;
	information	= Info_CorKalom_BringBook_Success_Info;
	permanent	= 0;
	description	= "Ich hab' das Buch gefunden";
};                       

FUNC INT Info_CorKalom_BringBook_Success_Condition()
{	
	if (	Npc_HasItems (Hero,ItWrFokusbuch)
	&&		(CorKalom_BringBook==LOG_RUNNING)	)
	{
		return 1 ; 
	};
};
FUNC VOID Info_CorKalom_BringBook_Success_Info()
{	
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_01"); //Ich hab' das Buch gefunden
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_02"); //Gute Arbeit. Du hast alles besorgt, was wir brauchen.
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_03"); //Ich werde jetzt die letzten Vorbereitungen treffen.
	AI_Output			(other, self,"Info_CorKalom_BringBook_Success_15_04"); //Wo wird die Anrufung stattfinden?
	AI_Output			(self, other,"Info_CorKalom_BringBook_Success_10_05"); //Komme bei Nacht zum Tempelvorplatz. Dort werden wir uns versammeln, um den allm�chtigen Schl�fer zu rufen.

	B_GiveInvItems	    (hero, self, ItWrFokusbuch, 1);
	Npc_RemoveInvItem   (self,ItWrFokusbuch);
	B_GiveXP			(XP_BringBook);
	CorKalom_BringBook = LOG_SUCCESS;

	B_LogEntry		(CH2_Book,	"Nachdem ich den Almanach bei Cor Kalom abgeliefert habe, bereitet sich die Bruderschaft nun auf die Gro�e Anrufung des Schl�fers vor. Sie soll bei Nacht auf dem Tempelvorplatz stattfinden.");
	Log_SetTopicStatus	(CH2_Book,	LOG_SUCCESS);

	//-------- Gurus und Novizen auf dem Tempelvorplatz versammeln --------
	AI_StopProcessInfos	(self);

	B_Story_PrepareRitual();
};


// ----------------------------BELOHNUNG ---------------------------------------
instance Info_CorKalom_Belohnung (C_INFO)
{
	npc			= GUR_1201_CorKalom;
	nr			= 1;
	condition	= Info_CorKalom_Belohnung_Condition;
	information	= Info_CorKalom_Belohnung_Info;
	permanent	= 0;
	description = "Wie sieht es mit einer Belohnung aus?";
};                       

FUNC INT Info_CorKalom_Belohnung_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_CorKalom_BringBook_Success) )
	{
		return 1;
	};
};

FUNC VOID Info_CorKalom_Belohnung_Info()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_15_00");//Wie sieht es mit einer Belohnung aus?
	AI_Output			(self, other,"Info_CorKalom_Belohnung_10_01");//Was willst du haben?
	
	Info_ClearChoices (Info_CorKalom_Belohnung);
	Info_Addchoice(Info_CorKalom_Belohnung,"Eine Spruchrolle"	,Info_CorKalom_Belohnung_SCROLL);
	Info_Addchoice(Info_CorKalom_Belohnung,"Erz"				,Info_CorKalom_Belohnung_ORE);
	Info_Addchoice(Info_CorKalom_Belohnung,"Manatrank"			,Info_CorKalom_Belohnung_MANA);

};
func void Info_CorKalom_Belohnung_SCROLL()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_SCROLL_15_00");//Gib mir die Spruchrollen.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_SCROLL_10_01");//Setze diese Zauber hier mit Bedacht ein!
	CreateInvItems (self,ItArScrollSleep,3);
	B_GiveInvItems  (self,hero,ItArScrollSleep,3);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_ORE ()
{
	AI_Output			(other, self,"Info_CorKalom_Belohnung_ORE_15_00");//Gib mir Erz.
	AI_Output			(self, other,"Info_CorKalom_Belohnung_ORE_10_01");//Dies soll deine Gier nach Erz zufrieden stellen!
	CreateInvItems  (self,ItMinugget,300);
	B_GiveInvItems  (self,hero,ItMinugget,300);
	Info_ClearChoices (Info_CorKalom_Belohnung);
};
func void Info_CorKalom_Belohnung_MANA()
{
	AI_Output						(other, self,"Info_CorKalom_Belohnung_MANA_15_00");//Manatr�nke.
	AI_Output						(self, other,"Info_CorKalom_Belohnung_MANA_10_01");//M�gen diese Tr�nke dir Kraft schenken!
	CreateInvItems 		(self,ItFo_Potion_Mana_02,5);
	B_GiveInvItems      (self,hero,ItFo_Potion_Mana_02,5);
	Info_ClearChoices	(Info_CorKalom_Belohnung);
};

// ************************ EXIT **************************************************************************

instance  GUR_1201_CorKalom_Exit (C_INFO)
{
	npc			=  GUR_1201_CorKalom;
	nr			=  999;
	condition	=  GUR_1201_CorKalom_Exit_Condition;
	information	=  GUR_1201_CorKalom_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  GUR_1201_CorKalom_Exit_Condition()
{
	return 1;
};

FUNC VOID  GUR_1201_CorKalom_Exit_Info()
{
	AI_Output			(other, self,"GUR_1201_CorKalom_Exit_15_01"); //Wir sehen uns.
	AI_Output			(self, other,"GUR_1201_CorKalom_Exit_10_02"); //M�ge der Schl�fer dich erleuchten.
	
	AI_StopProcessInfos	( self );
};
// *******************************************************************************************************



