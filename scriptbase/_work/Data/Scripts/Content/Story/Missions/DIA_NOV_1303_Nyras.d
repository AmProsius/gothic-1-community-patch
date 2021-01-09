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
	description		= "Hi! I'm new here.";
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
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Hi! I'm new here.
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //The Sleeper be with you, stranger!
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
	description		= "What can you tell me about this place?";
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
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //What can you tell me about this place?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Well - the Gurus are the most important people here. They spread the word of the Sleeper and pass our master's visions on to the novices.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //Of course he's too tired to talk to everybody himself.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //But on some days he speaks to us in the temple courtyard and reveals the holy words of the Sleeper.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Tell me about the holy words of the great Sleeper.",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"And what does he say then?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //And what does he say then?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //The Sleeper guides the way. But an infidel like you wouldn't understand that!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Tell me about the holy words of the great Sleeper.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //HE tells us what we need to do to gain freedom again.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion says that the Sleeper will show us the way as soon as we're able to hear him.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //He's preparing a great invocation, in which he'll contact the Sleeper together with the best novices.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalom supports him. He's an alchemist who brews substances which put us into a sleep-like state.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //You can only receive the thoughts of the Sleeper in this state - or when sleeping.
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
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Scram! You have no business to be here!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "I'm searching for the focus."; 
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
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //I'm searching for the focus.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Unfortunately you're too late for that. I've already found it!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //And I'm keeping it for myself!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //The Sleeper talked to me last night and made me his only tool!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Now I'll only serve the Sleeper. No more templars or Gurus!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //OOONNNLLLLYYYYYY MEEEEEEEEE AAALLLOOONE!!!!!!!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //DIIIIIIIIEE!!!!!

	B_LogEntry		(CH2_Focus,"Nyras has lost his mind. He wants to keep the focus for himself and attacked me in his rage.");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
