const int NEWS_SOURCE_WITNESS	= 0;
const int NEWS_SOURCE_GOSSIP	= 1;

// Je höher	die	ID,	desto wichtiger	ist	die	News ( Priorisierung ! )
const int NEWS_MURDER		= 200;
const int NEWS_ATTACK		= 195;
const int NEWS_THEFT		= 190;
const int NEWS_DEFEAT		= 185;
const int NEWS_NERVE		= 180;
const int NEWS_INTERFERE	= 175;
const int NEWS_HASDEFEATED	= 170;

FUNC VOID B_AssessAndMemorize(VAR INT newsid, VAR INT source, var C_NPC witness, var C_NPC offender, var C_NPC vict)
// -> Einspeisen der News ins Gedächtnis
// -> Reaktion auf News	( Attitüdenänderung	)
// Für alle	Zeugen und News-Adressaten
// Geht	davon aus, dass	SC erkannt wurde
// *** Parameter ***
// newsid		:	News ID
// source >	0	:	"gossip", ansonsten	"witness"
// witness		:	NSC, bei dem News eingespeist werden soll
// offender		:	Täter
// vict			:	Opfer
{
	PrintDebugNpc( PD_ZS_CHECK,"B_AssessAndMemorize");
	
	//SN: Auf Verdacht ein paar Checks...
	if !C_NpcIsHuman(witness)
	|| !C_NpcIsHuman(vict)
	|| !C_NpcIsHuman(offender)
	{
		PrintDebugNpc	(PD_ZS_CHECK,"...Täter, Zeuge oder Opfer KEIN Mensch!");
		PrintGlobals	(PD_ZS_CHECK);
		return;
	};

	//PrintGlobals(PD_ZS_CHECK);
	//PrintAttitudes();
	var int victimguild; 								// Initialisierung der victimguild Var
	var int offenderTrueguild;								// Initialisierung der offenderTrueguild Var
	var int witnessguild;								// Initialisierung der witnessguild Var
	var int offenderguild;								// Initialisierung der offenderguild Var
	
	victimguild 		= Npc_GetTrueGuild ( vict); 			// Zuweisung der Gilde des Übergebenen Vict 
	offenderTrueGuild 	= Npc_GetTrueGuild ( offender); 		// Zuweisung der Gilde des Übergebenen Offender 
	witnessguild 		= Npc_GetTrueGuild ( witness); 			// Zuweisung der Gilde des Übergebenen witness 
	offenderguild 		= offender.guild;
	//------------------------------------------------------------------------------------------
	if (newsid == NEWS_MURDER)
	{
		PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemMurder");
		Npc_MemoryEntry (witness,source,offender,newsid,vict ); // Und News merken hier sollte eigentlich Gilde als Opfer, es ist aber  
															 //	möglich, in anderen Zuständen als member von C_Npc auf die Gilde 
															 //	des Nsc zuzugreifen
		if (Wld_GetGuildAttitude (witnessguild, victimguild) == ATT_FRIENDLY)
		{
			PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemMurder Knows Player // friendly victim");
			if (Npc_IsPlayer (offender)) 
			{
				PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemMurder Knows Player // friendly victim // Player attacks");
				if (Npc_GetPermAttitude (witness,offender) == ATT_ANGRY)
				{
					PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemMurder Knows Player // friendly victim // Player attacks // Angry to Plyaer");
					Npc_SetPermAttitude (witness, ATT_HOSTILE);
				}
				else if ((Npc_GetPermAttitude (witness,offender) == ATT_FRIENDLY )||(Npc_GetPermAttitude (witness,offender) ==  ATT_NEUTRAL))
				{
					PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemMurder Knows Player // friendly victim // Player attacks // Friend/Neut to Player");
					Npc_SetPermAttitude (witness, ATT_ANGRY);
				};
			};
		};
		
	}
	//-----------------Theft-News--------------------------------------------------------------
	else if (newsid == NEWS_THEFT)
	{
		PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemTheft");
		// Bin ich das Opfer ?
		
		var int ownerguild ;
		ownerguild = item.ownerguild;
		if (!Hlp_IsValidItem	(item)) 		
		{
			if (B_CompareNpcInstance ( witness,vict ))
			{
				PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemTheft Someone stole me something");
				Npc_MemoryEntry (witness, source, offender, newsid, vict);
				if (Npc_GetPermAttitude(witness, offender) != ATT_HOSTILE)
				{
					PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemTheft Someone stole me something and im not hostile");
					if (Npc_IsPlayer(offender))
					{
						PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemTheft Player stole me something");
						Npc_SetTempAttitude (witness, ATT_HOSTILE);
						Npc_SetAttitude(witness, ATT_ANGRY);
						if (C_NpcIsWorker(self) && C_AmIWeaker(self,offender))
						{
							AI_StartState	(self, ZS_CallGuards, 0, "");
						};
					};
				};
			};
		}
		else 
		{
			PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemTheft Someone stole another something");
			if (((Wld_GetGuildAttitude(witnessguild, ownerguild) == ATT_FRIENDLY) ||( witnessguild == ownerguild)) && (ownerguild != offenderguild))
			{
				PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemTheft Someone(wrong guild) stole another (friend or my guild) something");
				if (Npc_IsPlayer (offender))
				{
					Npc_MemoryEntry (witness, source, offender, newsid, vict);
					Npc_SetTempAttitude (witness, ATT_HOSTILE);
					if (C_NpcIsWorker(self) && C_AmIWeaker(self,offender))
					{
						AI_StartState	(self, ZS_CallGuards, 0, "");
					};
				};
			};
		};
	}
	
	//----------------------------------------------------------------------------------------------
	else if (newsid == NEWS_DEFEAT)
	{
		PrintDebugNpc( PD_ZS_CHECK,"...NEWS_DEFEAT");
		// Jp: alte abfrage raus, weil sie doppelt war
		//if (Npc_IsPlayer	( offender) || Npc_IsPlayer	( vict))
		
		Npc_MemoryEntry (witness,source,offender,newsid,vict);
		if (Npc_IsPlayer (offender) )
		{
			PrintDebugNpc( PD_ZS_CHECK,"...Sieger ist SC!");
			//PrintGlobals	(PD_ZS_CHECK);
			if ((Wld_GetGuildAttitude (witnessguild,victimguild)==ATT_FRIENDLY) && (!B_CompareNpcInstance ( witness,vict)))
			{
				PrintDebugNpc( PD_ZS_CHECK,"...NSC ist in befreundeter Gilde zum Besiegten!");
				//PrintGlobals	(PD_ZS_CHECK);
				if (Npc_GetTempAttitude (witness,offender) == ATT_ANGRY && (!(C_NpcIsWorker	( self))))
				{
					PrintDebugNpc( PD_ZS_CHECK,"...permANGRY zum Sieger und weder Buddler, noch Novize, noch Bauer!");
					Npc_SetTempAttitude (witness,ATT_HOSTILE);
				}
				else if (Npc_GetTempAttitude (witness,offender) == ATT_ANGRY && (C_NpcIsWorker	( self))) 
				{
					PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemDefeat Player (Angry) is offender victim is my guild or friendly but I,m unimportant guild");
					// Hier evtl noch einen Aufruf hin, der den ZS_AlarmAll startet
					// vielleicht auch flee
				}
				else if (Npc_GetTempAttitude (witness,offender) == ATT_NEUTRAL || Npc_GetPermAttitude (witness,offender) ==ATT_FRIENDLY)
				{
					PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemDefeat Player(neutral/friendly is offender victim is my guild or friendly");
					Npc_SetTempAttitude (witness,ATT_ANGRY);
				};
			}
			else if (B_CompareNpcInstance ( witness,vict))
			{
				PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me");
				if ((C_NpcIsWorker	( self)) )
				{
					PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me (weak guild)");
					Npc_SetTempAttitude (witness,ATT_ANGRY);
				}
				else if (witnessguild == GIL_KDF ||witnessguild ==  GIL_KDW)
				{
					PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me ( mage guild)");
					Npc_SetTempAttitude (witness, ATT_HOSTILE);
				}
				else 
				{
					PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me ( other guild)");
					if (Npc_GetTempAttitude (witness, offender) != ATT_HOSTILE )
					{
						PrintDebugNpc( PD_ZS_CHECK,"...AssessAndMemDefeat Player is offender victim is me ( other guild// not hostile)");
						Npc_SetTempAttitude (witness,ATT_ANGRY);
					};
				};
			};
		}
		// JP: kein defeat mehr als Wiedergutmachung, aber wenn nur Temp Hostile wird die runtergesetzt, da man sonst nach dem Aufwachen direkt wieder niedergeknüppelt wird
		
		else if (Npc_IsPlayer	( vict))
		{
			if ( Npc_GetTempAttitude	( witness, vict) == ATT_HOSTILE)
			{
				if (Npc_GetPermAttitude	( witness, vict) == ATT_HOSTILE)
				{
				};
				if (Npc_GetPermAttitude	( witness, vict) == ATT_ANGRY)
				{
					Npc_SetTempAttitude	(self, ATT_ANGRY);
				};
				if (Npc_GetPermAttitude	( witness, vict) == ATT_NEUTRAL)
				{
					Npc_SetTempAttitude	(self, ATT_NEUTRAL);
				};
				if (Npc_GetPermAttitude	( witness, vict) == ATT_FRIENDLY)
				{
					Npc_SetTempAttitude	(self, ATT_FRIENDLY);
				};
			};
		};
	};
};