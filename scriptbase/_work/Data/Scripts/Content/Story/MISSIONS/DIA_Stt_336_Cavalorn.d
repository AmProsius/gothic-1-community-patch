// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Jäger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Was machst du hier draußen?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Was machst du hier draußen?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Ich bin Jäger - ich jage vor allem Scavenger.
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "Kannst du mir was über die Jagd beibringen?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"Cavalorn ist Jäger. Von ihm kann ich ausser SCHLEICHEN noch BOGENSCHIESSEN lernen. Er lebt in einer Hütte zwischen Altem und Neuem Lager.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Kannst du mir was über die Jagd beibringen?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //Kommt drauf an - was willst du wissen?
	
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
	Info_AddChoice		(DIA_cavalorn_Lehrer,DIALOG_BACK															,DIA_cavalorn_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_cavalorn_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_cavalorn_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Kannst du mir beibringen, besser mit dem Bogen umzugehen?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Für einen Anfänger ist es nicht schwierig, besser zu werden. Es ist eine Frage der Haltung.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Die Füße schön weit auseinander, Arme auf eine Linie bringen, Luft anhalten und - Schuss!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //An bestimmten Stellen des Körpers reicht ein Schuss aus, um dein Ziel zu erlegen. Als Anfänger hast du nur eine kleine Chance, diese Stellen zu erwischen.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Aber wenn du meine Ratschläge beherzigst, wirst du beim nächsten Mal besser treffen.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Ich will lernen, mich lautlos zu bewegen.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Gute Entscheidung. Das ist vor allem wichtig, wenn du in Hütten eindringen willst oder dich von hinten an jemanden anschleichst.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Wenn du tief nach unten gehst, hast du den Boden besser im Blick und deinen Körper besser unter Kontrolle.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Aber in dieser Haltung wirst du natürlich sofort bemerkt, also, lass dich von keinem hier beim Schleichen sehen!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Beachte das, was ich dir sage und vor allem: Lass dich nie erwischen!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Du bist jetzt schon ein guter Jäger. Erfahre nun das letzte Wissen.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Um ein Meisterschütze zu werden, musst du aufhören, einer sein zu wollen.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Erkenne das Gesetz von Auge, Spannkraft, Flugbahn und Ziel. Sei immer auf der Hut, sei immer bereit.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Die Technik beherrscht du schon lange zur Genüge. Geh einfach hin und wende dein Wissen und Können an.
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Woher bekomme ich einen Bogen?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Woher bekomme ich einen Bogen?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Von mir. Ich verkaufe die besten Bögen des Alten Lagers.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn handelt mit BÖGEN und PFEILEN. Er hält sich in der Schlucht westlich des Alten Lagers auf dem Weg ins Neue Lager auf.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zeig mir deine Ware"; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Zeig mir deine Ware.
	
};  








