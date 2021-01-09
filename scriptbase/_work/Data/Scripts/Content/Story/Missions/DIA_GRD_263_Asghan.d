
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "There must be a nest of minecrawlers here somewhere."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //There must be a nest of minecrawlers here somewhere.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //The whole bloody mountain is just one big crawler nest!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Why have you closed this shaft?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //It didn't matter how many crawlers we killed, more and more just kept coming out.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Sounds like there must be a nest somewhere near. Let me open the gate!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //No! This gate can only be opened with Ian's permission! Nothing will be done before.
	
	B_LogEntry		(CH2_MCEggs,"Asghan, the boss of the mine guards, won't open the gate. He wants Ian's permission.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hey Asghan, you may open the gate now!"; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hey Asghan, you may open the gate now!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //I've already told you: only if Ian...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Everything's going to be fine... and best regards from Ian.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Well then, if Ian is responsible for this... but only under one condition!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //What condition is that?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Just get me two or three templars for support, I don't want to be here on my own when the crawlers come out of the shaft!
	
	B_LogEntry		(CH2_MCEggs,"Although Ian has given me permission, Asghan won't open the gate until I've united some templars as reinforcements in front of the gate.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "All preparations have been made. The gate can now be opened!"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //All preparations have been made. The gate can now be opened!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Okay then, open the shaft now. Let the show begin.
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"I managed to unite sufficient templars in front of Asghan's gate. What will be awaiting us in the darkness behind the gate?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "The minecrawlers shouldn't be a threat anymore!"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //The minecrawlers shouldn't be a threat anymore!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //That's good news. I'll just send a messenger to Thorus!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz läuft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "How are you doing?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Hey, how are you doing?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Okay... so long as nobody don't get the idea of opening this gate, I don't need to hurt anybody, either.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //What's so special about this gate?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Minecrawlers. Big, bad minecrawlers. Lots and lots and lots of them.
};  



































