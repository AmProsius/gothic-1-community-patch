// ************************ EXIT **************************

instance  STT_300_Alberto_Exit (C_INFO)
{
	npc			=  STT_300_Alberto;
	nr			= 999;
	condition	=  STT_300_Alberto_Exit_Condition;
	information	=  STT_300_Alberto_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_300_Alberto_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_300_Alberto_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  STT_300_Alberto_BUY (C_INFO)
{
	npc				= STT_300_Alberto;
	condition		= STT_300_Alberto_BUY_Condition;
	information		= STT_300_Alberto_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	Trade			= 1;
};

FUNC int  STT_300_Alberto_BUY_Condition()
{
	return 1;
};


FUNC void  STT_300_Alberto_BUY_Info()
{
	AI_Output (other, self,"STT_300_Alberto_BUY_Info_15_01"); //Bei dir kann ich tauschen?
	AI_Output (self, other,"STT_300_Alberto_BUY_Info_12_02"); //Jupp. Alles, was du willst. Wenn du Erz hast.
	
};  
