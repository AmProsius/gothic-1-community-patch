/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Org_873_Cipher_Exit (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  999;
	condition	=  Org_873_Cipher_Exit_Condition;
	information	=  Org_873_Cipher_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ******************************
// 			Hallo
// ******************************

instance  Org_873_Cipher_Hello (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Hello_Condition;
	information	=  Org_873_Cipher_Hello_Info;
	permanent	=  0;
	description = "Wie sieht's aus?";
};                       

FUNC int  Org_873_Cipher_Hello_Condition()
{
	if (Balor_TellsNCDealer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Hello_Info()
{
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Wie sieht's aus?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Wir haben Gomez mal wieder ins Essen gespuckt.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Drei tote Gardisten und 'ne ganze Menge Zeug zum Verhökern. Darauf trink ich!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Du bist einer von den Jungs, die ständig das alte Lager überfallen?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Nein. Nur wenn sich 'ne lohnende Gelegenheit bietet.
};

// ******************************
// 			Fisk
// ******************************

instance  Org_873_Cipher_Fisk (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Fisk_Condition;
	information	=  Org_873_Cipher_Fisk_Info;
	permanent	=  1;
	description = "Fisk aus dem Alten sucht nach einem Handelspartner.";
};                       

FUNC int  Org_873_Cipher_Fisk_Condition()
{
	if (Fisk_GetNewHehler==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Fisk_Info()
{
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk aus dem Alten Lager ist auf der Suche nach einem Handelspartner.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Kein Interesse.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Aber Sharky könnte sich dafür interessieren. Wenn du ihn findest, frag ihn.
};

// ******************************
// 			Balor sent Me
// ******************************
	var int Cipher_Trade;
// ******************************

instance  Org_873_Cipher_FromBalor (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_FromBalor_Condition;
	information	=  Org_873_Cipher_FromBalor_Info;
	permanent	=  1;
	description = "Was hast du anzubieten?";
};                       

FUNC int  Org_873_Cipher_FromBalor_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_FromBalor_Info()
{
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //Was hast du anzubieten?
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Die Frage ist doch, was hast DU anzubieten. Ich bin nur an größeren Lieferungen interessiert.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor sagt, du hättest Interesse an etwas Sumpfkraut.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Hmmm. Du willst also handeln?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //Damit kann ich nicht dienen.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Dann komm wieder, wenn du es kannst. 
	};
};

// ******************************
// 			TRADE
// ******************************

instance  Org_873_Cipher_TRADE (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_TRADE_Condition;
	information	=  Org_873_Cipher_TRADE_Info;
	permanent	=  1;
	description = "Lass uns handeln.";
	trade		= 1;
};                       

FUNC int  Org_873_Cipher_TRADE_Condition()
{
	if ( Cipher_Trade == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_TRADE_Info()
{
	AI_Output (other, self,"DIA_Cipher_TRADE_15_00"); //Lass uns handeln.
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //Was willst du haben?
};
