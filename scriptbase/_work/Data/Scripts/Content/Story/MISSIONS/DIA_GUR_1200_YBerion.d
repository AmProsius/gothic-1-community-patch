// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Yberion_EXIT(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 999;
	condition	= Info_Yberion_EXIT_Condition;
	information	= Info_Yberion_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Yberion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Yberion_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//############################### KAPITEL 1 ###############################


INSTANCE DIA_YBerion_Wache(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Wache_Condition;
	information	= DIA_YBerion_Wache_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_YBerion_Wache_Condition()
{
	if (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Wache_Info()
{	
	AI_Output			(self,	other,"DIA_YBerion_Wache_12_00"); //Was machst du hier? Wer hat dich hereingelassen? Wache!
	B_IntruderAlert		(self,	other);
	AI_StopProcessInfos	(self);
};

//############################### Kennen? ###############################

INSTANCE DIA_YBerion_Kennen(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Kennen_Condition;
	information	= DIA_YBerion_Kennen_Info;
	permanent	= 0;
	description = "Sei gegrüßt, Meister Y'Berion.";
};                       

FUNC INT DIA_YBerion_Kennen_Condition()
{
	if (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Kennen_Info()
{	
	AI_Output (other, self,"DIA_YBerion_Kennen_15_00"); //Sei gegrüßt, Meister Y'Berion.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_01"); //Ah! Du kommst mir bekannt vor!
	AI_Output (other, self,"DIA_YBerion_Kennen_15_02"); //Unmöglich. Wir haben uns noch nie gesehen.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_03"); //Und ich dachte ... Nun gut - was willst du?
};


//############################### KAPITEL 2 ###############################

// ------------------------------ BringFocus ---------------------------
INSTANCE Info_YBerion_BringFocus (C_INFO)
{
	npc			= GUR_1200_Yberion;
	condition	= Info_YBerion_BringFocus_Condition;
	information	= Info_YBerion_BringFocus_Info;
	permanent	= 1;
	description = "Mir kam zu Ohren, du suchst etwas";
};


FUNC INT Info_YBerion_BringFocus_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_YBerion_Kennen)	)
	&&	(Npc_GetTrueGuild(hero) != GIL_NONE		)
	&& 	(YBerion_BringFocus		!= LOG_RUNNING	)
	&& 	(YBerion_BringFocus		!= LOG_SUCCESS	)
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Info()
{
	AI_Output (other, self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //Mir kam zu Ohren, du suchst etwas.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //Das ist richtig. Wir brauchen einen magischen Fokus.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Wir haben den Novizen Nyras losgeschickt, um den Fokus zu holen. Doch er ist bisher nicht zurückgekehrt.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //Du könntest für mich nachsehen, was passiert ist!
	
	Info_ClearChoices	(Info_YBerion_BringFocus);
	Info_AddChoice		(Info_YBerion_BringFocus,DIALOG_BACK							,	Info_YBerion_BringFocus_BACK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Ich werde den Fokus zurückbringen!"	,	Info_YBerion_BringFocus_OK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Wo soll ich suchen?"					,	Info_YBerion_BringFocus_WO);
	Info_AddChoice		(Info_YBerion_BringFocus,"Was hat es mit dem Fokus auf sich?"	,	Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK ()
{
	Info_ClearChoices	(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //Ich werde den Fokus zurückbringen!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Nimm diese Karte hier, dort ist der Ort des Fokus verzeichnet.

	B_Story_BringFirstFocus();

	B_LogEntry		(CH2_Focus,	"Y'Berion hat den Novizen Nyras ausgesand, um den magischen Fokus zu holen, doch er kam bisher nicht zurück. Der Guru gab mir eine Karte, auf der der Weg zum Fokus eingezeichnet ist.");
};

func void Info_YBerion_BringFocus_WO ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Wo soll ich suchen?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Wenn du das Lager verlässt, wende dich nach rechts und steige hinauf zur großen Klippe. Dort, hinter dem Wald, wo du das Meer sehen kannst, wirst du den Fokus finden.
};

func void Info_YBerion_BringFocus_FOKUS ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Was hat es mit dem Fokus auf sich?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //Es ist ein magischer Gegenstand, der unsere geistigen Kräfte vereinigen wird.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //Es handelt sich dabei um einen der fünf Fokussteine, den die Magier zum Errichten der Barriere benutzt haben.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //In einer Vision sah ich, dass wir uns die Kraft eines Fokus zu Nutze machen müssen.
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //War wohl eine ziemlich spannende Vision.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Meine Vision war ein Zeichen vom Schläfer. Mit dem Fokus können wir ihn erreichen!
};

// ------------------------------ RUNNING ----------------------------------
INSTANCE Info_YBerion_BringFocus_RUNNING (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_RUNNING_Condition;
	information	= Info_YBerion_BringFocus_RUNNING_Info;
	permanent	= 0;
	description	= "Ich habe den Fokus immer noch nicht gefunden.";
};                       

FUNC INT Info_YBerion_BringFocus_RUNNING_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( !Npc_HasItems ( hero, Focus_1 ))
	{
		return TRUE;
	};
};

FUNC VOID Info_YBerion_BringFocus_RUNNING_Info()
{	
	AI_Output (other, self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Ich habe den Fokus immer noch nicht gefunden.
	AI_Output (self, other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Dann suche weiter. Der Schläfer wird dir den Weg weisen.
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_YBerion_BringFocus_Success (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_Success_Condition;
	information	= Info_YBerion_BringFocus_Success_Info;
	permanent	= 0;
	description	= "Ich habe den Fokus gefunden";
};                       

FUNC INT Info_YBerion_BringFocus_Success_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Success_Info()
{	
	AI_Output			(other, self,"Info_YBerion_BringFocus_Success_15_01"); //Ich habe den Fokus gefunden.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_02"); //Hervorragend. Du hast uns einen großen Dienst erwiesen.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_03"); //Bring nun den Fokus zu Cor Kalom. Er wird wissen, was zu tun ist.
	if	(Kalom_TalkedTo == FALSE)
	{
		AI_Output		(other, self,"Info_YBerion_BringFocus_Success_15_04"); //Wo kann ich diesen Cor Kalom finden?
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_05"); //Er hält sich die meiste Zeit im Alchemielabor auf der oberen Stegebene auf.
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_06"); //Frag Lester am Eingang des Lagers ... Er führt öfter Neulinge herum.
		B_LogEntry		(CH2_Focus,	"Y'Berion hat mich beauftragt, den Fokus zu einem anderen Guru namens 'Cor Kalom' zu bringen. Dieser Cor Kalom soll sich den ganzen Tag im Alchemielabor aufhalten."); 
	}
	else
	{
		B_LogEntry		(CH2_Focus,	"Y'Berion hat mich beauftragt, den Fokus zu Cor Kalom zu bringen. Welch eine 'Freude' diesen überaus liebenswürdigen Menschen wieder zu treffen.");
	};

	Tpl_1406_Templer.aivar[AIV_PASSGATE] = TRUE;		//Türwache vor dem Labor

	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP			(XP_BringFocusToYBerion);
};

// ------------------------------ NYRAS ----------------------------------
INSTANCE Info_YBerion_NYRAS (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_NYRAS_Condition;
	information	= Info_YBerion_NYRAS_Info;
	permanent	= 0;
	description	= "Der Novize Nyras hat den Verstand verloren!";
};                       

FUNC INT Info_YBerion_NYRAS_Condition()
{
	if  ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_NYRAS_Info()
{	
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_01"); //Der Novize Nyras hat den Verstand verloren!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_02"); //Er faselte davon, dass der Schläfer zu ihm gesprochen habe und ihn als einzigen Diener auserwählte!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_03"); //Dann griff er mich sogar an und wollte mich töten!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_04"); //Die Macht des Schläfers ist so gewaltig, dass sie unvorbereitete Seelen in Verwirrung stürzen kann.
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_05"); //Nur wir Gurus haben durch jahrelanges Meditieren die seelische Stärke gewonnen, die Stimme des allmächtigen Schläfers zu ertragen!
};

// ------------------------------ BELOHNUNG ----------------------------------
instance  GUR_1200_Yberion_EARN (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_EARN_Condition;
	information		= GUR_1200_Yberion_EARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie siehts mit einer Belohnung aus?"; 
};

FUNC int  GUR_1200_Yberion_EARN_Condition()
{	
	if ( YBerion_BringFocus == LOG_SUCCESS) && ( Npc_GetTrueGuild (hero)!= GIL_NOV ) && ( C_IsChapter(2) )
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_EARN_Info()
{
	AI_Output				(other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Wie sieht's mit einer Belohnung aus?
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_02"); //Da du kein Bruder unserer Gemeinschaft bist, werde ich dich entlohnen.
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_03"); //Nimm dieses Amulett als Zeichen meiner Dankbarkeit.
	CreateInvItem	    (self, Schutzamulett_Feuer);
	B_GiveInvItems	    (self, hero, Schutzamulett_Feuer, 1);
};  



//############################### KAPITEL 3 ###############################
//SPIELER HAT DIE HEILKRÄUTER ZU COR ANGAR GEBRACHT
//YBERION WACHT AUF UND STIRBT
/*
instance GUR_1200_Yberion_LASTWORDS (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_LASTWORDS_Condition;
	information		= GUR_1200_Yberion_LASTWORDS_Info;
	important		= 1;
	permanent		= 0;

};

FUNC int GUR_1200_Yberion_LASTWORDS_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_LASTWORDS_Info()
{
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_01"); //Das Ende...der Schläfer...ich sah...IHN!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_02"); //Wer...?...du bist es, gut. Hör mir zu....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_03"); //Du darfst den Schläfer nicht wecken,... die Wassermagier, ...
	AI_Output (other, self,"GUR_1200_Yberion_LASTWORDS_Info_15_04"); //Was ist mit den Wassermagiern?
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_05"); //Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_06"); //Der Schläfer...Ich sah ihn. Er ist ein ...ein ....Dämon!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_07"); //Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_08"); //...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr müsst ....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das Böse....darf nicht erwachen .... 
	
	
	
};  
// ------------------------------  ----------------------------------
*/
