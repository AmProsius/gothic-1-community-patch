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
	description = "Who are you?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Who are you?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Bartholo's the name. I see to it that the Ore Barons get their supplies.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //I'm in charge of the lot - from weed supplies to food and provisions for the women.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Also, it's my job to make sure those idiotic cooks do their job right.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //They should be grateful. Gomez won't put up with any crap. He fed the last two cooks to the lurkers in the river.
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
	description = "I want to make a deal with you.";
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
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //I wanna make a deal with you.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //I have a lot to offer - if you have enough ore.
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
	description = "I have some weed here for Gomez. Cor Kalom sent it.";
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
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //I have some weed here for Gomez. Cor Kalom sent it.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Show me!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Alright! Gomez has been getting impatient. It's lucky for you that you delivered it today!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //What about the pay?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Not so fast... Here, take that. 500 ore is what we agreed on.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Bartholo has given me 500 ore for the weed delivery.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //You don't have enough weed to be a gofer! I hope for your sake that you haven't sold the stuff elsewhere! Come back when you have the right amount!
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
	AI_Output			(self, other,"Info_Bartholo_12_01");	//I knew that somebody would try to get at us through the pentagram!
	AI_Output			(self, other,"Info_Bartholo_12_02");	//But, unlike that traitorous smith Stone, we don't need you any more!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Where is Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Behind bars! But you're gonna be six feet under in a minute!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Get him, guys, and slice him up!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
