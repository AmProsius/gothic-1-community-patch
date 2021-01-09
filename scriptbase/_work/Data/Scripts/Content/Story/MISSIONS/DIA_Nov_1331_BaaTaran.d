// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Ich bin neu hier. Wer bist du?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Ich bin neu hier. Wer bist du?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Ich bin Baal Taran von der Bruderschaft des Schl�fers.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Was ist die Bruderschaft des Schl�fers?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Was ist die Bruderschaft des Schl�fers?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Wir sind eine Gemeinschaft von Anh�ngern eines neuen Glaubens.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Unser Lager liegt �stlich von hier, im Sumpfgebiet. Ich bin hergekommen, um Fremden wie dir die Lehre des Schl�fers zu verk�nden.
};

// **************************************************
//					Wer ist der Schl�fer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Wer ist der Schl�fer?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Wer ist der Schl�fer?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Der Schl�fer ist unser Erl�ser. Er hat sich uns vor 5 Jahren durch Y'Berion, unseren Meister, offenbart.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Seitdem haben wir den drei G�ttern abgeschworen. Und das solltest du auch tun.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Die G�tter haben es zugelassen, dass wir in dieses Gef�ngnis verbannt wurden. Der Schl�fer aber wird uns wieder in die Freiheit f�hren.
};

// **************************************************
//					Lehre des Schl�fers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Erz�hl mir von der Lehre des Schl�fers.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Erz�hl mir von der Lehre des Schl�fers.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Der Schl�fer ist ein m�chtiges Wesen, vielleicht sogar m�chtiger als Innos, der Gott des Lichts.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Im Geiste ist er mit uns. Aber seine Macht ist noch begrenzt. Er schl�ft einen tausendj�hrigen Schlaf, aber die Zeit seines Erwachens ist nahe.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Uns hat er auserw�hlt, sein Erwachen zu bezeugen und seine Lehre zu verbreiten.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Denn h�re, diejenigen, die sich dem Schl�fer anschlie�en, deren Seelen werden unsterblich, aber die, die ihm entsagen oder sich gar gegen ihn stellen, werden vernichtet werden.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Aber der Schl�fer ist barmherzig und gibt allen Zweiflern einen Beweis seiner Macht.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "Wie soll der Weg in die Freiheit aussehen?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Wie soll der Weg in die Freiheit aussehen?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Wir bereiten eine gro�e Anrufung des Schl�fers vor, in der alle Novizen zusammen den Kontakt herstellen.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //In dieser Anrufung wird uns der Schl�fer den Weg in die Freiheit offenbaren.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "Wie beweist euch euer Gott seine Macht?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Wie beweist euch euer Gott seine Macht?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Er spricht zu uns durch Visionen. Wer seine Stimme geh�rt hat, zweifelt nicht mehr an seiner Macht.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Wenn man das Kraut, das im Sumpf w�chst, einnimmt, ist man dem Schl�fer nahe und kann ihn h�ren. Manche sehen auch Bilder.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Verstehe.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "Wie komme ich zum Lager der Bruderschaft?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Wie komme ich zum Lager der Bruderschaft?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Ich bin gerade besch�ftigt. Aber Baal Parvez m�sste sich auch hier im Lager befinden.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Er ist in der N�he des Marktplatzes, auf der andern Seite der Burg. Ich glaube, er hat dort sogar 'ne eigene H�tte.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi, "Ein Novize namens Baal Parvez kann mich ins Sumpflager der Bruderschaft f�hren. Er h�lt sich am Marktplatz hinter der Burg des Alten Lagers auf.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "Ich muss in die Burg. Kannst du mir dabei helfen?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Ich muss in die Burg. Kannst du mir dabei helfen?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Ich f�rchte nicht, Bruder. Die einzigen von uns, die die Burg betreten d�rfen, sind diejenigen, die Gomez das Kraut liefern.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Wir ernten Sumpfkraut und verkaufen einen Teil davon ans Alte Lager, zum Austausch gegen Waren aus der Au�enwelt.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Wenn du einer der Kuriere w�rst, die f�r Cor Kalom arbeiten, k�nntest du in die Burg kommen. Aber dazu m�sstest du nat�rlich einer von uns sein.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //Was willst du �berhaupt in der Burg?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Ich will dort jemanden treffen."						,DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Ich habe einen Brief f�r den obersten Feuermagier."	,DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Ich will dort jemanden treffen.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //So? Wen? Und wieso wartest du nicht einfach, bis er rauskommt?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Das geht dich nichts an."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Es ist einer der Magier."	,DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Ich habe einen Brief f�r den obersten Feuermagier.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Ach? Und woher hast du den? Den haben dir die Magier gegeben, bevor sie dich hier reingeworfen haben, richtig?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Du bist ganz sch�n dumm, das so rum zu erz�hlen. Aber keine Sorge - ich behalt's f�r mich.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Nur tu dir selber einen Gefallen und erz�hl es keinem anderen, ja? Die Leute hier schneiden dir f�r so was die Kehle durch!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Die Belohnung, die es f�r eine Nachricht aus der Au�enwelt gibt, will jeder gerne kassieren.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //Es ist einer der Magier.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Oh! Tja, die kommen wirklich nie raus. Da musst du schon in die Burg rein.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Was willst du denn von denen? Magische Runen kaufen? Oder Tr�nke?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Das geht dich nichts an."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Stimmt genau."				,DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //Das geht dich nichts an.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Ist ja schon gut, Mann. Ich wollte dir nur helfen ...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Stimmt genau.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Wusste ich's doch! Was will ein Typ wie du auch sonst wohl von den Magiern.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Ich kann dir 'nen guten Rat geben: Vergiss die Magier. Die nehmen viel zu viel Erz f�r ihren Kram.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Bei uns im Lager kannst du viel billiger an magische Runen und Tr�nke herankommen.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
