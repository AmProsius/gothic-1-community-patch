// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Dem Ziel entgegen!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Der Schläfer möge dich behüten!
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Du hast einen Guru angesprochen!! Tu das nie wieder! Es ist ein Sakrileg! Wenn der Meister es für richtig hält, mit dir zu reden, wird ER dich ansprechen.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Wer bist du?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Wer bist du?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Ich bin Lester. Ich kümmere mich um die Fremden, die hier ankommen.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Gut, dass du nicht Baal Namib angesprochen hast. Kein Fremder darf die Gurus ansprechen.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "Ich will aber mit deinem Meister reden.";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Ich will aber mit deinem Meister reden.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Vergiss es! Ich bin sicher, ICH kann dir bei all deinen Problemen weiterhelfen.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "Erzähl mir was über das Lager.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Erzähl mir was über das Lager.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //Was willst du wissen?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Erzähl mir was über die Gilden.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Was hat es mit dem Schläfer auf sich?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Was weißt du über das Kraut?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Erzähl mir was über die Gilden.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Die Gurus bilden die oberste Gilde. Sie sind der Geist des Lagers, denn ihre Macht ist groß. Die Templer benutzen ihre geistige Stärke im Kampf.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Sie haben einen unbezwingbaren Willen. Leg dich besser NIE mit ihnen an. Ich selber gehöre zu den Novizen. Wir beten zum Schläfer und verrichten die Arbeiten, die hier im Lager anfallen.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Einige der Novizen werden als Gurus aufgenommen, aber dazu gehört eine viele Jahre lange Ausbildung.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Was hat es mit dem Schläfer auf sich?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Der Schläfer ist ein göttliches Wesen. Er schenkt uns Visionen - zumindest den Gurus.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Wir beten zu ihm, denn er wird uns allen die Freiheit schenken.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //Und daran glaubst du?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hey, ich bin seit zwei Jahren in der Barriere. Weißt du überhaupt wie lange ZWEI JAHRE sein können?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Du kannst dir nicht vorstellen, was ich alles bereit bin zu glauben und zu machen, damit ich hier wieder raus komme!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Was weißt du über das Kraut?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //Nun, das Kraut wächst im Sumpf. Es muss natürlich noch verarbeitet werden, damit man es rauchen kann. Das machen wir Novizen.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Das Kraut hat eine beruhigende und entspannende Wirkung. Es hilft dir, dich auf das Wesentliche zu konzentrieren und dein Bewusstsein zu öffnen.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Wir tauschen es gegen Waren aus den anderen Lagern und benutzen es, um neue Leute anzuwerben.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Das führt natürlich dazu, dass viele Leute nur wegen des Krauts zu uns kommen. Na ja, immerhin helfen sie bei den anfallenden Arbeiten.
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "Ich will mich der Bruderschaft anschließen!";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Ich will mich der Bruderschaft anschließen!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalom entscheidet, ob du bereit bist, in die Bruderschaft einzutreten.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Aber er verlässt sich auf den Rat der anderen Gurus. Baal Namib hier ist einer von ihnen.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Du wirst dich erst als würdig erweisen müssen, dann wird dich einer der Gurus zu Cor Kalom schicken.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "Wie soll das funktionieren, wenn keiner der Gurus mit mir redet?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Wie soll das funktionieren, wenn keiner der Gurus mit mir redet?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Es hat vielleicht nicht den Anschein, aber die Gurus beobachten genau, was du hier im Lager tust.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Wenn sie der Meinung sind, dass du dich um unsere Gemeinschaft verdient gemacht hast, werden sie dich ansprechen.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Hier im Lager werden sich sicher Gelegenheiten bieten, dich als würdig zu erweisen.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"Wenn ich mich der Bruderschaft im Sumpflager anschließen möchte, muss ich die Gurus beeindrucken. Dummerweise reden sie nicht mit Neuen. Lester der Novize erzählte mir, dass sie mich trotzdem genau beobachten und ich mich in ihrer Nähe würdig erweisen müsse. Ich habe nicht die geringste Ahnung, wie ich das machen soll! Am besten sehe ich mich erst mal im Sumpflager genau um.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "Wie bringe ich deinen Meister dazu, mit mir zu reden?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Wie bringe ich deinen Meister dazu, mit mir zu reden?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Du musst wissen, was er hören will.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //Nämlich?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Pass auf: Wenn wir beide das nächste Mal bei ihm sind, sprichst du mich an, und wir unterhalten uns ein bisschen.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib macht sich zurzeit große Sorgen, weil viele Novizen nicht nur zum Schläfer beten, sondern auch noch zu ihren alten Göttern.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Du erzählst mir, dass du den alten Göttern abgeschworen hast, und jetzt nur noch den Schläfer anrufst.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Daraufhin werde ich dich fragen, was dich dazu bewogen hat, und du sagst, du hattest eine Vision, in der der Schläfer dich zu sich gerufen hat.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Das sollte sein Interesse wecken. Denkst du, du kriegst das hin?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Kein Problem.
	
	B_LogEntry	(CH1_JoinPsi, "Um Baal Namib zu beeindrucken, soll ich Lester in der Nähe des Gurus ansprechen und über alte Götter und den Schläfer reden.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //AH! GUT, DICH WIEDER ZU TREFFEN. WIE IST ES DIR ERGANGEN?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "Ich habe den alten Göttern abgeschworen.";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //ICH HABE DEN ALTEN GÖTTERN ABGESCHWOREN.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //EHRLICH? WIE KOMMST DU ZU DIESR ENTSCHEIDUNG?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //ICH HATTE EINE VISION. DER SCHLÄFER HAT ZU MIR GESPROCHEN.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //WAS HAT ER GESAGT?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //ER SAGTE, GEH IN DAS LAGER IM SUMPF UND SCHLIESS DICH DER BRUDERSCHAFT AN.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //DU BIST EIN SEHR REICHER MANN, FREMDER, DER SCHLÄFER BELOHNT NICHT VIELE AUF DIESE WEISE.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "Wie kann ich mich hier im Lager zurechtfinden?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Wie kann ich mich hier im Lager zurechtfinden?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Ich kann dir die wichtigen Orte zeigen.
};

// **************************************************
//				FÜHRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "Sind wir gleich da?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //Sind wir gleich da?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Wenn du aufhörst, mich zu fragen, geht es schneller.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE ÄNDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "Ich habe es mir anders überlegt";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //Ich habe es mir anders überlegt.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Du weißt ja, wo du mich finden kannst.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------FÜHRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Zeig mir den Weg..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Zeig mir den Weg ...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zurück zum Hauptor",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zur Schmiede",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zum Tempel",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zu den Lehrern",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"zum Alchemielabor",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //... zur Schmiede.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //folge mir!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //... zum Tempel.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //folge mir!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //... zu den Lehrern.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //folge mir!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //... zum Alchemielabor!
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //folge mir!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Hier unten findest du Baal Cadar. Er unterrichtet die Novizen.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Die Leiter rauf kommst du zum Übungsplatz der Templer. Ich warte hier auf dich. Wenn du trödelst, dann triffst du mich wieder bei Baal Namib am Eingang des Lagers.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Hier ist der Tempel! Ich werde auf dich warten, aber wenn du dir zu viel Zeit lässt, dann gehe ich zurück zu Baal Namib.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Hier ist die Schmiede! Schau dich um, ich warte etwa eine Stunde, dann haue ich wieder ab.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauthändler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Wenn du die Leiter raufsteigst, dann kommst du zu Kalom, dem Alchemisten. Hier unten steht Fortuno, der Krauthändler.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Ich warte hier auf dich, aber lass dir nicht zu viel Zeit, sonst gehe ich wieder zurück.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral für alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Gut, dass du da bist. Ich habe Neuigkeiten.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Ich hoffe, gute Neuigkeiten.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Unsere Bruderschaft plant etwas ganz Großes.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Was plant ihr denn? Den Ausbruch?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Die Gurus versuchen, Kontakt zum Schläfer herzustellen. Aber sie brauchen etwas, um ihre Kräfte zu bündeln.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //Ja, und?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Sie brauchen einen magischen Gegenstand, einen Fokus.

	B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Was kann ich dabei tun?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //Was kann ich dabei tun?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Sprich mit Y'Berion. Er ist der mächtigste Mann hier. Dies ist die Gelegenheit, seine Gunst zu erringen.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Wo finde ich ihn?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Geh zum Tempel. Er kommt selten dort heraus. Wahrscheinlich fühlt er sich in diesem kalten Gemäuer dem Schläfer näher.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,	"Der Novize Lester erzählte, dass Y'Berion einen magischen Fokus sucht. Der Guru hält sich im Inneren des Tempelbergs auf.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hey, was machst du denn hier?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Ich bin im Auftrag der Wassermagier unterwegs. Ich suche magische Artefakte, sogenannte Fokussteine.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Du bist auf der Suche nach den Fokussteinen? Das ist verdammt mutig.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas und die anderen Magier aus dem Neuen Lager wollen damit die Barriere sprengen, die uns alle gefangen hält.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Das glaube ich erst, wenn ich es gesehen habe.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Das geht mir ähnlich, aber erzähl, was führt dich her?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Ich wäge gerade ab, ob es sich lohnt, der Festung einen Besuch abzustatten.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Es gibt nämlich eine alte Urkunde, die ich gerne in meiner Tasche hätte. Andererseits ist es nicht ganz ungefährlich, dort hineinzugehen.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie bist du eigentlich an dem wandelnden Steinhaufen vorbeigekommen?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Wie bist du eigentlich an dem wandelnden Steinhaufen vorbeigekommen?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Ich habe einiges von den Gurus gelernt. Vor allem ihre Magie erweist sich immer wieder als sehr hilfreich.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Was ist das für eine Urkunde, die du suchst?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Was ist das für eine Urkunde, die du suchst?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //In dieser Bergfestung lebte vor vielen Jahren der Lehnsherr dieses Landstriches. Ihm unterstanden das Land und die Minen.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Er hatte natürlich, wie jeder Adelige, eine Urkunde über den Besitz. Und die werde ich mir holen.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Aber solange die Barriere uns gefangen hält, nützt sie dir gar nichts.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //Das stimmt. Aber wenn die Wassermagier es doch schaffen, die Barriere zu zerstören, dann könnte die Urkunde wieder einiges wert sein.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wir könnten die Festung gemeinsam erkunden!"; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Wir könnten die Festung gemeinsam erkunden!
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //Ein guter Vorschlag. Geh du voraus, ich bleibe in deiner Nähe.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,	"Vor einer riesenhaften Festung, die in ein Bergmassiv hineingabaut wurde, traf ich den Novizen Lester aus dem Sumpflager. Er selbst will eine Urkunde in diesen Gemäuern finden und hat sich mir auf meiner Fokussuche angeschlossen.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Sieh mal, dort oben scheint der Fokus zu sein, den du suchst.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Ja, sieht aus wie ein Fokusplatz, hm ... so einfach komme ich da nicht dran ...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,	"Der Fokus den ich suche befindet sich auf einem Podest. Es ist zu hoch um zu klettern. Ich muss einen anderen Weg finden, an das Artefakt heranzukommen.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL ÜBER DIE BRÜCKE OHNE DEN AUFTRAG ERFÜLLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Wo willst du hin? Wir sind hier noch nicht fertig!
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich bin verletzt, kannst du mir helfen?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Ich bin verletzt, kannst du mir helfen?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Hier, nimm diesen Heiltrank.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE FÜR LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich habe die Urkunde gefunden"; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Ich habe die Urkunde gefunden.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Hey, gut gemacht. Dafür gebe ich dir diese Spruchrollen. Damit sollte es kein Problem sein, den Fokus zu erreichen.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Ich werde unten vor der Fokusplattform auf dich warten.

	B_LogEntry		(CH3_Fortress,	"Die Landbesitz-Urkunde, die Lester suchte, befand sich in einer Kiste. Er übergab mir im Tausch vier Telekinese-Spruchrollen, mit deren Hilfe ich den unerreichbaren Fokus nun bergen kann.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie soll ich den Fokus erreichen?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Wie soll ich den Fokus erreichen?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Meister Y'Berion sagte immer: Der Schüler versucht die Dinge mit Händen und Füßen zu bewegen, der Meister bewegt die Dinge mit der Kraft seiner Gedanken.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Ich bleibe noch hier und suche die Urkunde.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Ich werde mich mal oben umsehen.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Nun haben wir beide, was wir wollten. Ich werde noch etwas bleiben, um die alten Bücher zu studieren.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Wir sehen uns wieder.

	B_LogEntry		(CH3_Fortress,	"Ich habe den Fokus erfolgreich geborgen. Lester will noch eine Weile in der Biblithek der Festung herumstöbern. Ich frage mich, wann ich ihn wiedersehen werden.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hast du schon was gefunden?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Hast du schon was gefunden?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Die Truhe da vorne ist verschlossen. Vielleicht gibt es irgendwo in dieser Festung einen Schlüssel.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Gibt es irgendwelche Hinweise auf die Urkunde?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Nein, bisher noch nicht ...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Hast du schon in der Bibliothek nachgesehen?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Lass uns zusammen die Festung erkunden"; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Lass uns zusammen die Festung erkunden.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //In Ordnung, du gehst vor!
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Björn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ich habe Diego und Milten vor dem Alten Lager getroffen!";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Wie sieht's aus?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Hey, was machst du denn hier?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//Die Alte Mine wurde nach einem Wassereinbruch verschüttet!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//Und?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Die Feuermagier sind alle tot!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez hat sie ermorden lassen.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//Das wieder hinzubiegen wird nicht einfach!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Ich habe Diego und Milten vor dem Alten Lager getroffen!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Sie wollen sich mit dir treffen. An eurem üblichen Treffpunkt.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Wurde aber auch Zeit!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//Wie geht es nun weiter?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Ich werde noch etwas bleiben, um die alten Bücher zu studieren.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Ähh ... Ich verstehe nicht ...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Meister Y'Berion sagte immer: Der Schüler versucht die Dinge mit Händen und Füßen zu bewegen, der Meister bewegt die Dinge mit der Kraft seiner Gedanken.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Schon gut, ich hab's verstanden.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Also pass auf dich auf.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Ich danke dir. Ich werde mich jetzt wieder auf den Weg machen.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Der Schläfer möge dich behüten!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Ich habe Lester und Gorn nun darüber informiert sich mit den anderen beiden Freunden zu treffen. Ab jetzt ist dies nicht mehr meine Angelegenheit. Sie werden schon wissen, was zu tun ist."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
