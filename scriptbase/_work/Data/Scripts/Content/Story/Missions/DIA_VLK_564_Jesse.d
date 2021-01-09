// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "How's things?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //How's things?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //New here, are you? You better know that it's no good getting into trouble with the guards.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //When they want protection money, you better pay, otherwise half the Camp'll be against you.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hey, you! I learned you didn't want to pay protection money to Bloodwyn?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //What do you want?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //To warn you! Bloodwyn paid some people: They're gonna do you in.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //I saw how he talked to people like Herek over there, and God knows who else he hired!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Your warning about Herek is a bit late.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //He must have talked to somebody else as well, that much I know. So do take care.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Why did you tell me the story about Bloodwyn?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Why did you tell me the story about Bloodwyn?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Because favors can be returned. And you don't look like somebody who wouldn't understand that.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //And because I did YOU a favor, I'd like to give you the opportunity to return it.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Forget it! I don't owe you anything!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"What exactly do you have in mind?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //I don't owe you anything!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Oh! Then get lost!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //What exactly do you have in mind?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //I don't have any ore left, and Bloodwyn has already fleeced me as well.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Now that I've helped you, you could give him the 10 ore I owe him, couldn't you? Tell him it's from me.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Me, pay for you? Forget it!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"I'll see what I can do.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //I'll see what I can do.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Thanks, man! You just saved my day! Tell me when things are settled, will you?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Me, pay for you? Forget it!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Apparently I was wrong about you. Don't count on me in the future.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "I paid Bloodwyn!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //I paid Bloodwyn!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Yeah? Great! Then we're quits now.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"WHAAAT? I spent 10 ore on a clue I knew about anyway?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Yeah. You scratch my back, I'll scratch yours.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //WHAAAT? I spent 10 ore on a clue I knew about anyway?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Apparently.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Yeah. You scratch my back, I'll scratch yours.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
