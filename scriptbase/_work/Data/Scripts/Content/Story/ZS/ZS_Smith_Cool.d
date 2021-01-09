/*******************************************
*       Schmied benutzt Wassereimer        *
*******************************************/

func void ZS_Smith_Cool ()
{
    PrintDebugNpc	(PD_TA_FRAME,	"ZS_Smith_Cool");
    
	B_SetPerception (self);    
	B_StartUseMob	(self,	"BSCOOL");	
};

func void ZS_Smith_Cool_Loop ()
{
    PrintDebugNpc	(PD_TA_LOOP,"ZS_Smith_Cool_Loop");
   
	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("BSCOOL");
    };
	AI_Wait(self,1);
};

func void ZS_Smith_Cool_End ()
{
	PrintDebugNpc	(PD_TA_FRAME,	"ZS_Smith_Cool_End");

	B_StopUseMob	(self,	"BSCOOL");
};
