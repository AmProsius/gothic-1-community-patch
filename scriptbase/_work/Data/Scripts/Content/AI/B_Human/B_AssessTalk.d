/******************************************************************************************** 
*	B_AssessTalk																			*
*	============																			*
*	Wird dem ZS_AssessTalk vorgeschaltet, wenn ein NSC aktiv angesprochen wird				*
*	und löscht die INVINCIBLE-Flags															* 
********************************************************************************************/ 
func void B_AssessTalk ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_AssessTalk");
	
	if (Npc_IsInState(self, ZS_Smoke)) //MH: Blubber Mobsi machte Probleme! 
	{
		Npc_ClearAIQueue(self);
		AI_StandUpQuick(self);
		AI_StartState	(self, ZS_Talk, 0, "");
	}
	else if (C_BodystateContains(self,BS_MOBINTERACT)) 
	{
		return;
	};
		
	//-------- Verhindern von Ansprechen durch übernommene NSCs --------
	var C_NPC her; 	her = Hlp_GetNpc(PC_Hero); 
	var C_NPC rock; rock = Hlp_GetNpc(PC_Rockefeller);
	
	if ( (Hlp_GetInstanceID(her)!=Hlp_GetInstanceID(Hero))&&(Hlp_GetInstanceID(rock)!=Hlp_GetInstanceID(Hero)) ) 
	{	
		B_Say (self,other,"$NOTNOW");
	}
	else
	{
		Npc_SetPercTime	( self, 3);
		self.aivar[AIV_INVINCIBLE] = FALSE;
		hero.aivar[AIV_INVINCIBLE] = FALSE;
		hero.aivar[AIV_IMPORTANT]  = FALSE;		// Dialog kommt NICHT aufgrund einer Important-Info zustande
		
		Npc_ClearAIQueue(self);
						
		Npc_SetPercTime	(self, 1);
		if ( (!C_BodystateContains(self, BS_SIT)) || (!Npc_CanSeeNpc(self, hero)) )
		{
			AI_StartState	(self, ZS_Talk, 1, ""); //nicht sitzen UND/ODER nicht sehen: sauber aufstehen/zustand beenden
		}
		else
		{
			AI_StartState	(self, ZS_Talk, 0, ""); //sitzen UND sehen --> sitzenbleiben
		};
	};
};
			

				