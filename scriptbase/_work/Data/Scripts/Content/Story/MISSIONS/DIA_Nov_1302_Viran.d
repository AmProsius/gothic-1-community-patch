// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Viran_Exit (C_INFO)
{
	npc			=  Nov_1302_Viran;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Viran_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was macht ihr hier?
// **************************************************

instance  DIA_Viran_What (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_What_Condition;
	information	= DIA_Viran_What_Info;
	permanent	= 0;
	description	= "Was macht ihr hier?";
};                       

FUNC int  DIA_Viran_What_Condition()
{
	return 1;
};

FUNC VOID  DIA_Viran_What_Info()
{
	AI_Output (other, self,"DIA_Viran_What_15_00"); //Was macht ihr hier?
	AI_Output (self, other,"DIA_Viran_What_07_01"); //Wir sammeln das Sumpfkraut, das unsere Brüder dann zu Rauchwaren verarbeiten.
	AI_Output (self, other,"DIA_Viran_What_07_02"); //Es ist ziemlich gefährlich, im Sumpf zu sammeln, aber das Zeug wächst nun mal nur hier. Ist auch gut so.
	AI_Output (other, self,"DIA_Viran_What_15_03"); //Warum?
	AI_Output (self, other,"DIA_Viran_What_07_04"); //Weil dann die beiden anderen Lager nicht rankommen. Wir sind die Einzigen in der Kolonie, die Sumpfkraut ernten können.
	AI_Output (self, other,"DIA_Viran_What_07_05"); //In den beiden anderen Lagern können wir es tauschen - und WIR bestimmen den Preis.
};

// **************************************************
//				Kraut abholen
// **************************************************

instance  DIA_Viran_FetchWeed (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_FetchWeed_Condition;
	information	= DIA_Viran_FetchWeed_Info;
	permanent	= 0;
	description	= "Baal Orun schickt mich. Ich soll die gesamte Ernte zu Kalom bringen.";
};                       

FUNC int  DIA_Viran_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_15_00"); //Baal Orun schickt mich. Ich soll die gesamte Ernte zu Kalom bringen.
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_01"); //So einfach stellst du dir das vor, was?
	AI_Output (self, other,"DIA_Viran_FetchWeed_07_02"); //Da kann ja jeder kommen. 'Baal Orun schickt mich' - und schwupps - weg ist das ganze Kraut.
	
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Geh doch zu ihm und frag ihn, wenn du mir nicht glaubst!"	,DIA_Viran_FetchWeed_GotoHim);
	Info_Addchoice 		(DIA_Viran_FetchWeed,"Baal Orun schickt mich aber wirklich!"					,DIA_Viran_FetchWeed_Really);
};
	
func void DIA_Viran_FetchWeed_Really()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_Really_15_00"); //Baal Orun schickt mich aber wirklich!
	AI_Output (self, other,"DIA_Viran_FetchWeed_Really_07_01"); //Natürlich.
};

func void DIA_Viran_FetchWeed_GotoHim()
{
	AI_Output (other, self,"DIA_Viran_FetchWeed_GotoHim_15_00"); //Geh doch zu ihm und frag ihn, wenn du mir nicht glaubst!
	AI_Output (self, other,"DIA_Viran_FetchWeed_GotoHim_07_01"); //Ich hab' 'ne bessere Idee. Du beweist mir deine Loyalität, indem du eine kleine Aufgabe für mich erledigst!
	Info_ClearChoices 	(DIA_Viran_FetchWeed);
};

// **************************************************
//				MISSION Bloodflies
// **************************************************
	var int Viran_Bloodflies;
// **************************************************

instance  DIA_Viran_Bloodflies (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Bloodflies_Condition;
	information	= DIA_Viran_Bloodflies_Info;
	permanent	= 0;
	description	= "Und was soll ich machen?";
};                       

FUNC int  DIA_Viran_Bloodflies_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Viran_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Bloodflies_Info()
{
	AI_Output (other, self,"DIA_Viran_Bloodflies_15_00"); //Und was soll ich machen?
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_01"); //Ist nur 'ne Kleinigkeit. Die Arbeit im Sumpf ist nicht ganz ungefährlich, und die verdammten Blutfliegen tun ihr übriges dazu.
	AI_Output (self, other,"DIA_Viran_Bloodflies_07_02"); //Ohne sie wäre das Arbeiten viel leichter! Wir verstehen uns?
	Viran_Bloodflies = LOG_RUNNING;

	B_LogEntry			(CH1_DeliverWeed,	"Viran will mir seine Sumpfkrautlieferung erst geben, nachdem ich alle Blutfliegen in 20 Schritt Umkreis erlegt habe.");
};
	
// **************************************************
//				Running / Success
// **************************************************
	var int Viran_BotenDay;
// **************************************************

instance  DIA_Viran_Running (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Running_Condition;
	information	= DIA_Viran_Running_Info;
	permanent	= 1;
	description	= "Ich seh weit und breit keine Blutfliegen mehr.";
};                       

FUNC int  DIA_Viran_Running_Condition()
{
	if (Viran_Bloodflies == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Running_Info()
{
	AI_Output (other, self,"DIA_Viran_Running_15_00"); //Ich seh' weit und breit keine Blutfliegen mehr.
	Npc_PerceiveAll(self);
	if ( Wld_DetectNpc(self,bloodfly,ZS_MM_Rtn_Wusel,-1) && (Npc_GetDistToNpc(self, other)<2000) ) //other = nearest Bloodfly (Instance/ZS/Guild)
	//wenn keine Bloodfly in 40m, dann other noch unverändert (= hero)
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_00"); //Da sind aber noch Viecher innerhalb von zwanzig Schritt!
		AI_Output (self, hero,"DIA_Viran_Running_07_01"); //So leicht kommst du mir nicht davon!
	}
	else
	{
		AI_Output (self, hero,"DIA_Viran_Running_07_02"); //Weit und Breit keins von den Biestern mehr zu sehen. Das war ganze Arbeit!
		AI_Output (self, hero,"DIA_Viran_Running_07_03"); //Wer sich so abplagt, ist entweder auf unserer Seite oder ein kompletter Vollidiot!
		AI_Output (self, hero,"DIA_Viran_Running_07_04"); //Und ein Idiot wäre zu dumm, um mich aufs Kreuz zu legen, richtig?
		AI_Output (self, hero,"DIA_Viran_Running_07_05"); //Hier, nimm die Ernte und bring sie zu Cor Kalom.
		AI_Output (self, hero,"DIA_Viran_Running_07_06"); //Falls er meckert, es sei zu wenig, sag ihm, er soll seinen Hintern hier selber hinbewegen, dann kann er mal sehen, wie viel Arbeit das ist.
		
		B_GiveInvItems  (self, hero, ItMi_Plants_Swampherb_01, 50);

		if	Npc_KnowsInfo(hero, DIA_Balor_FetchWeed)
		{
			B_LogEntry	(CH1_DeliverWeed,	"Viran gab mir die zweite Hälfte der heutigen Sumpfkrauternte. Mal sehen, ob Cor Kalom mit der Menge zufrieden ist.");
		}
		else
		{
			B_LogEntry	(CH1_DeliverWeed,	"Viran übergab mir seine heutige Sumpfkrauternte. Sieht nach ziemlich wenig aus. Vielleicht gibt es noch eine zweite Sammlergruppe.");
		};
		B_GiveXP		(XP_WeedFromViran);
				
		Viran_Bloodflies = LOG_SUCCESS;
		Viran_BotenDay = Wld_GetDay();
	};
	AI_StopProcessInfos (self);
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Viran_Perm (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 1;
	condition	= DIA_Viran_Perm_Condition;
	information	= DIA_Viran_Perm_Info;
	permanent	= 1;
	description	= "Wie steht's mit der Sammelei?";
};                       

FUNC int  DIA_Viran_Perm_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_Perm_Info()
{
	AI_Output (other, self,"DIA_Viran_Perm_15_00"); //Wie steht's mit der Sammelei?
	AI_Output (self, other,"DIA_Viran_Perm_07_01"); //Ja, ja, verarsch mich ruhig. Ich bin mir sicher, du bekommst bessere Aufgaben von den Gurus.
	AI_Output (self, other,"DIA_Viran_Perm_07_02"); //Na, immerhin muss ich mich nicht selbst bücken. Das übernimmt das Fußvolk - hee, hee, hee.
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Viran_RipOff (C_INFO)
{
	npc			= Nov_1302_Viran;
	nr			= 5;
	condition	= DIA_Viran_RipOff_Condition;
	information	= DIA_Viran_RipOff_Info;
	permanent	= 0;
	description	= "Ich soll nochmal alles Kraut zu Cor Kalom bringen.";
};                       

FUNC int  DIA_Viran_RipOff_Condition()
{
	if ( (Viran_BotenDay<=(Wld_GetDay()-2)) && (Viran_Bloodflies == LOG_SUCCESS) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Viran_RipOff_Info()
{
	AI_Output (other, self,"DIA_Viran_RipOff_15_00"); //Ich soll noch mal alles Kraut zu Cor Kalom bringen.
	AI_Output (self, other,"DIA_Viran_RipOff_07_01"); //Schon wieder?
	AI_Output (other, self,"DIA_Viran_RipOff_15_02"); //Jetzt erzähl mir bloß nicht, ich soll alle Sumpfhaie für dich umbringen - ich hab' wenig Zeit.
	AI_Output (self, other,"DIA_Viran_RipOff_07_03"); //Ist ja schon gut! Hier, nimm das verdammte Kraut!
	CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
	B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
};








