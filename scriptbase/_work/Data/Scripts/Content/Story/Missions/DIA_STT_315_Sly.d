// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_315_Sly_Exit (C_INFO)
{
	npc			= STT_315_Sly;
	nr 			= 999;
	condition	= DIA_STT_315_Sly_Exit_Condition;
	information	= DIA_STT_315_Sly_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_315_Sly_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************

instance DIA_STT_315_Sly (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Condition;
	information		= DIA_STT_315_Sly_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_STT_315_Sly_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_Info()
{
	AI_SetWalkmode	(self, NPC_WALK);
	AI_GotoNpc		(self, other);
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //New here, are you? I don't know your face.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //I'm Sly. I have a job on offer for a newcomer.
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************
	var int Sly_LostNek;
// **************************************************

INSTANCE DIA_STT_315_LostNek (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNek_Condition;
	information		= DIA_STT_315_LostNek_Info;
	permanent		= 0;
	description		= "You have a job for me? What is it?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //You have a job for me? What is it?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //One of our guards has disappeared! He's called Nek. He might have gone over to the New Camp.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //You're new here and you'll get around quite a lot. So keep your eyes peeled.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //If you find him, I'll speak up for you in the Camp.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"I'll see if I can find him.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"What good will your speaking up for me do?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //What good will your speaking up for me do?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //If you wannna join the Camp, you need people to speak up for you.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //If I speak up for you with Diego, that'd be a great help for you.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //I'll see if I can find him.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //If you meet Fletcher, ask him about Nek. He's taken over his distric' since Nek disappeared.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Where will I find him?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //His district is the district of the arena.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, the Shadow, has promised to speak to Diego for me if I find Nek. The guard might have joined the New Camp. I should ask Fletcher from the arena district about Nek.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, the Shadow, has asked me to find the vanished guard Nek. The guard might have joined the New Camp. I should ask Fletcher from the arena district about Nek.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNek );
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						SUCCESS
// **************************************************

INSTANCE DIA_STT_315_LostNekSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNekSuccess_Condition;
	information		= DIA_STT_315_LostNekSuccess_Info;
	permanent		= 1;
	description		= "I've found Nek.";
};

FUNC INT DIA_STT_315_LostNekSuccess_Condition()
{	
	if ( (Sly_LostNek == LOG_RUNNING) && (Npc_HasItems(other,Neks_Amulett) > 0) )
	{
		return 1;
	};
};

func VOID DIA_STT_315_LostNekSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //I've found Nek.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //Good! Have you got any evidence for that?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"No - I'm afraid not.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"I've found this amulet on him - here you go.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //I've found this amulet on him - here you go.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //It was actually the amulet the whole thing was about. You're a clever guy.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //You might have had the idea to keep the amulet yourself, but you've made the right decision.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //If Diego asks me about you, I'll vote in your favor.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"I've given Nek's amulet to Sly. He was amazed at my honesty.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"I've given Sly Nek's amulet. He'll talk to Diego and speak in my favor.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"I've given Sly Nek's amulet. Not that it's going to do me any good - the Old Camp won't let me join any more anyway.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //No - I'm afraid not.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Oh? You're not hiding anything from me, are you? Nek had an amulet on him.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //I don't like people keeping things from me that are mine. If you find the amulet, bring it to me!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //I'll think of you when I hold the amulet in my hand.
	
	B_LogEntry( CH1_LostNek,"Sly wants to have an amulet of Nek's.");
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************

instance DIA_STT_315_Sly_AfterSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_AfterSuccess_Condition;
	information		= DIA_STT_315_Sly_AfterSuccess_Info;
	permanent		= 1;
	description		= "How's it going?";
	
};

FUNC int DIA_STT_315_Sly_AfterSuccess_Condition()
{
	if ( (Kapitel == 1) && (Sly_LostNek == LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_AfterSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //How's it going?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Good! With me you don't need to worry about Diego any more!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //You scratch my back, I'll scratch yours, eh?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //That's the way it is.
};


	
	
	




		
		
