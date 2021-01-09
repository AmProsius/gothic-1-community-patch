/*****************************************
*    Templer sucht MC und greift sie an  *
*****************************************/


func void ZS_MCHunting	()
// Gibt es Konzept, im Augenblick werden die Minecrawler sowieso nicht gefunden, 
// da nur AssessEnemy die Wahrnehmung füllen würde
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_MCHunting" );
    
	ObservingPerception ();
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	AI_GotoWP (self,self.wp);			// Gehe zum Tagesablaufstart
};

func void ZS_MCHunting_Loop ()
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_MCHunting_End" );

	// sollte Minecrawlerjäger was rumlaufen noch ?
	if (Wld_DetectNpc (self,-1,NOFUNC,GIL_MINECRAWLER) ) // ist hier ein Minecrawler? 
	{
		PrintDebugNpc(PD_TA_CHECK,"MineCrawler detect");
		Npc_SetTarget (self,other);
		
		Npc_GetTarget	( self);
		AI_StartState (self,ZS_AssessMonster, 0,"");	// SN: der korrekte Zustand, um Monster zu erkennen ist 'ZS_AssessMonster' -> ich habe das korrigiert! (wenn gelesen, dann Kommentar löschen)
	}
	else 
	{
		AI_GotoWP (self, Npc_GetNextWP (self));
		AI_GotoWP (self, Npc_GetNearestWP (self));
	};
};

func void ZS_MCHunting_End ()
{
	PrintDebugNpc (PD_TA_FRAME,"ZS_MCHunting_End" );
};

