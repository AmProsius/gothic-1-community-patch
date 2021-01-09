/*******************************************
*          NSC kloppt an Erzmobsi          *
*******************************************/

func void ZS_PickOre()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_PickOre");

	B_SetPerception (self);    

    if (self.aivar[AIV_DONTUSEMOB] == 1)
    {
    	self.aivar[AIV_DONTUSEMOB] = 0;
    }
    else
    {
		B_StartUseMob	(self,	"ORE");
	};
};

func void ZS_PickOre_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_PickOre_Loop");    
	PrintAttitudes (PD_TA_LOOP);

	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("ORE");
    };
	AI_Wait(self,1);
};

func void ZS_PickOre_End ()
{
	PrintDebugNpc	(PD_TA_FRAME,"ZS_PickOre_End");

	B_StopUseMob	(self,"ORE");
};