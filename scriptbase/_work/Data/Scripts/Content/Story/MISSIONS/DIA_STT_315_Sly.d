// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_315_Sly_Exit (C_INFO)
{
	npc			= STT_315_Sly;
	nr 			= 999;
	condition	= DIA_STT_315_Sly_Exit_Condition;
	information	= DIA_STT_315_Sly_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_315_Sly_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************

instance DIA_STT_315_Sly (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Condition;
	information		= DIA_STT_315_Sly_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_STT_315_Sly_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_Info()
{
	AI_SetWalkmode	(self, NPC_WALK);
	AI_GotoNpc		(self, other);
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Neu hier, was? Dein Gesicht kenne ich nicht.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Ich bin Sly. Ich hätte was zu tun für einen Neuen.
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************
	var int Sly_LostNek;
// **************************************************

INSTANCE DIA_STT_315_LostNek (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNek_Condition;
	information		= DIA_STT_315_LostNek_Info;
	permanent		= 0;
	description		= "Du hast was zu tun für mich? Um was geht's?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Du hast was zu tun für mich? Um was geht's?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Einer unserer Gardisten ist verschwunden! Er heißt Nek. Er könnte ins Neue Lager übergelaufen sein.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Du bist neu hier und kommst viel rum. Also halt die Augen offen.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Wenn du ihn findest, leg' ich ein gutes Wort für dich hier im Lager ein.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Ich werd sehen, ob ich ihn finde."				,DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"Was kann ein gutes Wort von dir denn bewirken?"	,DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //Was kann ein gutes Wort von dir bewirken?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Wenn du hier im Lager aufgenommen werden willst, brauchst du Leute, die für dich sprechen.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Ein gutes Wort von mir über dich bei Diego kann da schon einiges helfen.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Ich werd sehen, ob ich ihn finde.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Wenn du Fletcher triffst, frag ihn über Nek. Er hat sein Viertel übernommen, seit Nek verschwunden ist.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Wo finde ich ihn?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Sein Viertel ist das Arenaviertel.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek, "Der Schatten Sly hat mir versprochen, ein gutes Wort bei Diego für mich einzulegen, wenn ich Nek finde. Der Gardist könnte zum Neuen Lager übergelaufen sein. Fletcher aus dem Arenaviertel sollte ich nach Nek fragen.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek, "Der Schatten Sly hat mich beauftragt, den verschwundenen Gardisten Nek zu finden.Der Gardist könnte zum Neuen Lager übergelaufen sein. Fletcher aus dem Arenaviertel sollte ich nach Nek fragen.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNek );
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						SUCCESS
// **************************************************

INSTANCE DIA_STT_315_LostNekSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNekSuccess_Condition;
	information		= DIA_STT_315_LostNekSuccess_Info;
	permanent		= 1;
	description		= "Ich hab' Nek gefunden.";
};

FUNC INT DIA_STT_315_LostNekSuccess_Condition()
{	
	if ( (Sly_LostNek == LOG_RUNNING) && (Npc_HasItems(other,Neks_Amulett) > 0) )
	{
		return 1;
	};
};

func VOID DIA_STT_315_LostNekSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Ich hab' Nek gefunden.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //Gut! Hast du dafür Beweise?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Nein - ich befürchte nicht."					,DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Ich hab' ein Amulett bei ihm gefunden - hier."	,DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Ich hab' ein Amulett bei ihm gefunden - hier.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //Genau um dieses Amulett ging es mir. Du bist ein schlauer Junge.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Du hättest auf die Idee kommen können, das Amulett zu behalten, aber du hast die richtige Entscheidung getroffen.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Wenn Diego mich nach dir fragt, werd' ich dir meine Stimme geben.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek, "Ich habe Sly das Amulett von Nek gegeben. Er war überrascht von meiner Ehrlichkeit.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC, "Ich habe Sly das Amulett von Nek gegeben. Er wird mit Diego sprechen und ein gutes Wort für mich einlegen.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC, "Ich habe Sly das Amulett von Nek gegeben, allerdings bringt mir das Nichts, denn im Alten Lager werde ich nicht mehr aufgenommen.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Nein - ich befürchte nicht. 
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //So? Du willst mir doch nicht etwas vorenthalten? Nek hat ein Schutzamulett bei sich.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Ich mag nicht, wenn man mir etwas vorenthält, was mir gehört. Solltest du das Amulett finden, bring es mir!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Ich werd an dich denken, wenn ich das Amulett in der Hand halte.
	
	B_LogEntry( CH1_LostNek, "Sly will ein Amulett von Nek haben.");
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************

instance DIA_STT_315_Sly_AfterSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_AfterSuccess_Condition;
	information		= DIA_STT_315_Sly_AfterSuccess_Info;
	permanent		= 1;
	description		= "Wie läuft's denn so?";
	
};

FUNC int DIA_STT_315_Sly_AfterSuccess_Condition()
{
	if ( (Kapitel == 1) && (Sly_LostNek == LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_AfterSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Wie läuft's denn so?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Gut! Bei mir brauchst du dir wegen Diego keine Sorgen mehr zu machen!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Eine Hand wäscht die andere, denke ich.
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //So ist es.
};


	
	
	




		
		
