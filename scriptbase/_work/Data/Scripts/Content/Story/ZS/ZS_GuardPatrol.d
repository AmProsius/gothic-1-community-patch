/************************************
*     Wächter läuft ein bisschen    *
*     um Bezugs-WP rum und guckt    *
************************************/

func void ZS_GuardPatrol ()
{
    PrintDebugNpc 	(PD_TA_FRAME,"ZS_GuardPatrol");
    
	GuardPerception ();
	AI_StandUp		(self);				
	AI_SetWalkmode 	(self,NPC_WALK);		// Walkmode für den Zustand
	if !(Hlp_StrCmp	(self.wp,Npc_GetNearestWP(self)))
	{
		AI_GotoWP	(self, self.wp);               // Gehe zum Tagesablaufstart
	};		
};

func void ZS_GuardPatrol_Loop ()
/* 	in die Funktionen soll noch ein Zählglied, daß aber von der Funktionsweise der 
	Begin-Loop-End-Struktur abhängig, wo das Zählglied eingeführt und verwendet wird;
	mit diesem Glied wird nach einer Anzahl "rumlaufen" Vorgängen der Nsc wieder zu seinem self.wp 
	geschickt, damit er nicht irgendwann am Ende des Levels ankommt */
{
    PrintDebugNpc (PD_TA_LOOP,"ZS_GuardPatrol_Loop");

	var string hlpwp1;					// Hilfs-Variablen Deklaration
	var string hlpwp2;					// Hilfs-Variablen Deklaration
	var int varianzcounter;
	
	AI_GotoWP (self,Npc_GetNearestWP (self));
	if (varianzcounter >= 2)
	{
		AI_GotoWP (self,self.wp);
	}
	else
	{
		hlpwp1 = Npc_GetNearestWP (self);	// Definition der Ersten Hilfsvariable
		PrintDebugNpc (PD_TA_DETAIL,hlpwp1);
		hlpwp2 = Npc_GetNextWP (self);		// Definition der Zweiten Hilfsvariable
		PrintDebugNpc (PD_TA_DETAIL,hlpwp2);
		AI_GotoWP (self,hlpwp1);			// Begib Dich zur ersten zugewiesenen Hilfsvariable
		AI_GotoWP (self,hlpwp2);			// Begib Dich zur zweiten zugewiesenen Hilfsvariable
		var int hlprand;					// Hilfsvariblendeklaration für einen Randomwert
		hlprand = Hlp_Random (10000);		// Definition des Hilfsrandomwertes
		if (!(Hlp_StrCmp (Npc_GetNearestWP (self) ,hlpwp1)) && (!( Hlp_StrCmp (Npc_GetNearestWP (self) , hlpwp2))))
		/* Ist der nächste ermittelte Wegpunkt von den schon angesteuerten Verschieden ?-->ja*/
		{
		    PrintDebugNpc (PD_TA_DETAIL,"Gehe zum dritten WP");
			AI_GotoWP (self,Npc_GetNearestWP (self)); // da er verschieden istr begib Dich dorthin
			if (hlprand != 666) // Tuningwert um Animationen von Zeit zu Zeit abzuspielen
			{
				AI_PlayAni (self,"T_SEARCH");	// Spiele die Suchen Animation
			};
			
		}
		else 								// nicht verschieden
		{
		    PrintDebugNpc (PD_TA_DETAIL,"Gehe zum zweiten WP");
			AI_GotoWP (self,Npc_GetNextWP (other));	//Begib zum dritten Wegpunkt
			AI_PlayAni (self,"T_SEARCH");			// Umsehen Ani
			AI_Wait (self,10);						// Warten für 10 Sekunden
			AI_PlayAni (self,"T_SEARCH");			// Nochmal umsehen
			AI_GotoWP (self,Npc_GetNearestWP (self));
		};
		varianzcounter +=1;
	};
	
	AI_Wait(self,1);
};

func void ZS_GuardPatrol_End ()
{
    PrintDebugNpc (PD_TA_FRAME,"ZS_GuardPatrol_End");
};