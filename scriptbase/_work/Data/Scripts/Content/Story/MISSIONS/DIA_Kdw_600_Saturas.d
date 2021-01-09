// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Mögest du in einem Stück zurückkehren!

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Was machst du hier? Du hast hier nichts zu suchen! Verschwinde!

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Ich habe wichtige Neuigkeiten aus dem Lager der Bruderschaft!";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //Ich habe wichtige Neuigkeiten aus dem Lager der Bruderschaft!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Wenn dir Cronos die Erlaubnis gab, mich aufzusuchen, müssen es in der Tat wichtige Nachrichten sein!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Y'Berion ist tot";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y'Berion ist tot! Er starb bei einer großen rituellen Anrufung des Schläfers.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y'Berion tot? Das sind schlechte Nachrichten, sehr schlechte Nachrichten!
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Wer hat die Führung der Bruderschaft übernommen? Dieser machtgierige, verschlagene Cor Kalom?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Nein! Kalom hat der Bruderschaft den Rücken gekehrt. Er hat einige Templer mitgenommen. Niemand weiß, wohin sie aufgebrochen sind.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Warum das? Er war doch der zweite Mann nach Y'Berion!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Gewisse Ereignisse haben die Gurus davon überzeugt, dass der Weg ihres Gottes der falsche ist. Er scheint ein Erzdämon zu sein, der nur Böses im Schilde führt.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Einer der Gurus hat mich unter dem Einfluss des Schläfers fast umgebracht, obwohl ich eben diesem Mann kurz zuvor das Leben gerettet hatte.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom war der einzige Guru, der die wahre Natur der Höllenkreatur nicht sehen wollte und hat daher das Lager im Sumpf verlassen.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Ich verstehe! Nun, das ist Glück im Unglück, denn Cor Angar ist ein guter Mann. Hart, aber ehrlich.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Wenn jemand den Zerfall der Bruderschaft nach dieser spirituellen Katastrophe verhindern kann, ist er es.

	B_LogEntry		(CH3_EscapePlanNC,	"Ich habe Saturas von den Ereignissen im Sumpflager berichtet. Er zeigte sich froh, dass Cor Angar die Führung der Bruderschaft übernommen hat.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Ich habe diesen Almanach hier";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //Ich habe diesen Almanach hier ...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'Berion hatte ihn benutzt, um den Fokus aufzuladen.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Sehr gut. Wir benötigen das Wissen aus diesem Buch, um alle fünf der ursprünglichen Fokussteine aufzuladen.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Ich werde den Almanach an mich nehmen!

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich habe diesen Fokus hier";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //Ich habe diesen Fokus hier ...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Du hältst einen der Schlüssel für die Zerstörung unser aller Fesseln in Händen.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //Es handelt sich um einen der fünf Fokussteine, mit deren Hilfe die magische Barriere erschaffen wurde.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //Und mit der fokussierenden Kraft genau dieser Steine werden wir die Mauern aus Energie auch wieder niederreißen.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Aber kostet das nicht unglaublich viel magische Energie?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //Richtig, doch wir haben über all die Jahre unermüdlich Erz gesammelt, anstatt es mit unseren Kerkermeistern gegen Annehmlichkeiten zu tauschen.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Wie du sicher schon weißt, enthält jeder Erzbrocken etwas magische Energie. Mit Hilfe dieser Energie, die in unserem großen Erzhaufen schlummert, können wir die magische Barriere in Fetzen sprengen.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //Das hört sich gefährlich an.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //Die Explosion wird rein magischer Natur sein und wird ausschließlich alles magisch Veränderte innerhalb der Barriere zerstören. Für uns Menschen besteht keine Gefahr.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Hier, nimm den Fokus. Hoffentlich hilft er dem Plan mit dem Erzhaufen auch wirklich!

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Was machst du jetzt mit Fokus und Almanach?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //Was machst du jetzt mit Fokus und Almanach?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Nichts. Wir benötigen vorher die vier restlichen Fokussteine!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Dummerweise befindet sich kein einziger dieser vier magischen Steine in unserem Besitz.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich bin bereit diese vier Foki für euch zu suchen!";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Ich bin bereit diese vier Foki für euch zu suchen!
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Schließlich will ich auch hier irgendwann wieder raus.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Ich muss dich warnen. Die Suche wird gleichermaßen schwierig und gefährlich.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Da die Spannungen mit dem Alten Lager immer stärker werden, kann ich hier auch keinen der Söldner entbehren.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Du wärest ganz auf dich alleine gestellt.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Na ja ... Das ist nun wirklich nichts Neues! Ich werde diese Dinger schon irgendwo auftreiben.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Deine Zuversicht ehrt dich, aber du wirst einige Gegenstände benötigen.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Nimm diese Karte hier. Sie ist alt, aber auf ihr sind die ursprünglichen Standorte der Fokussteine während der Erschaffung der Barriere verzeichnet.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Darüber hinaus sollte diese Spruchrolle dir eine schnellere Reise zurück in unser Lager ermöglichen.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //Zu guter Letzt sprich mit Riordian. Er braut die Tränke für das Lager.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Du findest ihn in seiner Hütte hier auf der obersten Ebene.

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hm, das ist ein Anfang. Du schlägst dich gut.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Es fehlen noch drei Fokussteine, um unseren großen Plan durchzuführen.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Gehe nun und suche die restlichen Fokussteine.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Gut, das ist schon der zweite Fokusstein, den du uns bringst.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Wir kommen unserem großen Ziel immer näher.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Schlag dich tapfer und suche nun die restlichen zwei Fokussteine.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Unglaublich, nun haben wir schon insgesamt vier Fokussteine.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Nur noch ein Einziger fehlt uns, dann haben wir alle ursprünglichen Steine in unserem Besitz.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Du hast unserer Gemeinschaft schon jetzt sehr viel Ehre erwiesen. Finde den letzten Fokusstein und unsere Befreiung steht kurz bevor.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Fantastisch, nun haben wir alle fünf Fokussteine in unserem Besitz.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Deine Taten sind von unschätzbarem Wert für unser Lager. Sei dir meines ewigen Dankes gewiss.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Gehe nun zu Riordian. Er wird dir einen Ausgleich für deine unermesslichen Mühen geben.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Sprich auch mit Cronos, dem Hüter des Erzes. Auch er wird dir ein Geschenk unserer Gemeinschaft überreichen.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,	"Es ist mir gelungen, alle vier fehlenden Fokussteine zu finden. Saturas ist überglücklich. Ich glaube ich habe jetzt einiges gut im Neuen Lager.");
		B_LogEntry		(CH3_BringFoci,	"Die Wassermagier Cronos und Riordian halten jeweils eine Belohnung für die Wiederbeschaffung aller vier Fokussteine für mich bereit. Ich sollte mal bei ihnen vorbeischauen.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Du hast die Teleport-Spruchrolle verbraucht, wie ich sehe. Hier, nimm eine neue.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "Ich habe in der Trollschlucht einen Fokus gefunden!";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //Ich habe in der Trollschlucht einen Fokus gefunden!

	B_LogEntry		(CH3_TrollCanyon,	"Der Fokus aus der Trollschlucht liegt nun sicher verwahrt bei Saturas.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich habe in der Bergfestung einen Fokus gefunden!";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //Ich habe in der Bergfestung einen Fokus gefunden!

	B_LogEntry		(CH3_Fortress,		"Saturas hat von mir den Fokus aus der Bergfestung erhalten.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich habe in der Klosterruine einen Fokus gefunden!";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //Ich habe in der Klosterruine einen Fokus gefunden!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Gorn, der Söldner, war dort und hat mich bei der Suche unterstützt.

	B_LogEntry		(CH3_MonasteryRuin,	"Endlich konnte ich Saturas den Fokus aus der Klosterruine übergeben.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich habe unter dem Stonehenge einen Fokus gefunden!";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //Ich habe unter dem Stonehenge einen Fokus gefunden!

	B_LogEntry		(CH3_Stonehenge,	"Ich habe Saturas den Fokus aus der Gruft unter dem Stonehenge überreicht.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "Kann nun die Sprengung des Erzhaufens beginnen?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Kann nun die Sprengung des Erzhaufens beginnen?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Wir haben jetzt alle Artefakte zusammen, die unser großes Vorhaben benötigt.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Doch die Erschaffung der Barriere wurde von zwölf Magiern durchgeführt.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //Um die gewaltigen Energien zu kontrollieren und in die richtigen Bahnen lenken zu können, sind wir Wassermagier nicht genug.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //Was machen wir dann?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Mir ist bewusst, dass du schon sehr viel für unsere Gemeinschaft getan hast und wir stehen tief in deiner Schuld ...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //... Doch im Interesse aller Koloniebewohner muss ich dich noch um einen weiteren Gefallen bitten.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ein weiterer Gefallen?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //Ein weiterer Gefallen?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Ja. Begib dich ins Alte Lager und versuche, einige der Feuermagier für unsere Sache zu gewinnen.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //DIE FEUERMAGIER??? Warum sollten die Maden den Speck verlassen wollen?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //Ein Zusammenbruch der Barriere würde ihre Machtposition  zunichte machen!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //Genau aus diesem Grunde musst DU dich um diese schwierige Mission kümmern. Du kennst Leute aus allen Lagern der Kolonie.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Erinnere die Feuermagier an die alten Zeiten, als wir noch gemeinsam die magischen Künste studierten.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "Nun gut, ich werde versuchen, die Feuermagier zu überreden!";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //Nun gut, ich werde versuchen, die Feuermagier zu überreden!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Aber ich kann nichts versprechen! Es scheint mir fast unmöglich.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Du musst es versuchen. Wenn du keinen Erfolg hast, dann gibt es nur noch einen ...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Einen ...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //... Einen WAS?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Vergiss das! Du MUSST Erfolg haben!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Hier, nimm diese Zauberrune. Überbringe sie Corristo, dem obersten Feuermagier, als Zeichen unseres Vertrauens.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Damit kann er sich jederzeit vorbei an allen Wachen mitten in diesen Raum teleportieren.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Ich hoffe, das überzeugt unsere ehemaligen Freunde von unseren guten Absichten.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Gut, dass du wieder zurück bist. Es ist etwas Schreckliches passiert!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Lass mich raten, die Freie Mine wurde von Gardisten aus dem Alten Lager überfallen, die niemand kommen sah?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Moment ... woher ... aber natürlich ... Du hast es im Alten Lager erfahren!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn kam kurz vor dir hier an.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Was kann Gomez nur veranlasst haben, solch einen aggressiven Schritt zu wagen?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Ihm müsste klar sein, dass dieser hinterhältige Überfall einen Krieg heraufbeschwört.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Die Alte Mine wurde nach einem Wassereinbruch verschüttet!";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Die Alte Mine wurde nach einem Wassereinbruch verschüttet!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //... Verschüttet ... natürlich ... dann gibt das Ganze langsam einen Sinn.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez steht mit dem Rücken zur Wand. Er ist gefährlicher denn je geworden, denn nun, wo er nichts mehr zu verlieren hat, wird er zu allem fähig sein!
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gomez hat alle Feuermagier töten lassen!";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez hat alle Feuermagier töten lassen!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //TÖTEN LASSEN??? Wieso bei Beliar hat er so etwas getan?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Sie waren gegen den Überfall auf die Freie Mine und stellten sich gegen Gomez.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Dann sind wir alle verloren. Ohne die anderen sechs Magier werden wir die geballte Kraft des großen Erzhaufens nicht kontrollieren können.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Ich danke dir trotzdem dafür, dass du diese gefährliche Botschaft an mich überbracht hast.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,	"Saturas war garnicht erfreut, als ich ihm über die Ereignisse im Alten Lager berichtet habe. Wie immer es jetzt mit der Sprengung der magischen Barriere weitergeht... es wird auf jeden Fall OHNE die Feuermagier geschehen müssen.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Das Alte Lager hat mich verbannt, weil ich euch geholfen habe!"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Das Alte Lager hat mich verbannt, weil ich euch geholfen habe!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Du gehörst nicht länger zum Alten Lager?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Dann heiße ich dich in unserer Gemeinschaft willkommen.

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,	"Nachdem ich aus dem Alten Lager verbannt wurde hat mich Saturas im Neuen Lager wilkommen geheissen.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Heißt das, die Söldner werden mich aufnehmen?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Heißt das, die Söldner werden mich aufnehmen?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Sprich mit Lee. Er wird sich darum kümmern. Danach komm wieder zu mir.

	B_LogEntry			(CH4_BannedFromOC,	"Lee, der Anführer der Söldner, will in dieser Angelegenheit mit mir sprechen. Ich soll ihn aufsuchen und anschließend wieder zu Saturas zurückkehren."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Heißt das, ich gehöre jetzt in die Gilde der Wassermagier?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Heißt das, ich gehöre jetzt in die Gilde der Wassermagier?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Noch nicht. Du musst erst den Eid des Wassers ablegen.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Aber ich habe mich bereits dem Feuer verschworen!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm ....
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //Du brichst den Schwur ja nicht!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Ähh ... Ich verstehe nicht ...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Du erweiterst deinen Schwur. Damit wirst du zum Magier der beiden Elemente!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Sowohl die Macht des Feuers als auch das Wissen des Wassers stehen dir dann zur Verfügung!

	B_LogEntry			(CH4_BannedFromOC,	"Saturas bot mir an, mich in den Kreis der Wassermagier aufzunehmen, ohne dass ich meinen alten Schwur des Feuers brechen muss."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich bin bereit, den Eid abzulegen."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Ich bin bereit, den Eid abzulegen.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Diener des Feuers, du wirst nun den Segen des Wassers empfangen!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Sprich nun die Worte des Eides:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Ich schwöre bei den Mächten der Götter ... 
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Ich schwöre bei den Mächten der Götter ... 
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... und bei der Kraft des heiligen Wassers ... 
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... und bei der Kraft des heiligen Wassers ... 
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ... 
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei ... 
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt. 
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt. 
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Mit diesem Schwur einst du die Kraft des Feuers und den Segen des Wassers in dir.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Du verbindest das, was vorher getrennt war. Möge dein Leben ein Zeichen des Bundes der Elemente sein.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Trage diese Robe als Zeichen deiner Verbundenheit zum heiligen Wasser und zu Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,	"Er hat mich in den Kreis der Wassermagier aufgenommen. Von nun an habe ich Zugriff auf beide Schulen der Magie."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kannst du mich unterrichten?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Kannst du mich unterrichten?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Es gibt noch viel zu lernen für dich. Wenn du bereit bist, werde ich dich unterrichten.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Es gibt noch einen weiteren Kreis, den du nicht kennst. Wenn du bereit bist, werde ich dich unterrichten.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Du beherrscht bereits den fünften Kreis der Magie! Du weißt alles, was ich weiß.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Ich kann dir nichts mehr beibringen!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Saturas, der Anführer der Wassermagier lehrt die magischen KREISE. Er hält sich stets am Pentagramm auf der obersten Ebene auf.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Ich bin bereit, in den ersten Kreis aufgenommen zu werden.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Den ersten der magischen Kreise zu betreten, bedeutet die Anwendung magischer Runen lernen.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Jede Rune birgt in sich die Struktur eines speziellen Zaubers.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Durch den Einsatz deiner eigenen magischen Energie, bist du in der Lage, den Zauber der Rune zu wirken.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Doch anders als Spruchrollen, die auch eine Zauberformel sind, sorgt die magische Kraft, die der Rune innewohnt, dafür, dass die Struktur des Zaubers erhalten bleibt.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Jede Rune ist eine Quelle magischer Kraft, auf die du immer wieder zurückgreifen kannst.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Deine eigene magische Kraft verbraucht sich beim Benutzen der Rune, wie bei einer Spruchrolle.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Mit jedem Kreis, den du lernst, lernst du auch die Möglichkeit, weitere Runen zu benutzen.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Nutze die Kraft der Runen, um dich selber zu erkennen.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Ich bin bereit, in den zweiten Kreis aufgenommen zu werden.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Du hast das Verständnis der Runen gelernt. Nun ist es an der Zeit, dieses Verständnis zu vertiefen.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Mit dem zweiten Kreis lernst du die Grundsätze stärkerer Kampfzauber und vor allem das Geheimnis der Heilung.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Doch du musst noch viel lernen, willst du die tatsächlichen Geheimnisse der Magie ergründen.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Du weißt, dass du jede Rune solange einsetzen kannst, bis deine eigene Kraft verbraucht ist.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Aber frage dich, ob es sinnvoll ist. Du hast Macht verliehen bekommen, mit der es dir ein Leichtes ist, Tod und Verderben zu bringen.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Doch der wahrhafte Magier zaubert nur dann, wenn es angebracht ist.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Erkenne die Situation, dann wirst du die Macht der Runen erkennen.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Ich bin bereit, den dritten Kreis zu betreten
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Der dritte Kreis der Magie ist einer der wichtigsten Schritte im Leben eines Magiers. Nicht länger bist du ein Suchender.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Du bist bereits ein Stück des magischen Weges gegangen. Du hast gelernt die Runen zu nutzen.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Dieses Wissen ist das Fundament für deinen weiteren Weg. Nutze die Runen mit Bedacht.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Du kannst eine Rune nutzen oder nicht. Aber entscheide dich für eine der Möglichkeiten.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Zögere nicht, deine Macht einzusetzen, wenn du dich einmal entschieden hast.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Erkenne deinen Weg, dann wirst du die Macht der Entscheidung erkennen.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Ich bin bereit für den vierten der Kreise.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Du hast die ersten drei Kreise durchschritten. Nun ist es an der Zeit, dass du die Geheimnisse der Magie kennen lernst.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Die Magie der Runen ruht in ihrem Stein. Es sind magische Steine, gewonnen aus magischem Erz.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Das gleiche Erz, das hier abgebaut wird. Dieses Erz wird in den Tempeln mit den Formeln der Magie versehen. Dort werden die Runen zu den Instrumenten unserer Macht geformt.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Mit allen Runen, die du nun beherrschen kannst, steht dir das gesammelte Wissen der Tempel des Reiches zur Verfügung.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Erkenne die Magie, dann wirst du das Geheimnis von Macht erkennen.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER FÜNFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Ich bin bereit für den fünften Kreis.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //So soll es geschehen. Ich werde dich die Macht des fünften Kreises lehren.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Der Sturm des Feuers, die Welle aus Eis und die Macht, Untote zu vernichten, sind wahrhaft mächtige Sprüche, deren Runen dir nun untertan sind.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Doch der mächtigste Zauber des fünften Kreises ist die Welle des Todes. Solltest du in den Besitz dieser Rune gelangen, dann bist du im Besitz gefährlicher Macht.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Hüte dich vor dem Einsatz dieser Magie. Sie ist eine Gabe des dunklen Gottes.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Erkenne deine Grenzen, dann wirst du deine wahre Macht erkennen
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Ich möchte die hohe Robe des Wassers tragen.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Es ist noch nicht an der Zeit, dass du die hohe Robe tragen kannst.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Dein bisschen Erz deckt ja nicht mal die Herstellungskosten.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Die Zeit ist gekommen. Du bist würdig, die hohe Robe des Wassers zu tragen.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee hat mich bei den Söldnern aufgenommen.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee hat mich bei den Söldnern aufgenommen.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Gut. Sehr gut. Dann gehörst du nun offiziell zu unserer Gemeinschaft.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Sei herzlich willkommen!

	B_LogEntry			(CH4_BannedFromOC,	"Auch Saturas hat mich nun als neuer Söldner offiziell begrüßt.");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Bei der Sache mit den Feuermagiern, erwähntest du einen weiteren... JEMAND";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Björn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Björn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Als du mich zu den Feuermagiern schicktest, erwähntest du einen weiteren ... JEMAND
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Nun, ich hoffte wir würden ohne seine Hilfe auskommen, aber so wie die Dinge stehen ...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //Wer ist dieser JEMAND?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //Also gut, also gut!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Vor vielen, vielen Jahren ...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Bitte die Kurzform!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Geduld! Also, als wir - die zwölf Magier - damals die Barriere erschufen, wurden unsere magischen Kräfte von einem 13. Zauberer gelenkt und geleitet.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Ein 13. Zauberer? Ich dachte, es hätte nur zwölf gegeben!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Die meisten, die die ersten Tage der Kolonie nicht miterlebt haben, glauben das.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Dieser 13. Zauberer war einst unser Anführer. Das alles war, bevor wir uns in den Feuer- und Wasserkreis zerstritten haben.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Doch er verließ das Alte Lager, das damals noch das einzige Lager in der Kolonie war.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Wie heißt dieser 13. Zauberer?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Wie heißt dieser 13. Zauberer?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Sein Name ist Xardas. Kaum einer kennt noch die alten Geschichten über ihn!
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Die, die es tun, nennen ihn nur den DÄMONENBESCHWÖRER!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Warum verließ er das Alte Lager?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Warum verließ er das Alte Lager?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Er begann sich intensiv mit der Beschwörung untoter und magischer Wesen zu beschäftigen.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Das beunruhigte nicht nur Gomez. Selbst die meisten der anderen Magier lehnten sich gegen ihn und sein unheiliges Treiben auf.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //Was passierte dann?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //Er war - anders als Gomez - kein Schlächter, also ging er dem Konflikt aus dem Weg und verließ die anderen.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Wo kann man diesen Zauberer finden?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Wo kann man diesen Zauberer finden?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Er lebt heute zurückgezogen in seinem Turm mitten im Orkgebiet.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //Das ist so ziemlich der südlichste Ort der Kolonie.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ich werde zu Xardas aufbrechen und ihn um Hilfe bitten!";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Ich werde zu Xardas aufbrechen und ihn um Hilfe bitten!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Er ist der einzige, der uns jetzt noch helfen kann.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //Wenn er keinen Rat weiß oder uns nicht helfen will ...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //ER WIRD!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Da wäre noch ein Problem ...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ein Problem?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Ein Problem?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Ja. Wir haben in den vergangenen Jahren öfters versucht, mit Xardas Kontakt aufzunehmen.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Doch er scheint wohl lieber ungestört zu bleiben.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Was bedeutet das?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Keiner der Boten kehrte je von seinem Turm zurück.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Du wirst einen Weg finden müssen, an seinen Kreaturen vorbeizukommen.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Es scheint also weiterhin interessant zu bleiben!
	
	B_LogEntry			(CH4_FindXardas,	"Saturas warnte mich vor den magischen Kreaturen des Dämonenbeschwörers Xardas. In der Bibliothek der Wassermagier gibt es Schriften über die Gefahren und Schwächen solcher Wesen. Ich sollte mir etwas Zeit nehmen, um dort herumzustöbern.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Wie werde ich mit seinen Kreaturen fertig?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Wie werde ich mit seinen Kreaturen fertig?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Wenn ich es wüsste, würde ich es dir sagen!
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Am besten, du betreibst etwas Nachforschung in unserer Bibliothek.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Vielleicht wissen die alten Bücher etwas über Stärken und Schwächen von magisch beschwörten Kreaturen.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //Ich werde die Bibliothek durchstöbern. Und mach dir keine Sorgen ...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Ich komme wieder!

	B_LogEntry			(CH4_FindXardas,	"In der Bibliothek der Wassermagier gibt es Schriften über die Gefahren und Schwächen solcher Wesen. Ich sollte mir etwas Zeit nehmen, um dort herumzustöbern.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlüsselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Hast du mit Xardas gesprochen?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Nun..."										,KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Nein..."										,KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Die ganze Sache ist anders, als du denkst..."	,KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Nun ...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Nun ..? Nun was?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Äh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dürfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Nein...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Warum nicht?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Ich kam bisher nicht in diese Gegend ...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Du musst ihn finden und um Rat fragen!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Die ganze Sache ist anders, als du denkst ...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Was heißt anders? Er muss einen Weg finden, wie wir den Erzhaufen sprengen können!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Der Erzhaufen ... äh ... äh ...  ist mittlerweile sehr groß!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Suche Xardas, er muss uns helfen!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius sagte, ich sei bereit die Robe der Wassermagier zu tragen."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius sagte, ich sei bereit die Robe der Wassermagier zu tragen.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Dann heiße ich dich in unserer Gemeinschaft willkommen.
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Heißt das, ich gehöre jetzt in die Gilde der Wassermagier?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Noch nicht. Du musst erst den Eid des Wassers ablegen. 
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Ich bin bereit, den Eid abzulegen."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Ich bin bereit, den Eid abzulegen.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Sprich nun die Worte des Eides:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Ich schwöre bei den Mächten der Götter...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Ich schwöre bei den Mächten der Götter...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...und bei der Kraft des heiligen Wassers...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...und bei der Kraft des heiligen Wassers...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...dass mein Wissen und Handeln von nun an und auf ewig mit dem Wasser verbunden sei...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...bis ich einkehre in Beliars Reich und der Quell des Lebens versiegt.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Trage diese Robe als Zeichen deiner Verbundenheit zum heiligen Wasser und zu Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,	"Saturas hat mich in den Kreis der Wassermagier aufgenommen.");

	AI_StopProcessInfos	(self);
};

