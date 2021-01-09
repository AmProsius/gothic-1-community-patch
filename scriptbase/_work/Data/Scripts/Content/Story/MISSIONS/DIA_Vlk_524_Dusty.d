// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dusty_Exit (C_INFO)
{
	npc			= Vlk_524_Dusty;
	nr			= 999;
	condition	= DIA_Dusty_Exit_Condition;
	information	= DIA_Dusty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dusty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Dusty_Hello (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Hello_Condition;
	information		= DIA_Dusty_Hello_Info;
	permanent		= 0;
	description		= "Hi! Ich bin neu hier - wie sieht's aus?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Hi! Ich bin neu hier - wie sieht's aus?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Ach hör auf! Ich hab' die letzten zwei Wochen in den Minen geschuftet. Und wofür?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Ein paar lausige Brocken Erz sind mir geblieben. Das meiste ging für Essen drauf.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Ich hab' mich mit Baal Parvez da unten unterhalten. Er hat mir ein paar interessante Sachen über das Lager der Sekte erzählt.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Ich glaube, ich sollte besser zu denen gehen, als mir weiter für Gomez den Rücken krumm zu schuften.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

INSTANCE DIA_Dusty_WhyNotLeave (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_WhyNotLeave_Condition;
	information		= DIA_Dusty_WhyNotLeave_Info;
	permanent		= 0;
	description		= "Dir gefällt's hier nicht? Wieso gehst du dann nicht einfach?";
};

FUNC INT DIA_Dusty_WhyNotLeave_Condition()
{	
	if	 Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Dir gefällt's hier nicht? Wieso gehst du dann nicht einfach?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Weil ich nicht sicher bin, was mich da erwartet. Ich habe 'nen Kumpel hier gehabt - Melvin heißt er. Er ist vor einer Woche ins Sektenlager abgehauen.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Aber ich habe seitdem nichts mehr von ihm gehört. Und so lange sich das nicht ändert, bleibe ich besser hier!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Dusty, ein Buddler aus dem Alten Lager ist dort sehr unzufrieden. Er spielt mit dem Gedanken sich der Bruderschaft im Sumpf anzuschließen.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

INSTANCE DIA_Dusty_MetMelvin (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_MetMelvin_Condition;
	information		= DIA_Dusty_MetMelvin_Info;
	permanent		= 0;
	description		= "Ich war im Lager der Sekte und hab' Melvin getroffen.";
};

FUNC INT DIA_Dusty_MetMelvin_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Melvin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_MetMelvin_Info()
{
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //Ich war im Lager der Sekte und hab' Melvin getroffen.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //Und? Was sagt er?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Es gefällt ihm anscheinend besser, als sich von den Gardisten schikanieren zu lassen.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //Hey, Mann! Er hat den ganzen Spaß ohne mich? Ich muss da hin. Aber ich komme nie aus dem Lager raus.
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //So? Warum nicht?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Die Gardisten haben spitz gekriegt, dass ich mich verdrücken will - schätze, ich hab' zu viel geredet.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Ich bräuchte mindestens 100 Erz, um die Wachen zu bestechen.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

INSTANCE DIA_Dusty_Offer100Ore (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Offer100Ore_Condition;
	information		= DIA_Dusty_Offer100Ore_Info;
	permanent		= 0;
	description		= "Was wäre, wenn ich dir die 100 Erz für die Wachen geben würde?";
};

FUNC INT DIA_Dusty_Offer100Ore_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_MetMelvin))
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_Offer100Ore_Info()
{
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //Was wäre, wenn ich dir die 100 Erz für die Wachen geben würde?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //Das würdest du tun? Warum?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Nun, sagen wir mal, du bist nicht der einzige, der dein dummes Grinsen gerne im Sektenlager sehen würde.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //Soll das heißen, du willst mit mir dahin gehen?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

INSTANCE DIA_Dusty_IWouldGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_IWouldGo_Condition;
	information		= DIA_Dusty_IWouldGo_Info;
	permanent		= 0;
	description		= "Ich WERDE mit dir zum Sektenlager gehen.";
};

FUNC INT DIA_Dusty_IWouldGo_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_IWouldGo_Info()
{
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //Ich WERDE mit dir zum Sektenlager gehen.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //Gut, Mann! Ich bin bereit. Wir können los, sobald du so weit bist.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Aber vergiss nicht - wir brauchen 100 Erz für die Wachen.

	B_LogEntry	(CH1_RecruitDusty,	"Ich konnte den Buddler Dusty dazu überreden, mit mir ins Sumpflager der Bruderschaft zu gehen. Allerdings werde ich die Torwachen mit etwas Erz zum wegsehen bewegen müssen. Am besten bringe ich ihn gleich direkt zu Baal Tondral.");
	B_GiveXP	(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

INSTANCE DIA_Dusty_LetsGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_LetsGo_Condition;
	information		= DIA_Dusty_LetsGo_Info;
	permanent		= 1;
	description		= "Ich bin bereit - lass uns gehen.";
};

FUNC INT DIA_Dusty_LetsGo_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_IWouldGo))
	&&	(Npc_GetDistToWP(hero, "OCR_MAINGATE_INSIDE") > 1500)
	&&	(Npc_GetDistToWP(hero, "OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_LetsGo_Info()
{
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Ich bin bereit - lass uns gehen.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Okay - lass uns durchs Südtor gehen - auf keinen Fall durchs Nordtor - die Wachen dort lassen sich garantiert nicht bestechen.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Und die Sache mit dem Erz regelst du am besten - ich bin nicht sehr gut in so was.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Gut - also los!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,	"Dusty warnte mich davor das Haupttor im Norden zu benutzen. Die Wachen am hinteren Südtor sind angeblich empfänglicher für Bestechungen.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

