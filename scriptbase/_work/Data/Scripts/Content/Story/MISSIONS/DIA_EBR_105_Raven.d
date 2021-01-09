// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Was kann ich f�r dich tun?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Wer bist du?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Wer bist du?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Ich bin Raven. Gomez' rechte Hand. Jeder, der hier ist, um mit Gomez zu reden, redet vorher mit MIR.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "Ich habe eine Ladung Kraut f�r Gomez von Cor Kalom.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //Ich habe eine Ladung Kraut f�r Gomez von Cor Kalom.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Bartholo k�mmert sich um diese Sachen, Gomez selbst gibt sich nicht mit Boten ab.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Du findest ihn in der Kammer hier rechts hinter dem Eingang oder in der K�che im gro�en Turm.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //Nachts schl�ft er nat�rlich. Da w�rd' ich es nicht wagen, ihn zu st�ren.

	B_LogEntry			(CH1_KrautBote,	"Die Krautlieferung f�r Gomez muss bei Bartholo abgegeben werden. Ich finde ihn im Haus der Erzbarone.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "Ich will zu Gomez. Thorus sagt, ich soll als Schatten aufgenommen werden.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Ich will zu Gomez. Thorus sagt, ich soll als Schatten aufgenommen werden.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Wir sind immer auf der Suche nach guten Leuten. Du scheinst mir nicht auf den Kopf gefallen zu sein. Du k�nntest es hier zu was bringen.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Ich werde dich zu Gomez f�hren. Folge mir. Und fass nichts an!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT") ) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Dort hinten ist Gomez. Wenn du ihm keinen Respekt zeigst, werde ich dir pers�nlich welchen beibringen, ist das klar?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "Wie steht der Erzhandel?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //Wie steht der Erzhandel?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //Die Alte Mine spuckt genug aus. Die letzte Lieferung aus der Au�enwelt war ziemlich fett.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "Gomez sagt, ich bin dabei.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez sagt, ich bin dabei.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Gut! Du kannst dich gleich bei deinem ersten Auftrag bew�hren.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //Wenn deine Verbindungen wirklich so gut sind, wie du sagst, solltest du keine Probleme damit haben.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "Was soll ich f�r dich erledigen?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Was soll ich f�r dich erledigen?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Wir stehen mit der Bruderschaft in Handelskontakt. Das bedeutet nicht, das wir ihnen unbedingt vertrauen.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Mach dich auf den Weg in den Sumpf.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Wenn du dort im Lager bist, halte die Ohren auf. Alles was du erf�hrst, kann f�r uns n�tzlich sein.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Und je mehr du erf�hrst, desto besser. Das Ganze erfordert ein gewisses Feingef�hl. Du wei�t, was ich meine?
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Bleib ruhig, ich werde ihren Zorn nicht heraufbeschw�ren.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Ich wusste, dass du mich verstehen w�rdest.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Raven hat mich im Auftrag des Alten Lagers zur Bruderschaft im Sumpf geschickt. Ich soll mich dort umsehen und -h�ren. Vielleicht gibt es ein paar n�tzliche Informationen f�r die Erzbarone");
};

// *********************************************
// 				Ausr�stung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "Wo bekomme ich bessere Ausr�stung her?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Wo bekomme ich bessere Ausr�stung her?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Geh zu Diego, er wird dir 'ne R�stung geben. Damit wirst du nicht so schnell umgebracht und sie dient auch gleichzeitig als Ausweis.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Mit deiner neuen R�stung solltest du hier �berall hinkommen, wo du hin musst.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Und wenn du Waffen brauchst, geh zu Skip, er ist in der gro�en Scheune hinten links auf den Burgplatz.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,	"Diego verteilt bessere R�STUNGEN f�r Gomez' Schatten. Er h�ngt vor dem Eingang zur Burg herum.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,	"Der Gardist Skip auf dem hinteren Burginnenhof verkauft WAFFEN. Aber nur an Gomez' Leute.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "Ich will einen Zwischenbericht abgeben.";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Ich will einen Zwischenbericht abgeben.
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Gut. Ich bin gerne gut informiert.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //Die gro�e Beschw�rung hat stattgefunden.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Du hast deine Sache gut gemacht.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Raven hat mich mit billigen Worten abgespeist! Das ist nicht die Art der gro�z�gigen Dankbarkeit, die ich erwartet habe! Von nun an gehe ich meinen eigenen Pl�nen nach.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Sie wollen die Eier einer Minecrawler-K�nigin, um daraus ein Elixier herzustellen, durch das sie Kontakt zum Schl�fer aufnehmen k�nnen. Ich habe die Eier bei mir.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Interessant. Bin gespannt, ob die Sache funktioniert. Bring die Eier in den Tempel.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Du hast deine Sache gut gemacht.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Raven hat mich mit billigen Worten abgespeist! Das ist nicht die Art der gro�z�gigen Dankbarkeit, die ich erwartet habe! Von nun an gehe ich meinen eigenen Pl�nen nach.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Ich wei� noch nicht GENAU was sie vorhaben.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Was bel�stigst du mich dann?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


