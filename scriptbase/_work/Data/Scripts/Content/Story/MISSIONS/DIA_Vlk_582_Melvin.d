// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Melvin_Exit (C_INFO)
{
	npc			= Vlk_582_Melvin;
	nr			= 999;
	condition	= DIA_Melvin_Exit_Condition;
	information	= DIA_Melvin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Melvin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Melvin_Hello (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Hello_Condition;
	information		= DIA_Melvin_Hello_Info;
	permanent		= 0;
	description		= "Hi! Du bist nicht aus diesem Lager, oder?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //Hi! Du bist nicht aus diesem Lager, oder?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //Jetzt schon! Ich bin vor 'ner Woche aus dem Alten Lager abgehauen. Hab' meinem Kumpel Dusty gesagt, er soll mitkommen, aber er wollte lieber noch warten.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Der Buddler Melvin hat sich der Bruderschaft angeschlossen. Sein Kumpel Dusty ist immer noch im Alten Lager, spielt aber ebenfalls mit dem Gedanken dort abzuhauen.");
};

// **************************************************
// 				Dusty getroffen
// **************************************************

INSTANCE DIA_Melvin_MetDusty (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_MetDusty_Condition;
	information		= DIA_Melvin_MetDusty_Info;
	permanent		= 0;
	description		= "Ich kenne Dusty - hab' mich kurz mit ihm unterhalten.";
};

FUNC INT DIA_Melvin_MetDusty_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Melvin_Hello)) && (Npc_KnowsInfo(hero,DIA_Dusty_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_MetDusty_Info()
{
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Ich kenne Dusty - hab' mich kurz mit ihm unterhalten.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Wenn du ihn noch mal triffst, sag ihm, er ist schön blöd, dass er dageblieben ist. Wenn das hier nicht zehnmal besser ist, als sich im Alten Lager von den Gardisten schikanieren zu lassen, dann weiß ich's auch nicht mehr.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Werd's ihm ausrichten, wenn ich ihn noch mal sehe.
};


