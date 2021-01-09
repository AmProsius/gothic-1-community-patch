// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //Hey, du!
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Was willst du?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Dich warnen. Wenn du hier weiter gehst, kommst du in unser Jagdgebiet.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "Was jagt ihr denn so?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //Was jagt ihr denn so?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //Meistens Scavenger. Sie geben 'ne Menge Fleisch ab. Außerdem sind sie nicht so schwer zur Strecke zu bringen - wenn man weiß, wie.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //So? Und wie?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Frag meinen Freund Drax hier - der weiß über solche Sachen besser Bescheid als ich.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "Was ist an diesem Gebiet so gefährlich?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Was ist an diesem Gebiet so gefährlich?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Du bist gerade angekommen, was? In der Kolonie gibt es unterschiedlich gefährliche Gebiete.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Auf den Wegen zwischen den Lagern ist es einigermaßen sicher. Aber auch dort kannst du ein paar Wölfen begegnen, die dich als leichte Beute sehen werden.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Und genau das bist du auch, bis du geeignete Waffen und Rüstung hast.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Wo kriege ich bessere Ausrüstung her?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Wo kriege ich bessere Ausrüstung her?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //Der nächste Ort ist das Alte Lager. Du musst nur dem Weg folgen, den du gekommen bist.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Aber bei uns im Neuen Lager bekommst du die Sachen billiger - wenn du die richtigen Leute kennst.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Wenn du ins alte Lager gehst, frag nach Mordrag. Er ist einer von uns. Er verkauft gute Ware für wenig Erz.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC, "Der Bandit Mordrag verkauft im Alten Lager Waren aller Art zu günstigen Preisen.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Erzähl mir mehr über die Gebiete der Kolonie.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Erzähl mir mehr über die Gebiete der Kolonie.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Wenn du zwischen den Lagern reist, solltest du eine Karte haben. So kannst du die Verbindungswege von den Sackgassen unterscheiden.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Die Sackgassen führen dich oft in gefährliche Schluchten, in denen du Kreaturen begegnen wirst, denen du am Anfang besser aus dem Weg gehst.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //Meide alte Ruinen, die Gegend hier ist voll davon. Die meisten sind alte Befestigungen aus dem ersten Ork-Krieg oder verlassene Ork-Behausungen.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //In diesen Ruinen treiben sich oft Orks herum - oder Schlimmeres. Vor allem nachts würde ich diese Plätze meiden.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //Und wenn du noch einen letzten Tipp willst - geh nicht in den Wald!
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "Wo kriege ich eine Karte her?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Wo kriege ich eine Karte her?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Frag im Alten Lager herum, ich glaube, da gibt es einen Kartenzeichner.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Vielleicht kannst du ihm ja eine seiner Karten klauen! Wenn du's schaffst, bring mir eine mit!
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte, "Wenn ich rankomme, ohne zu bezahlen, bringe ich mit, soviel ich tragen kann!" 	,Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte, "Wieso? - Verkauft er die Karten nicht?" 										,Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Wenn ich rankomme, ohne zu bezahlen, bringe ich mit, so viel ich tragen kann!
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Du gefällst mir! Du solltest dir überlegen, zu uns ins Neue Lager zu kommen! Wenn du mal da bist, frag nach Lares. Er kümmert sich um die Neuen. Er hat bestimmt was zu tun für dich!
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Wieso? - Verkauft er die Karten nicht?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Wenn du an genug Erz rankommst, um sie zu bezahlen ...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Danke für die Hilfe.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Danke für die Hilfe.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Glaub bloß nicht, dass hier alle so nett zu dir sind, Kleiner!
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Ist zwar nicht viel zu holen bei einem Neuen, aber einige hier würden dir sogar für eine alte Spitzhacke die Seele aus dem Leib prügeln.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Werd's mir merken.
};











