// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Nyras_Exit (C_INFO)
{
	npc			=  Nov_1303_Nyras;
	nr			=  999;
	condition	=  DIA_Nyras_Exit_Condition;
	information	=  DIA_Nyras_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Nyras_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Nyras_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hi
// **************************************************

instance DIA_Nyras_Hallo (C_INFO)
{
	npc				= Nov_1303_Nyras;
	nr				= 1;
	condition		= DIA_Nyras_Hallo_Condition;
	information		= DIA_Nyras_Hallo_Info;
	permanent		= 0;
	description		= "Hi! Ich bin neu hier.";
};

FUNC int  DIA_Nyras_Hallo_Condition()
{
	if	(Kapitel <= 1)
	{
		return TRUE;
	};
};
func void  DIA_Nyras_Hallo_Info()
{
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Hi! Ich bin neu hier.
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Der Schläfer sei mit dir, Fremder!
};

// **************************************************
//						Ort
// **************************************************

instance DIA_Nyras_Ort (C_INFO)
{
	npc				= Nov_1303_Nyras;
	nr				= 1;
	condition		= DIA_Nyras_Ort_Condition;
	information		= DIA_Nyras_Ort_Info;
	permanent		= 0;
	description		= "Was kannst du mir über diesen Ort sagen?";
};

FUNC int  DIA_Nyras_Ort_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Nyras_Hallo))
	&&	(Kapitel <= 1)
	{
		return 1;
	};
};

func void  DIA_Nyras_Ort_Info()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Was kannst du mir über diesen Ort sagen?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Nun - die Gurus sind die wichtigsten Leute hier. Sie verbreiten die Lehre des Schläfers, und teilen den Novizen die Visionen unseres Meisters mit.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //Er selbst ist natürlich viel zu erschöpft, um immer zu allen zu reden.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Aber an manchen Tagen spricht er auf dem Tempelplatz zu uns und offenbart uns die heiligen Worte des Schläfers.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Berichte mir von den heiligen Worten des großen Schläfers. ",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"Und was sagt er so?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //Und was sagt er so?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //Der Schläfer weist uns unseren Weg. Aber davon versteht ein Ungläubiger wie du nichts!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Berichte mir von den heiligen Worten des großen Schläfers.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //ER sagt uns, was wir tun müssen, um die Freiheit zu erlangen.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion sagt, der Schläfer wird uns den Weg mitteilen, sobald wir in der Lage sind, ihn zu hören.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Er bereitet eine große Anrufung vor, in der er zusammen mit den besten Novizen mit dem Schläfer in Kontakt treten will.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalom unterstützt ihn dabei. Er ist Alchimist und braut Substanzen zusammen, die uns in einen schlafähnlichen Zustand versetzen.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //Nur in diesem Zustand - oder wenn du schläfst - kannst du die Gedanken des Schläfers empfangen.
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

// ***************************************************
//						
// ***************************************************








///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
////////////////////		Bring Fokus 1		///////////////////////////
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

// ***************************** BEGRÜßUNG ****************************************//

instance Nov_1303_Nyras_GREET (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_GREET_Condition;
	information		= Nov_1303_Nyras_GREET_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Nov_1303_Nyras_GREET_Condition()
{
	if ( YBerion_BringFocus == LOG_RUNNING )
	{
		return 1;
	};
};
func void  Nov_1303_Nyras_GREET_Info()
{
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Verschwinde! Hier gibt es nichts für dich zu holen!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich bin auf der Suche nach dem Fokus"; 
};

FUNC int  Nov_1303_Nyras_LEAVE_Condition()
{	
	if ( Npc_KnowsInfo (hero,Nov_1303_Nyras_GREET))
	{
		return 1;
	};
};
FUNC void  Nov_1303_Nyras_LEAVE_Info()
{
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Ich bin auf der Suche nach dem Fokus.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Da kommst du leider zu spät. Ich habe ihn bereits gefunden!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //Und ich werde ihn für mich selbst behalten!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Der Schläfer sprach heute Nacht zu mir und machte mich zu seinem alleinigen Werkzeug!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Nun werde nur noch ich dem Schläfer dienen. Keine Templer, keine Gurus mehr!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //NUUUUR ICHHHH ALEEEEEINEEEEEEE!!!!!!!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //STIIIIIIRB!!!!!

	B_LogEntry		(CH2_Focus,	"Nyras hat den Verstand verloren. Er will den Fokus für sich behalten und griff mich in seinem Wahn an.");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
