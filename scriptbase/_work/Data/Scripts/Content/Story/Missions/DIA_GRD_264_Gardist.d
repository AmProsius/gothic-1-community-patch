// ***************************** 
//				EXIT 
// *****************************

instance DIA_Grd_264_Exit (C_INFO)
{
	npc			= Grd_264_Gardist;
	nr			= 999;
	condition	= DIA_Grd_264_Exit_Condition;
	information	= DIA_Grd_264_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Grd_264_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Grd_264_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
//						GARDEAUFNAHME		und der andere gardist...					
------------------------------------------------------------------------*/
instance Grd_264_Gardist_GARDEAUFNAHME (C_INFO)
{
	npc				= Grd_264_Gardist;
	condition		= Grd_264_Gardist_GARDEAUFNAHME_Condition;
	information		= Grd_264_Gardist_GARDEAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_264_Gardist_GARDEAUFNAHME_Condition()
{	
	if (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	&& ( Npc_GetTrueGuild  (hero) == GIL_STT)
	&& (! Npc_KnowsInfo   (hero,Grd_260_Drake_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void  Grd_264_Gardist_GARDEAUFNAHME_Info()
{
	AI_Output (self, other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_01"); //Hey, that was a good job you did with the crawlers! You've earned your place among the guards!
	AI_Output (self, other,"Grd_264_Gardist_GARDEAUFNAHME_Info_07_02"); //Go over to the Old Camp and speak to Thorus about it!
	
	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"As soon as I've returned the eggs, I should have a word with Thorus. Maybe he'll let me join the guards.");

};
