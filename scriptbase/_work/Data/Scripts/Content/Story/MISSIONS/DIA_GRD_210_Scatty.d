// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "Was machst du hier?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //Was machst du hier?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Ich k�mmere mich um die Arena. Organisiere die Wetten, heuere neue K�mpfer an und so weiter ...
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Ich will mich dem Lager anschlie�en. Kannst du mir dabei helfen?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Ich will mich dem Lager anschlie�en. Kannst du mir dabei helfen?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Wenn du es schaffst, mich zu beeindrucken - vielleicht.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Einige der besten K�mpfer aller drei Lager kommen hier her um sich zu messen.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Fordere einen von ihnen heraus und k�mpfe gegen ihn. Je nachdem, wie gut du dich schl�gst, wird mein Urteil �ber dich ausfallen.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC, "Scatty der Arenameister wird von mir beeindruckt sein, wenn ich einen der K�mpfer fordere.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "Ich habe gegen Kirgo gek�mpft!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //Ich habe gegen Kirgo gek�mpft!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //Und du hast dich besiegen lassen!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //Du erwartest hoffentlich nicht, dass ich durch dein Versagen beeindruckt bin ...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC, "Meinem Niederlage gegen Kirgo hat Scatty nicht sehr beeindruckt.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //Und du hast ihn geschafft! Nicht schlecht f�r einen Anf�nger wie dich! Ich bin beeindruckt!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC, "Scatty ist beeindruckt von meinem Kampf gegen Kirgo.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "Ich bin gegen Kharim angetreten!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //Ich bin gegen Kharim angetreten!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //Er hat dir ganz sch�n in den Arsch getreten.
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //Trotzdem hast du dir den richtigen Gegner gew�hlt! Ich kann diese Bastarde aus dem Neuen Lager nicht ausstehen.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Scheint dir ja genauso zu gehen - so jemanden k�nnen wir hier brauchen!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC, "Ich bin Kharim unterlegen! Mein Mut hat Scatty gefallen, aber meine Kampff�higkeiten nicht.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //Und du hast ihn umgehauen! Ich muss schon sagen, nicht schlecht. Er war immer einer der besten K�mpfer hier.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //Du hast mich schwer beeindruckt!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC, "Ich habe es Kharim gezeigt! Scatty hat gestaunt.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager K�mpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "Wieso lasst ihr die Leute aus den anderen Lagern hier k�mpfen?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Ich dachte, das Alte und das Neue Lager verstehen sich nicht besonders gut - wieso lasst ihr ihre Leute hier k�mpfen?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //Ganz einfach: Wenn es hier einmal die Woche einen Kampf gibt, sehen es die Buddler am liebsten, wenn einer der Banditen aus dem Neuen Lager was aufs Maul bekommt.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Wenn einer von denen k�mpft, wird mehr gewettet - das ist gut!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Ich pers�nlich kann die Schweine aus dem Neuen Lager ja nicht ausstehen - aber Gesch�ft ist nun mal Gesch�ft ...
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Ich will wetten!";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Ich will wetten.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Aber im Moment findet kein Kampf statt.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //Der n�chste Kampf ist in ein paar Tagen - er wird vorher angek�ndigt.
	
};

// **************************************************
// 					Will K�mpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "Ich will in der Arena k�mpfen!";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //Ich will in der Arena k�mpfen!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //Bevor du nicht einem der Lager angeh�rst, werde ich dich nicht k�mpfen lassen!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //Einen unabh�ngigen K�mpfer will hier keiner sehen!
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "Trainierst du auch K�mpfer?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC, "Scatty der Arenameister kann mich im Kampf mit EINH�NDERN ausbilden.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //Trainierst du auch K�mpfer?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Schon, aber nicht zum Spa�. Wenn ich dich trainieren soll, musst du daf�r zahlen.


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Ich will besser mit Einhandwaffen umgehen k�nnen.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //Gute Entscheidung! Um deine Technik zu verbessern, musst du erst einmal lernen, deine Waffe richtig zu halten.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Anf�nger neigen dazu, Einhandwaffen mit beiden H�nden zu halten. Mit so was f�ngst du am besten gar nicht erst an, das behindert dich nur.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Halt die Waffe mit einer Hand, Klinge nach oben, und dann immer sch�n schwingen lassen.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Du musst lernen, den Schwung deiner Waffe mit deinen Bewegungen in Einklang zu bringen, dann kannst du schneller zuschlagen.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Wenn du dich an meine Anweisungen h�ltst, wirst du in Zukunft eleganter und vor allem schneller k�mpfen.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ach und noch was: Manche Treffer richten mehr Schaden an als andere! Als Anf�nger hast du nur eine geringe Chance, solche kritischen Treffer zu landen.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Aber je weiter du fortschreitest, desto besser wird diese F�higkeit.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //Du hast nicht genug Erz!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Bring mir bei, noch besser mit Einhandwaffen umzugehen.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //Na gut, die Grundkenntnisse hast du ja schon. Wenn du die Waffe gesenkt h�ltst, dann kannst du direkt mehr Wucht in deinen ersten Schlag legen.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Nutze den Schwung, wei�t du noch? Gut, der n�chste Schritt ist, du musst deinen K�rper mehr einsetzen. Wenn du zweimal geschlagen hast, drehe dich um die eigene Achse, damit �berraschst du den Gegner und bist in einer optimalen Position.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Dann ziehst du deine Klinge noch einmal quer von rechts nach links.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //Und wieder von vorne. Vergiss nicht, �bung macht den Meister. Also, geh jetzt und werde ein wahrer Meister des einh�ndigen Kampfes.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //Komm wieder, wenn du genug Erz hast!
	};
};
