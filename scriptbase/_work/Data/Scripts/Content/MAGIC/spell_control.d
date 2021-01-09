//-------- Spell Commands --------
// SPL_DONTINVEST 		= 	0;		// Es k�nnen keine weiteren Manapunkte investiert werden. Erst durch CTRL loslassen geht der Spell ab
// SPL_RECEIVEINVEST	= 	1;		// Wirkung durchgef�hrt, es k�nnen weitere Invest kommen, zB.bei Heal nach jedem P�ppel
// SPL_SENDCAST			= 	2;		// Starte den Zauber-Effekt (wie CTRL loslassen), automatischer Abbruch
// SPL_SENDSTOP			= 	3;		// Beende Zauber ohne Effekt
// SPL_NEXTLEVEL		=	4;		// setze den Spruch auf den n�chsten Level

func int Spell_Logic_Control(var int manaInvested)
{
	PrintDebugNpc			(PD_MAGIC,	"Spell_Logic_Control");
	
	if (!Npc_IsInState(other, ZS_Controlled))
	{
		PrintDebugNpc		(PD_MAGIC,	"npc is valid...");
		
		PrintDebugNpc		(PD_MAGIC,	"manainvested 0...starting ZS_PsiDefense on npc");
		if (!Npc_IsInState(other, ZS_PsiDefense))
		{
			B_FullStop		(other);
			AI_StartState	(other, ZS_PsiDefense,1,""	);
		}; 			
 		
 		if	(other.flags != NPC_FLAG_IMMORTAL)
 		{
 			PrintDebugNpc	(PD_MAGIC,	"npc is not immortal, sub mana");
			
			// �berschreiten die investierten manapunkte level*4, so ist sein wille gebrochen
 			if ( manaInvested >= other.level*4 )
			{
				PrintDebugNpc(PD_MAGIC,	"controlled success, starting states");	 	
				
				AI_StartState			( self	,ZS_PC_CONTROLLING	,0,"" );				
				Npc_SetActiveSpellInfo	( self,1 );	// �bernommen
				
				return SPL_SENDCAST;
			}; 
			return SPL_NEXTLEVEL; 			
 		}
 		else 
 		{
 			PrintDebugNpc		(PD_MAGIC,	"npc is immortal");
 			return SPL_NEXTLEVEL; 
 		};
 		
 		return SPL_NEXTLEVEL;
	}
	else 
	{
		PrintDebugNpc		(PD_MAGIC,	"npc is not valid...");
		// other ist kein npc
		return SPL_SENDSTOP;
	};	
	
	return SPL_DONTINVEST;
};