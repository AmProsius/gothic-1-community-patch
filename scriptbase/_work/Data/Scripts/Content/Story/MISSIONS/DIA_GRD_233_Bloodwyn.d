// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //Wir sehen uns.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Pass gut auf dich auf, Kleiner!
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Mach dir keine Sorgen, während du hier im Lager bist! Wir passen auf dich auf.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 2) 
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //Hey du!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //Redest du mit mir?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Ich will dich warnen! Jemand wie du hat hier schnell Ärger am Hals!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //Und die meisten, die sie hier reingeworfen haben, sind Arschlöcher!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Sie denken, dass sie mit dir machen können, was sie wollen. Aber das lassen wir nicht zu.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomez will, dass Ruhe im Lager herrscht. Und wir Gardisten sorgen dafür. Aber so eine Aufgabe ist extrem kostspielig.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //Darum bitte ich dich um etwas Erz. Du musst das als Freundschaftsdienst verstehen. Du hilfst uns und wir helfen dir. Wenn du mal Ärger hast, sind wir da.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Warum nicht. An wieviel Erz hattest du denn gedacht?"	,Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Ich soll Schutzgeld zahlen? Ich kann auf mich selbst aufpassen!"	,Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Soll das eine Drohung sein?"	,Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //Ich soll Schutzgeld zahlen? Ich kann auf mich selbst aufpassen!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Wie du meinst, Kleiner. Wirst schon sehen, was du davon hast, ein Freundschaftsangebot abzulehnen!
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //Soll das eine Drohung sein?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Im Gegenteil! Es ist ein Freundschaftsangebot!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Warum nicht. An wie viel Erz hast du denn gedacht?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Nicht viel. 10 Erz, mehr brauche ich nicht.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Ich habe gerade keine 10 Erz."	,Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Hier hast du das Erz. Ich kann Freunde brauchen."	,Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Hier hast du das Erz. Ich kann Freunde gebrauchen.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Du scheinst mir ein kluges Bürschchen zu sein. Von nun an werden wir auf dich aufpassen.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Aber das heißt nicht, dass du hier machen kannst, was du willst, verstanden?
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Ich habe gerade keine 10 Erz.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Dann nehme ich das, was du hast - ist schon okay. Du kannst ja beim nächsten Mal die volle Summe zahlen.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Lass mal sehen ...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Na, was haben wir denn da? Kann da jemand nicht bis 10 zählen?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Ich werd einfach alles nehmen, was du hast. Dafür vergesse ich, dass du mich belogen hast.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Ich nehme auch kleine Spenden, es ist der gute Wille, der zählt! Danke für das Erz, Kleiner!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //Von jetzt an werden wir ein Auge auf dich haben, solange du im Lager bist.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Du hast ja wirklich nichts ... Na, wie gesagt, beim nächsten Mal ...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) )
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Gut, dass ich dich treffe, mein Freund!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //Wie sieht's mit deiner täglichen Unterstützung aus? Deine 10 Erz sind wieder mal fällig.
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Hier, nimm - 10 Erz sind nicht viel unter Freuden."	,Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Ich werde nicht mehr zahlen - du hast schon genug gekriegt."	,Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hey du!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Was denn jetzt schon wieder?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //Es ist eine neue Gelegenheit für dich gekommen, dich als Freund zu erweisen.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Mit nur 10 Erz bist du dabei - wie sieht's aus?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Hier, nimm - 10 Erz sind nicht viel unter Freunden
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //Genau so sehe ich das auch.
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Ich werde nicht mehr zahlen - du hast schon genug gekriegt.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Du enttäuschst mich! Von nun an sind wir keine Freunde mehr. Du wirst selber aufpassen müssen, dass du nicht von üblen Halunken niedergeschlagen und ausgeraubt wirst.
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Ich kann ganz gut auf mich selbst aufpassen.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Das werden wir ja sehen ...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "Ich hab's mir überlegt - ich würde DOCH gern die 10 Erz bezahlen.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //Ich hab's mir überlegt - ich würde DOCH gern die 10 Erz bezahlen.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Na siehst du! Du kannst ja DOCH die richtige Entscheidung treffen.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //Und von jetzt an zahlen wir schön brav täglich unsere Unterstützung, ja? 
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Dann komm wieder, wenn du sie hast.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Jesse schickt mich - ich will seine 10 Erz für ihn zahlen.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse schickt mich - ich will seine 10 Erz für ihn zahlen.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Du solltest lieber DEINE 10 Erz zahlen.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Vergiss Jesse. Er ist ein Verlierer und wird sowieso bald draufgehen.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Nein - ich werde für ihn zahlen - hier nimm die 10 Erz und jetzt lass ihn in Ruhe!
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //Wie du willst, Mann - wie du willst.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Oh! Ich merke gerade, ich habe gar nicht so viel Erz bei mir.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //Das ist ein Zeichen, Mann! Überleg's dir noch mal! Für den Penner zu zahlen, ist glatte Verschwendung!
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Du gehörst jetzt zu uns. Gute Arbeit. Die Garde braucht Männer wie dich!
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //Da ist der Verräter aus unserer Mitte. PAH! Und dich haben wir mal Gardist genannt!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Wir haben wohl einen der aufständischen Feuermagier übersehen!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //Das ist der Schatten, der uns verraten hat!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Moment. Was redest du da, Bloodwyn?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Machst gemeinsame Sache mit dem Neuen Lager, was?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Warte mal, ich bin doch noch immer ...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Glaubtest wohl, das könnte ewig so gehen.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Jetzt hör aber auf mit diesem Unsinn ...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Verräter wie dich machen wir kalt.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //STIRB, ABTRÜNNIGER!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Fletcher, der nun das Haupttor bewacht, reagierte ähnlich wie Bloodwyn am hinteren Tor. Mir ist nicht klar warum, aber es muss etwas mit meiner Fokussuche für das Neue Lager zu tun haben.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Bloodwyn, der nun mit einer Gruppe Gardisten am hinteren Tor des Alten Lagers Wache hält, bezeichnete mich als Verräter und Abtrünniger. Er lies sich auf keine Diskussion ein und griff mich sofort an!");
			B_LogEntry			(CH4_BannedFromOC,	"Es sieht so aus, als ob ich nun aus dem alten Lager verbannt wurde!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Du wagst dich tatsächlich aus deinem Neuen Lager heraus? Wie dumm von dir!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //Du wagst dich tatsächlich aus deinem Sumpflager heraus? Wie dumm von dir!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Was soll das? Was meinst du?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //Hast wohl noch nichts von unserem Überfall auf eure Mine gehört, was?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Moment mal ...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Leider können wir es nicht zulassen, dass du das irgendwo herumerzählst!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hey, ich will keinen Streit ...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Das hättest du dir vorher überlegen sollen!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Jetzt ist es aber genug ...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //Richtig! TÖTET IHN!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Die Tore des Alten Lagers sind nun verschlossen und werden von Gardisten bewacht. Sie attackieren jeden der dem Lager zu nahe kommt.");
	};
	
	AI_StopProcessInfos	(self);
};

