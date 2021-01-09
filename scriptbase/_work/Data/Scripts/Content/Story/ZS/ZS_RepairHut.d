//////////////////////////////////////////////////////////////////////////
//	ZS_RepairHut
//	============
//	- Der NSC sucht sich ein MOB "REPAIR" und hämmert dort an der Hütte.
//	- Ab und zu geht er pinkeln zu einem FP "PEE"
//////////////////////////////////////////////////////////////////////////
FUNC VOID ZS_RepairHut ()
{
    PrintDebugNpc 		(PD_TA_FRAME,	"ZS_RepairHut");
    
	B_SetPerception 	(self);    
	AI_SetWalkmode 		(self,	NPC_WALK);		// Walkmode für den Zustand
	
	if !(C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT))
	{
	    AI_GotoWP		(self, 	self.wp);
	    PrintDebugNpc	(PD_TA_CHECK,	"...befindet sich nicht im MobInteract!");
		AI_UseMob 		(self,	"REPAIR",1);		// Benutze den Mob einmal bis zum angegebenen State
	};
};

FUNC VOID ZS_RepairHut_Loop ()
{
    PrintDebugNpc 		(PD_TA_LOOP,"ZS_RepairHut_Loop");

    if C_BodyStateContains(self,BS_MOBINTERACT_INTERRUPT)
	{
    	var int repairreaktion;
    	repairreaktion = Hlp_Random (100);
    	
    	if 		(repairreaktion >= 90)
    	{
    		AI_PlayAniBS(self,"T_REPAIR_RANDOM_1",BS_MOBINTERACT_INTERRUPT); 
    	}
    	else if (repairreaktion >= 85)
    	{
    		B_Pee		(self);
    	};	
	};
	
	
 	var int randomizer;
 	randomizer = Hlp_Random	(20);
    if (Npc_GetStateTime ( self ) >= 100 + randomizer)
    {
    	B_InterruptMob ("REPAIR");
    };
	AI_Wait(self,1);
};

FUNC VOID ZS_RepairHut_End()
{
    PrintDebugNpc 		(PD_TA_FRAME,	"ZS_RepairHut_End");

	AI_UseMob			(self,	"REPAIR",	-1);		// Verlasse das Mobsi, um den State zu wechseln
};

