// **************************************
//					EXIT 
// **************************************

instance  DIA_Skip_Exit (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  999;
	condition	=  DIA_Skip_Exit_Condition;
	information	=  DIA_Skip_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Skip_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************
	var int Skip_TradeFree;
// **************************************

instance  DIA_Skip_First (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_First_Condition;
	information	=  DIA_Skip_First_Info;
	permanent	=  0;
	description = "Was machst du hier?";
};                       

FUNC int  DIA_Skip_First_Condition()
{
	if ( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_First_Info()
{
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Was machst du hier?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Ich kümmere mich um die Waffen der Gardisten.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Verkaufst du Waffen?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Nur an Gomez' Leute.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,	"Der Gardist Skip auf dem hinteren Burginnenhof verkauft WAFFEN. Aber nur an Gomez' Leute.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Verstehe. Wir sehen uns.",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Thorus hat mich zu dir geschickt. Ich soll mir ne Waffe besorgen.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Gomez hat mich zu dir geschickt. Ich soll mich ausrüsten lassen.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Gomez hat mich zu dir geschickt. Ich soll mich ausrüsten lassen.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //Also das Übliche: 'Ne neue Rüstung und die beste Waffe, die ich da habe.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //Mach, dass du wegkommst, oder ich zieh' dir das Fell über die Ohren!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Thorus hat mich zu dir geschickt. Ich soll mir 'ne Waffe besorgen.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //So?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Geh und frag ihn.",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Wenn du keine Waffe rausrückst, soll ich dir in den Hintern treten.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Ich soll für ihn ne Sache erledigen, die keiner von euch machen kann.",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //Verstehe. Wir sehen uns.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};
//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Ich soll für ihn 'ne Sache erledigen, die keiner von euch machen kann - du verstehst.
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Ach? Und da hat er nichts Besseres zu tun, als dich zu mir zu schicken?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Geh und frag ihn.",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Wenn du keine Waffe rausrückst, soll ich dir in den Hintern treten.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Er hat gesagt, wenn du keine Waffe rausrückst, soll ich dir einen kräftigen Tritt in den Hintern geben.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Ach? Ich glaube, wenn du hier nicht gleich verschwunden bist, gebe ich DIR einen Tritt in den Hintern!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Geh und frag ihn.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //Mach' ich glatt. Aber nicht jetzt. Interessiert ihn bestimmt, was du über ihn erzählst.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Ich weiß nicht, wer dich hier reingelassen hat, aber du solltest schleunigst wieder verschwinden!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Er hat gesagt, wenn du keine Waffe rausrückst, soll ich dir einen kräftigen Tritt in den Hintern geben.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //Schon gut, Mann, was willst du?
	Info_ClearChoices 	(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};

// **************************************
//			VERPATZT
// **************************************

instance  DIA_Skip_VERPATZT (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_VERPATZT_Condition;
	information	=  DIA_Skip_VERPATZT_Info;
	permanent	=  1;
	description = "Ich dachte, ich frag' noch mal wegen der Ausrüstung ...";
};                       

FUNC int  DIA_Skip_VERPATZT_Condition()
{
	if 	( 
		( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
		&& ( (Npc_KnowsInfo(hero,DIA_Skip_First)) && (Skip_TradeFree == FALSE) ) 
		)
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_VERPATZT_Info()
{
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //Ich dachte, ich frag' noch mal wegen der Ausrüstung ...
	AI_Output (self, other,"DIA_Skip_VERPATZT_12_01"); //Zisch ab!
};

/*------------------------------------------------------------------------
							Waffenhandel								
------------------------------------------------------------------------*/

instance  GRD_211_Skip_TRADE (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_TRADE_Condition;
	information		= GRD_211_Skip_TRADE_Info;
	permanent		= 1;
	description		= "Ich könnte ein paar Sachen gebrauchen"; 
	trade 			= 1;
};

FUNC int  GRD_211_Skip_TRADE_Condition()
{
	if ( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) 
			||	(Skip_TradeFree == TRUE) )
	{
		return TRUE;
	};
};


FUNC void  GRD_211_Skip_TRADE_Info()
{
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Ich könnte ein paar Sachen gebrauchen.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Ich könnte dir ein paar Sachen verkaufen.
};  

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_211_Skip_WELCOME (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_WELCOME_Condition;
	information		= GRD_211_Skip_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_211_Skip_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_211_Skip_WELCOME_Info()
{
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Hey, dafür dass du noch nicht so lange hier bist, hast du es ziemlich weit gebracht!
};
