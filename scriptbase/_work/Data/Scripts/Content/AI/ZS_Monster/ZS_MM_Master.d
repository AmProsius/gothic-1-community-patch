// *************************************************************************************
// 										KONSTANTEN
// *************************************************************************************
// SN: Sind aus Gründen der nötigen Compile-Reihenfolge in AI_INTERN\AI_MM_CONSTANTS.D gewandert



// *************************************************************************************
// 										MASTER - AI
// *************************************************************************************
func INT C_PreyToPredator (var C_NPC prey, var C_NPC predator)
{
    PrintDebugNpc(PD_MST_FRAME,"C_PreyToPredator");
    
	if (prey.guild == GIL_SCAVENGER)
	{
		if (predator.guild == GIL_SNAPPER)		{return 1;};
	};
	
	if (prey.guild == GIL_MOLERAT)
	{
		if (predator.guild == GIL_WOLF)			{return 1;};
	};
	/*
	if (prey.guild == GIL_GOBBO)
	{
		if (predator.guild == GIL_LURKER)		{return 1;};
	};
	
	if (prey.guild == GIL_BLOODFLY)
	{
		if (predator.guild == GIL_SCAVENGER)	{return 1;};
	};
	*/
	return 0;
};


// *************************************************************************************

func int B_MM_DeSynchronize()
{
    PrintDebugNpc(PD_MST_FRAME,"B_MM_DeSynchronize");
    
	var int msec;
	msec = Hlp_Random (1000);
	AI_Waitms (self, msec);
};


// *****************************************************************************************

func void B_MM_ObserveIntruder()
{
    PrintDebugNpc(PD_MST_FRAME,"B_MM_ObserveIntruder");

	if (Npc_GetDistToNpc(self, other) <= self.aivar[AIV_MM_AttackRange])
	{
		Npc_SetTarget	(self, other);
		Npc_ClearAIQueue(self);
		AI_StartState	(self, ZS_MM_Attack, 0, "");
	};
};


// *****************************************************************************************

func void B_MM_AssessBody()
{
    PrintDebugNpc(PD_MST_FRAME,"B_MM_AssessBody");
    
	if (self.aivar[AIV_MM_TEMP_PRIO] == PRIO_PREY)
	{
		if (Npc_GetDistToNpc(self, other) < self.aivar[AIV_MM_PercRange])
		{
			if (C_PreyToPredator(other,self))
			{
				Npc_ClearAIQueue(self);
				AI_StartState 	(self, ZS_MM_EatBody, 0, "");
			};	
		};
	};
};
// ------------------------------------------------------------------------------------
func void ZS_MM_EatBody()
{
    PrintDebugNpc(PD_MST_FRAME,"ZS_MM_EatBody");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,	B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,	B_AssessMagic);
	Npc_PercEnable		(self, PERC_OBSERVEINTRUDER,B_MM_ObserveIntruder);
	Npc_PercEnable 		(self, PERC_ASSESSENEMY,	B_MM_ObserveIntruder);
	
	AI_GotoNpc 	(self, other);
	AI_TurnToNpc(self, other);
	AI_PlayAni	(self, "T_STAND_2_EAT");
};

func int ZS_MM_EatBody_loop()
{
    PrintDebugNpc(PD_MST_LOOP,"ZS_MM_EatBody_loop");
    
	if	!Hlp_IsValidNpc(other)	//Body weg
	{
		return LOOP_END;
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_EatBody_end()
{
    PrintDebugNpc(PD_MST_FRAME,"ZS_MM_EatBody_end");
    
	AI_PlayAni			(self,	"T_EAT_2_STAND");
};


// **************************************************************************************

func void B_MM_AssessEnemy()
{
    PrintDebugNpc(PD_MST_FRAME,"B_MM_AssessEnemy");
    
	if (	(Npc_GetDistToNpc(self, other) < self.aivar[AIV_MM_PercRange])
	&&		Npc_CanSeeNpcFreeLOS(self,other)									)	//SN 08.01.01: Vermeidung von Entdeckung des Spieler durch Wände hindurch
	{
		if (C_PreyToPredator(other,self)) 	//Jäger greift Beute immer direkt an
		{
			Npc_SetTarget 	(self,other);
			Npc_ClearAIQueue(self);
			AI_StartState 	(self, ZS_MM_Attack, 0, "");
		}
		else if (C_PreyToPredator(self,other))	// Beute flieht immer vor Jäger
		{
			Npc_SetTarget 	(self,other);
			Npc_ClearAIQueue(self);
			AI_StartState 	(self, ZS_MM_Flee, 0, "");
		}
		else if (Wld_GetGuildAttitude(self.guild,other.guild) != ATT_HOSTILE)	
		{
			//SN: wenn Spieler in Monster verwandelt, sind die Monster immer noch hostile, nicht aber nach Gildentabelle!
			//	-> vermeidet z.B. daß ein SC-Snapper von anderen Snappern attackiert wird
			//	-> wird später durch Aufruf von B_InitMonsterAttitudes() nach der Verwandlung dauerhaft und sauber gelöst! 
			return;	
		}
		else
		{	
			Npc_ClearAIQueue(self);
			AI_StartState 	(self,ZS_MM_AssessEnemy,0,"");
		};
	};
};
// -------------------------------------------------------------------------------------
func void ZS_MM_AssessEnemy()
{
    PrintDebugNpc(PD_MST_FRAME,"ZS_MM_AssessEnemy");
    
	Npc_SetPercTime (self,2);
	
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic); 			//selbe Rkt wie Humans
	Npc_PercEnable 		(self, PERC_ASSESSBODY, 		B_MM_AssessBody);
	
	if (self.aivar[AIV_MM_Behaviour] == HUNTER)
	{
		AI_StandUp 		(self);
		AI_TurnToNpc	(self, other);
		AI_PlayAni		(self, "T_WARN"); 
		AI_SetWalkmode 	(self, NPC_WALK);
	};

	if ((self.aivar[AIV_MM_Behaviour] == PASSIVE) || (self.aivar[AIV_MM_Behaviour] == PACKHUNTER))
	{
		AI_StandUp 		(self); //sonst kein LookAt
		AI_LookAtNpc	(self,other);
	};
};

func int ZS_MM_AssessEnemy_loop()
{
    PrintDebugNpc(PD_MST_LOOP,"ZS_MM_AssessEnemy_loop");
    
	if (Npc_GetDistToNpc(self, other) > self.aivar[AIV_MM_PercRange])
	{
		return 1;
	};
	
	if ((Npc_GetDistToNpc(self, other) <= self.aivar[AIV_MM_PercRange]) && (Npc_GetDistToNpc(self, other) > self.aivar[AIV_MM_DrohRange]))
	{
		if ((self.aivar[AIV_MM_Behaviour] == PASSIVE) || (self.aivar[AIV_MM_Behaviour] == PACKHUNTER))
		{
			if (!Npc_CanSeeNpc	(self,other))	
			{	
				AI_TurnToNpc 	(self,other);	
			};
		};
		
		if (self.aivar[AIV_MM_Behaviour] == HUNTER)
		{
			AI_GotoNpc (self,other);
		};
	};	
			
	if ((Npc_GetDistToNpc(self, other) <= self.aivar[AIV_MM_DrohRange]) && (Npc_GetDistToNpc(self, other) > self.aivar[AIV_MM_AttackRange])) 
	{
		if ((self.aivar[AIV_MM_Behaviour] == PASSIVE) || (self.aivar[AIV_MM_Behaviour] == PACKHUNTER))
		{
			if (Npc_GetStateTime (self) > self.aivar[AIV_MM_DrohTime])
			{	
				Npc_SetTarget	(self, other);
				Npc_ClearAIQueue(self);
				AI_StartState	(self, ZS_MM_Attack, 0, "");
			}
			else
			{
				AI_TurnToNpc 	(self,other);			
				AI_PlayAni		(self, "T_WARN");
				
				Npc_SendPassivePerc	(self, PERC_ASSESSWARN, other, self); // Opfer, Täter
			};
		};
		
		if (self.aivar[AIV_MM_Behaviour] == HUNTER)
		{
			AI_GotoNpc (self,other);
		};
	}
	else
	{
		Npc_SetStateTime (self,0); //Wenn SC NICHT im Droh-Bereich
	};
		
	if (Npc_GetDistToNpc(self, other) <= self.aivar[AIV_MM_AttackRange])
	{
		Npc_SetTarget	(self, other);
		Npc_ClearAIQueue(self);
		AI_StandUp		(self);
		AI_StartState	(self, ZS_MM_Attack, 0, "");
	};
	
	return 0;
};	

func void ZS_MM_AssessEnemy_end()
{ 
    PrintDebugNpc(PD_MST_FRAME,"ZS_MM_AssessEnemy_end");
    
	AI_StopLookAt (self);
};

// *************************************************************************************

func void B_MM_ReactToDamage ()
{
    PrintDebugNpc	(PD_MST_FRAME,"B_MM_ReactToDamage");
 	PrintGlobals	(PD_MST_CHECK);   

	self.aivar[AIV_MM_TEMP_PRIO] = PRIO_ATTACKER;
	
	if (C_PreyToPredator(self,other))
	{
		PrintDebugNpc	(PD_MST_FRAME,"...Monster ist Beute");
		Npc_SetTarget 	(self, other);	//für AI_Flee
		Npc_ClearAIQueue(self);
		Npc_PercDisable	(self,	PERC_ASSESSENEMY);		// SN:da diese Wahrnehmung sonst die Ausführung des folgenden AI_StartState verhindert!
		AI_StartState 	(self, ZS_MM_Flee, 0, "");	
	}
	else //Kein Jäger
	{
		PrintDebugNpc	(PD_MST_FRAME,"...Monster ist Jäger");
		Npc_SetTarget	(self, other);
		Npc_ClearAIQueue(self);
		Npc_PercDisable	(self,	PERC_ASSESSENEMY);		// SN:da diese Wahrnehmung sonst die Ausführung des folgenden AI_StartState verhindert!
		AI_StartState	(self, ZS_MM_Attack, 0, "");
	};
};


// *************************************************************************************************

func void B_MM_ReactToOthersDamage ()
{
    PrintDebugNpc(PD_MST_FRAME,"B_MM_ReactToOthersDamage");
    
	B_MM_DeSynchronize();
	
	if (C_PreyToPredator(self,other))
	{
		Npc_SetTarget 	(self, other);	//für AI_Flee
		Npc_ClearAIQueue(self);
		AI_StartState 	(self, ZS_MM_Flee, 0, "");	
	};
	
	if (	Wld_GetGuildAttitude(self.guild, victim.guild) == ATT_FRIENDLY   	
		 &&	Wld_GetGuildAttitude(self.guild, other.guild) != ATT_FRIENDLY)	// Helfe Rudelfreund
	{
		Npc_SetTarget	(self, other);
		Npc_ClearAIQueue(self);
		AI_StartState	(self, ZS_MM_Attack, 0, "");
	};
	
	if (	Wld_GetGuildAttitude(self.guild, other.guild) == ATT_FRIENDLY   
		 &&	Wld_GetGuildAttitude(self.guild, victim.guild) != ATT_FRIENDLY)	// Greife mit Rudelfreund an
	{
		Npc_SetTarget	(self, victim);
		Npc_ClearAIQueue(self);
		AI_StartState	(self, ZS_MM_Attack, 0, "");
	};
};


// ****************************************************************************************

func void B_MM_ReactToCombatDamage ()
{
    PrintDebugNpc(PD_MST_FRAME,"B_MM_ReactToCombatDamage");
    
	self.aivar[AIV_MM_TEMP_PRIO] = PRIO_ATTACKER;
	
	if (C_PreyToPredator (self,other))
	{
		Npc_SetTarget	(self, other); 	//für AI_Flee
		Npc_ClearAIQueue(self);
		AI_StartState 	(self, ZS_MM_Flee, 0, "");
	};
		
	if (other == hero)
	{
		Npc_SetTarget	(self, other);	//macht SC zum target
	};
};
// -------------------------------------------------------------------------------------------------
func void ZS_MM_Attack ()
{
	PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Attack");

	//-------- Monster-Mages --------
	PrintGlobals	(PD_MST_DETAIL);
	if (C_NpcIsMonsterMage(self))
	{	
		B_FullStop		(self);
		AI_StartState	(self,	ZS_MM_AttackMage, 0, "");
		return;
	};

	//-------- SC/NSC im Dialog ignorieren --------
	if (other.aivar[AIV_INVINCIBLE])
	{
		AI_ContinueRoutine(self); 
	};

	//-------- Wahrnehmungen --------
	Npc_PercEnable	(self, PERC_ASSESSDAMAGE,	B_MM_ReactToCombatDamage); 	//global
	Npc_PercEnable	(self, PERC_ASSESSMAGIC,  	B_AssessMagic); 				//selbe Rkt wie Humans
	Npc_PercEnable	(self, PERC_ASSESSBODY, 	B_MM_AssessBody);
	if (self.aivar[AIV_MM_PARTYMEMBER] == TRUE) //d.h. beschworenes Monster
	{	
		Npc_PercEnable  (self, PERC_ASSESSFIGHTSOUND, B_MM_SummonedByPCAssessOthersDamage);
	};
	
	AI_StandUp		(self);
	AI_SetWalkmode 	(self, NPC_RUN);
	
	Npc_GetTarget	(self);
	
	Npc_SendPassivePerc	(self, PERC_ASSESSWARN,	other, self); //Opfer,Täter
};

func int ZS_MM_Attack_Loop ()
{
	PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_Attack_Loop");

	if (other.attribute[ATR_HITPOINTS] <= 0)
	{
		B_MM_AssessBody();	// springt in ZS_EatBody, wenn Monster Beute mag
		return 1;			// oder beendet Loop
	};
		
	Npc_GetTarget(self);	//other = target
	if (Hlp_IsValidNpc(other) && !C_NpcIsDown(other)) 
	{
		PrintDebugNpc		(PD_MST_LOOP, "...Ziel vorhanden!");
		if	C_BodyStateContains(other,BS_RUN)
		||	C_BodyStateContains(other,BS_JUMP)
		{
			PrintDebugNpc	(PD_MST_LOOP, "...Ziel läuft oder springt!");
			if (Npc_GetStateTime (self) > self.aivar[AIV_MM_FollowTime]) // x Sekunden verfolgen
			{
				PrintDebugNpc(PD_MST_CHECK, "...Ziel schon zu lange verfolgt!");
				return 1;
			};
		}
		else if (C_BodystateContains(other,BS_SWIM) || C_BodystateContains(other,BS_DIVE))
		{
			if (self.aivar[AIV_MM_FollowInWater] == FALSE)
			{
				return 1;
			};
		}
		else
		{
			Npc_SetStateTime (self,0);
		};
		
		if (other.aivar[AIV_INVINCIBLE]==FALSE) // Nur NSCs angreifen, die NICHT im Talk sind
		{
			AI_Attack		(self); 
		};
	}
	else // GetTarget = FALSE
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Ziel ist ungültig oder kampf-unfähig!");

		if (self.aivar[AIV_MM_Behaviour] == HUNTER)	
		{
			Npc_ClearAIQueue(self);
			AI_StartState 	(self, ZS_MM_EatBody, 0, "");
		}
		else	// Monster NICHT auf der Jagd - weitere Feinde Attacken
		{
			Npc_PerceiveAll		(self);		// nötig, da Npc_GetNextTarget() auf der Liste der zuletzt Wahrgenommenen VOBs beruht
			Npc_GetNextTarget	(self);
			PrintGlobals		(PD_ZS_DETAIL);
			if (Hlp_IsValidNpc(other) && !C_NpcIsDown(other))
			{
				PrintDebugString	(PD_MST_CHECK, "...neues Ziel gefunden: ", other.name);
			}
			else
			{
				PrintDebugNpc		(PD_MST_CHECK, "...kein Neues Ziel vorhanden!");
				return 				LOOP_END;
			};
		};
	};
	return LOOP_CONTINUE;
};

func void ZS_MM_Attack_End ()
{
	PrintDebugNpc	(PD_MST_FRAME, "ZS_MM_Attack_End");

	self.aivar[AIV_MM_TEMP_PRIO] = PRIO_PREY;
	Npc_ClearAIQueue(self);
	AI_StandUp		(self);
	AI_PlayAni		(self,	"T_WARN"); //nochmal zum Abschied Drohen
	AI_Wait			(self,	1); 			 //SC hat die Chance, weiter weg zu kommen als AttackRange
};

// **********************************************************************************************


func void ZS_MM_Flee ()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Flee");
    
	Npc_PercEnable		(self,	PERC_ASSESSMAGIC,	B_AssessMagic);	
	
	AI_StandUp			(self);
	AI_SetWalkmode 		(self, NPC_RUN);
};

func int ZS_MM_Flee_Loop ()
{
    PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_Flee_Loop");
    
	if (Npc_GetDistToNpc(self,	other) < 2000)
	{																
		AI_Flee (self);
		return 0;
	}
	else
	{			
		self.WP = Npc_GetNearestWP (self);	//Bleib da, wo du bist
		return 1;													
	};
};

func void ZS_MM_Flee_End ()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Flee_End");
};

// **************************************************************************************

func void B_MM_AssessWarn ()
{
    // MH: BEACHTEN: Wenn Warns andere NSCs dureinanderbringen, müssen diese die Sender FILTERN!
    
    PrintDebugNpc		(PD_MST_FRAME, "B_MM_AssessWarn");
		
	// ---------------- Beute von Jäger gewarnt -------------------
	if (C_PreyToPredator(self,other))
	{
		Npc_SetTarget	(self, other); 				//für AI_Flee
		Npc_ClearAIQueue(self);
		AI_StartState 	(self, ZS_MM_Flee, 0, "");
	};	
	// ---------------- PACKHUNTER greift an ODER ruft Verstärkung -----------------
	if ( (Wld_GetGuildAttitude(self.guild,other.guild)==ATT_FRIENDLY) && (self.aivar[AIV_MM_Behaviour]==PACKHUNTER) )	
	{
		if (Npc_IsInState(other, ZS_MM_Attack))
		{
			Npc_SetTarget	(self, victim);
			Npc_ClearAIQueue(self);
			AI_StandUp		(self);
			AI_StartState	(self, ZS_MM_Attack, 0, "");
		}
		else // Kein Attack, also AssessEnemy
		{
			AI_SetWalkmode	(self, NPC_RUN);
			AI_GotoNpc 		(self, other);		// Gehe zu Jäger-Freund
			if (Wld_DetectNpc   (self, victim, NOFUNC, -1))	// victim --> other
			{
				AI_StartState	(self, ZS_MM_AssessEnemy, 0, "");
			};
		};
	};
};


// ***********************************************************************************
// 										DAYCYCLE
// ***********************************************************************************

func void ZS_MM_AllScheduler()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_AllScheduler");
    
	if (Wld_IsTime	(self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00) || (self.aivar[AIV_MM_SleepStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Sleep, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00) || (self.aivar[AIV_MM_RestStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Rest, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00) || (self.aivar[AIV_MM_RoamStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Roam, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00) || (self.aivar[AIV_MM_EatGroundStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_EatGround, 1, "");
	}
	else if (Wld_IsTime	(self.aivar[AIV_MM_WuselStart],00,self.aivar[AIV_MM_WuselEnd],00) || (self.aivar[AIV_MM_WuselStart] == OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_Rtn_Wusel, 1, "");
	}
	else
	{
		AI_StartState (self, ZS_MM_Rtn_Default, 1, "");
	};
};

// ******************************** DEFAULT *****************************

func void ZS_MM_Rtn_Default()	// Immobile
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Default");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);

	AI_AlignToWP		(self);		// SN: Monster am Start am Wegpunkt ausrichten
};
func void ZS_MM_Rtn_Default_loop()
{
    PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_Rtn_Default_loop");
};
func void ZS_MM_Rtn_Default_end()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Default_end");
};


// ********************************* SLEEP ******************************

func void B_MM_AssessEnemy_Sleep()
{
    PrintDebugNpc		(PD_MST_FRAME, "B_MM_AssessEnemy_Sleep");
    
	if (C_BodyStateContains(self,BS_LIE))
	{
		if (Npc_GetDistToNpc(self,other)<200)
		{
			B_MM_AssessEnemy();
		};
	}
	else
	{
		B_MM_AssessEnemy();
	};
};
// ------------------------------------------------------------------
func void B_MM_AssessQuietSound_Sleep()
{
    PrintDebugNpc		(PD_MST_FRAME, "B_MM_AssessQuietSound_Sleep");
	/*
	if (self.aivar[AIV_MM_CanLookWhileSleeping]==TRUE && self.aivar[AIV_MM_SchonmalGeglotzt]==FALSE)
	{
		AI_PlayAni	(self,"T_SLEEP_2_SLEEPLOOK");
		AI_LookAtNpc(self,other);
		AI_Wait		(self,2);
		AI_StopLookAt(self);
		self.aivar[AIV_MM_SchonmalGeglotzt] = TRUE;
	};
	*/	
	
	if (Npc_GetDistToNpc(self, other) <= self.aivar[AIV_MM_DrohRange])	//Drohrange > INTERMEDIAT bringt natürlich nix wegen QuietSound-Distanz
	{
		if (Wld_GetGuildAttitude(self.guild,other.guild)==ATT_HOSTILE)  //(Npc_GetAttitude(self, other)==ATT_HOSTILE)
		{
			B_MM_AssessEnemy();
		};
	};
};
// ------------------------------------------------------------------
func void ZS_MM_Rtn_Sleep()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Sleep");
    
	Npc_SetPercTime		(self, 2);
	
	Npc_PercEnable		(self,	PERC_ASSESSDAMAGE,		B_MM_ReactToDamage);
	Npc_PercEnable		(self,	PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self,	PERC_ASSESSWARN,		B_MM_AssessWarn);
	Npc_PercEnable		(self, 	PERC_ASSESSOTHERSDAMAGE,B_MM_ReactToOthersDamage); 
	Npc_PercEnable		(self,	PERC_ASSESSQUIETSOUND,	B_MM_AssessQuietSound_Sleep);
	Npc_PercEnable		(self, 	PERC_ASSESSENEMY,		B_MM_AssessEnemy_Sleep);		
	
	//self.aivar[AIV_MM_SchonmalGeglotzt] = FALSE;
	AI_SetWalkmode 	(self, NPC_WALK);
	
	B_MM_DeSynchronize();
	
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
			
	if (Wld_IsFPAvailable(self,"FP_SLEEP"))
	{																	
		AI_GotoFP (self, "FP_SLEEP");
	};
	AI_PlayAni			(self,	"T_PERCEPTION");
	AI_PlayAniBS		(self,	"T_STAND_2_SLEEP", BS_LIE);
};

func void ZS_MM_Rtn_Sleep_loop()
{
    PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_Rtn_Sleep_loop");
    
	if ((!Wld_IsTime (self.aivar[AIV_MM_SleepStart],00,self.aivar[AIV_MM_SleepEnd],00)) && (self.aivar[AIV_MM_SleepStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
	};
};

func void ZS_MM_Rtn_Sleep_end()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Sleep_end");
    
	AI_PlayAniBS		(self,	"T_SLEEP_2_STAND", BS_STAND);
};


// ****************************** ROAM *********************************

func void ZS_MM_Rtn_Roam()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Roam");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE)  //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};	
};

func void ZS_MM_Rtn_Roam_loop()
{
    PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_Rtn_Roam_loop");
    
	if ((!Wld_IsTime (self.aivar[AIV_MM_RoamStart],00,self.aivar[AIV_MM_RoamEnd],00)) && (self.aivar[AIV_MM_RoamStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
	};
		
	if (Hlp_Random(100) <= 20)
	{
		if (Wld_IsNextFPAvailable(self,	"FP_ROAM"))	
		{											
			AI_GotoNextFP	(self,	"FP_ROAM");
		}
		else // WPs benutzen
		{														
			AI_GotoWP	(self,	Npc_GetNearestWP (self));						
			AI_GotoWP	(self,	Npc_GetNextWP (self));						
		};
	}
	else
	{
		var int randomMove;
		randomMove = Hlp_Random(2);
		if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
		if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
		if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
	};
};

func void ZS_MM_Rtn_Roam_end()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Roam_end");
};

// ****************************** REST ********************************

func void ZS_MM_Rtn_Rest()  
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Rest");
    
	Npc_SetPercTime		(self, 2);
	self.aivar[AIV_MM_TEMP_PRIO] = PRIO_PREY;
	
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic); 			//selbe Rkt wie Humans
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy); 	
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn); 	
	Npc_PercEnable 		(self, PERC_ASSESSBODY, 		B_MM_AssessBody);

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
		
	if (Wld_IsFPAvailable(self,	"FP_ROAM"))	
	{
		AI_GotoFP (self, "FP_ROAM");
	};
};

func void ZS_MM_Rtn_Rest_Loop ()
{
    PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_Rtn_Rest_Loop");
    
	if ((!Wld_IsTime	(self.aivar[AIV_MM_RestStart],00,self.aivar[AIV_MM_RestEnd],00)) && (self.aivar[AIV_MM_RestStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
	};
	
	if (Hlp_Random(1000) <= 5)
	{
		var int randomMove;
		randomMove = Hlp_Random(2);
		AI_StandUp (self);
		if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
		if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
		if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
	};
};

func void ZS_MM_Rtn_Rest_End ()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Rest_End");
    
	AI_PlayAni			(self,	"T_REST_2_STAND");
};


// ****************************** EAT GROUND **************************************

func void ZS_MM_Rtn_EatGround()  
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_EatGround");
    
	Npc_SetPercTime		(self, 2);
	self.aivar[AIV_MM_TEMP_PRIO] = PRIO_PREY;
	
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage); 		
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic); 			//selbe Rkt wie Humans
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy); 	
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn); 	
	Npc_PercEnable 		(self, PERC_ASSESSBODY, 		B_MM_AssessBody);

	AI_SetWalkmode 	(self, NPC_WALK);
	B_MM_DeSynchronize();
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};
		
	if (Wld_IsFPAvailable(self,	"FP_ROAM"))	
	{
		AI_GotoFP (self, "FP_ROAM");
	};
	AI_PlayAni			(self, "T_STAND_2_EAT");
	
	Mdl_ApplyRandomAni		(self,	"S_EAT",	"R_ROAM1");
	Mdl_ApplyRandomAni		(self,	"S_EAT",	"R_ROAM2");
	Mdl_ApplyRandomAni		(self,	"S_EAT",	"R_ROAM3");
	Mdl_ApplyRandomAniFreq	(self,	"S_EAT",	8.0);
};

func void ZS_MM_Rtn_EatGround_Loop ()
{
    PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_Rtn_EatGround_Loop");
    
	if ((!Wld_IsTime	(self.aivar[AIV_MM_EatGroundStart],00,self.aivar[AIV_MM_EatGroundEnd],00)) && (self.aivar[AIV_MM_EatGroundStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
	};
};

func void ZS_MM_Rtn_EatGround_End ()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_EatGround_End");
    
	AI_PlayAni			(self,	"T_EAT_2_STAND");
};


// ******************************** WUSEL ***************************************

func void ZS_MM_Rtn_Wusel()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Wusel");
    
	Npc_PercEnable		(self, PERC_ASSESSDAMAGE,		B_MM_ReactToDamage);
	Npc_PercEnable		(self, PERC_ASSESSOTHERSDAMAGE, B_MM_ReactToOthersDamage); 	
	Npc_PercEnable		(self, PERC_ASSESSMAGIC,		B_AssessMagic);	
	Npc_PercEnable		(self, PERC_ASSESSENEMY,		B_MM_AssessEnemy);
	Npc_PercEnable		(self, PERC_ASSESSWARN,			B_MM_AssessWarn);
	Npc_PercEnable		(self, PERC_ASSESSBODY,			B_MM_AssessBody);

	AI_SetWalkmode 	(self, NPC_RUN);
	if (Hlp_StrCmp(Npc_GetNearestWP(self),self.wp)==FALSE) //damit die Monster beim Inserten nicht immer erst zum WP rennen, sondern nur, wenn sie der Heimat zu fern sind
	{
		AI_GotoWP (self, self.WP);
	};		
};

func void ZS_MM_Rtn_Wusel_loop()
{
    PrintDebugNpc		(PD_MST_LOOP, "ZS_MM_Rtn_Wusel_loop");
    
	if ((!Wld_IsTime (self.aivar[AIV_MM_WuselStart],00,self.aivar[AIV_MM_WuselEnd],00)) && (self.aivar[AIV_MM_WuselStart] != OnlyRoutine))
	{
		AI_StartState (self, ZS_MM_AllScheduler, 1, "");
	};
		
	if (Hlp_Random(100) <= 20)
	{
		if (Wld_IsNextFPAvailable(self,	"FP_ROAM"))	
		{											
			AI_GotoNextFP	(self,	"FP_ROAM");
		}
		else // WPs benutzen
		{														
			AI_GotoWP	(self,	Npc_GetNearestWP (self));						
			AI_GotoWP	(self,	Npc_GetNextWP (self));						
		};
	}
	else
	{
		var int randomMove;
		randomMove = Hlp_Random(2);
		if (randomMove == 0) {AI_PlayAni(self, "R_ROAM1");};
		if (randomMove == 1) {AI_PlayAni(self, "R_ROAM2");};
		if (randomMove == 2) {AI_PlayAni(self, "R_ROAM3");};
	};
};

func void ZS_MM_Rtn_Wusel_end()
{
    PrintDebugNpc		(PD_MST_FRAME, "ZS_MM_Rtn_Wusel_end");
};


// **************************** SUMMONED MONSTER *****************************

func void ZS_MM_Summoned()
{
	PrintDebugNpc			(PD_MST_FRAME,	"ZS_MM_Summoned");
	Npc_SetPercTime			(self,	1);
	
	Npc_PercEnable			(self,	PERC_ASSESSENEMY,	ZS_MM_Attack);
	Npc_PercEnable			(self,	PERC_ASSESSMAGIC,  	B_AssessMagic);
	
	AI_StandUp(self);

	Npc_SetTempAttitude		(self,	ATT_HOSTILE); 
	Npc_SetAttitude			(self,	ATT_HOSTILE);
};

func int ZS_MM_Summoned_loop()
{
	PrintDebugNpc			(PD_MST_LOOP,	"ZS_MM_Summoned_loop");
	PrintGlobals			(PD_MST_DETAIL);
	if (Npc_GetNextTarget(self))		// other = target oder nicht valid
	{
		PrintDebugNpc		(PD_MST_CHECK,	"...neuer Gegner gefunden");
		Npc_SetTarget		(self,	other);	
		Npc_ClearAIQueue	(self);
		AI_StartState		(self,	ZS_MM_Attack, 0, "");
	}
	else // Kein Gegner gefunden
	{
		if (Npc_GetStateTime (self) > 5)
		{
			return LOOP_END;
		}
		else
		{
			AI_TurnToNpc	(self, other);
			return LOOP_CONTINUE;
		};
	};
};

func void ZS_MM_Summoned_End()
{
	PrintDebugNpc			(PD_MST_FRAME,	"ZS_MM_Summoned_End");
	
	Npc_ChangeAttribute		(self,ATR_HITPOINTS, -self.attribute[ATR_HITPOINTS]);
};





// ****************************************************************************

/*				ITEMS WERFEN RAUSGEFLOGEN - Sinn von AssessItem & Co ?

// ****************************************************************************

func void B_MM_AssessItem()		// kann auch durch QuietSound aufgerufen werden
{
	if (item.mainflag == ITEM_KAT_FOOD && Wld_DetectItem (self, ITEM_KAT_FOOD))
	{
		AI_StartState	(self, ZS_MM_EatItem, 0 ,"");
	}; 
};
// ----------------------------------------------------------------------------
func void ZS_MM_EatItem()
{
	Npc_PercEnable		(self,	PERC_ASSESSDAMAGE,	B_MM_ReactToDamage);
	Npc_PercEnable		(self,	PERC_ASSESSMAGIC,	B_AssessMagic);	
	Npc_PercEnable		(self,	PERC_ASSESSENEMY,	B_MM_AssessEnemy);
	Npc_PercEnable		(self,	PERC_ASSESSWARN,	B_MM_AssessWarn);
	//Npc_PercEnable		(self,	PERC_MOVENPC,				ZS_MONSTER_MoveNpc );
	
	AI_SetWalkmode		(self, NPC_RUN);
	
	AI_PlayAni			(self,	"T_PERCEPTION");
	B_WhirlAround		(self,	item);
	AI_GotoItem			(self,	item);
	AI_PlayAni			(self,	"T_STAND_2_EAT");
};

func int ZS_MONSTER_EatItem_loop()
{
	if (Npc_GetStateTime(self) > 10)
	{
		return 1;
	};
	if (!Hlp_IsValidItem(item))	//Item weg
	{
		return 1;
	};
	return 0;
};

func void ZS_MONSTER_EatItem_end()
{
	if (Hlp_IsValidItem	(item))
	{
		Wld_RemoveItem	(item);
	};
	AI_PlayAni		(self,	"T_EAT_2_STAND");
};


// ********************************************************************

func void ZS_MM_MoveNpc ()
{
	Npc_PercEnable		(self,	PERC_ASSESSDAMAGE,	B_MM_ReactToDamage);
	Npc_PercEnable		(self,	PERC_ASSESSMAGIC,	B_AssessMagic);	
	Npc_PercEnable		(self,	PERC_ASSESSENEMY,	B_MM_AssessEnemy);
	Npc_PercEnable		(self,	PERC_ASSESSWARN,	B_MM_AssessWarn);

	AI_PlayAni		(self,	"T_WARN");
};

*/

