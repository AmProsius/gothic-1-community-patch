// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "Wer bist du?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Wer bist du?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Ich bin Bartholo. Ich kümmere mich um die Versorgung der Erzbarone.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Ich regele alles - von Krautlieferungen, über Essen bis hin zur Versorgung der Frauen.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Außerdem sorge ich dafür, dass die beiden idiotischen Köche ihre Arbeit gut machen.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Sie sollten mir dafür dankbar sein. Gomez lässt sich nicht jeden Fraß gefallen. Die letzten beiden hat er an die Snapper im Fluss verfüttert.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Ich will mit dir handeln.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schlüssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Ich will mit dir handeln.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Ich habe einiges da - wenn du genug Erz hast.
};


// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Bartholo_Krautbote (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_Krautbote_Condition;
	information	= Info_Bartholo_Krautbote_Info;
	permanent	= 1;
	description = "Ich habe ne Ladung Kraut von Cor Kalom für Gomez.";
};                       

FUNC INT Info_Bartholo_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Bartholo_Krautbote_Info()
{
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Ich habe 'ne Ladung Kraut von Cor Kalom für Gomez.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Zeig her!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm ...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Gut! Gomez ist beinahe ungeduldig geworden. Sei froh, dass du es heute noch abgeliefert hast!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //Was ist mit der Bezahlung?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Nicht so eilig ... Hier, nimm. 500 Erz waren abgemacht.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,	"Bartholo hat mir 500 Erz für die Krautlieferung gegeben.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Du hast zu wenig Kraut für einen Boten! Ich will für dich nicht hoffen, dass du das Zeug verscherbelt hast! Komm wieder, wenn du die richtige Menge dabei hast!
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance  DIA_EBR_106_Bartholo_Wait4SC (C_INFO)
{
	npc				= EBR_106_Bartholo;
	condition		= DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information		= DIA_EBR_106_Bartholo_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_106_Bartholo_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	AI_Output			(self, other,"Info_Bartholo_12_01");	//Ich hatte mir fast gedacht, dass es jemand durch das Pentagramm versuchen würde!
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Aber im Gegensatz zu diesem verräterischen Schmied Stone brauchen wir dich nicht mehr!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Wo ist Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Hinter Gittern! Aber dafür wirst du gleich unter der Erde liegen!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Schnappt ihn euch, Jungs, und macht ihn kalt!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
