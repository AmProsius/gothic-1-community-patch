// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalIsidro_EXIT(C_INFO)
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 999;
	condition	= DIA_BaalIsidro_EXIT_Condition;
	information	= DIA_BaalIsidro_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalIsidro_Hello(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Hello_Condition;
	information	= DIA_BaalIsidro_Hello_Info;
	permanent	= 0;
	description = "Du siehst nicht sehr glücklich aus.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Du siehst nicht sehr glücklich aus.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Bin ich auch nicht!
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Ich muss noch 'nen ganzen Berg Kraut loswerden.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //Du bist hier um Waren aus dem Sektenlager zu verkaufen?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Ja. Aber ich kann mich einfach nicht aufraffen.
};

// ************************************************************
// 					 	TRADE
// ************************************************************

INSTANCE DIA_BaalIsidro_TRADE(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 800;
	condition	= DIA_BaalIsidro_TRADE_Condition;
	information	= DIA_BaalIsidro_TRADE_Info;
	permanent	= 1;
	description = "Zeig mir, was du hast.";
	trade 		= 1;
};                       

FUNC INT DIA_BaalIsidro_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_TRADE_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Zeig mir, was du hast.
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Hier ...
};

// ************************************************************
// 					 Ich verkaufe für dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "Ich könnte das Kraut für dich verkaufen - gegen Beteiligung versteht sich.";
};                       

FUNC INT DIA_BaalIsidro_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Ich könnte das Kraut für dich verkaufen - gegen Beteiligung versteht sich.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Vergiss es - so besoffen bin ich nun auch wieder nicht. Du brennst doch einfach damit durch.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob, "Der Novize Baal Isidro hängt den ganzen Tag in der Kneipe auf dem See des Neuen Lagers herum und betrinkt sich sinnlos. Er muss seine Ladung Krautstengel verkaufen, kann sich aber nicht aufraffen. Vielleicht könnte ich ihn irgendwie dazu überreden, mir den Job zu geben, nur wie?"); 
};

// ************************************************************
// 					Baal Kagan hat gepetzt
// ************************************************************

INSTANCE DIA_BaalIsidro_Problem(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Problem_Condition;
	information	= DIA_BaalIsidro_Problem_Info;
	permanent	= 0;
	description = "Du hast ein Problem. Baal Kagan will dafür sorgen, dass du ersetzt wirst.";
};                       

FUNC INT DIA_BaalIsidro_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Problem_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Ich sag dir was - du hast ein Problem. Baal Kagan will dafür sorgen, dass du ersetzt wirst.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Was? Beim großen Schläfer. Ich muss das Zeug loswerden ...
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob, "Baal Isidro war sichtlich erschüttert, als ich von den Plänen, ihn zu ersetzen, berichtete. Aber es hat nicht ganz gereicht, mir den Job zu übergeben.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob, "Die Pläne Baal Kagans den trunksüchtigen Baal Isidro zu ersetzen, haben ihm den Rest gegeben. Ich glaube jetzt ist er reif für mein Angebot!");
	};	
};

// ************************************************************
// 					 Trink noch einen
// ************************************************************
	var int BaalIsidro_GotDrink;
// ************************************************************

INSTANCE DIA_BaalIsidro_Drink(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Drink_Condition;
	information	= DIA_BaalIsidro_Drink_Info;
	permanent	= 1;
	description = "Hier - trink noch einen auf meine Rechnung.";
};                       

FUNC INT DIA_BaalIsidro_Drink_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Drink_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Hier - trink noch einen auf meine Rechnung.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Danke, Mann. Ich trinke auf dein Wohl!

		if 		(Npc_HasItems(other,ItFoBooze))
		{
			B_GiveInvItems	(other,self,ItFoBooze,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBooze);		
		}
		else if (Npc_HasItems(other,ItFoBeer))
		{
			B_GiveInvItems	(other,self,ItFoBeer,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBeer);		
		}
		else if (Npc_HasItems(other,ItFoWine))
		{
			B_GiveInvItems	(other,self,ItFoWine,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoWine);		
		};
		
		BaalIsidro_GotDrink = TRUE;

		if	Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem)
		{
		    B_LogEntry	(CH1_DealerJob, "Der letzte Schluck meiner spendablen Geste hat den letzten Widerstand Baal Isidro's weggespült. Ich glaube jetzt ist er für mein Angebot empfänglich.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob, "Baal Isidro nahm den ausgegebenen Tropfen dankbar entgegen, doch er scheint noch nicht soweit zu sein, mir den Krautverkauf übertragen zu wollen.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); //Was? Wo?
	};
};

// ************************************************************
// 					 Übrleg's dir!
// ************************************************************
	var int BaalIsidro_DealerJob;
// ************************************************************

INSTANCE DIA_BaalIsidro_ThinkAgain(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_ThinkAgain_Condition;
	information	= DIA_BaalIsidro_ThinkAgain_Info;
	permanent	= 1;
	description = "Überleg's dir - Gib mir das Kraut und wir teilen den Gewinn.";
};                       

FUNC INT DIA_BaalIsidro_ThinkAgain_Condition()
{
	if	( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob!=LOG_RUNNING)&&(BaalIsidro_DealerJob!=LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_ThinkAgain_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Überleg's dir - Gib mir das Kraut und wir teilen den Gewinn.
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Oh Mann, ich muss das Zeug loswerden. Du willst mich doch nicht über's Ohr hauen, oder?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Ich geb' dir mein Wort.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Gut, hier ist das Zeug... Du müsstest mindestens 400 Erz dafür kriegen. Also 200 für jeden. Ich bin die ganze Zeit hier. Wenn du das Erz hast, komm zurück.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Weißt du, wer hier größere Mengen abnimmt?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Wenn ich das wüsste, wär' ich selber losgegangen.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Jetzt, wo ich das Zeug los bin, fühle ich mich schon viel besser.
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob, "Baal Isidro hat mir einen Haufen Krautstengel gegeben, die ich verhökern soll. Er will die Hälfte der Einnahmen also 200 Erz davon abhaben.");	
	
		//Itemübergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items übergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Nee, Mann. Ich schaff das schon noch ...
	};
};

// ************************************************************
// 					RUNNING / SUCCESS
// ************************************************************

INSTANCE DIA_BaalIsidro_RUNNING(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_RUNNING_Condition;
	information	= DIA_BaalIsidro_RUNNING_Info;
	permanent	= 0;
	description = "Ich hab' das Kraut verkauft. Hier sind deine 200 Erz.";
};                       

FUNC INT DIA_BaalIsidro_RUNNING_Condition()
{
	if (BaalIsidro_DealerJob == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_RUNNING_Info()
{	
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //Ich hab' das Kraut verkauft.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //Meine 200?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Hier sind sie.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Gut ... Jetzt kann mich Baal Kagan mal. (lacht dreckig)
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //War ne gute Idee, mit dir Geschäfte zu machen.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob, "Baal Isidro war erleichtert seine 200 Erz zu bekommen.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Hab ich nicht bei mir.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Dann schaff sie ran!
		AI_StopProcessInfos	(self);
	};
};

