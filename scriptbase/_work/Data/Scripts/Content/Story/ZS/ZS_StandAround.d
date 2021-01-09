//////////////////////////////////////////////////////////////////////////
//	ZS_StandAround
//	==============
//	Der NSC sucht sich für diesen Tagesablauf-Zustand  einen FP 'STAND'
//	und führt eine große Anzahl an zufälligen Ambient-Aktionen durch:
//	->	Essen
//	->	Trinken
//	->	Rauchen
//	->	Pinkeln gehen
//	->	Gelangweilt-Animationen
//////////////////////////////////////////////////////////////////////////
//	ToDo:
//	-----
//	- Manche Übergänge von T_..._RANDOM_X nach S_..._S0 poppen unschön
////////////////////////////////////////////////////////////////////////////
func void ZS_StandAround ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_StandAround");
	
	//-------- Wahrnehmungen --------
	// R$ückkehr in ZS_SmallTalk wird enabled
	
	B_SetPerception			(self);
	if Npc_WasInState(self,ZS_Smalltalk)
	{
        Npc_PercEnable			(self,	PERC_NPCCOMMAND,	B_SmallTalk);
    };    
    
	//-------- Vorbereitungen --------
	AI_SetWalkmode			(self,	NPC_WALK);
	B_ClearItem				(self);

	//-------- Grobpositionierung --------
	if (!Npc_IsOnFP(self,"CAMPFIRE"))	//  && !Npc_IsOnFP(self,"SMALLTALK"))
	{
		PrintDebugNpc		(PD_TA_CHECK,	"...nicht auf FP!");
		AI_GotoWP			(self,	self.wp);						// Gehe zum Tagesablaufstart
	};
};

func int ZS_StandAround_Loop ()
{
	PrintDebugNpc			(PD_TA_LOOP,	"ZS_StandAround_Loop");
	
	//-------- Feinpositionierung abhängig von Vorgängerzustand! --------
	if Npc_WasInState(self,ZS_Smalltalk)
	{
	    B_GotoFP				(self,	"SMALLTALK");
	    AI_AlignToFP( self );				//Richte Dich aus
	}
	else
	{
		if (Wld_IsFPAvailable (self,"CAMPFIRE"))
		{
			B_GotoFP				(self,	"CAMPFIRE");
			AI_AlignToFP( self );				//Richte Dich aus
		}
		else
		{
			Npc_PerceiveAll (self);
			if (Wld_DetectNpcEx(self, -1, NOFUNC, -1, 0)) //other = Nearest Npc (0=Spieler ignorieren!)
			{
				AI_TurnToNpc (self,other);
			};
		};
	};    

    //-------- Suche nach Smalltalk-Partner ! --------
    if Npc_WasInState(self,ZS_Smalltalk)
	{
	    Npc_SendPassivePerc		(self,	PERC_NPCCOMMAND,	self,	self);
	};    

	//-------- Zufallsaktionen... --------
	var int choice;
	choice = Hlp_Random 	(100);
	PrintDebugInt			(PD_TA_DETAIL, "...Zufallsani-Wurf: ", choice);		
		
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_NONE)	
	{	
		//-------- ...im ALTEN LAGER --------
		if (C_NpcBelongsToOldCamp(self))
		{
			if		(choice <  10)	{	B_ChooseApple	(self);	}
			else if	(choice	<  20)	{	B_ChooseLoaf	(self);	}
			else if	(choice	<  30)	{	B_ChooseCheese	(self);	}
			else if	(choice	<  40)	{	B_ChooseBeer	(self);	}
			else if	(choice	<  60)	{	B_ChooseMeat	(self);	}
			else if	(choice	<  80)	{	B_Pee			(self);	}
			else if	(choice	< 100)	{	B_Bored			(self);	};
		}

		//-------- ...im NEUEN LAGER --------
		else if (C_NpcBelongsToNewCamp(self))
		{
			if		(choice <  10)	{	B_ChooseRice	(self);	}
			else if	(choice	<  30)	{	B_ChooseWine	(self);	}
			else if	(choice	<  50)	{	B_ChooseBooze	(self);	}
			else if	(choice	<  60)	{	B_ChooseJoint	(self);	}
			else if	(choice	<  80)	{	B_Pee			(self);	}
			else if	(choice	< 100)	{	B_Bored			(self);	};
		}

		//-------- ...im SEKTEN-LAGER --------
		else if (C_NpcBelongsToPsiCamp(self))
		{
			if		(choice <  20)	{	B_ChooseSoup	(self);	}
			else if	(choice	<  80)	{	B_ChooseJoint	(self);	}
			else if	(choice	<  90)	{	B_Pee			(self);	}
			else if	(choice	< 100)	{	B_Bored			(self);	};
		};
	}
	else
	{
		if (choice < 20)
		{
			B_ClearItem		(self);
		};
	};
	
	B_PlayItemRandoms		(self);
	
	AI_Wait					(self,	1);
	return					LOOP_CONTINUE;
};

func void ZS_StandAround_End ()
{
	PrintDebugNpc			(PD_TA_FRAME,	"ZS_StandAround_End");
	
	C_StopLookAt			(self);
	B_ClearItem 			(self);
};

func void B_SmallTalk()
{
	PrintDebugNpc			(PD_TA_FRAME,	"B_SmallTalk");
	
	if (Npc_IsInState		(other,	ZS_StandAround)
	&&	Npc_IsOnFP			(other, "SMALLTALK")
	&&	(Npc_GetDistToNpc	(self, other)<HAI_DIST_SMALLTALK))
	{
		PrintDebugNpc		(PD_TA_CHECK,	"...'other' geeigneter SmallTalk-Partner!");
		
		Npc_PercDisable		(other,	PERC_ASSESSPLAYER);
		Npc_PercDisable		(other,	PERC_OBSERVEINTRUDER);
		B_FullStop			(other);
		Npc_SetTarget		(other,	self);
		
		Npc_GetTarget		( self);
		AI_StartState		(other,	ZS_Smalltalk,	1,	"");
		
		Npc_PercDisable		(self,	PERC_ASSESSPLAYER);
		Npc_PercDisable		(self,	PERC_OBSERVEINTRUDER);
		B_FullStop			(self);
		Npc_SetTarget		(self,	other);
		
		Npc_GetTarget		( self);
		AI_StartState		(self,	ZS_Smalltalk,	1,	"");
	};
};