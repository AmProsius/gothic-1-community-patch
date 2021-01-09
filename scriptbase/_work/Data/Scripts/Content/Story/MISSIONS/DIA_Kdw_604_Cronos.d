// ************************ EXIT **************************
instance  KDW_604_Cronos_Exit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  999;	
	condition	=  KDW_604_Cronos_Exit_Condition;
	information	=  KDW_604_Cronos_Exit_Info;
	permanent	=  1;
	important	=  0;
	description = DIALOG_ENDE;
};                       

FUNC int  KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneIceCube))
	{
	CreateInvItem (self, ItArRuneIceCube);
	};
	if (!Npc_HasItems (self,ItArRuneThunderbolt))
	{
	CreateInvItem (self, ItArRuneThunderbolt);
	};
};

/*
// *****************************************
//					Greet
// *****************************************

instance  KDW_604_Cronos_Greet (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Greet_Condition;
	information	=  KDW_604_Cronos_Greet_Info;
	permanent	=  0;
	description = "Ich gr��e dich, Magier.";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Ich gr��e dich, Magier.
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum st�rst du den H�ter des Erzes?
};
*/

// *****************************************
//					Brief
// *****************************************

instance  KDW_604_Cronos_Brief (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Brief_Condition;
	information	=  KDW_604_Cronos_Brief_Info;
	permanent	=  0;
	description = "Ich habe einen Brief f�r den obersten Feuermagier.";
};                       

FUNC int  KDW_604_Cronos_Brief_Condition()
{
	if	Npc_KnowsInfo(hero, KDW_604_Cronos_Greet)
	&&	(Npc_GetTrueGuild(hero) != GIL_STT)
	&&	(Npc_GetTrueGuild(hero) != GIL_KDF)
	&&	(hero.level < 10)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Brief_Info()
{
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //Ich habe einen Brief f�r den obersten Feuermagier.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //Wir sind die Magier vom Kreis des Wassers. Die Magier vom Kreis des Feuers findest du im alten Lager.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Aber ich komme nicht in die Burg. Kannst du mir helfen?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Nun, gelegentlich senden wir Boten zu unseren Br�dern ins Alte Lager...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Aber wir vertrauen diese Nachrichten nur Lares' Leuten an. Seit vielen Jahren sorgt er schon daf�r, dass unsere Nachrichten sicher ankommen.
};

// *****************************************
//					Barrier
// *****************************************

instance  KDW_604_Cronos_Barrier (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  2;	
	condition	=  KDW_604_Cronos_Barrier_Condition;
	information	=  KDW_604_Cronos_Barrier_Info;
	permanent	=  0;
	description = "Ihr wollt die Barriere zerst�ren - wie genau soll das gehen?";
};                       

FUNC int  KDW_604_Cronos_Barrier_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Barrier_Info()
{
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Ihr wollt die Barriere zerst�ren - wie genau soll das gehen?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Wir brauchen eine gro�e Menge magisches Erz. 
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //In einem gro�en magischen Ritual werden wir die gesamte magische Energie freilassen und somit die Barriere sprengen.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Nat�rlich zieht eine solch gro�e Menge Erz allerlei Lumpen und Banditen an!
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Also brauchen wir jeden Mann, der bereit ist unseren Plan zu verteidigen.
};

// *****************************************
//					WannaJoin
// *****************************************

instance  KDW_604_Cronos_WannaJoin (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaJoin_Condition;
	information	=  KDW_604_Cronos_WannaJoin_Info;
	permanent	=  0;
	description = "Ich will bei euch mitmachen!";
};                       

FUNC int  KDW_604_Cronos_WannaJoin_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Ich will bei euch mitmachen!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Wenn du dich uns anschlie�en willst, solltest du zu Lee oder Lares gehen. 
};

// *****************************************
//					WannaMage
// *****************************************

instance  KDW_604_Cronos_WannaMage (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaMage_Condition;
	information	=  KDW_604_Cronos_WannaMage_Info;
	permanent	=  0;
	description = "Ich will Magier werden!";
};                       

FUNC int  KDW_604_Cronos_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Ich will Magier werden!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Wir k�nnen es uns nicht leisten unser Wissen unter unseren Feinden zu verbreiten.
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Erst wenn du deine Loyalit�t zu uns unter Beweis gestellt hast, werden wir �berhaupt in Erw�gung ziehen, dich zu unterweisen.
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 2        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

// *****************************************
//					Bandit --> Messenger
// *****************************************

instance  KDW_604_Cronos_Bandit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  4;	
	condition	=  KDW_604_Cronos_Bandit_Condition;
	information	=  KDW_604_Cronos_Bandit_Info;
	permanent	=  0;
	description = "Ich geh�re jetzt zu Lares. Hast du eine Nachricht f�r die Feuermagier?";
};                       

FUNC int  KDW_604_Cronos_Bandit_Condition()
{
	if ( (Npc_GetTrueGuild(hero)==GIL_ORG) || (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Bandit_Info()
{
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Ich bin jetzt einer von Lares Leuten. Hast du eine Nachricht f�r die Feuermagier, die ich �berbringen k�nnte?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //In der Tat. Aber du brauchst das Zeichen eines unserer Boten, sonst lassen dich Gomez Schergen nicht in die Burg.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Hier, nimm Brief und Zeichen. Und nun beeile dich!
	
	CreateInvItem (other,KdW_Amulett);
	CreateInvItem (other,Cronos_Brief);
	
	Cronos_Messenger = LOG_RUNNING;
};

// *****************************************
//					BriefBack
// *****************************************

instance  KDW_604_Cronos_BriefBack (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_BriefBack_Condition;
	information	=  KDW_604_Cronos_BriefBack_Info;
	permanent	=  0;
	description = "Ich habe deine Nachricht �berbracht!";
};                       

FUNC int  KDW_604_Cronos_BriefBack_Condition()
{
	if (Cronos_Messenger == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_BriefBack_Info()
{
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //Ich habe deine Nachricht �berbracht!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //Ah gut! Hier ist eine kleine Entsch�digung f�r deine M�hen...
	
	CreateInvItems (self,itminugget, 200);
	B_GiveInvItems (self, other, itminugget, 200);
	
	B_GiveXP(XP_CronosLetter);
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 3        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Cronos_NEWS (C_INFO)
{
	npc			= KDW_604_Cronos;
	condition	= Info_Cronos_NEWS_Condition;
	information	= Info_Cronos_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich habe wichtige Nachrichten f�r Saturas!";
};

FUNC INT Info_Cronos_NEWS_Condition()
{	
	if	(CorAngar_SendToNC==TRUE)
	&&	!Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_NEWS_Info()
{
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //Ich habe wichtige Nachrichten f�r Saturas!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Was k�nnte schon so wichtig sein, dass unser spiritueller Anf�hrer seine wertvollen Studien daf�r unterbrechen sollte?
};

//***************************************************************************
//	Info KALOM
//***************************************************************************
instance Info_Cronos_KALOM (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 10;
	condition	= Info_Cronos_KALOM_Condition;
	information	= Info_Cronos_KALOM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Cor Kalom hat die Bruderschaft verlassen!";
};

FUNC INT Info_Cronos_KALOM_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_KALOM_Info()
{
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom hat mit ein paar fanatischen Templern die Bruderschaft verlassen!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Er will unbedingt den Schl�fer auf eigene Faust finden und ihn erwecken.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Ich habe ihm noch nie getraut. Zweiter Guru hin oder her, er ist verblendet, hinterh�ltig und zu allem f�hig.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //Sicher ist die Bruderschaft ohne ihn besser dran!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Ich werde Saturas bei Gelegenheit davon berichten. Geh nun!

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Cronos_YBERION (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 20;
	condition	= Info_Cronos_YBERION_Condition;
	information	= Info_Cronos_YBERION_Info;
	permanent	= 0;
	important 	= 0;
	description = "Y'Berion, der Anf�hrer des Sektenlagers, ist tot!";
};

FUNC INT Info_Cronos_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_YBERION_Info()
{
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y'Berion, der Anf�hrer des Sektenlagers, ist tot!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //WAAAS??? Wie konnte das geschehen?
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //Die Bruderschaft f�hrte ein Ritual durch, eine Anrufung ihres Gottes.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Die mentalen Anstrengungen waren wohl zu viel f�r Y'Berion.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //Das ist sehr traurig. Y'Berion war ein zuverl�ssiger Verb�ndeter.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Aber es rechtfertigt nicht die St�rung der Studien von Saturas.

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SLEEPER
//***************************************************************************
instance Info_Cronos_SLEEPER (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_SLEEPER_Condition;
	information	= Info_Cronos_SLEEPER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Die Gurus haben erkannt, dass sie einen �blen Erzd�monen anbeten!";
};

FUNC INT Info_Cronos_SLEEPER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_SLEEPER_Info()
{
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Die Gurus haben erkannt, dass sie einen �blen Erzd�monen anbeten!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Sie halten ihren Schl�fer jetzt pl�tzlich f�r einen D�monen?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //H�rt sich nach einer weiteren Verworrenheit der Bruderschaft an, aber ...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //... Sollten sie Recht haben ... k�nnten wir alle hier in der Kolonie in gro�er Gefahr sein.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Das musst du sofort Saturas berichten. Er muss entscheiden, was zu tun ist.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Wo finde ich Saturas?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Begib dich zur obersten Ebene. Sage den Wachen dort, du hast meine Erlaubnis zum passieren.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Die Parole lautet TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturas findest du beim gro�en Pentagramm.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //Er gibt sich dort fast den ganzen Tag seinen Studien �ber die Sprengung des gro�en Erzhaufens hin.

	B_LogEntry			(CH3_EscapePlanNC,	"Cronos gab mir die Erlaubnis Saturas auf der obersten Ebene aufzusuchen. Man kann den obersten Wassermagier normalerweise beim Pentragramm finden. Die Parole f�r die Wachen lautete... verdammt wie war die doch gleich?");

	B_GiveXP			(XP_GetCronosPermission);

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info PAROLE
//***************************************************************************
instance Info_Cronos_PAROLE (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_PAROLE_Condition;
	information	= Info_Cronos_PAROLE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Wie war die Parole nochmal?";
};

FUNC INT Info_Cronos_PAROLE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_PAROLE_Info()
{
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Wie war die Parole noch mal?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Du bist vergesslicher als meine Gro�mutter. Sie lautet "TETRIANDOCH"
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Cronos_REWARD (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_REWARD_Condition;
	information	= Info_Cronos_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas sagte, du h�ttest eine Belohnung f�r mich.";
};

FUNC INT Info_Cronos_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_REWARD_Info()
{
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas sagte, du h�ttest eine Belohnung f�r mich.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //Als H�ter des Erzes m�chte ich f�r deine gro�en Dienste f�r unser Lager einen kleinen Teil des Erzes in deine H�nde geben.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Ich hoffe, du hast eine ebenso sinnvolle Verwendung wie wir daf�r!

	B_LogEntry		(CH3_BringFoci,	"Cronos �bergab mir eine stattliche Menge Erz, die diesen riesiegen Erzhaufen wohl kaum merklich verkleinern werden.");
	if	Npc_KnowsInfo(hero, Info_Riordian_REWARD)
	{
		Log_SetTopicStatus	(CH3_BringFoci,	LOG_SUCCESS);
	};
	
	CreateInvItems		(self, ItMiNugget,	1000);
	B_GiveInvItems (self, hero, ItMiNugget,	1000);
};
/*------------------------------------------------------------------------
//						NACH DER WEIHE							//
------------------------------------------------------------------------*/
instance KDW_604_Cronos_WELCOME (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_WELCOME_Condition;
	information		= KDW_604_Cronos_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_604_Cronos_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};
};
func void  KDW_604_Cronos_WELCOME_Info()
{
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Deine Entscheidung, zu den Wassermagiern zu kommen, war richtig. Willkommen, Bruder!
	AI_StopProcessInfos	( self );  
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDW_604_Cronos_MANA (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 800;
	condition		= KDW_604_Cronos_MANA_Condition;
	information		= KDW_604_Cronos_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich ben�tige mehr magische Kraft"; 
};

FUNC int  KDW_604_Cronos_MANA_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_MANA_Info()
{
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Ich ben�tige mehr magische Kraft
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Ich kann dir helfen, deine Kraft zu steigern. Setze sie mit Bedacht ein!
	
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);
};  
func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices	(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};

func void KDW_604_Cronos_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Cronos_SELLSTUFF (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 900;
	condition		= KDW_604_Cronos_SELLSTUFF_Condition;
	information		= KDW_604_Cronos_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Cronos_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Ich m�chte Schriften �ber Magie erwerben.
	
};  
/*------------------------------------------------------------------------
						BEGR�SSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich gr��e dich, Magier"; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Ich gr��e dich, Magier.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Der Segen Adanos sei mit dir. Ich kann dir helfen, deine geistige Kraft zu st�rken oder dir ein paar n�tzliche Dinge anbieten.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Was kann ich f�r dich tun?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos verkauft magische Utensilien wie RUNEN, SPRUCHROLLEN und RINGE. Er ist Tag und Nacht am Gitter �ber dem gro�en Erzhaufen zu finden."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos kann mir helfen, meine MANA zu steigern. Er ist Tag und Nacht am Gitter �ber dem gro�en Erzhaufen zu finden.");
};
