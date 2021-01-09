// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Du bist aus dem Lager der Sekte, richtig?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Du bist aus dem Lager der Sekte, richtig?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Wir nennen es die Bruderschaft.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Ich bin Baal Kagan. Der Schläfer sei mit dir.
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Was machst du hier?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Was machst du hier?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Ursprünglich bin ich hierhin entsandt worden, um für unsere Gemeinschaft zu werben.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Aber diese Barbaren wollen nichts wissen von geistiger Erleuchtung. So beschränke ich mich auf den Verkauf von Sumpfkraut.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Dies wiederum wird hier sehr gerne gesehen. Zu gerne. Ich kann allein kaum alle meine Kunden beliefern.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,	"Baal Kagan verkauft Krautstengel an die Banditen und Söldner im Neuen Lager.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Zeig mir deine Waren.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Zeig mir deine Waren.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Wie du wünschst.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "Warum schicken sie nicht einen weiteren Mann?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Warum schicken sie nicht einen weiteren Mann?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Baal Isidro sollte mich unterstützen, aber er sitzt den ganzen Tag in der Kneipe auf dem See und tauscht sein Kraut gegen Reisschnaps ein.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Er ist dem Schnaps verfallen. Ich fürchte, von ihm ist keine Hilfe zu erwarten.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,	"Baal Isidro sitzt den ganzen Tag in der Kneipe auf dem See und säuft.");	
	};
};

// ************************************************************
// 					Ich könnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Ich könnte dir helfen, dein Kraut unter die Leute zu bringen.";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Ich könnte dir helfen, dein Kraut unter die Leute zu bringen.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Eine so große Menge Kraut kann ich dir nur anvertrauen, wenn du ein Mitglied der Bruderschaft bist.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Aber du könntest mir helfen, Geschenke zu verteilen.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Es sind noch nicht alle hier auf den Geschmack gekommen. Wenn sie erst einmal unser Kraut gekostet haben, werden sie mehr verlangen und ich kann mehr verkaufen.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Ich denke, du schaffst es JETZT schon kaum, deine Aufgabe zu erfüllen.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Für Baal Isidro wird bald gesorgt. Ich habe schon eine Nachricht an Cor Kalom geschickt.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "Wenn ich das Kraut für dich verteile - was ist für mich drin?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Wenn ich das Kraut für dich verteile - was ist für mich drin?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Ich kann dich auf viele Arten entlohnen.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Du kannst von mir magische Spruchrollen erhalten, die mit mächtiger Magie des Schläfers belegt sind.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Ich kann dir aber auch helfen, leichter in unsere Gemeinschaft aufgenommen zu werden, wenn du das wünschst. Ich habe sehr gute Kontakte zu Cor Kalom und Baal Tyon.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Beide stehen Y'Berion, unserem Meister, sehr nahe.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Ich kann dich aber auch mit schnödem Erz bezahlen, wenn das dein Wunsch ist. 100 Brocken sollten für deine Mühe genügen.
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "Okay, gib her das Kraut. An wen soll ich es verteilen?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Okay, gib her das Kraut. An wen soll ich es verteilen?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Du findest sicher leicht Abnehmer. Rede mit den Leuten. Aber gib jedem nur EINEN Stengel.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //Noch was: Wenn du dir das Kraut abnehmen lässt oder es selber rauchst, gilt unsere Abmachung nicht mehr.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Sicher.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints, "Der Novize Baal Kagan hat mir 10 Stengel Sumpfkraut Grüner Novize gegeben, die ich im Neuen Lager verteilen soll.");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "Ich habe das Kraut verteilt";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Ich habe das Kraut verteilt.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //Die ersten neuen Kunden waren schon bei mir. Du hast gute Arbeit geleistet.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Wie soll deine Belohnung aussehen.
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Ich nehme das Erz."	,DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS, "Hilf mir, in der Bruderschaft aufgenommen zu werden."	,DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS, "Die Spruchrollen interessieren mich - was sind das für Sprüche?"	,DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints, "Baal Kagan hat neue Kunden und ich meine Belohnung.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Ich habe noch keinen neuen Kunden hier gesehen. Verteil mehr.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Die Spruchrollen interessieren mich - was sind das für Sprüche?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Windfaust, Charme, Telekinese, Pyrokinese und Schlaf. Von diesen Sprüchen darfst du drei wählen.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Ich nehme die drei Spruchrollen."	,DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Hilf mir, in der Bruderschaft aufgenommen zu werden.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Deine Bitte ist bescheiden. Ich werde dir helfen, hör gut zu. Baal Tyon ist einer der niederen Gurus - so wie ich.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion hat ihn zu einem seiner Berater gemacht. Das ist ihm nicht bekommen.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Er hält sich jetzt für so wichtig, dass er mit niemanden außer seinen Schülern mehr redet.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Wenn du ihm das hier gibst, wird sich seine Zunge lösen.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"Baal Kagan hat mir einen speziell präparierten TRAUMRUF für Baal Tyon gegeben. Es wird mir helfen in die Bruderschaft der Sekte aufgenommen zu werden.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Ich nehme die 100 Erz.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Wie du willst. Hier.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Ich nehme die Spruchrollen.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Eine gute Entscheidung. Wähle drei aus.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Windfaust"	,DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Telekinese"	,DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Pyrokinese"	,DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Schlaf."		,DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Charme"		,DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Das waren drei. Verwende sie weise.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




