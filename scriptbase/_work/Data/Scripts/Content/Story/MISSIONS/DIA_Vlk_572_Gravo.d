// **************************************************
//						 EXIT 
// **************************************************

instance DIA_Gravo_Exit (C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 999;
	condition		= DIA_Gravo_Exit_Condition;
	information		= DIA_Gravo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT DIA_Gravo_Exit_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hallo
// **************************************************

instance DIA_Gravo_Hallo(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_Hallo_Condition;
	information		= DIA_Gravo_Hallo_Info;
	permanent		= 0;
	description 	= "Wie steht's denn so?";
};                       

FUNC INT DIA_Gravo_Hallo_Condition()
{
	return 1;
};

func VOID DIA_Gravo_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gravo_Hallo_15_00"); //Wie steht's denn so?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_01"); //Seit ich aufgehört habe, in der Mine zu arbeiten, lässt sich's hier richtig gut leben.
	AI_Output (other, self,"DIA_Gravo_Hallo_15_02"); //Und woher kriegst du dein Erz?
	AI_Output (self, other,"DIA_Gravo_Hallo_04_03"); //Ich helfe Leuten, die Probleme haben.
	AI_Output (self, other,"DIA_Gravo_Hallo_04_04"); //Wenn du hier Ärger mit einflussreichen Leuten hast, kann ich dafür sorgen, dass die Sache wieder ins Lot kommt.
};

// **************************************************
//						HelpHow
// **************************************************

instance DIA_Gravo_HelpHow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpHow_Condition;
	information		= DIA_Gravo_HelpHow_Info;
	permanent		= 0;
	description 	= "Wenn ich hier Ärger habe, kannst DU mir also helfen? Wie?";
};                       

FUNC INT DIA_Gravo_HelpHow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpHow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpHow_15_00"); //Wenn ich hier Ärger habe, kannst DU mir also helfen? Wie?
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_01"); //Nun - sagen wir mal, du hast Ärger mit Thorus. Du solltest es besser nie dazu kommen lassen, aber man weiß ja nie, was passiert.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_02"); //Thorus kann ziemlich stur sein - wenn du's dir einmal mit ihm verscherzt hast, redet er nicht mehr mit dir. Das ist schlecht.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_03"); //Denn als Neuer bist du auf ihn angewiesen. Also kommst du zu mir. Ich kenne 'ne Menge Leute hier, die Einfluss auf Thorus haben.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_04"); //Die legen ein gutes Wort für dich ein und Thorus ist wieder auf deiner Seite. Natürlich wollen die Jungs dafür Erz sehen. Dein Erz.
	AI_Output (self, other,"DIA_Gravo_HelpHow_04_05"); //Und ICH kümmere mich darum, dass dein Erz die richtigen Leute erreicht ...

	B_LogEntry(GE_TraderOC,	"Der Buddler Gravo verkauft eine Dienstleistung besonderer Art. Wenn ich es mir bei wichtigen Leuten im Alten Lager verscherzt habe, kann ich ihn bezahlen, um den Streit beizulegen.");
};

// **************************************************
//						HelpAngryNow
// **************************************************

//---------------------------------------------------
func void B_Gravo_HelpAttitude(var C_NPC prob)
{
	if (Npc_GetPermAttitude(prob, other)==ATT_ANGRY)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_00"); //Stimmt, er ist nicht besonders gut auf dich zu sprechen.
		AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_01"); //Ich werd' zusehen, dass sich ein paar Leute mal mit ihm unterhalten. 100 Erz und ich erledige die Sache.
		if (Npc_HasItems(other,itminugget)>=100)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_02"); //Lass sehen, wie viel du hast ... Ah! Das sollte reichen. Betrachte die Sache als erledigt.
			AI_Output (self, other,"B_Gravo_HelpAttitude_ANGRY_04_03"); //Und sprich mit keinem darüber. Tu einfach so, als wär' nichts passiert.
			B_GiveInvItems (hero, self, itminugget, 100);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //So viel hab' ich nicht.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Dann kann ich nichts für dich tun - tut mir Leid, Junge.
		};
		
	}
	else if (Npc_GetPermAttitude(prob, other)==ATT_HOSTILE)
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_00"); //Ärger ist gar kein Ausdruck, Junge. Er würde dir am liebsten den Kopf abreißen.
		AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_01"); //Wenn ich ein paar Jungs davon überzeugen soll, ihn wieder gut zu stimmen, wird das nicht billig. 500 Erz musst du schon hinlegen.
		if (Npc_HasItems(other,itminugget)>=500)
		{
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_02"); //Lass sehen, wie viel du hast ... Du scheinst ein reicher Bursche zu sein. Ich nehme die 500 und kümmere mich drum.
			AI_Output (self, other,"B_Gravo_HelpAttitude_HOSTILE_04_03"); //Und noch was: Er darf nie erfahren, dass ICH die Sache für dich geregelt habe - also rede mit KEINEM darüber!
			B_GiveInvItems (hero, self, itminugget, 500);
			Npc_SetPermAttitude(prob,ATT_NEUTRAL);
		}
		else
		{
			AI_Output (other, self,"B_Gravo_HelpAttitude_NoOre_15_01"); //Soviel hab' ich nicht.
			AI_Output (self, other,"B_Gravo_HelpAttitude_NoOre_04_02"); //Dann kann ich nichts für dich tun - tut mit leid, Junge.
		};
	}
	else
	{
		AI_Output (self, other,"B_Gravo_HelpAttitude_NoProb_04_00"); //Soweit ich weiß, hat er kein Problem mit dir - mach dir keine Sorgen.
	};
};

//---------------------------------------------------

instance DIA_Gravo_HelpAngryNow(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 1;
	condition		= DIA_Gravo_HelpAngryNow_Condition;
	information		= DIA_Gravo_HelpAngryNow_Info;
	permanent		= 1;
	description 	= "Kannst du mir helfen - ich glaub, ich hab' Ärger.";
};                       

FUNC INT DIA_Gravo_HelpAngryNow_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_HelpHow))
	{
		return 1;
	};
};

func VOID DIA_Gravo_HelpAngryNow_Info()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_15_00"); //Kannst du mir helfen - ich glaub, ich hab' Ärger.
	AI_Output (self, other,"DIA_Gravo_HelpAngryNow_04_01"); //Ich denke schon, aber ich warne dich, die Sache kann dich zwischen 100 und 500 Erz kosten.
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, DIALOG_BACK			,DIA_Gravo_HelpAngryNow_BACK);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Mit Diego."			,DIA_Gravo_HelpAngryNow_Diego);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Mit Thorus"			,DIA_Gravo_HelpAngryNow_Thorus);
	Info_AddChoice	 (DIA_Gravo_HelpAngryNow, "Mit Gomez"			,DIA_Gravo_HelpAngryNow_Gomez);
};

func void DIA_Gravo_HelpAngryNow_BACK()
{
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Diego()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Diego_15_00"); //Mit Diego.
	var C_NPC diego; diego = Hlp_GetNpc (PC_Thief);
	B_Gravo_HelpAttitude(diego);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Thorus()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Thorus_15_00"); //Mit Thorus.
	var C_NPC thorus; thorus = Hlp_GetNpc (Grd_200_Thorus);
	B_Gravo_HelpAttitude(thorus);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

func void DIA_Gravo_HelpAngryNow_Gomez()
{
	AI_Output (other, self,"DIA_Gravo_HelpAngryNow_Gomez_15_00"); //Mit Gomez.
	var C_NPC gomez; gomez = Hlp_GetNpc (Ebr_100_Gomez);
	B_Gravo_HelpAttitude(gomez);
	
	Info_ClearChoices(DIA_Gravo_HelpAngryNow );
};

// **************************************************
//						Influence
// **************************************************

instance DIA_Gravo_Influence(C_INFO)
{
	npc				= Vlk_572_Gravo;
	nr				= 2;
	condition		= DIA_Gravo_Influence_Condition;
	information		= DIA_Gravo_Influence_Info;
	permanent		= 1;
	description 	= "Kannst du mir sagen, wer hier zu den einflussreichen Leuten gehört?";
};                       

FUNC INT DIA_Gravo_Influence_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gravo_Hallo))
	{
		return 1;
	};
};

func VOID DIA_Gravo_Influence_Info()
{
	AI_Output (other, self,"DIA_Gravo_Influence_15_00"); //Kannst du mir sagen, wer von den Schatten hier zu den einflussreichen Leuten gehört?
	AI_Output (self, other,"DIA_Gravo_Influence_04_01"); //Du willst die richtigen Leute beeindrucken, he?
	AI_Output (self, other,"DIA_Gravo_Influence_04_02"); //Diego hat von allen Schatten am meisten zu melden. Zu seinen Vertrauten zählen Fingers, Whistler und Sly.
	AI_Output (self, other,"DIA_Gravo_Influence_04_03"); //Dexter und Fisk verscherbeln ihre Sachen auf dem Marktplatz. Sie haben viele Kunden, selbst unter den Gardisten und sind dementsprechend einflussreich.
	AI_Output (self, other,"DIA_Gravo_Influence_04_04"); //Und dann wäre da noch Scatty, er leitet die Arena, bestimmt wer kämpft und so. Es gibt viele hier, die ihm noch Erz schulden - auch an ihn kannst du dich halten.
	
	Log_CreateTopic (GE_TraderOC, LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Dexter und Fisk handeln mit verschiedenen Waren am Marktplatz.");

	
};











