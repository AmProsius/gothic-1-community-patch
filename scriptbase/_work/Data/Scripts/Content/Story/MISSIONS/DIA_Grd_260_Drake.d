// ************************	EXIT **************************

instance  Grd_260_Drake_Exit (C_INFO) //E1
{
	npc			=  Grd_260_Drake;
	nr			=  999;
	condition	=  Grd_260_Drake_Exit_Condition;
	information	=  Grd_260_Drake_Exit_Info;
	important	=  0;
	permanent	=  1;
	description	= DIALOG_ENDE;
};

FUNC int  Grd_260_Drake_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_260_Drake_Exit_Info()
{
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //Wir sehen uns.
	AI_StopProcessInfos	( self );
};
/**************** GEFAHREN *********************/

INSTANCE  Grd_260_Drake_Gefahr (C_INFO)	//E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Gefahr_Condition;
	information		= Grd_260_Drake_Gefahr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Auf was sollte ich in der Mine achten?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Auf was sollte ich in der Mine achten?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Vor allem auf Minecrawler. Das sind gefährliche Biester.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Wir mussten wegen ihnen schon einige Höhlen aufgeben. Haben schon so manchen Buddler verspeist.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Erzähl mir von den Crawlern.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Nun, ich hab' eine ziemlich trockene Kehle.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Wenn du ein Bier ausgibst, erzähl ich dir noch was über die Crawler.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Bier ausgeben)";
};

FUNC INT  Grd_260_Drake_Crawler_Okay_Condition()
{
	if (Npc_KnowsInfo (hero,Grd_260_Drake_Gefahr))
	{
			return 1;
	};
};
FUNC void Grd_260_Drake_Crawler_Okay_Info()
{
	if	( Npc_HasItems (hero,ItFobeer) )
	{
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Hier, trink einen auf mein Wohl!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Danke. Also die Crawler gibt es hier zuhauf in vielen Nebenhöhlen.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Hier im Hauptschacht haben sie noch nicht angegriffen. Wenn du ihnen mal begegnest, dann lauf!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Oder stell dich mit dem Rücken zur Wand. Dann hast du vielleicht noch eine Chance!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Willst du mich verarschen? Komm wieder, wenn du Bier hast.
   		Grd_260_Drake_Crawler_Okay.permanent = 1;
   };
};
// ***************** DIE MINE *****************************

instance  Grd_260_Drake_Mine (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Condition;
	information		= Grd_260_Drake_Mine_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kannst du mir was über die Mine erzählen?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Kannst du mir was über die Mine erzählen?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Hier, wo wir uns befinden, das ist der Hauptschacht. Über ein Stegsystem kommst du bis ganz nach unten.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Und überall wird Erz geschürft. Doch sei vorsichtig, hier gibt's auch eine Menge Minecrawler.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Ganz unten steht die Schmelze. Einen Teil des Erzes schmelzen wir direkt ein und verarbeiten es.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Erzähl mehr von der Mine";
};

FUNC int  Grd_260_Drake_Mine_Mehr_Condition()
{
	if ( Npc_KnowsInfo (hero, Grd_260_Drake_Mine) )
	{
		return 1;
	};
};
func void  Grd_260_Drake_Mine_Mehr_Info	()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Erzähl mir mehr davon!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Wenn du mehr wissen willst, dann wende dich an Viper. Er ist der Schmelzer.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Oder wende dich an Ian. Er ist der Boss. Er organisiert hier in der Mine alles.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wo kann ich Ian finden ?";
};

FUNC int  Grd_260_Drake_Ian_Condition()
{
	if !(Npc_KnowsInfo (hero,STT_301_IAN_HI)) && ( Npc_KnowsInfo (hero,	Grd_260_Drake_Mine_Mehr))
	{
		return TRUE;
	};

};
FUNC void  Grd_260_Drake_Ian_Info()
{
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Wo kann ich Ian finden ?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Er steht in der Mitte des Hauptschachtes, beim Warenlager.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Ach noch was, du kennst doch Thorus? Vergiss ihn!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//Hier drin hat nur einer das Sagen und das ist Ian. Er ist hier der Chef.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Legst du dich mit ihm an, legst du dich mit uns allen an. Verstanden?
};	 

/*------------------------------------------------------------------------
//						GARDEAUFNAHME								//
------------------------------------------------------------------------*/
instance Grd_260_Drake_GARDEAUFNAHME (C_INFO)
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_GARDEAUFNAHME_Condition;
	information		= Grd_260_Drake_GARDEAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_260_Drake_GARDEAUFNAHME_Condition()
{	
	if (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	&& ( Npc_GetTrueGuild  (hero) == GIL_STT)
	&& (! Npc_KnowsInfo   (hero,Grd_264_Gardist_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void  Grd_260_Drake_GARDEAUFNAHME_Info()
{
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hey, gute Arbeit, das mit den Crawlern! Damit hast du dir deine Aufnahme bei den Gardisten verdient!
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Geh doch mal zum Alten Lager und sprich mit Thorus darüber!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Wenn ich die Eier zurückgebracht habe, sollte ich mal mit Thorus reden. Vielleicht nimmt er mich in die Reihen der Gardisten auf.");
};

