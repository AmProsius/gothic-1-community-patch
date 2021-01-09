// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Watch your back!
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Do you intend to go through this gate?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //Do you intend to stop me?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //No, but you should know what's waiting for you. This is not like in the Old Camp and not like being with the sect loonies either!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //And what am I expecting here?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //There are no guards or templars to look after you. It's every man for himself, the only ones who stick together are us mercenaries.
};

// ************************************************************
// 						Söldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "What do the mercenaries do?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //What do the mercenaries do?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //We - we are the mercenaries of the water mages.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Our target is to break free from here. We're working hard for it and don't plan to take things easy like the guys from the Old Camp, who are just having an easy time resting on the backs of the diggers.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //And we all follow Lee. He's a great man. He's the one who holds this damn camp together.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "What do the mages do?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //What do the mages do?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //They investigate the magic characteristics of the ore our scrapers collect in the mine.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //As far as I know, they want to blow the whole damn ore mound sky-high to free us from the Barrier.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //Sounds dangerous.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //They said we shouldn't worry.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "You have a massive ore mound here?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //You have a massive ore mound here?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //You could say that. We could buy the King's wife for that.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //But we don't give a damn about trading the ore with that old fart. We want to get OUT OF HERE!
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "Where's the ore mound?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Where's the ore mound?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //You want to see a real mound of ore, do you? There's a hole in the middle of the cave, they shove it all in there.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //But you won't get anywhere near it, I can tell you. The mages and our people guard the ore day and night.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //I was just curious.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "What about the rest of the people?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //What about the rest of the people?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //All crooks. They don't give a damn about the Camp. I'd rather just have the peasants guarding the front gate.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "How are things going at the moment?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //How are things going at the moment?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //The scrapers are still collecting. Once they have enough ore, we'll blow the mound up.
};

/*------------------------------------------------------------------------
//							SÖLDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hey, I heard you'd been giving the crawlers in the mine a hard time.
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee should be quite willing to accept you as a mercenary. Just speak to him.

	self.flags = 0;		// Immortal-Flag löschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"I should speak to Lee. Maybe he'll let me join the mercenaries.");
};






	


