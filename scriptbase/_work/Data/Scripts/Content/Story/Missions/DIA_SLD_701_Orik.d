/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Sld_701_Orik_Exit (C_INFO)
{
	npc			=  Sld_701_Orik;
	nr			=  999;
	condition	=  Sld_701_Orik_Exit_Condition;
	information	=  Sld_701_Orik_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = "END";
};                       

FUNC int  Sld_701_Orik_Exit_Condition()
{
//	return TRUE;	//SN: da ambient-NSC!
};

FUNC VOID  Sld_701_Orik_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
