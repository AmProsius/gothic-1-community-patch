//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "This castle's pretty roomy.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //This castle's pretty roomy.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //I don't think I've seen you here before. Who are you?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //I'm a newcomer. Just thought I'd take a look around.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 10;
	description = "What can you tell me about the castle?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //What can you tell me about the castle?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Gomez and his gang took it over after the big uprising.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //I knew right away it was better to join up with him.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Even when we were still cooped up in the dungeons, and had to slave away in the mines, the rest of us prisoners always did what he said.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Are there dungeons under the castle then?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Yeah, but there ain't nothing in them now. Nobody ever went down there after the big uprising.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "What's life like as a guard?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //What's life like as a guard?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Quiet. We're the biggest, strongest camp in the whole of the colony. Nobody messes with us.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //I see.
	AI_StopProcessInfos	(self);
};

	














/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //You've made the right choice. You'll enjoy being a guard!
	AI_StopProcessInfos	(self);
};
