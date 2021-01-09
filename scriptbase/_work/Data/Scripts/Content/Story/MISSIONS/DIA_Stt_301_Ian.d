
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Ich schau' mich mal um.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Mach keinen Ärger.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "Bist du Ian, der Chef der Mine?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //Bist du Ian, der Chef der Mine?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Ja, ich bin Ian. Und das hier ist meine Mine. Also fass nichts an und mach nichts kaputt.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ist das nicht Gomez' Mine?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Ist das nicht Gomez' Mine?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Ja, natürlich ist das die Mine des Alten Lagers. Aber hier drin gibt's nur einen Chef - und das bin ich.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kannst du mir ein paar Takte zur Erzförderung erzählen?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Kannst du mir ein paar Takte zur Erzförderung erzählen?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Wir fördern hier rund um die Uhr Erz. Im Monat sind das über 200 Säcke Erz, die gelagert werden und noch mal 20 Säcke, die eingeschmolzen werden. 
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Mit dem Erz, das wir dem König liefern, können hunderte von Klingen hergestellt werden.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich habe gehört, das Erz ist magisch. Erzähl mir davon."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //Ich habe gehört, das Erz ist magisch. Erzähl mir davon.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Das magische Erz besitzt besondere Qualitäten. Es macht die Waffen unzerbrechlich und die Klingen sind schärfer als gewöhnliche. 
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Eine Armee, die mit solchen Waffen ausgestattet ist, hat einen entscheidenden Vorteil in jeder Schlacht.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Erzähl mir mehr vom Erz"; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Erzähl mir mehr vom Erz.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Leider geht die magische Wirkung des Erzes beim Schmelzen verloren. In den Hochöfen von Nordmar, da kennen sie die richtige Schmelztechnik. 
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Aber selbst ohne die magische Wirkung sind Waffen aus diesem Erz extrem widerstandsfähig und richten mehr Schaden an als gewöhnliche Waffen.  
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Erzähl mir von der Mine."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Erzähl mir von der Mine.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Wenn du dich hier weiter umsehen willst, sei vorsichtig. In den Höhlen sind Minecrawler. Am besten du bleibst in diesem Hauptschacht.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //Und lass die Templer in Ruhe. Sie lungern zwar die meiste Zeit nur rum, aber wenn die Crawler kommen,gibt es keinen besseren Kämpfer an deiner Seite.  
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Ich werd's mir merken.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Ich hab' noch zu tun. Und halte meine Jungs nicht von der Arbeit ab.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Ich sehe mich nur mal um.   
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich wollte die Liste fürs Lager abholen."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Ich wollte die Liste fürs Lager abholen.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Da könnte ja jeder kommen. Verpiss dich.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Diego schickt mich. Ich soll die Liste abholen."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Diego schickt mich. Ich soll die Liste abholen.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //Alle klar, hier ist die Liste. Sie sollen sich mit dem Liefern beeilen.
	B_LogEntry  (CH1_BringList,"Ian hat mir die Liste ohne Probleme übergeben.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Es muss hier irgendwo ein Nest der Minecrawler geben.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Es muss hier irgendwo ein Nest der Minecrawler geben.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Hier gibt's wahrscheinlich Dutzende von Nestern.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Hör zu, ich muss zu diesem Nest...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Ich habe jetzt keine Zeit, mich darum zu kümmern. Unser Stampfer ist kaputt. Vor ein paar Stunden ist das Zahnrad gebrochen. 
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Ich hab' noch keine Idee, wo ich ein neues herbekommen kann.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Besorg mir doch einfach eins, dann kümmere ich mich um dein Problem.

	B_LogEntry		(CH2_MCEggs,	"Ian der Minenboss will mir nicht helfen das Nest zufinden Ich soll ihm erst ein neues Zahnrad für ihren kaputten Erzstampfer besorgen. Er erwähnte einen verlassenen Nebenstollen, in dem sich noch ein alter Stampfer befinden soll.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ein Zahnrad? Wo soll ich das herkriegen?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ein Zahnrad? Wo soll ich das herkriegen?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Keine Ahnung. Ich bin so ratlos wie du!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //Aber es gibt in einem Nebenschacht noch einen alten, kaputten Stampfer. Vielleicht hast du ja dort Glück.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ich habe das Zahnrad.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Ich habe das Zahnrad.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Hey, gut gemacht. Ich denke, das wird klappen. Nun zu dir, du suchst das Nest der Minecrawler...hm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Geh mal zu Asghan, er soll das Tor öffnen, damit du die dunklen Schächte durchsuchen kannst.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Sag ihm einfach, "Alles wird gut". Dann wird er wissen, das ich die Erlaubnis gegeben habe.

	B_LogEntry		(CH2_MCEggs,	"Ich habe Ian das Zahnrad des verlassenen Erzstampfers gebracht.Ian sagte mir,wenn ich Asgahn die Worte ALLES WIRD GUT sagen, dann wird er das Tor zu den dunklen Schächten öffnen.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ich suche immer noch das Nest der Crawler.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Ich suche immer noch das Nest der Crawler.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Ich sagte doch, geh zu Asghan. Er ist der Anführer der Gardisten. Du findest in irgendwo auf der untersten Ebene.

	B_LogEntry		(CH2_MCEggs,	"Wenn ich das Minecrawlernest finden will, sollte ich mit Asghan reden.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ich habe das Nest gefunden!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Ich habe das Nest gefunden!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //Dann kehrt jetzt hier endlich wieder Ruhe ein. Hahaha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Nichts für ungut. Gute Arbeit, Kleiner! 
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Hier, nimm diese Kiste Bier für deine Mühen.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ich habe das Nest gefunden! Und Eier von der Minecrawler-Königin!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Ich habe das Nest gefunden! Und Eier von der Minecrawler-Königin!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Wie? Nur so wenig Eier? Na, was soll's. Du hast bewiesen, dass du kämpfen kannst.
};
