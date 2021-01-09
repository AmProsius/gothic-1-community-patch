// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Joru_Exit (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 999;
	condition	= DIA_Joru_Exit_Condition;
	information	= DIA_Joru_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Joru_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Was machst du?
// **************************************************

instance  DIA_Joru_Greet (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Greet_Condition;
	information	= DIA_Joru_Greet_Info;
	permanent	= 0;
	description = "Was machst du hier?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Was machst du hier?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Ich verbreite die Lehre des Schläfers an die Novizen.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Ich bin selbst noch Novize, aber bald bin ich ein Baal - einer der Gurus.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Ich habe sogar schon mit Y'Berion geredet. Er ist der Auserwählte. Er hat mir gesagt, wenn ich hart an mir arbeite, bin ich bald selbst ein Meister.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Aber ich schiebe das so'n bisschen vor mir her. Eilt ja nicht - verstehst du? Meister kann ich ja immer noch werden.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //Im Moment bin ich ganz zufrieden mit meiner jetzigen Aufgabe.
};

// **************************************************
//					Tester
// **************************************************

instance  DIA_Joru_Tester (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Tester_Condition;
	information	= DIA_Joru_Tester_Info;
	permanent	= 0;
	description = "Was ist deine Aufgabe hier?";
};                       

FUNC int  DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_Tester_Info()
{
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Was ist deine Aufgabe hier?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Ich teste mit den Jungs hier die neuen Substanzen, die Cor Kalom in seinem Alchimielabor entwickelt.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Sein Gehilfe bringt alle paar Tage was Neues raus. Und wir testen es dann.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //Dieses Kraut öffnet deinen Geist. Wenn du die richtige Menge einnimmst, kannst du in Kontakt mit dem Schläfer treten.
};

// **************************************************
//				Schonmal Kontakt?
// **************************************************

instance  DIA_Joru_SleeperContact (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_SleeperContact_Condition;
	information	= DIA_Joru_SleeperContact_Info;
	permanent	= 0;
	description = "Hattest du schon Kontakt zum Schläfer?";
};                       

FUNC int  DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_SleeperContact_Info()
{
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //Hattest du schon Kontakt zum Schläfer?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Nein. Bis jetzt noch nicht. Wir kriegen auch nie genug von dem Zeug.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalom will zwar immer von mir wissen, wie die Wirkung war, aber ich habe den Eindruck, meine Meinung interessiert ihn gar nicht so sehr.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Wenn ich die Wirkung anregend fand, gibt er das Zeug direkt weiter an die Gurus ...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Aber bald bin ich ja selber ein Guru, dann kann ich bis an meine Grenzen gehen und auch die Stimme des Schläfers vernehmen.
};


// **************************************************
//					JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance  DIA_Joru_JoinPsi (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JoinPsi_Condition;
	information	= DIA_Joru_JoinPsi_Info;
	permanent	= 0;
	description = "Ich will mich eurem Lager anschließen - kannst du mir dabei helfen?";
};                       

FUNC int  DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JoinPsi_Info()
{
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Ich will mich eurem Lager anschließen - kannst du mir dabei helfen?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Du willst bei uns mitmachen? Das ist gut! Warte mal ... Ja, ich glaube, ich kann dir helfen.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Ich bin zwar noch kein Guru, aber ich habe einigen Einfluss in der Bruderschaft.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Du müsstest mir einen kleinen Gefallen tun. Bist du schon bei Fortuno gewesen?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Nein."	,DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Ja."		,DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Dann hast du bestimmt schon deine tägliche Ration bekommen? Wenn du sie mir überlässt, sind wir im Geschäft.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Ich denke drüber nach.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Dann geh zu ihm und hol dir deine tägliche Ration ab. Wenn du mir alles Sumpfkraut überlässt, das er dir gibt, sind wir im Geschäft.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Ich denk drüber nach.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi, "Joru möchte meine tägliche Ration Sumpfkraut haben, die ich von Fortuno bekomme");
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Joru_JointsRunning (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JointsRunning_Condition;
	information	= DIA_Joru_JointsRunning_Info;
	permanent	= 1;
	description = "Ich habe Sumpfkraut bei mir. Du kannst es haben.";
};                       

FUNC int  DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JointsRunning_Info()
{
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //Ich habe Sumpfkraut bei mir. Du kannst es haben.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Gut! Du hast sicher schon bemerkt, dass so gut wie keiner der Gurus mit dir reden will.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Du kannst das ändern, indem du sie beeindruckst. Ich kann dir verraten, wie du das anstellst.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Drei Schwarzer Weiser waren ausgemacht, und nichts anderes! Besorg mir erst das Kraut, DANN sind wir im Geschäft!
	}; 
};

// **************************************************
//			Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance  DIA_Joru_ImpressGurus (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_ImpressGurus_Condition;
	information	= DIA_Joru_ImpressGurus_Info;
	permanent	= 1;
	description = "Wie kann ich die Gurus beeindrucken?";
};                       

FUNC int  DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_ImpressGurus_Info()
{
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Wie kann ich die Gurus beeindrucken?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar unterrichtet die Novizen in der Magie des Schläfers.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Wenn du seine Aufmerksamkeit willst, wende Magie an.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Aber blas ihm keine Windfaust um die Ohren! Versetze einen seiner Zuhörer in Schlaf oder so was.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib vorne am Haupttor ist einer der harten Brocken. Ich denke, bei ihm kann dir Lester helfen. Sprich ihn drauf an, wenn sein Meister gerade nicht dabei ist.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Die anderen Gurus sind eigentlich ganz in Ordnung - versuch dich einfach nützlich zu machen.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Danke für die Tipps.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Hey - eine Hand wäscht die andere.
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi, "Um Baal Cadar zu beeindrucken muss ich auf einen seiner Zuhörer einen Schlafzauber legen.");
		B_LogEntry	(CH1_JoinPsi, "Wie man Baal Namib am Haupttor beeindrucken kann, soll ich den Novizen Lester fragen. Allerdings nicht in der Nähe des Gurus!");
		Joru_JoinPsi = TRUE;
	};
	
	Joru_Tips = TRUE;
};

// **************************************************
//					Woher Magie?
// **************************************************

instance  DIA_Joru_GetMagic (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_GetMagic_Condition;
	information	= DIA_Joru_GetMagic_Info;
	permanent	= 1;
	description = "Wie komme ich an die Magie des Schläfers?";
};                       

FUNC int  DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
		B_LogEntry		(GE_TraderPSI,	"Baal Cadar verkauft RUNEN und SPRUCHROLLEN");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Wie komme ich an die Magie des Schläfers?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar verkauft Runen und Spruchrollen. Aber das nützt dir ja nicht viel, wenn er nicht mit dir redet, richtig?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Vielleicht kann einer der anderen Gurus dir helfen.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Weißt du, es ist ziemlich gut. Es öffnet deinen Geist für die Worte des Schläfers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit für eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 


	










