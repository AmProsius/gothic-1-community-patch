// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "Ich will Schatten werden!"; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Ich will Schatten werden!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //Und?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Ich suche jemanden, der mir was beibringt."	,DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Kannst du mir dabei helfen?"					,DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Kannst du mir dabei helfen?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Ich wüsste nicht, wie ...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Ich suche jemanden, der mir was beibringt.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Wie kommst du auf mich?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Diego schickt mich.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Sag das doch gleich.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Wenn du im Lager aufgenommen werden willst, hilft es, wenn du ein geschickter Kämpfer oder Dieb bist.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Wenn die einflussreichen Schatten in diesem Lager dich auf die Probe stellen, werden sie dir Aufträge geben, bei denen du dich besser nicht erwischen lässt.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Deswegen ist für den Anfang der Weg des Diebes für dich vielversprechender.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Wie es der Zufall so will, bin ich der beste Dieb im ganzen Alten Lager.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Fingers kann mir die Talente der TASCHENDIEBSTAHL und SCHLÖSSER ÖFFNEN beibringen");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "Was kannst du mir beibringen?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Was kannst du mir beibringen?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //Kommt drauf an, was willst du wissen?



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Ich will lernen, mich lautlos zu bewegen." 								,DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Ich will lernen, mich lautlos zu bewegen.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Ich glaube - ohne falsche Bescheidenheit - ich bin einer der besten Diebe, die sie in die Kolonie geworfen haben.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Aber wenn es darum geht, zu lernen, wie man sich leise bewegt, ist Cavalorn der bessere Mann für dich!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Wie werde ich besser im Knacken von Schlössern?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Das willst du gerne wissen, hm? Ist für den Anfang nicht so schwer.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Du musst vor allem darauf achten, dass dir dein Dietrich nicht abbricht.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Wenn du in Zukunft mit weniger Gewalt an die Sache rangehst, wirst du merken, dass du weniger Dietriche verbrauchst!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Wie werde ich Meister im Öffnen von Schlössern?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Nur wer schon einige Übung hat, merkt genau, wann ihm ein Dietrich abbricht und wann nicht. Du erkennst es am Geräusch!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Ich denke, du bist jetzt so weit - lerne, auf das leise Klicken des Schlosses zu achten, und du wirst nur noch selten das Pech haben, einen Dietrich zu verlieren.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Ein Meister des Fachs hat eine gute Chance, eine Truhe zu öffnen, ohne dass sein Dietrich überhaupt abbricht.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Ich will ein guter Taschendieb werden!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //So, du willst also ein paar Leute um ihre Sachen erleichtern? Nun gut.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Ich werde dir beibringen, wie du besser wirst, aber es besteht immer noch eine Chance, dass du erwischt wirst.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Das Risiko solltest du nur eingehen, wenn außer deinem Opfer niemand sonst da ist.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Erst als Meister wirst du in der Lage sein, jemandem etwas aus der Tasche zu ziehen, ohne dass er es merkt!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Vergiss es! Ohne dass du schleichen kannst, wirst du NIEMALS ein geschickter Dieb.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Ich will ein Meister der Taschendiebe werden!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Ich denke, du bist gut genug, um in die letzten Geheimnisse eingeweiht zu werden.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Du solltest aber wissen, dass es selbst den Besten manchmal passiert, dass sie bemerkt werden.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Also pass auf dich auf.
	};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "Wo finde ich Cavalorn?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Wo finde ich Cavalorn?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Er jagt in der Wildnis. Du findest ihn auf dem Weg zum Neuen Lager. Westlich des Alten Lagers beginnt eine breite Schlucht.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //In dieser Schlucht steht eine alte Holzfällerhütte. Dort findest du ihn.
	
	B_LogEntry( GE_TeacherOW, "Cavalorn kann mir Schleichen beibringen. Seine Hütte steht in einer Schlucht westlich des Alten Lagers, auf dem Weg zum Neuen Lager.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "Du würdest nicht zufällig bei Diego ein gutes Wort für mich einlegen?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Du würdest nicht zufällig bei Diego ein gutes Wort für mich einlegen?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Ja. Du hast was gelernt, was dich wertvoll für uns macht.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Geschickte Diebe können wir hier im Lager brauchen. Meine Stimme ist dir sicher.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC, "Fingers ist sehr zufrieden mit meinen Fortschritten.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //Kommt drauf an ...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Wenn du zeigst, dass du als Dieb was gelernt hast, könnten wir dich schon brauchen!
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Wie soll ich das machen?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Lerne ein Diebestalent! Werde geschickter im Schleichen, im Taschendiebstahl oder im Öffnen von Schlössern. Dann werde ich dich dir meine Stimme geben.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC, "Fingers wird ein gutes Wort für mich einlegen, wenn ich ein Diebestalent lerne.");
	};
};




























