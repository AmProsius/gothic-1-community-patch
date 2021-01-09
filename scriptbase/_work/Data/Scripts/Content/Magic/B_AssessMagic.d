// B_AssessMagic. Wird auf dem Opfer einmalig aufgerufen, wenn die Perception MAGIC (ASSESSMAGIC) aktiviert wird

// FIXME: 	hier müssen für jeden Spruch noch Fallunterscheidungen für MAIN / IMMORTAL Characters
//			berücksichtigt werden, die evtl. nicht von den Sprüchen beeinflußt werden sollen!


/*******************************************************************************************/
func void B_AssessMagic_Firebolt()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Firebolt" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_FireBall()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_FireBall" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_Firestorm()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Firestorm" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_Firerain()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Firerain" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};


/*******************************************************************************************/
func void B_AssessMagic_ChainLightning()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic ...ChainLightning" );	

	Npc_PercDisable		(self,	PERC_ASSESSCASTER);

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);

	Npc_ClearAIQueue(self);
	if ( !Npc_IsDead(self) )
	{
		B_FullStop 		(self);
		AI_StartState	(self, ZS_Zapped, 0, "");
	};
};


/*******************************************************************************************/
func void B_AssessMagic_Thunderbolt()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Thunderbolt" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_ThunderBall()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic ...Thunderball" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
	
	Npc_ClearAIQueue(self);
	if ( !Npc_IsDead(self) )
	{
		AI_StartState	( self, ZS_ShortZapped, 0, "");
	};
};

/*******************************************************************************************/
func void B_AssessMagic_IceCube()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic ...IceCube oder IceWave" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);


// kein Freezen von SLEEPER, DEMON, GOLEM, SWAMPSHARK, TROLL und wenn Opfer in BS_SWIM oder BS_DIVE
// FIXME: MInecrawlerqueeen ist GIL_MINECRAWLER! Andere Gilde geben, damit auch sie nicht gefreezt werden kann?!
	if ( !(	(self.guild	== GIL_SLF) 		||
			(self.guild == GIL_DEMON) 		||
			(self.guild == GIL_GOLEM) 		||
			(self.guild == GIL_SWAMPSHARK) 	||
			(self.guild == GIL_TROLL)) ) 	&&
			( ! (C_BodystateContains(self,BS_SWIM)) ||	(C_BodystateContains(self,BS_DIVE)) )
	{
	Npc_ClearAIQueue(self);
	AI_StartState	(self, ZS_MagicFreeze, 0, "");
	};
};

/*******************************************************************************************/
func void B_AssessMagic_Fear()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Fear" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);

	// Immunität für SLEEPER, TROLL, SWAMPSHARK, DEMON, SKELETONS, ZOMBIES, GOLEM
	if (	(self.guild	== GIL_SLF) 		||
			(self.guild == GIL_TROLL)		||
			(self.guild == GIL_SWAMPSHARK) 	||
			(self.guild == GIL_DEMON)		||
			(self.guild == GIL_GOLEM)		||
			(self.guild == GIL_SKELETON)	||
			(self.guild == GIL_ZOMBIE)			)
	{
		PrintDebugNpc	(PD_MAGIC, "...Ziel immun!" );	
	}
	else
	{
		PrintDebugNpc	(PD_MAGIC, "...Ziel NICHT immun!" );	
		Npc_ClearAIQueue(self);
		Npc_SetTarget	(self,	other);
		if (C_NpcIsHuman(self))
		{
			AI_StartState	(self, ZS_Flee, 0, "");
		}
		else if (C_NpcIsMonster(self))
		{
			AI_StartState	(self, ZS_MM_Flee, 0, "");
		};
	};
};

/*******************************************************************************************/
func void B_Assessmagic_Massdeath()
{
	PrintDebugNpc( PD_MAGIC, "B_Assessmagic_Massdeath" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_Destroyundead()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Destroyundead" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_Windfist()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Windfist" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_Stormfist()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Stormfist" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_Charm()
{
	PrintDebugNpc( PD_ZS_CHECK, "B_AssessMagic Charm");

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
	
	Npc_ClearAIQueue		(self);		// alle AI Befehle entfernen	

	if (!Npc_IsInState(self, ZS_Unconscious))
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...NSC ist ein Mensch bei bewußtsein!");

		Npc_SetTempAttitude (self,	ATT_FRIENDLY) ;
		B_FullStop			(self);

		if (Npc_IsInState(self, ZS_Attack) )
		{
			B_SayOverlay	(self,	other,	"$LetsForgetOurLittleFight");
		}
		else
		{
			B_Say			(self,	other,	"$FriendlyGreetings");
		};
		AI_ContinueRoutine	(self);
	};
};

/*******************************************************************************************/
func void B_AssessMagic_Pyrokinesis()
{
	PrintDebugNpc		(PD_MAGIC, "...Pyrokinesis");	
	Npc_ClearAIQueue	(self);
	Npc_PercDisable		(self,	PERC_ASSESSCASTER);

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc	(self,	PERC_ASSESSFIGHTSOUND, self, other);
	if ( !Npc_IsDead(self) && !Npc_IsInState(self,ZS_Unconscious))
	{
		PrintDebugNpc	(PD_MAGIC,	"...weder bewußtlos noch tot!" );	
		AI_StartState	(self,	ZS_Pyro, 0, "");
	};
};

/*******************************************************************************************/
func void B_AssessMagic_Berzerk()
{
	PrintDebugNpc		(PD_MAGIC, "...Berzerk" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);

// FIXME: was soll mit Immortals/Main chars.  passieren?
	Npc_ClearAIQueue	(self);

	if ( !Npc_IsDead(self) && !Npc_IsInState(self,ZS_Unconscious))
	{
		AI_StartState	(self, ZS_Berzerk, 0, "");
	};
};

/*******************************************************************************************/
func void B_AssessMagic_Breathofdeath()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_Breathofdeath" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_New1()
{
	PrintDebugNpc( PD_MAGIC, "B_AssessMagic_New1" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc(self, PERC_ASSESSFIGHTSOUND, self, other);
};

/*******************************************************************************************/
func void B_AssessMagic_Shrink()
{
	PrintDebugNpc( PD_MAGIC, "...Shrink" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);

	Npc_ClearAIQueue	(self);
	AI_StartState		(self, ZS_MagicShrink, 0, "");
};

/*******************************************************************************************/
func void B_AssessMagic_Control()
{
	PrintDebugNpc( PD_MAGIC, "...Control" );	

	//	Damit andere NSCs den Angriff wahrnehmen können
	Npc_SendPassivePerc	(self, PERC_ASSESSFIGHTSOUND, self, other);
};





/*******************************************************************************************/
func void B_AssessMagic ()
{
	PrintGlobals		(PD_MAGIC);

	PrintDebugNpc		( PD_MAGIC, "B_AssessMagic" );
	
	if 		( Npc_GetActiveSpell 	(other) == SPL_FIREBOLT			)		{	B_AssessMagic_Firebolt		();	}
	else if ( Npc_GetActiveSpell 	(other) == SPL_FIREBALL			)		{	B_AssessMagic_Fireball		();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_FIRESTORM		)		{	B_AssessMagic_Firestorm		();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_FIRERAIN			)		{	B_AssessMagic_Firerain		();	} 

	else if ( Npc_GetActiveSpell 	(other) == SPL_CHAINLIGHTNING	)		{	B_AssessMagic_Chainlightning();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_THUNDERBOLT		)		{	B_AssessMagic_Thunderbolt	();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_THUNDERBALL		)		{	B_AssessMagic_Thunderball	();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_ICECUBE			)		{	B_AssessMagic_Icecube		();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_ICEWAVE			)		{	B_AssessMagic_Icecube		();	} 

	else if ( Npc_GetActiveSpell 	(other) == SPL_MASSDEATH		)		{	B_Assessmagic_Massdeath		();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_DESTROYUNDEAD	)		{	B_AssessMagic_Destroyundead	();	} 

	else if ( Npc_GetActiveSpell 	(other) == SPL_WINDFIST			)		{	B_AssessMagic_Windfist		();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_STORMFIST		)		{	B_AssessMagic_Stormfist		();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_CHARM 			) 		{	B_AssessMagic_Charm			();	}
	else if ( Npc_GetActiveSpell 	(other) == SPL_FEAR				)		{	B_AssessMagic_Fear			();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_PYROKINESIS  	) 		{	B_AssessMagic_Pyrokinesis	();	}
	else if ( Npc_GetActiveSpell 	(other) == SPL_BERZERK 			) 		{	B_AssessMagic_Berzerk		();	}
	else if ( Npc_GetActiveSpell 	(other) == SPL_BREATHOFDEATH	)		{	B_AssessMagic_Breathofdeath	();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_NEW1				)		{	B_AssessMagic_New1			();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_CONTROL			)		{	B_AssessMagic_Control		();	} 
	else if ( Npc_GetActiveSpell 	(other) == SPL_SHRINK 			) 		{	B_AssessMagic_Shrink		();	};


// Folgende Sprüche brauchen keinen B_AssessMagic weil sie nicht auf einen NSC wirken:

//	 ( Npc_GetActiveSpell 	(other) == SPL_LIGHT		)			{	B_AssessMagic_Light();			}
//	 ( Npc_GetActiveSpell 	(other) == SPL_TELEPORT1	)			{	B_AssessMagic_TELEPORT1();		} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_TELEPORT2	)			{	B_AssessMagic_TELEPORT2();		} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_TELEPORT3	)			{	B_AssessMagic_TELEPORT3();		} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_TELEPORT4	)			{	B_AssessMagic_TELEPORT4();		} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_TELEPORT5	)			{	B_AssessMagic_TELEPORT5();		} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_HEAL 		)			{	B_AssessMagic_Heal();			} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_TRANSFORM	) 			{	B_AssessMagic_Transform();		} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_SUMMONDEMON  ) 			{	B_AssessMagic_SummonDemon();	} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_SUMMONSKELETON) 			{	B_AssessMagic_SummonSkeleton();	} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_SUMMONGOLEM  ) 			{	B_AssessMagic_SummonGolem();	} 
//	 ( Npc_GetActiveSpell 	(other) == SPL_ARMYOFDARKNESS) 			{	B_AssessMagic_ArmyOfDarkness();	}
//	 ( Npc_GetActiveSpell 	(other) == SPL_TELEKINESIS  ) 			{	B_AssessMagic_Telekinesis();	} 

};


// Anmeldung der AssessMagic-Wahrnehmung, wenn der Player NICHT zustandsgesteuert ist
const func PLAYER_PERC_ASSESSMAGIC = B_AssessMagic; 			