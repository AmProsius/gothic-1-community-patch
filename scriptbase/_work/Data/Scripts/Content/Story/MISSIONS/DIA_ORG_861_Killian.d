instance  ORG_861_Killian_Exit (C_INFO)
{
	npc			=  ORG_861_Killian;
	nr			=  999;
	condition	=  ORG_861_Killian_Exit_Condition;
	information	=  ORG_861_Killian_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = "ENDE";
};                       

FUNC int  ORG_861_Killian_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  ORG_861_Killian_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//*****************************************************************
//						Verpiß dich								
//*****************************************************************

instance  ORG_861_Killian_GetLost (C_INFO)
{
	npc			=  ORG_861_Killian;
	nr			=  1;
	condition	=  ORG_861_Killian_GetLost_Condition;
	information	=  ORG_861_Killian_GetLost_Info;
	permanent	=  1;
	important 	= 1;
};                       

FUNC int  ORG_861_Killian_GetLost_Condition()
{
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID  ORG_861_Killian_GetLost_Info()
{
	AI_Output (self, other,"Org_861_Killian_GetLost_Info_13_00"); //Verpiß dich!
	AI_StopProcessInfos	( self );
};




/*

//*****************************************************************
//							NORMAL									
//*****************************************************************

instance  ORG_861_Killian_WORK (C_INFO)
{
	npc				= ORG_861_Killian;
	condition		= ORG_861_Killian_WORK_Condition;
	information		= ORG_861_Killian_WORK_Info;
	important		= 0;
	permanent		= 0;
	description		= " Wie läufts?"; 
};

FUNC int  ORG_861_Killian_WORK_Condition()
{
	return TRUE;
};


FUNC void  ORG_861_Killian_WORK_Info()
{
	AI_Output (other, self,"Org_861_Killian_WORK_Info_15_01"); //Wie läufts?
	AI_Output (self, other,"Org_861_Killian_WORK_Info_13_02"); //Lass mich in Ruhe! Ich bin beschäftigt!
};  

//*****************************************************************
//							NORMAL									
//*****************************************************************

instance  ORG_861_Killian_DEAL (C_INFO)
{
	npc				= ORG_861_Killian;
	condition		= ORG_861_Killian_DEAL_Condition;
	information		= ORG_861_Killian_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie läufts Kumpel?"; 
};

FUNC int  ORG_861_Killian_DEAL_Condition()
{	
	if ( Kalom_DrugMonopol == LOG_RUNNING)
	&& (idiots_deal == TRUE)
	{
		return TRUE;
	};

};
FUNC void  ORG_861_Killian_DEAL_Info()
{
	AI_Output (other, self,"Org_861_Killian_DEAL_Info_15_01"); //Wie läufts Kumpel?
	AI_Output (self, other,"Org_861_Killian_DEAL_Info_13_02"); //Wir haben zwar eine Abmachung, aber ich bin nicht dein Kumpel, Penner!
};  

//*****************************************************************
//							NORMAL									
//*****************************************************************

instance  ORG_861_Killian_LOST (C_INFO)
{
	npc				= ORG_861_Killian;
	condition		= ORG_861_Killian_LOST_Condition;
	information		= ORG_861_Killian_LOST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Und du penner? Hältst du jetzt die Füße still?"; 
};

FUNC int  ORG_861_Killian_LOST_Condition()
{	
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Killian.aivar[AIV_WASDEFEATEDBYSC] ;
	
	if (Killian.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	&& ( Kalom_DrugMonopol == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,ORG_860_Renyu_DEAL))
	{
		return TRUE;
	};

};
FUNC void  ORG_861_Killian_LOST_Info()
{
	AI_Output (other, self,"Org_861_Killian_LOST_Info_15_01"); //Und du penner? Hältst du jetzt die Füße still?
	AI_Output (self, other,"Org_861_Killian_LOST_Info_13_02"); //Hey KUMPEL, ich wusste ja nicht, das die Brudeschaft da soviel Wert darauf legt!
	AI_Output (other, self,"Org_861_Killian_LOST_Info_15_03"); //Ich bin nicht dein Kumpel, Penner! 
	Kalom_DrugMonopol = LOG_SUCCESS;
	Npc_ExchangeRoutine (self,"ARBEITSLOS");
};

*/
