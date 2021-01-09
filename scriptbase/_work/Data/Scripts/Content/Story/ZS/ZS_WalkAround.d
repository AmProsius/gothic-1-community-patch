/***********************************************
*    NSC läuft um Bezugs-WP auf Waynet rum     *
***********************************************/

func void ZS_WalkAround	()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_WalkAround");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);	// Walkmode für den Zustand
	AI_GotoWP (self,self.wp);		// Gehe zum Tagesablaufstart
	AI_AlignToWP (self);			//Richte Dich aus
	

};
 
func void ZS_WalkAround_Loop()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_WalkAround_Loop");
       
	var string hlpwp1;
	var string hlpwp2;
	var int varianzcounter;

	AI_GotoWP (self,Npc_GetNearestWP (self));

	if (varianzcounter == 7)
	{
		AI_GotoWP (self,self.wp);
	}
	else
	{
		hlpwp1 = Npc_GetNearestWP (self);
		hlpwp2 = Npc_GetNextWP (self);
		AI_GotoWP (self,hlpwp1);
		AI_GotoWP (self,hlpwp2);
		var int hlprand;
		hlprand = Hlp_Random (10000);
		if (!(Hlp_StrCmp (Npc_GetNearestWP (self) ,hlpwp1)) )
		{
		
			AI_GotoWP (self,Npc_GetNearestWP (self));
			varianzcounter +=1;
			if (hlprand != 666)
			{
				AI_PlayAni (self,"T_SEARCH");
			
			};
		}
		else
		{
			AI_GotoWP (self,Npc_GetNextWP (other));
			AI_Wait (self,10);
			varianzcounter +=1;
		};
	};
	
	AI_Wait(self,1);
};

func void ZS_WalkAround_End()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_WalkAround_End");
};
