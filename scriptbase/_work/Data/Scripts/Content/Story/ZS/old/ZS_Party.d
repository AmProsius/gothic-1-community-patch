func void ZS_Party() //### Design fehlt
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Party");	
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);			// Walkmode für den Zustand 
	AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	AI_AlignToWp (self);                    //Richte Dich aus           
	if (Npc_IsNear (self,other)&& Npc_IsInState (other,ZS_Teaching))
	{
		AI_TurnToNpc (self,other);
	};
};
func void ZS_Party_Loop()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_Party_Loop");
	
	AI_Wait(self,1);
};

func void ZS_Party_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Party_End");
};
