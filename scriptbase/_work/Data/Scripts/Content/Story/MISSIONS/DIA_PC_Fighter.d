//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //Auf in den Kampf!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Bis sp�ter.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begr��ung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hey. Ein neues Gesicht.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Wer bist du?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Ich bin Gorn. S�ldner der Magier.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "Was machst du als S�ldner der Magier?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //Was machst du als S�ldner der Magier?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee hat mit den Magiern eine Abmachung getroffen. Er heuert die besten K�mpfer an, die in der Kolonie zu finden sind. Also uns.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Wir sorgen daf�r, dass die Sch�rfer ungest�rt Erz abbauen k�nnen und halten den Magiern den R�cken frei.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Die Magier k�mmern sich darum, dass wir hier rauskommen. Und einen kleinen Teil des Erzes bekommen wir als Sold.
};

//*************************************
//			H�tte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "Kann ich hier irgendwo pennen?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Kann ich hier irgendwo pennen, ohne dass ich vorher jemanden aus seiner H�tte pr�geln muss?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Ich f�rchte nicht. Aber wenn du das wirklich vorhast, geh zu Shrike.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Er hat sich die H�tte ganz vorne am H�hleneingang geschnappt. Sie stand leer - aber eigentlich geh�rte sie uns.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Uns?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Den S�ldnern eben. S�ldner und Banditen leben hier getrennt. Und normalerweise hat keiner aus Lares' Bande was auf dieser Seite des gro�en Loches zu suchen.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //Im Grunde ist es v�llig egal. Aber er hat niemanden gefragt. Und man kann den Banditen nicht alles durchgehen lassen, sonst werden sie aufm�pfig!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,	"Der S�ldner Gorn erz�hlte mir, dass Shrike sich ohne zu Fragen eine S�ldner-H�tte genommen hat. Da ICH Gorn gefragt habe, wird sich keiner der S�ldner einmischen, wenn ich Shrike davon '�berzeugen' kann, sich eine andere H�tte zu suchen.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			H�tte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Shrike hat sich eine andere H�tte gesucht.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Shrike hat sich eine andere H�tte gesucht.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Gut. Gerade noch hat mich Torlof drauf angesprochen, dass er dem Burschen das Fell �ber die Ohren ziehen wollte.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,	"Gorn hat sich dar�ber k�niglich am�sert, dass ich Shrike aus seiner H�tte geworfen haben. Er macht den Eindruck einer ehrlichen Haut. Hart aber gerecht. Ich sollte mich in Zukunft an ihn halten.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			S�ldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "Was muss ich tun, um im Neuen Lager aufgenommen zu werden?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Was muss ich tun, um im Neuen Lager aufgenommen zu werden?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Bevor dich Lee aufnimmt, musst du lernen, besser zu k�mpfen. Egal, mit welcher Waffe, aber du musst gut sein.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Au�erdem musst du viel Erfahrung haben mit dem Leben hier und allem.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Wenn du keine Lust hast, in die anderen Lager zu gehen, solltest du dich den Banditen anschlie�en, bevor du als S�ldner anf�ngst.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Hast du noch mehr von dem Zeug?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Jede Menge. Willst du handeln?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "Wie kommt es, dass du dich an einem �berfall der Bande beteiligt hast?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Wie kommt es, dass du dich an einem �berfall der Bande beteiligt hast?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //Wer sagt, dass es so war?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Warum hast du sonst so viel von diesem Zeug?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Denk blo� nicht, dass das alles von EINEM Fischzug kommt.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //Du beteiligst dich regelm��ig an den �berf�llen?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Wenn es so w�re, k�nnte ich es dir nicht sagen. Lee sieht so was n�mlich gar nicht gerne.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Verstehe.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig f�r Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Ahh, du bist es! Mein Freund Lester aus dem Sumpflager hat mir erz�hlt, was du dort alles vollbracht hast.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //F�r jemanden, der noch nicht so lange hier ist, hast du es schon weit gebracht.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Es hat oft nicht viel gefehlt, und ich w�re als Futter f�r die W�rmer geendet.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Ich habe eine wichtige Botschaft f�r die Wassermagier!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //Ich habe eine wichtige Botschaft f�r die Wassermagier!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Dann sprich am besten gleich mit Saturas. Er ist der oberste Wassermagier und studiert den ganzen Tag irgendwelche Schriften.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Aber egal, wie wichtig die Botschaft auch ist, die Wachen zur oberen Ebene werden dich nicht zu ihm durch lassen.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //Kannst du nicht ein gutes Wort f�r mich einlegen?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Ich nicht, aber Cronos, der H�ter des Erzes, kann dir vielleicht eine Erlaubnis erteilen.
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Wo finde ich diesen 'H�ter des Erzes'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Wo finde ich diesen 'H�ter des Erzes'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Wenn du von hier weitergehst, st��t du nach dem Damm auf die gro�e Wohnh�hle.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos h�lt sich normalerweise am Gitter �ber dem gro�en Erzhaufen auf.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Aber er ist ein wenig arrogant. Du wirst ihn �berzeugen m�ssen, dass deine Botschaft wichtig ist.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,	"Gorn empfahl mir, direkt mit dem obersten Wassermagier mit Namen Saturas zu sprechen. Cronos, der H�ter des Erzes, kann eine Audienz erwirken. Cronos h�lt sich im Zentrum des Neuen Lagers, am Gitter �ber dem Erzhaufen auf."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Hallo, Neuer. Wie du siehst, ist die Kolonie ein kleiner Ort.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Man l�uft sich hier st�ndig �ber den Weg.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Was f�hrt dich denn hier her?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Was f�hrt dich denn hierher?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Oh, ich versuche, einer alten Legende auf die Spur zu kommen.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Einer Legende?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Ja, Milten, mein Kumpel aus dem Alten Lager, hat mir erz�hlt, dass hier einst M�nche lebten.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Das war nat�rlich lange, bevor es die Barriere gab.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Sie sollen einem Gott gehuldigt haben, der seinen Anh�ngern die Macht gab, sich in Tiere zu verwandeln.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Bestimmt gibt es hier noch Sch�tze aus der alten Zeit.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //Was f�hrt dich hierher?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ich suche einen magischen Fokus";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Ich suche einen magischen Fokus.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Er muss irgendwo in dieser Gegend sein.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Was du suchst, befindet sich vielleicht innerhalb der Klosterruinen dort jenseits der Schlucht.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Wir k�nnten unseren Weg gemeinsam fortsetzen.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Wir k�nnen unseren Weg gemeinsam fortsetzen.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Gute Idee. Hier wimmelt es nur so von Snappern.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Einzeln sind sie f�r einen ge�bten K�mpfer zwar kein Problem, aber sie jagen meistens in Rudeln.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //So ein Rudel kann auch den gewieftesten Schwertmeister in Fetzen rei�en.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Wir gehen also zusammen?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Ok, doch bevor wir �ber diesen Baumstamm balancieren, m�chte ich die Schlucht darunter erforschen. Ich habe gerne einen freien R�cken.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Komm mit, ich habe einen Weg entdeckt, der uns dorthin f�hrt.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,	"Als ich mich der Klosterruine n�herte traf ich auf den S�ldner Gorn. Er ist hier, um die vor uns liegende Gem�uer nach Sch�tzen aus alten Tagen zu durchsuchen.");
	B_LogEntry			(CH3_MonasteryRuin,	"Wir werden unsere Suche gemeinsam fortsetzen. Gorn warnte mich vor grossen Snapper-Rudeln, die in dieser Gegend verst�rkt anzutreffen sind.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //Das nenne ich Gl�ck. Hier scheint eine Vorratsh�hle gewesen zu sein.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //�bernimm du jetzt die F�hrung, ich wollte nur sicherstellen, dass bei unserer R�ckkehr hier keine �berraschung auf uns wartet.

	B_LogEntry		(CH3_MonasteryRuin,	"Wir haben eine geheime Vorratsh�hle entdeckt. Vor allem ein Schl�ssel und zwei Spruchrollen haben meine Aufmerksamkeit geweckt");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Du scheinst doch nicht mehr an der Klosterruine interessiert zu sein.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Ich werde alleine weitergehen.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Komm einfach nach, wenn du es dir anders �berlegst.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Dieses verfluchte Tor. Man erz�hlt sich, dass bisher kein Mensch in der Kolonie es �ffnen konnte.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Die kleinen Biester da dr�ben scheinen die Einzigen zu sein, die es geschafft haben, in den Innenhof zu gelangen.

	B_LogEntry		(CH3_MonasteryRuin,	"Wir stehen vor einem verschlossenen Tor. Man scheint es von au�en nicht �ffnen zu k�nnen.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "Wie geht es nun weiter?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //Wie geht es nun weiter?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Du musst einen Weg finden, auf die andere Seite des Tors zu gelangen.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Dort oben ist eine Art Plattform. Aber es scheint zu hoch zu sein, um zu klettern.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Wir m�ssen einen anderen Weg finden.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Sieht aus wie ein Podest f�r irgendetwas.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Vielleicht lag hier mal das Artefakt, dass du suchst.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Du hast es tats�chlich geschafft, das Tor zu �ffnen. Das mit dem Zauber war wirklich clever.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //Los, weiter geht's.

	B_LogEntry		(CH3_MonasteryRuin,	"Mithilfe der Spruchrollen aus der Vorratsh�hle habe ich mich in eine Fleischwanze verwandelt und bin durch einen Mauerspalt ins Innere gelangt.");
	B_LogEntry		(CH3_MonasteryRuin,	"Das Tor ist nun offen.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Du scheinst doch nicht mehr an der Klosterruine interessiert zu sein.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Ich werde alleine weitersuchen.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Komm einfach nach, wenn du es dir anders �berlegst.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //Du hast dein magisches Artefakt also gefunden!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Ja. Ich muss den Fokus zu den Wassermagiern bringen. Sie brauchen ihn.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Ich werde dich noch etwas begleiten.

	B_LogEntry		(CH3_MonasteryRuin,	"Ich habe den Fokus in einer Art Studienraum gefunden. Gorn will mich noch etwas begleiten.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //ACH DU SCHEISSE!!! Was ist das f�r ein Riesenvieh dort dr�ben?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Wo kommt DAS denn her???
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //Sieht aus wie einer dieser fast unverwundbaren Trolle. Allerdings etwas kleiner!
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Wie auch immer, wenn wir hier raus wollen, m�ssen wie an diesem Biest vorbei.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //Das war ein hartes St�ck Arbeit.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Ja, wir haben das Monster bezwungen. Doch wenn das nur ein junger Troll war ...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //... dann willst du wohl einem ausgewachsenen Exemplar lieber nicht zwischen die Finger geraten.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //So in etwa.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Unsere Wege trennen sich hier. Ich werde noch eine Weile bleiben und herumst�bern.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Doch wir werden uns sicher wiedersehen. Bis dann, mein Freund.

	B_LogEntry		(CH3_MonasteryRuin,	"Wir sind auf dem R�ckweg in den Hof der Klosterruine auf einen jungen Troll gesto�en. Es war ein harter Kampf aber wir haben ihn gewonnen.");
	B_LogEntry		(CH3_MonasteryRuin,	"Die Wege von Gorn und mir trennen sich nun. Mein Gef�hl sagt mir, dass ich ihn bald wiedersehen werde.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ich habe Diego und Milten vor dem Alten Lager getroffen!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Ich habe Diego und Milten vor dem Alten Lager getroffen!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //Eine gute Nachricht!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Sie wollen sich mit dir und Lester treffen. An eurem �blichen Treffpunkt.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Danke. In diesen turbulenten Zeiten sind gute Freunde unersetzlich.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Auch du geh�rst mittlerweile schon fast zu uns. Auf dich ist Verlass!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"Ich habe Lester und Gorn nun dar�ber informiert sich mit den anderen beiden Freunden zu treffen. Ab jetzt ist dies nicht mehr meine Angelegenheit. Sie werden schon wissen, was zu tun ist."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Was hast du in der Freien Mine gesehen?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Was hast du in der Freien Mine gesehen?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Nachdem ich von der Klosterruine zur�ckkam, wollte ich einen Abstecher zu Okyl, dem Boss der Freien Mine, machen.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Doch als ich ankam, lagen �berall Leichen herum.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Ich konnte gerade noch sehen, wie sich einige Gardisten im Mineneingang verschanzten.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Wie konnten so viele S�ldner zwei Dutzend Gardisten unterliegen?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //Sah mir sehr nach einem Angriff aus dem Hinterhalt aus! Niemand h�tte erwartet, dass Angreifer �ber die Berge kommen w�rden.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Das �berraschungsmoment kann die St�rke einer Truppe vervielfachen.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Was hast du jetzt vor?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Was hast du jetzt vor?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Die gesamte Verteidigung unseres Lagers muss nun umgestellt werden. Das braucht Zeit.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Bis Lee und seine Leute so weit sind, werde ich mich erst mal Cords provisorischen Wachposten anschlie�en.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Plant ihr einen Gegenschlag?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Noch nicht, aber der Tag wird kommen!
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Wenn du mich suchst, gehe von hier in Richtung Mine. Dort werde ich meinen Posten beziehen.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "Wie ist die Lage?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Wie ist die Lage?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Alles ruhig. In der Freien Mine r�hrt sich nichts.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee ist noch damit besch�ftigt, unsere Verteidigung zu organisieren!
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Du kommst gerade richtig! Wir bereiten uns auf den Gegenschlag vor.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Die R�ckeroberung der Freien Mine ist der erste Schritt!
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Eine R�ckeroberung mit vier Mann? Wo sind all die anderen S�ldner?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Eine R�ckeroberung mit vier Mann? Wo sind all die anderen S�ldner?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Ein frontaler Angriff bringt nichts! Daf�r sind Gomez' Leute zu gut verschanzt!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Aber eine verdeckte Operation, bei der wir Mann f�r Mann ausschalten, k�nnte gelingen!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee bat mich, dir etwas auszurichten.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Als einer unserer besten S�ldner wurdest du bestimmt, die Operation durchzuf�hren!
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Als Wassermagier mit sehr viel Kampferfahrung wurdest du bestimmt, die Operation durchzuf�hren!
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Als einer unserer besten Banditen wurdest du bestimmt, die Operation durchzuf�hren!
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Obwohl du nicht zu uns geh�rst, hast du unserem Lager schon gro�e Dienste erwiesen und dich mehr als bew�hrt.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Wir bieten dir die Durchf�hrung der Operation an!
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Ich werde mit dir gehen. Gemeinsam k�nnen wir es schaffen!
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "Der erste Schritt? Was wird denn der zweite sein?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Der erste Schritt? Was wird denn der Zweite sein?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Sobald die Mine wieder in unserem Besitz ist, werden wir den Pass �ber die Berge suchen, den Gomez' Leute f�r den �berfall benutzt haben!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Wenn der Pass dicht gemacht wurde, haben wir die Situation wieder im Griff.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Verstehe.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "Warum gerade ich?";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Warum gerade ich?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Du hast schon mehrmals bewiesen, dass du Mut hast und gleichzeitig denken kannst!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Au�erdem kennst du das Alte Lager und die Gardisten besser als die meisten von uns.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Du bist der beste Mann f�r diesen schwierigen Job!
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Lass uns den ungebetenen G�sten in der Mine kr�ftig in den Hintern treten!";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //Okay, lass uns den ungebetenen G�sten in der Mine kr�ftig in den Hintern treten!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Nichts anderes habe ich von dir erwartet!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Hier, nimm diesen Schl�ssel. Er �ffnet das Torhaus vor dem Eingang der Mine.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "Warum nicht. Ich muss ohnehin in die Mine!";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Warum nicht. Ich muss ohnehin in die Mine!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Was immer auch DEINE Gr�nde sein m�gen, ich bin froh, dass wir diese Sache gemeinsam erledigen!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Hier, nimm diesen Schl�ssel. Er �ffnet das Torhaus vor dem Eingang der Mine.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Fast h�tte ich es vergessen!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Der Bandit Wolf will dich unbedingt sprechen, bevor wir zur Mine aufbrechen!

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF, "Er kann warten, wir haben jetzt wichtigeres zu tun!",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF, "Dann werde ihn besser noch vorher aufsuchen!",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,	"Wolf der Bandit will mich unbedingt nochmal sprechen, bevor wir zur Mine aufbrechen. Ich sollte bei ihm vorbeischauen.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //Er kann warten, wir haben jetzt Wichtigeres zu tun!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Wie du meinst!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Dann werde ich ihn besser noch vorher aufsuchen!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Tu das. Ich warte hier am Wachposten auf dich!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Du scheinst doch noch mit Wolf sprechen zu wollen!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Du l�ufst in die falsche Richtung! Wir m�ssen zur Mine!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Ich warte am provisorischen Wachposten auf dich!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "Es kann losgehen! Auf zur Mine!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Es kann losgehen! Auf zur Mine!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //H�chste Zeit, dass wir die Gardisten von dort vertreiben!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Geh du vor, ich folge dir!

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //VORSICHT, RAZORS!!!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Die arbeiten genauso in Rudeln wie die Snapper, nur dass sie viel heftiger zubei�en!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Wir sollten sie aus dem Weg r�umen! Du wei�t ja, ich habe gerne einen freien R�cken!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Warte mal, siehst du all die Leichen hier?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Geh du runter zum Mineneingang, ich bleib' erst mal hier oben und stelle sicher, dass es keine �berraschung von hinten gibt.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Wenn du unten bist, komme ich nach.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Ich h�rte dich k�mpfen, da bin ich sofort hinterher.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Ein alter Bekannter ... aber die Rechnung ist beglichen.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Gut, �ffne du das Tor, ich pass' hier auf!

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Oh, Mann. Das war ein wirklich beinharter Kampf.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //H�tte nicht gedacht, dass Gomez' Gardisten so viel Widerstand leisten.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Die Hauptsache ist, dass wir sie wieder aus unserer Mine vertrieben haben!
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Ich werde hier bleiben und daf�r sorgen, dass das auch so bleibt!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee �ber die befreite Mine informieren.     ***Bj�rn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "Wie ist die Lage?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Wie ist die Lage?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Alles ruhig. In der Freien Mine r�hrt sich nichts.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Es kann nicht mehr lange dauern, bis Lee die Verst�rkung hier hoch schickt.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //So lange werde ich es mir hier gem�tlich machen.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Eine interessante Ork-Standarte, die du da hast.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Stammt sie von dem befreiten Ork-Sklaven in der Mine?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //Es ist ein orkisches Symbol f�r Freundschaft. Ich will damit die Stadt der Orks betreten.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Ich hoffe f�r dich, die Orks respektieren dieses ... ETWAS!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








