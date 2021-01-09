// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "Du siehst nicht so aus, als wenn du jeden in die Burg lassen würdest.";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Du siehst nicht so aus, als wenn du jeden in die Burg lassen würdest.
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Nur Gomez' Leuten ist es erlaubt, die Burg zu betreten.
};

// ************************************************************
// 					Ich will für Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Ich will für Gomez arbeiten.";
};                       

FUNC INT Info_Thorus_WorkForGomez_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo (hero,Info_Thorus_EnterCastle) )
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_WorkForGomez_Info()
{	
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Ich will für Gomez arbeiten.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Ach? Und wieso, glaubst du, ist Gomez daran interessiert, dass du für ihn arbeitest?
};

// ************************************************************
// 						Diego schickt mich
// ************************************************************

INSTANCE Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_DiegoSentMe_Condition;
	information	= Info_Thorus_DiegoSentMe_Info;
	permanent	= 0;
	description = "Diego sagt, DU entscheidest, wer Gomez interessiert.";
};                       

FUNC INT Info_Thorus_DiegoSentMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_DiegoSentMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego sagt, DU entscheidest, wer Gomez interessiert.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Hm ... Wenn Diego denkt, du taugst was, kann ER sich auch mit dir rumschlagen.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Ich werde dir jetzt erklären, wie das läuft: Diego wird dich auf die Probe stellen. Wenn ER denkt, dass du gut genug bist, werde ich dich zu Gomez in die Burg lassen.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //Was dann passiert, liegt an dir. Kapiert?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Ich werde mit Diego reden.
	
	B_LogEntry(CH1_JoinOC,"Thorus sagte mir, ich soll mit Diego reden, wenn ich ins Alte Lager aufgenommen werden will. Diego wird mich auf die Probe stellen");
};

// ************************************************************
// 						Try Me
// ************************************************************

INSTANCE Info_Thorus_TryMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMe_Condition;
	information	= Info_Thorus_TryMe_Info;
	permanent	= 0;
	description = "Warum stellst du mich nicht auf die Probe?";
};                       

FUNC INT Info_Thorus_TryMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Warum stellst du mich nicht auf die Probe?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //So läuft das hier nicht, Kleiner! Jeder Neue, der sich hier beweisen will, braucht einen Fürsprecher.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Der Fürsprecher muss einer von Gomez' Leuten sein. Er wird dich auf die Probe stellen.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //Und wenn du Mist baust, ist er für dich verantwortlich - so läuft das hier.
};

// ************************************************************
// 						TryMeAgain
// ************************************************************

INSTANCE Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeAgain_Condition;
	information	= Info_Thorus_TryMeAgain_Info;
	permanent	= 0;
	description = "Es muss doch eine Aufgabe geben, die du erledigt haben willst.";
};                       

FUNC INT Info_Thorus_TryMeAgain_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeAgain_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Es muss doch eine Aufgabe geben, die du erledigt haben willst.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Nein. Die Dinge, um die wir Gardisten uns kümmern, sind 'ne Nummer zu groß für dich, Kleiner.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Halt dich lieber an die Prüfungen, die dein Fürsprecher dir stellen wird.
};

// ************************************************************
// 						TryMeICanDoIt
// ************************************************************

INSTANCE Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeICanDoIt_Condition;
	information	= Info_Thorus_TryMeICanDoIt_Info;
	permanent	= 0;
	description = "Ich kann alles schaffen, was du mir aufträgst.";
};                       

FUNC INT Info_Thorus_TryMeICanDoIt_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeAgain) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeICanDoIt_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Ich kann alles schaffen, was du mir aufträgst.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //So? Du willst also unbedingt versagen ... Es gibt eine Sache, die nur von jemandem erledigt werden kann, der keiner von Gomez' Leuten ist.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Aber ich warne dich. Wenn du das Ding vermasselst, bekommst du mächtigen Ärger.
};

// **************************************************************************
// 							MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
// **************************************************************************
// 							MISSION MORDRAG KO VERGABE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Offer (C_INFO) //E6
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Offer_Condition;
	information	= Info_Thorus_MordragKo_Offer_Info;
	permanent	= 0;
	description = "Ich bin bereit für deine Aufgabe.";
};                       

FUNC INT Info_Thorus_MordragKo_Offer_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeICanDoIt) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Offer_Info()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Ich bin bereit für deine Aufgabe.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //Was ich dir jetzt sage, bleibt unter uns, und niemand außer uns beiden wird je von dieser Sache erfahren, verstanden?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Ja.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Wir haben Ärger mit einem Typen aus dem Neuen Lager. Mordrag ist sein Name. Er hat Eigentum der Erzbarone gestohlen.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Es gibt viele Banditen im Neuen Lager, auf die das zutrifft, aber dieser Junge kommt in UNSER Lager und verkauft UNSERE gestohlene Ware an UNSERE Jungs zurück!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //Damit ist er eindeutig zu weit gegangen. Aber er weiß ganz genau, dass ich nichts machen kann.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Warum?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Weil er unter dem Schutz der Magier steht.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer, "Ich kümmere mich drum." 							,Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Soll ich den Kerl umbringen?" 						,Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Wo finde ich Mordrag?" 								,Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Wieso beschützen die Magier diesen Mordrag?"		,Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Klingt eher als wären die Magier dein Problem..."	,Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus hat mich damit beauftragt, einen Banditen namens Mordrag aus dem Lager zu vertreiben. Wie ich das anstelle hat er mir überlassen. Außerdem darf niemand erfahren, dass Thorus dahintersteckt.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Ich kümmere mich darum.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Soll ich den Kerl umbringen?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Du sollst dafür sorgen, dass ich ihn hier nie wieder sehen muss. Wie du das anstellst, ist deine Sache.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Wo finde ich Mordrag?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Du findest ihn am Südtor, auf der anderen Seite der Burg, direkt hinter dem Eingang. Weiter traut sich dieser Halunke nicht ins Lager.
	B_LogEntry(CH1_MordragKO, "Mordrag hält sich am Südtor auf der Rückseite der Burg auf.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Wieso beschützen die Magier diesen Mordrag?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Weil er als Bote für sie arbeitet. Unsere Magier stehen mit den Magiern des Neuen Lagers in Kontakt. Sie schicken regelmäßig Boten hin und her.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Wenn ich einen ihrer Boten aus dem Lager werfe oder umlegen lasse, könnten sie SEHR unangenehm werden.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //Was ist mit MIR? Was glaubst du machen die Magier mit MIR?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Du bist neu. Dir passiert gar nichts. ICH dagegen bin für das verantwortlich, was meine Jungs tun. Deswegen ist es ja so wichtig, dass du die Klappe hältst.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Klingt eher, als wären die Magier dein Problem ...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Ja, aber eines, das sich schwer lösen lässt. Vor ein paar Jahren hat mal einer der Schatten versucht, den Obersten Magier des Feuers im Schlaf zu erdolchen.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Er wurde später im Außenring gefunden - an VERSCHIEDENEN Stellen im Außenring.
};

// **************************************************************************
// 									ANALYZE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Analyze (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Analyze_Condition;
	information	= Info_Thorus_MordragKo_Analyze_Info;
	permanent	= 1;
	description = "Wegen Mordrag...";
};                       

FUNC INT Info_Thorus_MordragKo_Analyze_Condition()
{	
	if ( (Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices	(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze, "Ich kümmere mich drum." 	,Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze, "Wo finde ich Mordrag?" 	,Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze, "Mordrag wird nie wieder irgendwen bestehlen!" ,Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze, "Der Typ wird sich hier nie wieder blicken lassen!" ,Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Ich kümmere mich drum.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag wird nie wieder irgendwen bestehlen!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Du hast ihn geschafft? Nicht schlecht, Kleiner.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO, "Thorus war beeindruckt, dass ich Mordrag beseitigt habe. Ein klarer Pluspunkt für mich.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Der Typ wird sich hier nie wieder blicken lassen!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Lieber wär' mir gewesen, du hättest ihn umgelegt.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO, "Thorus ist zufrieden, dass Mordrag nicht mehr hier im Lager ist.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_MordragFailed (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragFailed_Condition;
	information	= Info_Thorus_MordragFailed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_MordragFailed_Condition()
{	
	if (MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragFailed_Info()
{
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Du Versager! Ich sagte doch: NENN MEINEN NAMEN NICHT!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Du hast es vermasselt! Die Sache kannst du vergessen! Versuche ja nicht, noch weiter daran rumzupfuschen!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO, "Dass ich Mordrag seinen Namen gesagt habe, hat Thorus gar nicht gefallen. Bei ihm brauche ich mich erstmal nicht mehr sehen lassen.");
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Bribe Thorus					
// ************************************************************

INSTANCE Info_Thorus_BribeGuard (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_BribeGuard_Condition;
	information	= Info_Thorus_BribeGuard_Info;
	permanent	= 0;
	description = "Würdest du mich für eine entsprechende Menge Erz in die Burg lassen?";
};                       

FUNC INT Info_Thorus_BribeGuard_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BribeGuard_Info()
{
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Würdest du mich für eine entsprechende Menge Erz in die Burg lassen?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Für eine entsprechende Menge ... 
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Wie viel?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //Nun - es müsste 'ne Weile dauern, das Erz zu zählen. So lange würden die Jungs am Tor und ich dann wegsehen.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Sag schon, wie viel?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //1000 Brocken dürften genügen.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 Brocken?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Nun, du könntest dich Gomez' Leuten anschließen, dann kommst du auch in die Burg - ganz umsonst.
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "Ich hab' die 1000 Brocken Erz. Lass mich in die Burg!";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Ich hab' die 1000 Brocken Erz. Lass mich in die Burg!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //Gut, wegen mir. Du kommst in die Burg, aber mach keine Dummheiten, klar!
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Verarsch mich nicht, Kleiner, du hast keine 1000 Brocken Erz!
	};
};
		
// ************************************************************
// 					Brief für Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 1;
	description = "Ich muss in die Burg! Ich habe einen Brief für den obersten Feuermagier.";
};                       

FUNC INT Info_Thorus_LetterForMages_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Thorus_EnterCastle)
	&&	(Npc_HasItems (hero, ItWr_Fire_Letter_01) || Npc_HasItems (hero, ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_LetterForMages_Info()
{
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Ich muss in die Burg! Ich habe einen Brief für den obersten Feuermagier.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //Und ich soll dich jetzt in die Burg spazieren lassen, damit du ihn abgeben und deine Belohnung kassieren kannst?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Ja.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Na gut, zeig her den Brief.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Den geb' ich nicht aus der Hand - vergiss es!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //Schon vergessen.
};

// ************************************************************
// 					Bereit für Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Diego sagt, ich bin bereit für Gomez!";
};                       

FUNC INT Info_Thorus_ReadyForGomez_Condition()
{	
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_ReadyForGomez_Info()
{
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego sagt, ich bin bereit für Gomez!
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //Das entscheide immer noch ich!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //Und wie lautet deine Entscheidung?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm ...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Du hast wohl die meisten Sachen gut gemacht, so viel muss man sagen.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Gut! Du kannst zu Gomez gehen. Er allein bestimmt, wer aufgenommen wird und wer nicht.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Ab jetzt bist du auf dich allein gestellt, Kleiner.
				
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Thorus_Krautbote (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_Krautbote_Condition;
	information	= Info_Thorus_Krautbote_Info;
	permanent	= 0;
	description = "Ich habe ne Ladung Kraut von Cor Kalom für Gomez.";
};                       

FUNC INT Info_Thorus_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Krautbote_Info()
{
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Ich habe 'ne Ladung Kraut von Cor Kalom für Gomez.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Zeig her!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmmm ...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //Gut! Du kannst durch. Geh direkt zum Haus der Erzbarone. Bartholo wird dich empfangen.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Du hast zu wenig Kraut für einen Boten! Ich will für dich nicht hoffen, dass du das Zeug verscherbelt hast! Komm wieder, wenn du die richtige Menge dabei hast!
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

INSTANCE Info_Thorus_KdWSiegel (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_KdWSiegel_Condition;
	information	= Info_Thorus_KdWSiegel_Info;
	permanent	= 1;
	description = "Ich bin Bote der Wassermagier. Ich muss in die Burg!";
};                       

FUNC INT Info_Thorus_KdWSiegel_Condition()
{	
	if 	(( (Npc_KnowsInfo(hero, Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1) )
		&& (thorus_Amulettgezeigt == FALSE) 
		)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_KdWSiegel_Info()
{
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Ich bin Bote der Wassermagier. Ich muss in die Burg!
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Du hast das Amulett eines Boten bei dir. Damit kommst du an den Wachen vorbei.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Mit den Magiern will ich nichts zu tun haben. Also belästige mich nicht weiter mit der Sache!
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //Natürlich bist du das. Und dein Amulett hast du verlegt, was?
	};
};

// ************************************************************
// 					Habs GESCHAFFT
// ************************************************************

INSTANCE Info_Thorus_SttGeschafft (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_SttGeschafft_Condition;
	information	= Info_Thorus_SttGeschafft_Info;
	permanent	= 0;
	description = "Ich hab's geschafft. Jetzt bin ich Mitglied des Lagers!";
};                       

FUNC INT Info_Thorus_SttGeschafft_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_SttGeschafft_Info()
{
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Ich hab's geschafft. Jetzt bin ich Mitglied des Lagers!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Herzlichen Glückwunsch, Kleiner! Ab jetzt hältst du dich am besten an Diego.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Zu Gomez oder Raven solltest du nur noch gehen, wenn du was WIRKLICH Wichtiges zu sagen hast.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2 	   ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "Wie sieht's bei dir aus?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if ( (Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Wie sieht's bei dir aus?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Wir haben wenig Ärger mit den Typen aus dem Neuen Lager. Mir machen eher die Sektenspinner Sorgen.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance  GRD_200_Thorus_GARDIST (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_GARDIST_Condition;
	information		= GRD_200_Thorus_GARDIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Du wolltest mir etwas mitteilen?"; 
};

FUNC int  GRD_200_Thorus_GARDIST_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
	&& (Npc_GetTrueGuild (hero ) == GIL_STT)
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Du wolltest mir etwas mitteilen?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Ja. Durch das, was du in der Mine getan hast, hast du nicht nur deine Tapferkeit, sondern auch deine Stärke und deine Fähigkeit im Kampf unter Beweis gestellt.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Ich bin bereit, dich in die Reihen der Gardisten aufzunehmen.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Aber du bist noch nicht bereit, Gardist zu werden. Sammle erst noch mehr Erfahrung, dann werde ich dich aufnehmen.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Ich gebe dir eine Chance. Wie sieht's aus?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_AUFNAHME (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_AUFNAHME_Condition;
	information		= GRD_200_Thorus_AUFNAHME_Info;
	permanent		= 0;
	description		= "Ich will Gardist werden"; 
};

FUNC int  GRD_200_Thorus_AUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10)	
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_AUFNAHME_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Ich will Gardist werden.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Das freut mich. Doch zunächst: Es gibt da ein paar Dinge, die ich jedem Neuen sage. Pass gut auf, denn ich sage sie nur einmal.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Bisher hast du versucht, auf eigene Faust zu überleben. Damit ist nun Schluss. Meine Jungs halten zusammen. Wir Gardisten beschützen die Erzbarone, das Erz, das Lager und die Mine.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Die Buddler schürfen das Erz, aber wir sorgen dafür, dass sie nicht von den Crawlern gefressen werden. Die Barone verhandeln mit dem König, aber wir decken ihren Arsch dabei.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Wir stehen Tag und Nacht in der Mine. Wir stehen Tag und Nacht an den Toren des Lagers und passen auf, dass alle ruhig schlafen können.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Als wir hier angefangen haben, da waren wir Freiwild, aber wir haben uns behauptet. Wir alle haben hart dafür gearbeitet, uns dieses Leben aufzubauen.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Ich erwarte nur eins von meinen Jungs: dass sie zusammenhalten. Denn nur wenn wir zusammen stehen, dann werden wir das alles behalten können.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //Dann überleben wir.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Alles andere wirst du schon mit der Zeit rauskriegen. Halte dich bereit und hilf da, wo gerade Not am Mann ist oder irgendwas zu erledigen ist.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Du kannst dir bei Stone deine Rüstung und dein Schwert holen.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Du findest Stone im inneren Ring, in der Schmiede.

	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild (hero,GIL_GRD);
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_NOCHWAS_Condition;
	information		= GRD_200_Thorus_NOCHWAS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_200_Thorus_NOCHWAS_Condition()
{	
	if (Npc_KnowsInfo     (hero, GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild  (hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void  GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Ach, noch eine Sache ...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Willkommen bei der Garde.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,	"Heute hat mich Thorus in die Reihen der Gardisten aufgenommen. Ich kann mir bei dem Schmied Stone in der Burg meine neue Rüstung abholen.");
	
};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_WANNABEMAGE (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_WANNABEMAGE_Condition;
	information		= GRD_200_Thorus_WANNABEMAGE_Info;
	permanent		= 0;
	description		= "Ich interessiere mich für den Weg der Magie!"; 
};
//
FUNC int  GRD_200_Thorus_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_WANNABEMAGE_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Ich interessiere mich für den Weg der Magie.
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Nun, dann solltest du vielleicht mit Corristo sprechen. Er hat auch Milten unterrichtet. Ich bin sicher, dem steht nichts im Wege.

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc		(KDF_402_Corristo);
	Npc_ExchangeRoutine			(Corristo,"WAITFORSC");
	AI_ContinueRoutine			(Corristo);
};  
//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE GRD_200_Thorus_Teach(C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 10;
	condition	= GRD_200_Thorus_Teach_Condition;
	information	= GRD_200_Thorus_Teach_Info;
	permanent	= 1;
	description = "Kannst du mich trainieren?";
};                       

FUNC INT GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Kannst du mich trainieren?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Ich kann dir zeigen, wie du deine Geschicklichkeit und deine Stärke verbesserst.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Bei Thorus kann ich meine STÄRKE und mein GESCHICK verbessern");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	
	Info_ClearChoices	(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND1 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND1_Condition;
	information		= GRD_200_Thorus_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND1_Info()
{	
	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Thorus kann mir den Kampf mit ZWEIHÄNDERN beibringen, wenn ich im EINHÄNDIGEN Kampf gemeistert bin.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Ich möchte den Umgang mit dem Zweihänder lernen.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Nun, dann gehen wir zuerst die Grundbegriffe durch.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Halte das Schwert waagerecht. Um den Gegner mit einer großen Waffe anzugreifen, brauchst du viel Schwung.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Hole mit der Waffe aus und schlage am besten direkt von oben. Meistens reicht das aus, um Gegner zu Boden zu strecken.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Nutze den Schwung, wenn die Waffe unten ist, um direkt wieder nach oben zu schlagen.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Seitliche Schläge lassen sich ausgezeichnet mit einem Zweihänder koordinieren. Damit hältst du dir die Gegner vom Hals.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //Das sollte erst einmal reichen. Übe das.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND2 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND2_Condition;
	information		= GRD_200_Thorus_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Ich möchte mehr über den zweihändigen Kampf lernen.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Zunächst ändere deine Grundhaltung. Halte das Schwert aufrecht, fasse den Griff mit beiden Händen und halte es seitlich am Körper.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Schlage schnell von oben und lass die Klinge über deine Schulter gleiten. Nun hast du die Möglichkeit, einen schnellen Schlag nach rechts zu machen.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Damit bietest du dem Gegner keine Chance, an dich ranzukommen.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Sonst schlage wieder nach vorne von links oben, um so den Gegner zurückzutreiben.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Eine schnelle Körperdrehung verleiht deinem nächsten Schlag die nötige Wucht, um den Gegner zu Boden zu zwingen.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Falls das nicht ausreichen sollte, dann nutze den übrigen Schwung, um die Klinge noch einmal tanzen zu lassen.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Geh nach deinem Angriff in den Block und suche eine Lücke, damit du erneut zuschlagen kannst.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Abwechslung in den Kampfbewegungen und Positionswechsel sind der Schlüssel zum Sieg.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
