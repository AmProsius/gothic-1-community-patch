// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //How often have I told you bastards not to run through my hut!
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "What's your problem?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //What's your problem?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Leave me alone, man! Everyone's a problem with ME!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //It all started when I built my hut.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Don't build your hut close to the ditch, they said.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //But none of these bastards told me what would happen if I still did it.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //When I came back from the mine a few days ago, I had a second door.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Those pigs. I hate them. I can't tell you how much I hate them.
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Now everybody runs through my hut. Every idiot.
};

	
	
	
	
	


















