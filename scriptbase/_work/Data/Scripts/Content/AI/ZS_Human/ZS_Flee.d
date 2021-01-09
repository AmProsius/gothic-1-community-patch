//////////////////////////////////////////////////////////////////////////
//	ZS_Flee
//	=======
//	Wird angesprungen durch
//
//	- ZS_AssessEnemy
//	- ZS_AssessMonster
//	- ZS_Attack
//	- ZS_CallGuards
//	- ZS_CallGuardsOnEnterRoom
//	- Spell_Logic_Fear
//
//	Folgende Voraussetzungen müssen erfüllt sein:
//
//	- (keine)
//
//	Macht folgendes:
//	1.	Falls Waffe in Hand			-> fallen lassen
//	2.	tempAttitüde auf hostile
//	3.	weglaufen bis genügend Distanz zum Gegner
//	4.	evtl. Selbstheilung
//////////////////////////////////////////////////////////////////////////
func void ZS_Flee ()
{	
	PrintDebugNpc		(PD_ZS_FRAME, "ZS_Flee" );			
	PrintGlobals		(PD_ZS_CHECK);

	Npc_PercEnable  	(self, 	PERC_ASSESSMAGIC		,	B_AssessMagic			);			
	C_ZSInit			();

	//B_DropWeapon		(self);						// aus Gamedesign-Gründen entfernt

	AI_SetWalkmode 		(self,	NPC_RUN);
	Mdl_ApplyOverlayMds	(self,	"HUMANS_FLEE.MDS");// Flucht-OverlayMDS einschalten

	if (Npc_IsPlayer(other))
	{
		Npc_SetTempAttitude (self,	ATT_HOSTILE);
	};
};

func int ZS_Flee_Loop ()
{
	PrintDebugNpc		(PD_ZS_LOOP,	"ZS_Flee_Loop" );			

	//-------- Gegner noch gültig? --------
	if (!Hlp_IsValidNpc(other))		
	{																
		PrintDebugNpc	(PD_ZS_CHECK,	"...Gegner nicht mehr gültig!");			
		return			LOOP_END;									// 
	}
	
	//-------- Gegner weit genug weg ? --------
	else if (Npc_GetDistToNpc(self,	other) > HAI_DIST_ABORT_FLEE)		// Gegner noch näher als 20m?
	{																// ...nein...
		PrintDebugNpc	(PD_ZS_CHECK,	"...Gegner weit genug weg -> Flucht abbrechen!");			
		return			LOOP_END;									// 
	}
	
	//-------- Gegner noch kampffähig? --------
	else if (C_NpcIsDown(other))
	{															
		PrintDebugNpc	(PD_ZS_CHECK,	"...Gegner nicht mehr kampffähig!");			
		return			LOOP_END;									// 
	}

	//-------- Die eigentliche Flucht -------- 
	else
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Gegner noch zu nah dran!");			
		Npc_SetTarget	(self,	other);	
		
		Npc_GetTarget	( self);
		AI_Flee			(self);										// ...also weiter fliehen!
		AI_Wait			(self,	1);
		return			LOOP_CONTINUE;
	};
};

func void ZS_Flee_End ()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"ZS_Flee_End");				

	Mdl_RemoveOverlayMDS(self,"HUMANS_FLEE.MDS");
	B_LookAround		();
	AI_StartState		(self,	ZS_HealSelf,	1,	"");
};

