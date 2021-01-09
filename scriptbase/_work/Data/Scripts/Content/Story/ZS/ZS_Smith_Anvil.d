/*******************************************
*          Schmied benutzt Amboss          *
*******************************************/

func void ZS_Smith_Anvil	()
{
    PrintDebugNpc	(PD_TA_FRAME,	"ZS_Smith_Anvil");
    
	B_SetPerception (self);    
	B_StartUseMob	(self,	"BSANVIL");	
};

func void ZS_Smith_Anvil_Loop	()
{	
    PrintDebugNpc	(PD_TA_LOOP,	"ZS_Smith_Anvil_Loop");
   
	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("BSANVIL");
    };
	AI_Wait(self,1);
};

func void ZS_Smith_Anvil_End ()
{
	PrintDebugNpc	(PD_TA_FRAME,"ZS_Smith_Anvil_End");

	B_StopUseMob	(self,	"BSANVIL");
};
