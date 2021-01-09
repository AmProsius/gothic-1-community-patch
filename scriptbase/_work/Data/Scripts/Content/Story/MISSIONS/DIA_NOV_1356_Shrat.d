// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Shrat_Exit (C_INFO)
{
	npc			=  Nov_1356_Shrat;
	nr			=  999;
	condition	=  DIA_Shrat_Exit_Condition;
	information	=  DIA_Shrat_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Shrat_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance  DIA_Shrat_WhyHere (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_WhyHere_Condition;
	information	= DIA_Shrat_WhyHere_Info;
	permanent	= 0;
	description	= "Was machst du denn hier?";
};                       

FUNC int  DIA_Shrat_WhyHere_Condition()
{
	return 1;
};

FUNC VOID  DIA_Shrat_WhyHere_Info()
{
	AI_Output (other, self,"DIA_Shrat_WhyHere_15_00"); //Was machst du denn hier?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_01"); //Habe ich dir erlaubt, mich anzusprechen?
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_02"); //War nur'n Witz! Diese verdammten Spinner gehen mir gehörig auf den Sack, deswegen bin ich hier!
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_03"); //'Sprich mich nicht an!' - 'Bitte den Schläfer um Vergebung!' - 'Deine Mission ist von äußerster Dringlichkeit!'
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_04"); //Das hält man ja im Kopf nicht aus - kein Wunder, dass die hier alle gaga sind.
	AI_Output (self, other,"DIA_Shrat_WhyHere_02_05"); //Ich bin Shrat. Novize ersten Ranges - und das werde ich auch bleiben!
};

// **************************************************
//				Hilfe bei Join PSI ??
// **************************************************

instance DIA_Shrat_JoinPSI (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_JoinPSI_Condition;
	information	= DIA_Shrat_JoinPSI_Info;
	permanent	= 0;
	description	= "Ich will der Bruderschaft beitreten - kannst du mir helfen?";
};                       

FUNC int DIA_Shrat_JoinPSI_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Shrat_WhyHere))
	{
		return 1;
	};
};

FUNC void DIA_Shrat_JoinPSI_Info()
{
	AI_Output (other, self,"DIA_Shrat_JoinPSI_15_00"); //Ich will der Bruderschaft beitreten - kannst du mir helfen?
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_01"); //Du willst bei dem Laden hier mitmachen? Ich überleg gerade, wie ich hier wegkomme.
	AI_Output (self, other,"DIA_Shrat_JoinPSI_02_02"); //Wir könnten ein bisschen durch die Kolonie ziehen. Ein paar Einfaltspinsel ausplündern, ein bisschen Erz sammeln - was denkst du?
};

// **************************************************
//					Komm mit
// **************************************************

instance DIA_Shrat_ComeWithMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 1;
	condition	= DIA_Shrat_ComeWithMe_Condition;
	information	= DIA_Shrat_ComeWithMe_Info;
	permanent	= 1;
	description	= "Lass uns zusammen losziehen! Komm mit!";
};                       

FUNC int DIA_Shrat_ComeWithMe_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Shrat_JoinPSI) && (self.aivar[AIV_PARTYMEMBER]==FALSE) )
	{
		return 1;
	};
};

FUNC void DIA_Shrat_ComeWithMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_ComeWithMe_15_00"); //Lass uns zusammen losziehen! Komm mit!
	AI_Output (self, other,"DIA_Shrat_ComeWithMe_02_01"); //Das ist doch mal ein Wort! Auf geht's!

	Npc_ExchangeRoutine (self, "FOLLOW");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
};

// **************************************************
//					Verlassen
// **************************************************

instance DIA_Shrat_LeaveMe (C_INFO)
{
	npc			= Nov_1356_Shrat;
	nr			= 700;
	condition	= DIA_Shrat_LeaveMe_Condition;
	information	= DIA_Shrat_LeaveMe_Info;
	permanent	= 1;
	description	= "Hier trennen sich unsere Wege - ich werde von hier aus alleine weiterziehen.";
};                       

FUNC int DIA_Shrat_LeaveMe_Condition()
{
	if (self.aivar[AIV_PARTYMEMBER]==TRUE)
	{
		return 1;
	};
};

FUNC void DIA_Shrat_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Shrat_LeaveMe_15_00"); //Hier trennen sich unsere Wege - ich werde von hier aus alleine weiterziehen.
	AI_Output (self, other,"DIA_Shrat_LeaveMe_02_01"); //Na gut. Ich werd' zurück in mein Versteck im Sumpf gehen. Pass gut auf dich auf!

	Npc_ExchangeRoutine (self, "START");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};
