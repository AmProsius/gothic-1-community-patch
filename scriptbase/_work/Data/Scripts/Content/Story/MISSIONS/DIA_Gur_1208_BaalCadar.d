// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalCadar_Exit (C_INFO)
{
	npc			= Gur_1208_BaalCadar;
	nr			= 999;
	condition	= DIA_BaalCadar_Exit_Condition;
	information	= DIA_BaalCadar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungl�ubiger) 
// ************************************************************
	var int BaalCadar_Ansprechbar;
	var int BaalCadar_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalCadar_NoTalk(C_INFO)
{
	npc				= GUR_1208_BaalCadar;
	nr				= 2;
	condition		= DIA_BaalCadar_NoTalk_Condition;
	information		= DIA_BaalCadar_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalCadar_NoTalk_Condition()
{
	if	Npc_IsInState(self,ZS_TALK)
	&&	(BaalCadar_Ansprechbar==FALSE)
	&&	(Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY)
	&&	(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalCadar_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalCadar_NoTalk);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,DIALOG_ENDE					,DIA_BaalCadar_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Alles, klar, Alter?"			,DIA_BaalCadar_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Der Schl�fer sei mit dir!"	,DIA_BaalCadar_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"Hi! Ich bin neu hier!"		,DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Hi_15_00"); //Hi! Ich bin neu hier!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Sleeper_15_00"); //Der Schl�fer sei mit dir!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Sleeper_02_01"); //
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Imp_15_00"); //Alles klar, Alter? 
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Imp_02_01"); //
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

/*


	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_01"); //Du solltest deinen Weg mit Bedacht w�hlen und nach reiflicher �berlegung. 
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_02"); //Bedenke wie du entscheidest. In den anderen Lagern bekommst zwar Schutz und Nahrung, aber ist es das, was du willst?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_15_03"); //Was erwartet mich, was es wert w�re, zu euch zu kommen?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_04"); //Ich k�nnte dir jetzt erz�hlen, das die Templer einen unbezwinglichen Willen haben,das die magische Macht der Gurus, die Vorstellungskraft von Feuer- und Wassermagiern bei weitem �bersteigt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_05"); //Das unsere Nahrung auch satt macht. Aber das ist es nicht, was diese Gemeinschaft ausmacht.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_06"); //Was dich hier erwartet, ist die Gabe. Du wirst einen Weg beschreiten, der dir sehr viel abverlangt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_07"); //Aber das was du erreichen wirst ist eine Gr��e, eine Macht die dir Erleuchtung schenkt. Eine Macht, die dich zur Freiheit f�hrt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_08"); //Ist es nicht das, was du willst?... Freiheit?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_09"); //Also solltest du nicht die Frage stellen, warum du her kommen solltest, die Frage ist viel mehr, warum solltest du nicht?
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    (GE_TeacherPSI,"Baal Cadar kann mir zeigen, wie ich meine geistige Kraft verbessern kann.");
*/

// **************************************************
// 						 Sleep Spell
// **************************************************

INSTANCE DIA_BaalCadar_SleepSpell (C_INFO)
{
	npc			= Gur_1208_BaalCadar;
	nr			= 1;
	condition	= DIA_BaalCadar_SleepSpell_Condition;
	information	= DIA_BaalCadar_SleepSpell_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_BaalCadar_SleepSpell_Condition()
{
	var C_NPC Nov1336; Nov1336=Hlp_GetNpc(Nov_1336_Novize);
	var C_NPC Nov1340; Nov1340=Hlp_GetNpc(Nov_1340_Novize);
	var C_NPC Nov1345; Nov1345=Hlp_GetNpc(Nov_1345_Novize);
	
	if ( Npc_IsInState(Nov1336,ZS_MagicSleep) || Npc_IsInState(Nov1340,ZS_MagicSleep) || Npc_IsInState(Nov1345,ZS_MagicSleep) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalCadar_SleepSpell_Info()
{
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_00"); //Was tust du? Ich versuche hier gerade mit meinen Sch�lern zu meditieren.
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_01"); //Wer hat dir beigebracht, die Magie des Schl�fers zu wirken?
	AI_Output (other, self,"DIA_BaalCadar_SleepSpell_15_02"); //Niemand. Es war ganz leicht.
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_03"); //Du scheinst ein sehr gelehriger Sch�ler zu sein. Ich werde dich unterrichten.

	BaalCadar_Ansprechbar = TRUE;
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry		(CH1_JoinPsi,	"Baal Cadar h�lt mich f�r einen gelehrigen Sch�ler!");
	B_GiveXP		(XP_ImpressBaalCadar);
};

/*------------------------------------------------------------------------
						MANA								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_Teach (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_Teach_Condition;
	information		= Gur_1208_BaalCadar_Teach_Info;
	permanent		= 1;
	description		= "Ich will lernen, die Kraft meiner Magie zu steigern."; 
};

FUNC int  Gur_1208_BaalCadar_Teach_Condition()
{	
	if	(BaalCadar_Ansprechbar == TRUE)
	||	(Npc_GetTrueGuild(other) != GIL_NONE)
	{
		return TRUE;
	};
};
FUNC void  Gur_1208_BaalCadar_Teach_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_Teach_Info_15_01"); //Ich will lernen, die Kraft meiner Magie zu steigern.
	AI_Output (self, other,"Gur_1208_BaalCadar_Teach_Info_02_02"); //Die Kraft deines Geistes ist der Schl�ssel dazu.
	
	if (log_baalcadartrain == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"Der Guru Baal Cadar kann mir helfen, meine MANA zu steigern");
		log_baalcadartrain = TRUE;
	};
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
};
func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);

};
/*------------------------------------------------------------------------
							DIE KREISE DER BRUDERSCHAFT									
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_FIRSTTEST (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information		= Gur_1208_BaalCadar_FIRSTTEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Lehre mich die Magie der Runen."; 
};

FUNC int  Gur_1208_BaalCadar_FIRSTTEST_Condition()
{	
	if	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_FIRSTTEST_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01"); //Lehre mich die Magie der Runen.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02"); //Die Sprache der Runen zu lernen, verm�gen viele, doch nur wenige verstehen ihre Magie.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03"); //Ich werde es mit dir versuchen.
	
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    	(GE_TeacherPSI,	"Baal Cadar kann mich die magischen KREISE der Runenmagie lehren.");
		
};

/*------------------------------------------------------------------------
							DER ERSTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS1 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS1_Condition;
	information		= Gur_1208_BaalCadar_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich bin bereit f�r den ersten Kreis"; 
};

FUNC int  Gur_1208_BaalCadar_KREIS1_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&&	(Npc_KnowsInfo (hero,Gur_1208_BaalCadar_FIRSTTEST))
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS1_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS1_Info_15_01"); //Ich bin bereit f�r den ersten Kreis.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_02"); //H�re meine Worte:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_03"); //Der Schl�fer erschien vor langer Zeit und gab den Menschen eine Vision.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_04"); //Viele wollten seine Zeichen jedoch nicht sehen, weil sie von der Gier nach Erz geblendet waren.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_05"); //Nur Y'Berion und eine Hand voll anderer machten sich auf und gr�ndeten die Bruderschaft.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_06"); //In dem Augenblick, als sie dem Ruf des Schl�fers folgten, entstand der erste Kreis. Die Magie der Runen offenbart sich demjenigen, der dem Schl�fer folgt.
		Gur_1208_BaalCadar_KREIS1.permanent = 0;
	};
	AI_StopProcessInfos	( self );

};
/*------------------------------------------------------------------------
							DER ZWEITE KREIS									
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS2 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS2_Condition;
	information		= Gur_1208_BaalCadar_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich bin bereit f�r den zweiten Kreis"; 
};

FUNC int  Gur_1208_BaalCadar_KREIS2_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS2_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS2_Info_15_01"); //Ich bin bereit f�r den zweiten Kreis.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_02"); //Dann h�re und begreife:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_03"); //Der Schl�fer f�hrte Y'Berion und seine getreuen Anh�nger an diesen Ort. Hier lie�en sie sich nieder.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_04"); //Sie arbeiteten ohne Unterlass, Tage, Wochen Monate. Und das Lager wuchs heran. Mehr M�nner kamen dazu, die dem Ruf des Schl�fers gefolgt waren.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_05"); //Und zusammen versuchten sie, durch Gebet und Meditation den Schl�fer auf spiritueller Ebene zu treffen.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_06"); //Das war die Geburtsstunde des zweiten Kreises.
		Gur_1208_BaalCadar_KREIS2.permanent = 0;
	};
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							DER DRITTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS3 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS3_Condition;
	information		= Gur_1208_BaalCadar_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich bin bereit f�r den dritten Kreis"; 
};

FUNC int  Gur_1208_BaalCadar_KREIS3_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 2)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS3_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS3_Info_15_01"); //Ich bin bereit f�r den dritten Kreis.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_02"); //Achte das Wort:
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_03"); //Die Visionen wurden deutlicher, jedoch war die geistige Kraft der Br�der nicht ausreichend f�r einen Kontakt.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_04"); //Einer der Gurus, ein Alchemist, fand einen Weg. Mit Hilfe eines Elixiers aus dem Sekret der Minecrawler, das die Br�der vor dem Gebet einnahmen, wurde es erstmalig m�glich, die geistigen Kr�fte zu vereinen.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_05"); //Zur gleichen Zeit machten sich die Novizen auf in die Lager, die Worte des Schl�fers zu predigen, um mehr Ungl�ubige von der Wahrheit zu �berzeugen.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_06"); //Dadurch wurde der dritte Kreis vollendet.
	};
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
						DER VIERTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS4 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS4_Condition;
	information		= Gur_1208_BaalCadar_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich bin bereit f�r den vierten Kreis"; 
};

FUNC int  Gur_1208_BaalCadar_KREIS4_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 3)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS4_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS4_Info_15_01"); //Ich bin bereit f�r den vierten Kreis.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_02"); //Seit der Gr�ndung des Lagers ist viel Zeit vergangen. Viel hat sich ge�ndert.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_03"); //Der Glaube ist gewachsen, hat sich gefestigt und wurde weitergetragen.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_04"); //Und wir haben unser Ziel nie aus den Augen verloren, haben nicht aufgegeben, den Schl�fer zu rufen.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_05"); //Die Best�ndigkeit und Festigung des Glaubens, das ist der vierte Kreis.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_06"); //Du wei�t nun alles, was ein Bruder �ber Magie wissen muss. Du warst ein gelehriger Sch�ler.
		Gur_1208_BaalCadar_KREIS4.permanent = 0;
	};

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  Gur_1208_BaalCadar_SELLSTUFF (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information		= Gur_1208_BaalCadar_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Gur_1208_BaalCadar_SELLSTUFF_Condition()
{	
	if	(BaalCadar_Ansprechbar == TRUE)
	||	(Npc_GetTrueGuild(other) != GIL_NONE)
	{
		return TRUE;
	};
};
FUNC void  Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if  (log_baalcadarsell == FALSE)
	{
		Log_CreateTopic   	(GE_TraderPSI,LOG_NOTE);
		B_LogEntry			(GE_TraderPSI,"Der Guru Baal Cadar verkauft RUNEN, SPRUCHROLLEN, TR�NKE, AMULETTE und RINGE.");
		log_baalcadarsell = TRUE;
	};	
	AI_Output (other, self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01"); //Ich m�chte Schriften �ber Magie erwerben.

};  






     
