func void B_CombatReactToDamage ()
{
	PrintDebugNpc		(PD_ZS_FRAME, "B_CombatReactToDamage" );	
	
	PrintGlobals 		(PD_ZS_CHECK);
	
	//-------- friendly NSC wird von Spieler attackiert --------
	if (Npc_IsPlayer(other) && ((self.npctype == NPCTYPE_FRIEND)||(Npc_GetPermAttitude(self,other)==ATT_FRIENDLY)))
	{
		return;
	};

	//-------- Merken ob Schaden durch Fernkampfwaffe/Magie verursacht wurde --------
	if (Npc_IsInFightMode(other,FMODE_FAR) || Npc_IsInFightMode(other,FMODE_MAGIC))
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = TRUE;
	}
	else
	{
		self.aivar[AIV_LASTHITBYRANGEDWEAPON] = FALSE;
	};

	//-------- ! --------
	if ( Npc_IsPlayer( other ) )
	{
		Npc_SetTempAttitude	(self,	ATT_HOSTILE);

		if ( (Npc_GetAttitude( self, other ) == ATT_HOSTILE) || (Npc_GetAttitude( self, other ) == ATT_ANGRY) )
		{
			Npc_SetTarget	(self,	other);
		/*
		}
		// JP: Ich mach das mal raus, weil der Nsc sich nur aus zwei Gründen im Kampf befinden kann, erstens wenn er Hostile ist oder den Kampf sonst wie beginnt und somit nicht 
		// angefangen hat, oder wenn er Angegriffen wurde und über ZS_ReactToDamage  (NewsEintrag) im ZS_Attack ist
		// JP: Außerdem kommen Attack_News raus
		else
		{
			B_AssessAndMemorize( NEWS_ATTACK, NEWS_SOURCE_WITNESS, self, other, self );
		*/	
		};
	};

	//-------- spezielle Reaktionen im Kampf --------
	if (self.aivar[AIV_SPECIALCOMBATDAMAGEREACTION])
	{
		B_SpecialCombatDamageReaction();
	};
};
