// **************************************
//					EXIT 
// **************************************

instance DIA_Lefty_Exit (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Lefty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First At Night
// **************************************

instance DIA_Lefty_FirstAtNight (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_FirstAtNight_Condition;
	information	= DIA_Lefty_FirstAtNight_Info;
	permanent	= 0;
	description = "Was machst du hier?";
};                       

FUNC int DIA_Lefty_FirstAtNight_Condition()
{
	if	(Wld_IsTime(19,00,08,00))
	&&	(!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_FirstAtNight_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Was machst du hier?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Ich arbeite für den Reislord.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //Hast du Arbeit für mich?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Wir sprechen uns noch!
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************

instance DIA_Lefty_First (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_First_Condition;
	information	= DIA_Lefty_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Lefty_First_Condition()
{
	if	(Wld_IsTime(08,00,19,00))
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_First_Info()
{
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Hey, du! Neu hier, was? Auf den Reisfeldern brauchen wir noch jemanden, der den Bauern Wasser bringt.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //Da kannst du dir direkt ein paar Freunde machen. Was denkst du?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,	"Lefty, ein ziemlich großkotziger Bandit aus dem neuen Lager will, dass ich den Bauern auf den Reisfeldern Wasser bringe.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Vielleicht später."				,DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Bring dein Wasser selbst rum!"	,DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Klar, ich helfe gerne."			,DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Klar, ich helfe gern.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //Gut! Geh zum Reislord. Er gibt dir das Wasser und erzählt dir alles andere.
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,	"Obwohl es vermutlich eine stupide Aufgabe ist, habe ich zugesagt, um mir vielleicht ein paar Freunde zu machen. Das zu verteilende Wasser soll ich vom sogenannten 'Reislord' abholen.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Bring dein Wasser selbst rum!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //So geht man aber nicht mit Freunden um! Ich glaube, ich muss dir mal Manieren beibringen!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,	"Als ich Leftys 'Angebot' ablehnte, wurde er ziemlich ungehalten! Und ich dachte schon, das Alte Lager ist ein rauher Ort.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Vielleicht später.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Später brauche ich aber niemanden. Ich brauche JETZT Hilfe.  Willst du mir nun helfen oder nicht?
};

// **************************************
//				Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WorkDay_Condition;
	information	= DIA_Lefty_WorkDay_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int DIA_Lefty_WorkDay_Condition()
{
	if	(Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS))				// wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&	((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS))	// wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WorkDay_Info()
{
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //Hey, du!
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Du hast Glück! Du bekommst eine neue Chance.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Diesmal solltest du's nicht vermasseln! Also: Du gehst zum Reislord und dann bringst du schön brav allen Bauern ihr Wasser, klar?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,	"Schon wieder bin ich Lefty über den Weg gelaufen! Er will, dass ich jetzt endlich zum Reislord gehe und das Wasser für die Verteilung an die Bauern auf den Reisfeldern abhole.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Ich habe dir doch gesagt, du sollst den Bauern Wasser bringen!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Ich mag es nicht, wenn man mir Sachen verspricht und sie dann nicht hält!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,	"Lefty war stinksauer darüber, dass ich das Wasser noch nicht verteilt haben! Das kann ja noch heiter werden mit diesem Burschen.");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Gut gemacht! Du bist ja zu was zu gebrauchen.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Ich denke, das ist genau die richtige Aufgabe für dich. Du wirst das ab jetzt jeden Tag tun. Fang direkt wieder damit an
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,	"Ich fasse es nicht. Nachdem ich das Wasser überall verteilt habe, will Lefty doch tatsächlich, dass ich nun jeden Tag den Wasserträger spiele. Ich glaube dieser Idiot muss mal seine Grenzen aufgezeigt bekommen.");
			B_GiveXP		(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		
		AI_StopProcessInfos	(self);
	};
};

// **************************************
//				NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "Du kannst dein Wasser ab jetzt selbst bringen.";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NeverAgain_Info()
{
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Du kannst dein Wasser ab jetzt selbst bringen.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Ach? Hast du was Besseres vor?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Ich glaube, ich muss dich noch einmal daran erinnern, wer hier der Boss ist!
	
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};	

// **************************************
//				PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_PERM_Condition;
	information	= DIA_Lefty_PERM_Info;
	permanent	= 1;
	description	= "Na, mein Freund?";
};                       

FUNC int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_PERM_Info()
{
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Na, mein Freund?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Mann! Was willst du?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,	"Ich habe Lefty endgültig klargemacht, dass er mich besser nicht mehr mit seiner Wasserträgerei behelligen sollte. Mache Leute lernen nur durch Schmerzen.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Wollte nur mal sehen, wie's dir geht."												,DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Die Bauern sehen durstig aus."														,DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"Ich hatte nen schlechten Tag und suche einen Ausgleich... Halt mal still."	,DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Ich hatte 'nen schlechten Tag und suche ein bisschen Ausgleich ... Halt mal still.
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Die Bauern sehen durstig aus.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Ich kümmere mich drum ... Mach dir keine Sorgen.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Wollte nur mal sehen, wie's dir geht.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	