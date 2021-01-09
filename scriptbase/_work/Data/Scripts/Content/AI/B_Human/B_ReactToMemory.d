func void B_ReactToMemory ()
{
	PrintDebugNpc( PD_ZS_FRAME, "B_ReactToMemory" );

	//-------------------------------------------ReactToMurderNews--------------------------------------------------------
	var int 	murdernews;
	
	
	murdernews	 		= 	Npc_HasNews 		( self, NEWS_MURDER, NULL, NULL);
			
	if (murdernews > 0)
	{
		var C_NPC	murdernews_victim;
		var C_NPC	murdernews_offender;
		
		murdernews_victim 	= 	Npc_GetNewsVictim	( self, murdernews);
		murdernews_offender	=	Npc_GetNewsOffender	( self, murdernews);
	
		PrintDebugNpc( PD_ZS_CHECK, "B_ReactToMemory // Murder_News");
		if (B_CompareNpcInstance (murdernews_offender, other))
		{
			PrintDebugNpc( PD_ZS_CHECK, "B_ReactToMemory // Murder_News// SC Offender");
			if ( Npc_GetPermAttitude ( self, other) == ATT_FRIENDLY || Npc_GetPermAttitude ( self, other) == ATT_NEUTRAL)
			{
				PrintDebugNpc( PD_ZS_CHECK, "B_ReactToMemory // Murder_News // Friendly/Neutral offender SC");
				if (Hlp_IsValidNpc	(murdernews_victim))
				{
					PrintDebugNpc( PD_ZS_CHECK, "B_ReactToMemory // Murder_News// SC Offender es gibt ein victim");
				};	

				//	Wichtige Gilden (GURU, EBR, MAGE) haben eigenes SVM
					PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile");
					if ( murdernews_victim.guild == GIL_EBR)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile// EBR");
						B_Say 	( self, other, "$YOUKILLEDEBR");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
					if ( murdernews_victim.guild == GIL_GUR)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // GUR");
						B_Say	( self, other, "$YOUKILLEDGUR");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
					if ( murdernews_victim.guild == GIL_KDW || murdernews_victim.guild == GIL_KDF)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // KDF");
						B_Say	( self, other, "$YOUKILLEDMAGE");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};

				//	Ein SVM für restl. Gilden Altes Lager
					if ( murdernews_victim.guild == GIL_GRD)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // GRD");
						B_Say	( self, other, "$YOUKILLEDOCFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
					if ( murdernews_victim.guild == GIL_STT)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // STT");
						B_Say 	( self, other, "$YOUKILLEDOCFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
					if ( murdernews_victim.guild ==GIL_VLK)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // VLK");
						B_Say	( self, other , "$YOUKILLEDOCFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};

				//	Ein SVM für restl. Gilden Neues Lager
					if ( murdernews_victim.guild == GIL_SLD )
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // SLD");
						B_Say	( self, other, "$YOUKILLEDNCFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
					if ( murdernews_victim.guild == GIL_ORG )
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // ORG");
						B_Say	(self, other, "$YOUKILLEDNCFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
					if ( murdernews_victim.guild == GIL_BAU)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // BAU");
						B_Say	( self, other, "$YOUKILLEDNCFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
					if ( murdernews_victim.guild == GIL_SFB)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile //SFB");
						B_Say 	( self, other, "$YOUKILLEDNCFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};

				//	Ein SVM für restl. Gilden Altes Lager
					if ( murdernews_victim.guild == GIL_NOV)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // NOV");
						B_Say	( self, other, "$YOUKILLEDPSIFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
					if ( murdernews_victim.guild == GIL_TPL)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News // Friendly/Neutral offender SC victim  NOT hostile // TPL");
						B_Say	( self, other, "$YOUKILLEDPSIFOLK");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};

			}; 

			if (Npc_GetPermAttitude	( self, other) == ATT_ANGRY && Npc_GetPermAttitude	( self, murdernews_victim ) == ATT_FRIENDLY)
			{
				PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News// SC Offender(angry) victim(Friendly)");
				B_Say	( self, other, "$YOUKILLEDMYFRIEND");
				// JP: Neue Funktion, um erteilte News zu löschen
				Npc_DeleteNews  ( self,murdernews); 
				return;
			};
		}
		else 
		{
			if ( B_CompareNpcInstance	( other, murdernews_victim))
			{
			}
			else
			{
				PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News// SC Not Victim and not offender");
				if (Npc_GetPermAttitude	( self, other) == ATT_FRIENDLY || Npc_GetPermAttitude	( self, other) == ATT_NEUTRAL)
				{
					PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News// SC Not Victim and not offender and ok guy");
					if ( Npc_GetPermAttitude	( self, murdernews_victim) == ATT_FRIENDLY)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Murder_News// SC Not Victim and not offender and ok guy victim was a friend");
						B_Say	( self, other, "$THEYKILLEDMYFRIEND");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,murdernews); 
						return;
					};
				};
			};	
		 };
		 Npc_DeleteNews  ( self,murdernews); 
	};
	
	//-------------------------------------------ReactToAttackNews--------------------------------------------------------
	//Per Aivar noch einen Kommentar, bei Nsc selbst Attackopfer gewesen
	
	if (self.aivar[AIV_BEENATTACKED	]	== 1)
	{
		if (Npc_GetPermAttitude	( self, other) == ATT_ANGRY)
		{
			PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Attack_News SC offender victim(Angry) is me");
			B_Say	( self, other, "$LOOKINGFORTROUBLEAGAIN");
		};
		if (Npc_GetPermAttitude	( self, other) == ATT_FRIENDLY || Npc_GetPermAttitude	( self, other) ==  ATT_NEUTRAL)
		{
			PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Attack_News SC offender victim(friend/neutr) is me");
			B_Say	( self, other, "$LETSFORGETOURLITTLEFIGHT");
		};
		self.aivar[AIV_BEENATTACKED	]	= 0;
		return;
	};
	//-------------------------------------------ReactToDefeatNews--------------------------------------------------------
	
	var int 	defeat_news;
	
	defeat_news				= Npc_HasNews			( self, NEWS_DEFEAT, NULL, NULL);
					
	if (defeat_news > 0)
	{
		var int 	self_guild;
		var int 	defeat_news_victim_guild;
		var int 	defeat_news_offender_guild;
		var int 	other_guild;
	
		var C_NPC 	defeat_news_offender;
		var C_Npc 	defeat_news_victim;
		
		defeat_news_victim			= Npc_GetNewsVictim		( self, defeat_news);
		defeat_news_offender		= Npc_GetNewsOffender	( self, defeat_news);
		self_guild 					= self.guild;
		defeat_news_victim_guild 	= defeat_news_victim.guild;
		defeat_news_offender_guild 	= defeat_news_offender.guild;
		other_guild 				= other.guild;
	
	
		PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News");
		//JP: hier statt dem Victim und den news evtl. mit der AIV_Defeat arbeiten, vielleicht sogar zusätzlich
		if (B_CompareNpcInstance ( other, defeat_news_offender))
		{
			PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC offender");
			if (B_CompareNpcInstance ( self, defeat_news_victim))
			{
				PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC offender// victim is me");
				// JP: Warum wird hier nicht noch mal über stronger gegangen, was ist hier mit dem Fußvolk kann es sich beschweren ( kann für sie der Fall eintreten) und soll
				// es sich beschweren ?
				if (Npc_GetPermAttitude	( self, defeat_news_offender) == ATT_ANGRY)
				{
					PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC(angry) offender// victim is me");
					B_Say	( self, other, "$LookingForTroubleAgain");
					// JP: Neue Funktion, um erteilte News zu löschen
					Npc_DeleteNews  ( self,defeat_news); 
					return;
				}; 
				if (Npc_GetPermAttitude	( self, defeat_news_offender) == ATT_NEUTRAL || Npc_GetPermAttitude	( self, defeat_news_offender) == ATT_FRIENDLY)
				{
					PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC(friend/neutr) offender// victim is me");
					B_Say	( self, other, "$YOUDEFEATEDMEWELL");
					// JP: Neue Funktion, um erteilte News zu löschen
					Npc_DeleteNews  ( self,defeat_news); 
					return;
				};
			}
			else if (!B_CompareNpcInstance ( defeat_news_victim, other))	// anderer Nsc ist das Opfer 
			{
				PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC offender// victim is an other");
				if (Npc_GetPermAttitude	( self, defeat_news_offender) == ATT_ANGRY )
				{
					PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (angry) offender// victim is an other");
					if( Wld_GetGuildAttitude ( self_guild, defeat_news_victim_guild) == ATT_FRIENDLY)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender //victimguild (friendly)");
						if ( defeat_news_victim_guild == GIL_EBR)
						{
							PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender // victimguild (friendly) EBR");
							B_Say	( self, other, "$SUCKERDEFEATEDEBR");
							// JP: Neue Funktion, um erteilte News zu löschen
							Npc_DeleteNews  ( self,defeat_news); 
						}
						else if ( defeat_news_victim_guild == GIL_GUR)
						{
							PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender //victimguild (friendly) GUR");
							B_Say	( self, other, "$SUCKERDEFEATEDGUR");
							// JP: Neue Funktion, um erteilte News zu löschen
							Npc_DeleteNews  ( self,defeat_news); 
							return;
						}
						else if ( defeat_news_victim_guild	== GIL_KDF || defeat_news_victim_guild	== GIL_KDW)
						{
							PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender// victimguild (friendly) MAGE");
							B_Say	( self, other, "SUCKERDEFEATEDMAGE");
							// JP: Neue Funktion, um erteilte News zu löschen
							Npc_DeleteNews  ( self,defeat_news); 
							return;
						}
						else if	(self_guild == GIL_GRD && ( defeat_news_victim_guild == GIL_VLK || defeat_news_victim_guild == GIL_STT))
						{
							B_Say	( self, other, "$SUCKERDEFEATEDVLK_GUARD");
							// JP: Neue Funktion, um erteilte News zu löschen
							Npc_DeleteNews  ( self,defeat_news); 
							return;
						}
						else if (self_guild == GIL_TPL	&& defeat_news_victim_guild	== GIL_NOV)
						{
							B_Say	( self, other, "$SUCKERDEFEATEDNOV_GUARD");
							// JP: Neue Funktion, um erteilte News zu löschen
							Npc_DeleteNews  ( self,defeat_news); 
							return;
						}
						else
						{	
							PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry)  offender// victimguild (friendly) all others");
							if (Wld_GetGuildAttitude	( self_guild, defeat_news_offender_guild) == ATT_ANGRY || Wld_GetGuildAttitude	( self_guild, defeat_news_offender_guild) == ATT_NEUTRAL)
							{
								PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (Angry / guild-angry/neutral)  offender //victimguild (friendly) all others");
								B_Say	( self, other, "$YOUATTACKEDMYFRIEND");
								// JP: Neue Funktion, um erteilte News zu löschen
								Npc_DeleteNews  ( self,defeat_news); 
								return;
							};
						};
					
					};
				}
				else if (Npc_GetPermAttitude	( self, defeat_news_offender) == ATT_FRIENDLY || Npc_GetPermAttitude	( self, defeat_news_offender) == ATT_NEUTRAL)
				{
					PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is an other");
					if (defeat_news_victim_guild == GIL_EBR && self_guild != GIL_EBR)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is an other EBR me not EBR");
						B_Say	( self, other, "$YOUATTACKEDEBR");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,defeat_news); 
						return;
					}
					else if ( defeat_news_victim_guild == GIL_GUR && self_guild != GIL_GUR)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is an other GUR me not GUR");
						B_Say	( self, other, "YOUATTACKEDGUR");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,defeat_news); 
						return;
					}
					else if	( defeat_news_victim_guild	== GIL_KDW || defeat_news_victim_guild	== GIL_KDF)
					{
						PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is an other MAGE me not MAGE");
						B_Say	( self, other, "$YOUATTACKEDMAGE");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,defeat_news); 
						return;
					}
					else
					{
						if ((defeat_news_victim_guild == GIL_VLK || defeat_news_victim_guild == GIL_STT) && self_guild == GIL_GRD)
						{
							B_Say	( self, other, "$YOUDFEATEDVLK_GUARD");
							// JP: Neue Funktion, um erteilte News zu löschen
							Npc_DeleteNews  ( self,defeat_news); 
							return;
						};
						if (defeat_news_victim_guild == GIL_NOV && self_guild == GIL_TPL)
						{
							B_Say	( self, other, "$YOUDEFEATEDNOV_GUARD");
							// JP: Neue Funktion, um erteilte News zu löschen
							Npc_DeleteNews  ( self,defeat_news); 
							return;
						};

						PrintDebugNpc ( PD_ZS_FRAME, "B_ReactToMemory // Defeat_News // SC (friendly/neutral) offender// victim is protected by Guards");
						if ( C_NpcIsGuard ( self))
						{
							if ( C_NpcIsGuard (defeat_news_victim))
							{
								B_Say	( self, other, "$YouDefeatedMyComrade");
								Npc_DeleteNews  ( self,defeat_news); 
								return;
							};
							if (Wld_GetGuildAttitude	( self_guild, defeat_news_victim_guild) == ATT_FRIENDLY)
							{
								if ((defeat_news_victim_guild == GIL_VLK || defeat_news_victim_guild == GIL_STT) && self_guild == GIL_GRD)
								{
									B_Say	( self, other, "$YOUDFEATEDVLK_GUARD");
									// JP: Neue Funktion, um erteilte News zu löschen
									Npc_DeleteNews  ( self,defeat_news); 
									return;
								};
								if (defeat_news_victim_guild == GIL_NOV && self_guild == GIL_TPL)
								{
									B_Say	( self, other, "$YOUDEFEATEDNOV_GUARD");
									// JP: Neue Funktion, um erteilte News zu löschen
									Npc_DeleteNews  ( self,defeat_news); 
									return;
								};
							};
						};
					};
				};
			};
		}
		else // SC ist Victim
		{
			PrintDebugNpc ( PD_ZS_FRAME,	"B_ReactToMemory // Defeat_News // victim is player");
			if (B_CompareNpcInstance	( self, defeat_news_offender))
			{
				PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // victim is player/ me is aggressor");
				B_Say	( self, other, "$LOOKINGFORTROUBLEAGAIN");
				// JP: Neue Funktion, um erteilte News zu löschen
				Npc_DeleteNews  ( self,defeat_news); 
				return;
			}
			else
			{
				PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // victim is player/ me is NOT aggressor");
				if (Npc_GetPermAttitude	( self, defeat_news_victim) ==ATT_ANGRY)
				{
					PrintDebugNpc 	( PD_ZS_FRAME,"B_ReactToMemory // Defeat_News // victim is player(angry)/ me is NOT aggressor");
					B_Say			( self, other, "$SUCKERGOTSOME");
					Npc_DeleteNews  ( self,defeat_news); 
					return;
				};
			};
		};
		Npc_DeleteNews  ( self,defeat_news); 
	};
	
	//-------------------------------------------ReactToTheftNews--------------------------------------------------------
	
	var int theft_news;
	
	theft_news			= Npc_HasNews			( self, NEWS_THEFT,NULL, NULL);
	//JP: hier wurde auf eine Var abgefragt, die erst in dem Zweig gefüllt wird, grober Blödsinn B_CompareInstance jetzt eine Ebene tiefer
	if (theft_news > 0 )
	{
		var C_NPC theft_news_victim;
		var C_NPC theft_news_offender;
		
		theft_news_victim 	= Npc_GetNewsVictim 	( self, theft_news);	
		theft_news_offender = Npc_GetNewsOffender	( self, theft_news);
		if ( B_CompareNpcInstance ( other,theft_news_offender))
		{
			PrintDebugNpc ( PD_ZS_FRAME,"B_ReactToMemory // Theft_News // SC is Thief");
			if (Npc_GetPermAttitude	( self, other) == ATT_FRIENDLY || Npc_GetPermAttitude	( self, other) == ATT_NEUTRAL)
			{
				if ( theft_news_victim.guild == GIL_EBR && self.guild != GIL_EBR)
				{
					B_Say	( self, other, "$YOUSTOLEFROMEBR");
					// JP: Neue Funktion, um erteilte News zu löschen
					Npc_DeleteNews  ( self,theft_news); 
					return;
				};
				if ( theft_news_victim.guild == GIL_GUR && self.guild != GIL_GUR)
				{
					B_Say	( self, other, "$YOUSTOLEFROMGUR");
					// JP: Neue Funktion, um erteilte News zu löschen
					Npc_DeleteNews  ( self,theft_news); 
					return;
				};
				if ( theft_news_victim.guild == GIL_KDW || theft_news_victim.guild == GIL_KDF)
				{
					B_Say	( self, other, "$YOUSTOLEFROMMAGE");
					// JP: Neue Funktion, um erteilte News zu löschen
					Npc_DeleteNews  ( self,theft_news); 
					return;
				};
			};
			if (Npc_GetPermAttitude	( self, other) == ATT_ANGRY)
			{
				if (B_CompareNpcInstance	( self, theft_news_victim))
				{
					B_Say	( self, other, "$YOUSTOLEFROMME");
					// JP: Neue Funktion, um erteilte News zu löschen
					Npc_DeleteNews  ( self,theft_news); 
					return;
				}
				else
				{
					if ( theft_news_victim.guild == self.guild && Wld_GetGuildAttitude ( self.guild,self.guild) == ATT_FRIENDLY)
					{
						B_Say	( self, other, "$YOUSTOLEFROMUS");
						// JP: Neue Funktion, um erteilte News zu löschen
						Npc_DeleteNews  ( self,theft_news); 
						return;
					};
				};
			};
		};
		Npc_DeleteNews  ( self,theft_news); 
	};
};

						

