instance  Tpl_1430_Templer_CALLSLEEPER (C_INFO)
{
	npc				= Tpl_1430_Templer;
	condition		= Tpl_1430_Templer_CALLSLEEPER_Condition;
	information		= Tpl_1430_Templer_CALLSLEEPER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Tpl_1430_Templer_CALLSLEEPER_Condition()
{	
	var C_NPC Templer;	Templer	 	 = Hlp_GetNpc	(TPL_1430_Templer);
	var C_NPC Kalom;	Kalom	 = Hlp_GetNpc	(GUR_1201_CorKalom);				
	
						

	if (	(CorKalom_BringBook == LOG_SUCCESS)
	&&		(Npc_GetDistToWP(Templer,	"PSI_TEMPLE_STAIRS_3")<1000)
	&&		C_TimeForGreatPrayer()	
	&&      ( !Npc_KnowsInfo (hero, NOV_1319_Novize_CALLSLEEPER ) ) 
	&&      ( !Npc_KnowsInfo (hero, NOV_1320_Novize_CALLSLEEPER ) ) 
	&&      ( !Npc_KnowsInfo (hero, Tpl_1431_Templer_CALLSLEEPER ) ) 
	&&      (Npc_GetDisttoWP (Kalom,"PSI_TEMPLE_STAIRS_RIGHT") < 300)	)
	{
		return TRUE;
		
	};
};
FUNC void  Tpl_1430_Templer_CALLSLEEPER_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(3);
};
  