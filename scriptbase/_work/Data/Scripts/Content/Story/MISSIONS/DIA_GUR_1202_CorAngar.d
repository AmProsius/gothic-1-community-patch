//#####################################################################
//##
//##
//##							KAPITEL 1
//##
//##
//#####################################################################

// ************************ EXIT **************************

instance DIA_GUR_1202_CorAngar_Exit (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 999;
	condition	= DIA_GUR_1202_CorAngar_Exit_Condition;
	information	= DIA_GUR_1202_CorAngar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GUR_1202_CorAngar_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_GUR_1202_CorAngar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************	
//		Sp�ter Trainer 
// ************************

instance DIA_CorAngar_LaterTrainer (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_LaterTrainer_Condition;
	information	= DIA_CorAngar_LaterTrainer_Info;
	permanent	= 0;
	description = "Kannst du mich trainieren?";
};                       

FUNC int DIA_CorAngar_LaterTrainer_Condition()
{
	return 1;
};

FUNC VOID DIA_CorAngar_LaterTrainer_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_LaterTrainer_15_00"); //Kannst du mich trainieren?
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_01"); //Du willst ein starker K�mpfer werden und bist auf der Suche nach jemandem, der dich unterweist.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_02"); //Das ist gut. Aber ich bin NICHT derjenige, den du suchst.
	AI_Output(self,other,"GUR_1202_CorAngar_LaterTrainer_08_03"); //Ich opfere meine Zeit nur denen, die dem heiligen Kreis der Templer angeh�ren.
};

// ************************	
//		Wie Templer
// ************************

instance DIA_CorAngar_WieTempler (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= DIA_CorAngar_WieTempler_Condition;
	information	= DIA_CorAngar_WieTempler_Info;
	permanent	= 1;
	description = "Wie werde ich in den Kreis der Templer aufgenommen?";
};                       

FUNC int DIA_CorAngar_WieTempler_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_CorAngar_LaterTrainer) && (Npc_GetTrueGuild(other) != GIL_TPL) )
	{
		return 1;
	};
};

FUNC VOID DIA_CorAngar_WieTempler_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_WieTempler_15_00"); //Wie werde ich in den Kreis der Templer aufgenommen?
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_01"); //Du musst eine Zeit lang als Novize gedient haben, um deinen Glauben an den Schl�fer unter Beweis zu stellen.
	AI_Output(self,other,"GUR_1202_CorAngar_WieTempler_08_02"); //Dann kehre zu mir zur�ck, und ich werde dich unterweisen.
	AI_StopProcessInfos	( self );
};

/////////////////////////////////
/////////////////////////////////
//////// Kapitel 2 //////////////
/////////////////////////////////
/////////////////////////////////

//-------------------------------------------------------------------------
//							ST�RKE UND DEX STEIGERN
//-------------------------------------------------------------------------
INSTANCE GUR_1202_CorAngar_Teach(C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 10;
	condition	= GUR_1202_CorAngar_Teach_Condition;
	information	= GUR_1202_CorAngar_Teach_Info;
	permanent	= 1;
	description = "Kannst du meine St�rke und mein Geschick trainieren?";
};                       

FUNC INT GUR_1202_CorAngar_Teach_Condition()
{
	if (C_NpcBelongsToPsiCamp(hero))  
	{
		return TRUE;
	};
};

FUNC VOID GUR_1202_CorAngar_Teach_Info()
{
	AI_Output(other,self,"GUR_1202_CorAngar_Teach_15_00"); //Kannst du meine St�rke und mein Geschick trainieren?
	AI_Output(self,other,"GUR_1202_CorAngar_Teach_08_01"); //Kampfkraft und Wendigkeit sind die Vorraussetzungen f�r jeden K�mpfer.
	
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_BACK()
{
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
};

func void GUR_1202_CorAngar_Teach_STR_1()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_STR_5()
{
	B_BuyAttributePoints(other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_1()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

func void GUR_1202_CorAngar_Teach_DEX_5()
{
	B_BuyAttributePoints(other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GUR_1202_CorAngar_Teach);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,DIALOG_BACK									,GUR_1202_CorAngar_Teach_BACK);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,GUR_1202_CorAngar_Teach_STR_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GUR_1202_CorAngar_Teach_STR_1);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_5);
	Info_AddChoice		(GUR_1202_CorAngar_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GUR_1202_CorAngar_Teach_DEX_1);
};

//--------------------------------------------------------------
// TEMPLER WERDEN
//--------------------------------------------------------------
instance  GUR_1202_CorAngar_WANNABETPL (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WANNABETPL_Condition;
	information		= GUR_1202_CorAngar_WANNABETPL_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich m�chte Templer werden"; 
};

FUNC int  GUR_1202_CorAngar_WANNABETPL_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	&& (Npc_GetTrueGuild (hero) == GIL_NOV)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_WANNABETPL_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WANNABETPL_Info_15_01"); //Ich m�chte Templer werden!
	
	if	(hero.level < 10)
	{ 
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_02"); //Du bist noch nicht bereit. Wenn du erfahrener geworden bist, werde ich dich aufnehmen.
	    GUR_1202_CorAngar_WANNABETPL.permanent = 1;
    }
    else if	(hero.level >= 10)
    {
	    AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_03"); //Die Zeit ist gekommen, da du aufgenommen wirst.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_04"); //Du solltest eins wissen: Templer zu sein, bedeutet nicht nur gut k�mpfen zu k�nnen und das Lager zu besch�tzen. Wir sind die auserw�hlte Wache des Schl�fers. Die H�ter des Geistes.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_05"); //Wir nutzen unsere geistige und unsere k�rperliche Kraft zu gleichen Teilen. Nur ein Mann, dessen K�rper und Geist sich in Einklang befinden, kann ein aufrechter Templer sein.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_06"); //Es freut mich, dass du es in so kurzer Zeit geschafft hast, so weit zu kommen, dass du nun bereit bist, einer der Unseren zu werden.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_07"); //Und vergiss nicht: ein konzentrierter Geist in einem gest�hlten K�rper widersteht jeder Bedrohung.
		AI_Output		(self, other,"GUR_1202_CorAngar_WANNABETPL_Info_08_08"); //Gehe nun zu Gor Na Toth am �bungsplatz. Er wird dir deine neue R�stung geben.
		GUR_1202_CorAngar_WANNABETPL.permanent = 0;
		Npc_SetTrueGuild(hero, GIL_TPL);
		hero.guild = GIL_TPL;

		Log_CreateTopic	(GE_BecomeTemplar,	LOG_NOTE);
		B_LogEntry		(GE_BecomeTemplar,	"Heute hat mich Cor Angar zu einem Templer ernannt. Gor Na Toth soll mir meine neue R�stung �berreichen. Er h�lt sich normalerweise am �bungsplatz auf.");
		Log_CreateTopic	(GE_TeacherPSI,		LOG_NOTE);
		B_LogEntry		(GE_TeacherPSI,		"Cor Angar unterrichtet ST�RKE, GESCHICK und den ZWEIH�NDIGEN Kampf. Diesen aber nur, wenn ich im EINH�NDIGEN Kampf gemeistert bin. Man kann ihn normalerweise auf dem �bungsplatz der Templer auf der zweiten Stegebene finden.");
	};

};

//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND1 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND1_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1,	LPCOST_TALENT_2H_1,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND1_Info_15_01"); //Ich m�chte den Umgang mit dem Zweih�nder lernen.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_02"); //Der Kampf mit zweih�ndigen Waffen setzt nicht nur ein Mindestma� an St�rke und Geschick voraus.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_03"); //Um eine zweih�ndige Waffe zu f�hren, musst du nicht nur deinen K�rper, sondern auch deinen Geist beherrschen.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_04"); //Nur wenn du K�rper und Geist ganz beherrscht, kannst du das Talent lernen.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND1_Info_08_05"); //Konzentration ist der Schl�ssel. K�rper und Geist verschmelzen in Konzentration zusammen.

		GUR_1202_CorAngar_ZWEIHAND1.permanent		= 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GUR_1202_CorAngar_ZWEIHAND2 (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_ZWEIHAND2_Condition;
	information		= GUR_1202_CorAngar_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2,	LPCOST_TALENT_2H_2,0); 
};

FUNC int  GUR_1202_CorAngar_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_TPL)
	{
		return TRUE;
	};

};
FUNC void  GUR_1202_CorAngar_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_ZWEIHAND2_Info_15_01");		//Ich m�chte mehr �ber den zweih�ndigen Kampf lernen.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_02"); //Den Tanz mit der Klinge beherrscht du nun. Jetzt werde ich dir die Meisterschaft des Kampfes zeigen.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_03"); //Nutze deine geistige Kraft, um die Bewegungen des Gegners vor dem Angriff zu erkennen.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_04"); //Zu wissen, wie dein Gegner k�mpft, ist der halbe Sieg �ber ihn.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_05"); //Sei schnell, deine Bewegungen m�ssen �berraschend und flie�end sein, deine Schl�ge pr�zise und hart.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_06"); //Lerne den Schmerz zu ignorieren. Dein Wille ist es, der letztendlich �ber den Ausgang des Kampfes entscheidet.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_07"); //Bewahre die Ruhe. Nur wenn du ruhig und konzentriert in einen Kampf gehst, wirst du ihn auch �berleben.
		AI_Output			(self, other,"GUR_1202_CorAngar_ZWEIHAND2_Info_08_08"); //Setze dein Talent mit Vorsicht ein. Und denke daran: Wer den Kampf fordert, kommt durch den Kampf um.

		GUR_1202_CorAngar_ZWEIHAND2.permanent = 0;

		AI_StopProcessInfos	(self);
		B_PracticeCombat	("PSI_PATH_6_7");
	};
};  

  
  
  
  
//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
 
// **************************************************************************
// 				nach der gro�en Beschw�rung
// **************************************************************************
instance  GUR_1202_CorAngar_SENDS (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_SENDS_Condition;
	information		= GUR_1202_CorAngar_SENDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie geht es jetzt weiter?"; 
};

FUNC int  GUR_1202_CorAngar_SENDS_Condition()
{	
	if	(Kapitel == 3)
	&&	(CorAngar_GotoOGY == FALSE)
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_SENDS_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_01"); //Wie geht es jetzt weiter?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_02"); //Die Vision war sehr verschwommen und gab mehr R�tsel auf, als dass sie uns Antworten brachte.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_03"); //Aber eines war klar. Mann konnte einen Ork in einer H�hle erkennen. Es gibt eine alte verlassene Kultst�tte der Orks ganz hier in der N�he.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_04"); //Fr�her haben dort die Orks ihre Verstorbenen beigesetzt, daher nennen wir dieses H�hlensystem den Ork-Friedhof.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_05"); //Der Guru Baal Lukor ist mit einigen Templern dorthin aufgebrochen. Vielleicht finden wir dort etwas, das uns hilft, die Vision besser zu verstehen.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_06"); //Ich brauche jemanden, der dort nach dem Rechten sieht und mir von der Situation berichtet.
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_Info_15_07"); //Warum gehst du nicht selber? Du bist doch der Anf�hrer der Templer!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_08"); //Meine Aufgabe ist es, den Erleuchteten zu sch�tzen. Ich bleibe hier bei Y'Berion und wache �ber ihn.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_09"); //Du hast dem Lager schon gro�e Dienste erwiesen. Ich vertraue dir mehr als jedem anderen hier.
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_Info_08_10"); //Ich bitte dich, gehe zum Ork-Friedhof und berichte mir, was die Templer dort gefunden haben.
	
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Was springt f�r mich dabei raus?",	GUR_1202_CorAngar_SENDS_EARN);
	Info_AddChoice		(GUR_1202_CorAngar_SENDS,"Ich mache mich sofort auf den Weg!",	GUR_1202_CorAngar_SENDS_KNOW);
};  
func void GUR_1202_CorAngar_SENDS_EARN()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_EARN_Info_15_01"); //Was springt f�r mich dabei raus?
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_EARN_Info_08_02"); //Du willst Erz? Anscheinend habe ich mich in dir get�uscht. Aber ich brauche dich. Hier, 100 Erz. Mehr gibt es nicht!
	CreateInvItems		(self,ItMiNugget,100);
	B_GiveInvItems      (self, hero, ItMiNugget,100);
};

func void GUR_1202_CorAngar_SENDS_KNOW()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_SENDS_KNOW_Info_15_01"); //Ich mache mich sofort auf den Weg!
	AI_Output			(self, other,"GUR_1202_CorAngar_SENDS_KNOW_Info_08_02"); //Bevor du losgehst, nimm diesen Ring. Er m�ge dich im Kampf sch�tzen!
	
	B_Story_GotoOrcGraveyard();

	CreateInvItem		(self, Schutzring_Geschosse1);
	B_GiveInvItems      (self, hero, Schutzring_Geschosse1, 1);
	Info_ClearChoices	(GUR_1202_CorAngar_SENDS);
};
	
instance  GUR_1202_CorAngar_WHERE (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_WHERE_Condition;
	information		= GUR_1202_CorAngar_WHERE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wo ist der Ork Friedhof?"; 
};

FUNC int  GUR_1202_CorAngar_WHERE_Condition()
{	
	if ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_SENDS) )
	{
		return 1;
	};

};
FUNC void  GUR_1202_CorAngar_WHERE_Info()
{
	AI_Output			(other, self,"GUR_1202_CorAngar_WHERE_Info_15_01"); //Wo ist der Ork-Friedhof?
	AI_Output			(self, other,"GUR_1202_CorAngar_WHERE_Info_08_02"); //Nicht weit von hier. Der Novize Talas kennt den Weg. Du findest ihn unten auf dem Vorplatz des Tempels. Er wird dich dort hinf�hren.

	B_LogEntry		(CH3_OrcGraveyard,	"Der Novize Talas wird mir den Weg zum Ork-Friedhof zeigen. Er wartet auf dem Tempelvorplatz auf mich.");
};  

// **************************************************************************
// 				nach dem Ork-Friedhof
// **************************************************************************
instance  GUR_1202_CorAngar_AFTER (C_INFO)
{
	npc				= GUR_1202_CorAngar;
	condition		= GUR_1202_CorAngar_AFTER_Condition;
	information		= GUR_1202_CorAngar_AFTER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich war im Ork Friedhof"; 
};

FUNC int  GUR_1202_CorAngar_AFTER_Condition()
{
	  
	if   ( BaalLukor_BringParchment == 4 ) 
	{
		return	1;
	};
};

FUNC void  GUR_1202_CorAngar_AFTER_Info()
{
	
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_01"); //Ich war im Ork-Friedhof. Dort gibt es NICHTS. Keinen Schl�fer, kein Zeichen, gar nichts.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_02"); //Was ist mit Baal Lukor und den Templern?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_03"); //Sie sind alle tot.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_04"); //Tot? Aber warum, was ist dort vorgefallen?
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_05"); //Im gesamten H�hlensystem wimmelte es von Orks. Sie haben alle Templer get�tet.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_06"); //Baal Lukor und ich, wir haben �berlebt, aber auf einmal drehte Baal Lukor v�llig durch.
	AI_Output			(other, self,"GUR_1202_CorAngar_AFTER_Info_15_07"); //Er schrie, der Schl�fer h�tte ihm befohlen, mich zu t�ten, und das wollte er dann auch tun.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_08"); //Offensichtlich kam er mit der gro�en Entt�uschung, nichts gefunden zu haben, nicht zurecht.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_09"); //Ich glaube nicht, dass der Einfluss des Schl�fers solch grausame Taten verursacht.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_10"); //Es darf nicht ... darf nicht ... EGAL!
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_11"); //Die Hauptsache ist, dass Baal Lukor in seinem Wahn keinen Erfolg hatte.
	AI_Output			(self, other,"GUR_1202_CorAngar_AFTER_Info_08_12"); //Y'Berion ist nun unsere einzige Hoffnung.
	 

	B_GiveXP			(XP_ReportToCorAngar);
	B_Story_BackFromOrcGraveyard();
};  
	
// **************************************************************************
// 				MISSION: Find Herb
// **************************************************************************
INSTANCE Info_CorAngar_FindHerb (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Condition;
	information	= Info_CorAngar_FindHerb_Info;
	permanent	= 0;
	important 	= 0;
	description = "Wie steht es um Y'Berion?";
};

func INT Info_CorAngar_FindHerb_Condition()
{
	  
	if   ( Npc_KnowsInfo (hero,GUR_1202_CorAngar_AFTER) )
	{
		return	1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Info()
{
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_01"); //Wie steht es um Y'Berion?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_02"); //Er wird nicht von alleine erwachen. Und er wird immer schw�cher. Ich wei�, wie ich ihn wachbekommen kann, aber dazu brauche ich deine Hilfe.
	AI_Output			(other, self,"Mis_3_NC_CorAngar_FindHerb_15_03"); //Was ist zu tun?
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_04"); //Besorge mir die Heilkr�uter aus dem Sumpf. F�nf von der st�rksten Sorte sollten gen�gen!
	AI_Output			(self, other,"Mis_3_NC_CorAngar_FindHerb_08_05"); //Und bitte beeile dich!
	AI_StopProcessInfos	(self);
	CorAngar_FindHerb = LOG_RUNNING;
	
	Log_CreateTopic		(CH3_FindHerbs,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_RUNNING);
	B_LogEntry		(CH3_FindHerbs,	"Y'Berion liegt immer noch im Koma. Cor Angar bat mich, f�nf Heilkr�uter der st�rksten Sorte zu sammeln.");
};

// ---------------------------- FindHerb - WHERE ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_WHERE (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_WHERE_Condition;
	information	= Info_CorAngar_FindHerb_WHERE_Info;
	permanent	= 0;
	important	= 0; 
	description = "Wo findet man solche Pflanzen ?";
};                       

FUNC INT Info_CorAngar_FindHerb_WHERE_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_WHERE_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_WHERE_15_01"); //Wo findet man solche Pflanzen ?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_02"); //Suche im Sumpf hinter dem Lager. Du musst sehr tief hineingehen aber pass auf, dass dich die Sumpfhaie nicht erwischen.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_WHERE_08_03"); //Und jetzt verliere nicht noch mehr Zeit. Geh!
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Die ben�tigten Heilkr�uter f�r Y'Berion wachsen tief im Sumpf hinter dem Lager der Bruderschaft. Allerdings gibt es dort die gef�hrlichen Sumpfhaie. Ich muss die Augen offen halten.");
};

// ---------------------------- FindHerb - LOOK ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_LOOK (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_LOOK_Condition;
	information	= Info_CorAngar_FindHerb_LOOK_Info;
	permanent	= 0;
	important	= 0; 
	description = "Wie kann ich diese Kr�uter erkennen?";
};                       

FUNC INT Info_CorAngar_FindHerb_LOOK_Condition()
{
	if ( (CorAngar_FindHerb==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Herb_03)<5) )
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_LOOK_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_LOOK_15_01"); //Wie kann ich diese Kr�uter erkennen?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_02"); //Sie sehen aus wie ein Stern und tragen acht gr�ne und orangefarbene Bl�tter.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_LOOK_08_03"); //Nun geh aber los.
	AI_StopProcessInfos	(self);

	B_LogEntry		(CH3_FindHerbs,	"Die Heilkr�uter sehen aus wie ein Stern mit vier gr�nen und vier orangefarbenen Bl�ttern.");
};



// ---------------------------- RUNNING ---------------------------------------
INSTANCE Info_CorAngar_FindHerb_Running (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	nr			= 1;
	condition	= Info_CorAngar_FindHerb_Running_Condition;
	information	= Info_CorAngar_FindHerb_Running_Info;
	permanent	= 1;
	important	= 0; 
	description = "Ich habe noch nicht genug Heilkr�uter gefunden";
};                       

FUNC INT Info_CorAngar_FindHerb_Running_Condition()
{
	if	(CorAngar_FindHerb==LOG_RUNNING)
	&&	(Npc_HasItems(other,ItFo_Plants_Herb_03)<5)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_WHERE)
	&&	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_LOOK)
	{
		return 1;
	};
};

FUNC VOID Info_CorAngar_FindHerb_Running_Info()
{
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Running_15_01");//Ich habe noch nicht genug Heilkr�uter gefunden
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_02");//Vielleicht hat auch Fortuno, der Kr�uterh�ndler, zurzeit einige davon in seinen Regalen.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Running_08_03");//Beeil dich. Ich brauche f�nf St�ck. Y'Berion bleibt nicht mehr viel Zeit.
	AI_StopProcessInfos	(self);

	//-------- Fortuno die Kr�uter "unterschieben" --------
	if	!Fortuno_HasYBerionHerbs
	{
		var C_NPC	fortuno;
		fortuno = Hlp_GetNpc(Nov_1357_Fortuno);
		CreateInvItems		(fortuno,	ItFo_Plants_Herb_03,	5);	

		Fortuno_HasYBerionHerbs = TRUE;
		B_LogEntry		(CH3_FindHerbs,	"Fortuno der Kr�uterh�ndler der Bruderschaft k�nnte solche Heilkr�uter haben.");
	};
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_CorAngar_FindHerb_Success (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_FindHerb_Success_Condition;
	information	= Info_CorAngar_FindHerb_Success_Info;
	permanent	= 0;
	description	= "Ich habe die Heilkr�uter f�r Y'Berion.";
};                       

FUNC INT Info_CorAngar_FindHerb_Success_Condition()
{
	if ( Npc_HasItems ( other, ItFo_Plants_Herb_03 ) >= 5 ) && ( CorAngar_FindHerb == LOG_RUNNING )
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_FindHerb_Success_Info()
{	
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_01"); //Ich habe die Heilkr�uter f�r Y'Berion.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_02"); //Gut gemacht. Als du unterwegs warst, ist Y'Berion kurzzeitig erwacht.
	AI_Output			(other, self,"Info_CorAngar_FindHerb_Success_15_03"); //Hat er was gesagt?
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_04"); //Ja, er sagte, das der Schl�fer nicht der ist, f�r den wir ihn halten. Wir d�rfen nicht weiter versuchen, ihn zu erwecken.
	AI_Output			(self, other,"Info_CorAngar_FindHerb_Success_08_05"); //Jetzt k�nnen wir nur noch hoffen, das es noch nicht zu sp�t f�r Y'Berion ist.
	Yberion_dead = LOG_RUNNING;

	B_GiveInvItems	(other, self, ItFo_Plants_Herb_03, 5 );
	Npc_RemoveInvItems(self, ItFo_Plants_Herb_03, 5 );
	B_GiveXP  			(XP_FindHerbs);

	CorAngar_FindHerb = LOG_SUCCESS;
	
	B_LogEntry		(CH3_FindHerbs,	"Ich habe Cor Angar ausreichend der dringend ben�tigten Heilkr�uter �bergeben. Jetzt k�nnen wir nur noch hoffen, dass ich nicht zu sp�t kam.");
	Log_SetTopicStatus	(CH3_FindHerbs,	LOG_SUCCESS);

	//-------- Versuch YBerion zu heilen... --------
	var C_NPC YBerion; 	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	AI_Wait				(self,	1);
	AI_GotoNpc			(self,	YBerion);
	AI_TurnToNpc		(self,	YBerion);
	AI_PlayAni			(self,	"T_PLUNDER");
	AI_WaitTillEnd		(self,	YBerion);
	//YBerion.attribute[ATR_HITPOINTS] = 0;
	//AI_StartState		(YBerion,	ZS_Dead,	0,	"");

	//-------- ...scheitert. YBerion ist tot --------
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_00"); //Y'BERION IST TOT. Unser geistiger Anf�hrer ist von uns gegangen!
	AI_TurnToNpc		(self, other);
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_01"); //Selbst deine schnelle Hilfe konnte seinen Tod nicht mehr verhindern!
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_02"); //Was jetzt, Cor Angar?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_03"); //Ich habe Y'Berion immer vertraut. Kurz bevor er starb, legte er all seine Hoffnungen in den Ausbruchsplan der Wassermagier.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_04"); //Dann sollten wir die Wassermagier bei ihrem Vorhaben unterst�tzen.
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_05"); //Sie werden den Fokus und den Almanach ben�tigen. Beides befindet sich noch in Cor Kaloms Besitz.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_06"); //Wo ist Cor Kalom?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_07"); //Er ist mit einigen Templern v�llig zornerf�llt aufgebrochen, um einen eigenen Weg zum Schl�fer zu finden.
	AI_Output			(other, self,"GUR_1202_CorAngar_DEATH_Info_15_08"); //Verdammt, wie sollen wir jetzt an den Fokus kommen?
	AI_Output			(self, other,"GUR_1202_CorAngar_DEATH_Info_08_09"); //Ich sch�tze, er lie� Buch und Fokus in seinem Labor zur�ck. Hier ist der Schl�ssel f�r seine Truhe.

	CreateInvItem		(self,			ITKE_PSI_KALOM_01); 
	B_GiveInvItems		(self,	other,	ITKE_PSI_KALOM_01,	1);
};
 
// ------------------------------ TELEPORT ----------------------------------
INSTANCE Info_CorAngar_TELEPORT (C_INFO)
{
	npc			= GUR_1202_CorAngar;
	condition	= Info_CorAngar_TELEPORT_Condition;
	information	= Info_CorAngar_TELEPORT_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT Info_CorAngar_TELEPORT_Condition()
{
	if	Npc_KnowsInfo(hero,Info_CorAngar_FindHerb_Success)
	{
		return TRUE;
	};	
};

FUNC VOID Info_CorAngar_TELEPORT_Info()
{	
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); //Einen Moment noch!
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_02"); //Ja?
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); //Nimm diese Zauberrune als Zeichen unseres Dankes f�r deine gro�en Taten.
	AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_04"); //Damit kannst du dich jederzeit schnell und bequem auf unseren Tempelvorplatz teleportieren.
	AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); //Ich danke dir!

	//-------- Spieler wird losgeschickt --------
	B_Story_SentToNC	();
};
 
