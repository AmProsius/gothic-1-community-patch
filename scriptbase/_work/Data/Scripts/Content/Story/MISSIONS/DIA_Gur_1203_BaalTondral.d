// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "Nichts sagen";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Du siehst nicht aus wie einer, der sein Leben bereits unter die Knechtschaft der Erzbarone gestellt hat.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Du siehst aus wie ein Suchender. Du siehst aus wie einer, der den wahren Glauben sucht. Spürst du nicht das Feuer in dir, das dir nachts den Schlaf raubt?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Ich sehe, dass du an dem zweifelst, was dir die Knechte der Erzbarone als wahr und gerecht verkaufen wollen. Du weißt auch warum. Weil es Lügen sind!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Es sind Lügen, mit denen sie den Geist derer beherrschen, die schwach sind. Dein Glaube ist stärker als ihre Lügen!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Fühlst du nicht jeden Tag den Wunsch nach Freiheit? Fühlst du wie er jeden Tag wächst? Er lenkt deinen Geist. Lass es geschehen!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Weißt du, was du tust, wenn du ihn beherrscht? Du verleugnest deine Seele. Du verleugnest dich selbst! Hör auf, im Schatten deiner Ängste zu leben.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Mach dich frei. Verstehe! Der Schläfer WIRD erwachen, er wird dir die Freiheit bringen, und das ganze ungläubige Pack wegschwemmen.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Wie Unrat, der vom Regen weggespült wird, werden sie vom Antlitz dieser Welt verschwinden und sie werden klagen und jammern und bereuen, aber dann ist es zu spät.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Dann werden sie zahlen. Mit ihrem Blut. Und ihrem Leben.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "Hey! Du hast mich angesprochen. Heißt das, ich kann jetzt mit dir reden?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hey! Du hast mich angesprochen. Heißt das, ich kann jetzt mit dir reden?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Ich sehe, du hast dich mit unseren Regeln vertraut gemacht. Das ist gut.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Ich spüre große geistige Kraft in dir! Du kannst schon bald ein Mitglied unserer Gemeinschaft sein.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Ich habe dich angesprochen weil ich dir Gelegenheit geben will, uns deine Loyalität zu beweisen.
};

// **************************************************
// 				Loyalität beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "Wie kann ich dir meine Loyalität beweisen?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //Wie kann ich dir meine Loyalität beweisen?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Was wir am dringendsten brauchen, sind neue Seelen, die sich unserer Gemeinschaft anschließen.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Wenn du dafür sorgst, dass ein weiterer Mann unserem Lager beitritt, hast du deinen Willen, unsere Gemeinschaft zu bereichern, unter Beweis gestellt.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Baal Tondral schickt mich ins Alte Lager um einen neuen Mann für die Bruderschaft anzuwerben. Ich schätze das ist eine gute Gelegenheit, seine Gunst zu gewinnen!");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "Wo kann ich neue Leute für die Bruderschaft anwerben?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Wo kann ich neue Leute für die Bruderschaft anwerben?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Das alte Lager ist ein guter Ort dafür. Denn viele, die dort leben, sind der Angst und der Lügen überdrüssig, sie müssen nur ein wenig unterstützt werden.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //Im Neuen Lager wirst du wahrscheinlich weniger Glück haben. Die Männer, die dort leben sind Barbaren.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "Wieso braucht ihr so dringend neue Leute?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Wieso braucht ihr so dringend neue Leute?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Der Schläfer hat unserem Meister offenbart, dass er eine wichtige Nachricht für uns hat.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Aber er ist noch nicht zu seiner vollen Stärke erwacht, und so braucht er UNSERE Kraft, um mit uns in Kontakt treten zu können.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Deswegen bereiten wir eine große Anrufung vor und je mehr Männer daran teilnehmen, umso eher werden wir Erfolg haben.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Wenn du mehr darüber erfahren willst, geh zum großen Platz vor dem Tempelberg. Aber störe nicht den Meister bei der Meditation!
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "Ich habe hier jemanden, der dich kennen lernen möchte, Meister!";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Ich habe hier jemanden, der dich kennen lernen möchte, Meister!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Wen bringst du zu mir? Ist er würdig?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Er bedarf sicherlich noch eurer geistigen Führung, Meister.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Gut. Von heute an soll er zu meinen Schülern zählen.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Von heute an wirst du dich täglich vor meiner Hütte einfinden und meinen Worten lauschen. Deine Seele ist noch zu retten.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Heißt das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC lösen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,	"Dusty ist jetzt ein Schüler von Baal Tondral. Damit ist meine Aufgabe erledigt.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "Meister! Ich will in die Bruderschaft aufgenommen werden.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Meister! Ich will in die Bruderschaft aufgenommen werden. Ich brauche eure Stimme.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Du hast dich als würdig erwiesen. Cor Kalom soll dir die Robe geben.

	B_LogEntry(CH1_JoinPsi,	"Baal Tondral hält mich für würdig, die Robe eines Novizen zu tragen!");
};








