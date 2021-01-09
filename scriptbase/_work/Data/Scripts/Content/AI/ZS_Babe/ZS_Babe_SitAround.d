/*******************************************
*      Babe sitzt rum				       *
*******************************************/

func void ZS_Babe_SitAround()
{
	PrintDebugNpc 		(PD_TA_FRAME,	"ZS_BabeSitAround");

// falls noch die Nacktrüstung angezogen ist, ausziehen!
	AI_UnequipArmor (self);

	B_SetBabeDefaultPerceptions();
	AI_SetWalkmode 		(self,NPC_WALK);

	if (!C_BodyStateContains(self,	BS_SIT))
	{
		if ((Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
		{
			AI_GotoWP	(self, self.wp);
		};
		AI_UseMob(self,"CHAIR",1);
	};
};

func void ZS_Babe_SitAround_Loop()
{
	PrintDebugNpc (PD_TA_LOOP,"ZS_BabeSitAround_Loop");
	AI_Wait(self,1);
};

func void ZS_Babe_SitAround_End()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_BabeSitAround_End");
	AI_UseMob(self,"CHAIR",-1);
};

