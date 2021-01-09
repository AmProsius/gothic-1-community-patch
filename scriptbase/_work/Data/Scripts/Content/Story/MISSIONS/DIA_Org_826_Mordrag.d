// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Hey, Neuer! Ich bin Mordrag. Meinen Namen solltest du dir merken - ich kann dir gute Ware aller Art günstig verkaufen!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Zeig mir deine Ware.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Zeig mir deine Ware.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Such dir was aus ...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,	"Bandit Mordrag verhökert am Marktplatz Diebesgut");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FÜR MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "Stimmt es, dass du Kurier für die Magier bist?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Stimmt es, dass du Kurier für die Magier bist?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //Und wenn es so wäre?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Ich würde gerne mal Gelegenheit haben, mit den Magiern zu reden. Ich muss in die Burg.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Die Kuriere der Magier haben ein Siegel, dass ihnen Zutritt zur Burg erlaubt. Wenn du einer von uns wärst, könntest du so ein Siegel bekommen ...
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "Du hast ein Problem.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //Du hast ein Problem.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Ach? Und das wäre?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Es gibt Leute hier, die wollen, dass du dich hier nie wieder blicken lässt.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //So? Dann sag doch den Leuten, sie sollen jemanden schicken, der ihren Willen auch durchsetzt.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //Wie kommst du darauf, dass ich das nicht tue?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Weil ich denke, dass du ein schlauer Junge bist. Du wirst schnell erkennen, dass es Besseres gibt, als für Gomez zu arbeiten.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //Bei uns im Neuen Lager können wir fähige Leute genauso gut brauchen, und dort gibt es niemanden, der dir sagt, was du zu tun und zu lassen hast.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Erzähl mir was über das Neue Lager.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Erzähl mir was über das Neue Lager.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Es ist das freieste Lager in der Kolonie. Wir haben keine Erzbarone oder Gurus, die uns herumkommandieren.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Wir haben eine eigene Mine. Aber das Erz, das wir dort fördern, wird nicht an den verdammten König geliefert!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //Sondern?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Unsere Magier arbeiten an einem Ausbruchsplan. Dafür wird alles Erz gesammelt.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Während Gomez und seine Leute auf der faulen Haut liegen, rackern wir uns für die Freiheit ab - so sieht's aus.
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "Und wenn ich mich dem Neuen Lager anschließen will, ...";//könntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //Und wenn ich mich dem Neuen Lager anschließen wollte, könntest du mir dabei helfen ...
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Wenn du's wirklich ernst meinst, können wir direkt losgehen. Ich kann dich zu Lares bringen. Er ist der Kopf unserer Bande.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Aber wenn du lieber versuchen willst, mich aus dem Lager zu prügeln - bitte.
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Lass uns zum Neuen Lager gehen!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Lass uns zum Neuen Lager gehen!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Gut! Folge mir.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Mordrag hat sich bereit erklärt, mir den Weg zum neuen Lager zu zeigen. Ich hoffe, dass er mich nicht in eine Falle locken will!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //So, hier sind wir.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Ich dachte schon, du kommst nie an! Egal - wir sind hier!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Wenn du durch das Tor gehst, kommst du ins Neue Lager. Sprich mit Lares. Er wird dir weiterhelfen. Hier - gib ihm das hier von mir. Es ist ein wertvoller Ring.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //Er ist deine Eintrittskarte zu Lares. Ohne guten Grund kommst du nicht zu ihm.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Wenn ich's mir so recht überlege - ich glaub', ich bleib' 'ne Weile hier. Ich hab' fürs Erste genug verdient und im Alten Lager wird's langsam heiß.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Wenn du Lust hast, triff mich in der Kneipe - das Haus direkt auf dem See. Mach's gut!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Wir sehen uns.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC, "Wir stehen nun vor dem Tor des Neuen Lagers. Für den Fall, dass ich wirklich in das Neue Lager aufgenommen werden will, gab mir Mordrag einen Ring, den ich dem Anführer der Banditen mit Namen Lares bringen soll. Mordrag will erst mal hier bleiben und ist ab jetzt in der Kneipe auf dem See zu finden.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "In diesem Lager ist nicht genug Platz für uns beide!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //In diesem Lager ist nicht genug Platz für uns beide!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Bitte, was?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight, "Mach dass du aus diesem Lager verschwindest!" 					,Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight, "Hier ist kein Platz für Leute, die die Erzbarone bestehlen!" 	,Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight, "Thorus schickt mich. Er will dich für immer loswerden." 		,Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Mach, dass du aus diesem Lager verschwindest!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Große Worte für einen kleinen Mann ...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Hier ist kein Platz für Leute, die die Erzbarone bestehlen!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //Ach, so ist das! Sag das doch gleich ...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Thorus schickt mich. Er will dich für immer loswerden.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //So? Thorus also? Das war alles, was ich wissen wollte ...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Mach, dass du wegkommst ...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Ich habe Mordrag bewusstlos geschlagen und ihm gesagt, er soll sich nie wieder im alten Lager blicken lassen.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Lares hat eine Nachricht für dich.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares hat eine Nachricht für dich.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Lass hören.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Er will wissen, was im Lager der Sekte vorgeht. Er sagt, du sollst dich darum kümmern.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Ich hab' so ein Gefühl, als wenn sich die Sache von alleine erledigt ...

	B_LogEntry	(CH1_JoinNC,	"Habe Mordrag gesagt was Lares mir aufgetragen hat. Er faselte etwas davon, dass sich die Sache von selbst regelt. Keine Ahnung, was er damit meint!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares sagt, ich soll dich bei der Sektensache unterstützen.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares sagt, ich soll dich bei der Sektensache unterstützen.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Siehst du ... Ich dachte mir, ich müsste mich nicht selbst drum kümmern.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Soll ich die Sache ganz allein erledigen?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Das schaffst du schon. Hör zu: Es geht darum, rauszufinden, was an dieser ganzen Beschwörungsklamotte dran ist.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Ich weiß, dass die Sektenspinner eine große Anrufung planen. Ich persönlich glaube ja nicht an den Schläfer - aber eins steht fest:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Die Gurus sind mit mächtiger Magie im Bunde. Und es ist besser, wenn wir wissen, was da abgeht. Soweit alles klar?

	B_LogEntry			(CH1_GotoPsiCamp,	"Mordrag hat die Spitzelaufgabe im Sumpflager geschickt auf mich abgewälzt. Die Gurus scheinen eine große Beschwörung vorzubereiten, aber was da dran ist, sollte ich besser genauer in Erfahrung bringen.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Hast du genauere Anweisungen?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Werd' sehen was ich rausfinden kann.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Hast du genauere Anweisungen?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Rede mit Lester. Ich war mal 'ne Zeit lang im Sektenlager. Er hat mir damals geholfen. Er ist einer von den Guten.
	B_LogEntry(CH1_GotoPsiCamp,	"Im Lager der Bruderschaft soll ich einen Novizen namens Lester ansprechen. Er scheint vertrauenswürdig zu sein und hat Mordrag in der Vergangenheit auch schon mal geholfen.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Werd' sehen, was ich rausfinden kann.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Sobald du genau weißt, was sie im Schilde führen, melde dich.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "Wegen der Sektensache...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //Wegen der Sektensache ...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Was gibt's?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //Die große Beschwörung hat stattgefunden.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Nein! Du machst bei dem Schwachsinn mit?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Sie wollen mit der Hilfe eines mächtigen Elixiers, das sie aus Minecrawlereiern gewinnen, ihre geistigen Kräfte stärken und Kontakt zum Schläfer herstellen.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Ich lach' mich tot! Diese Spinner glauben wirklich daran, was?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Ich bin neugierig, was dabei rauskommt.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Ich auch. Sag mir Bescheid, wenn sich die Gurus bis auf die Knochen blamiert haben.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,	"Mordrag hat sich halbtotgelacht, als ich ihm von den Minecrawlereiern erzählte. Er scheint allerdings kein großes Interesse mehr an der Spitzelei bei den Gurus zu haben. Ich betrachte den Auftrag einfach als erledigt!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Ich hab' noch nichts rausgefunden.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Bleib dran ...
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
