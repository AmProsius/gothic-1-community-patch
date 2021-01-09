/*******************************************
*      Schmied benutzt Schmiedefeuer       *
*******************************************/

func void ZS_Smith_Fire ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_Smith_Fire");
    
	B_SetPerception (self);    
	B_StartUseMob	(self,	"BSFIRE");	
};

func void ZS_Smith_Fire_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_Smith_Fire_Loop");
  
	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("BSFIRE");
    };
	AI_Wait(self,1);
};

func void ZS_Smith_Fire_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_Smith_Fire_End");

	B_StopUseMob	(self,	"BSFIRE");
};
