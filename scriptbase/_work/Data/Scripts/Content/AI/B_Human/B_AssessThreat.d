//////////////////////////////////////////////////////////////////////////
//	B_AssessThreat
//	==============
//	Wird ausschlieﬂlich angesprungen durch
//
//	- PERC_ASSESSTHREAT		(nur aus ZS_AssessFighter/Wait heraus)
//
//	angesprungen und macht folgendes:
//
//	1.	gibt passenden Kommentar aus
//	2.	war der NSC ANGRY, greift er jetzt an (ZS_AssessEnemy)
//	2.	schaltet weitere PERC_ASSESSTHREAT aus
//////////////////////////////////////////////////////////////////////////
func void B_AssessThreat ()
{
	PrintDebugNpc				(PD_ZS_FRAME,	"B_AssessThreat");		

	if (Npc_CanSeeNpc(self, other))
	{
		PrintDebugNpc			(PD_ZS_CHECK, "...NSC kann Bedrohung sehen!" );

		//-------- von FRIENDLY auf NEUTRAL --------
		if 		(Npc_GetAttitude(self,other) == ATT_FRIENDLY)
		{
			B_SayOverlay		(self,	other,	"$WATCHYOURAIM");
			Npc_SetTempAttitude	(self,	ATT_NEUTRAL);
		}

		//-------- von NEUTRAL auf ANGRY --------
		else if	(Npc_GetAttitude(self,other) == ATT_NEUTRAL)
		{
			B_SayOverlay		(self,	other,	"$WATCHYOURAIMANGRY");
			Npc_SetTempAttitude	(self,	ATT_ANGRY);
		}

		//-------- von ANGRY auf HOSTILE --------
		else if (Npc_GetAttitude(self,other) == ATT_ANGRY)
		{
			Npc_SetTempAttitude	(self,	ATT_HOSTILE);
			AI_StartState		(self,	ZS_AssessEnemy, 0, "");
			return;
		};

		Npc_PercDisable			(self,	PERC_ASSESSTHREAT);		// in jedem Fall Wn ausschalten, da sie MG-artig eintrifft!
	};
};

