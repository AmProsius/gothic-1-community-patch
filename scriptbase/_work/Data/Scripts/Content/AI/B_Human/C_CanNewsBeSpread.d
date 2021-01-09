func int C_CanNewsBeSpread ()
/*
B_SpreadNews <Erzähler-NSC> <InfoQuelle> <Täter-SC> <Ereignis ID> <Opfer> 
Für jeden NSC jeder Gilde, die zur Gilde des <Erzähler-NSCs> befreundet ist
	Wenn NSC =|= Erzähler-NSC, dann 	UND NICHT WITNESS!!!
B_AssessAndMemorize <NSC> <GOSSIP> <Täter-SC> <Ereignis ID> <Opfer/Besitzer> 
*/
{
	PrintDebugNpc 	(PD_ZS_CHECK, "C_CanNewsBeSpread");
	/*var int murder_news	;
	murder_news 		=	Npc_HasNews	( self, NEWS_MURDER, NULL, victim);
	
	var C_NPC	murder_news_witness;
	var C_NPC	murder_news_offender;
	var C_NPC	murder_news_victim;
		
	murder_news_witness			=	Npc_GetNewsWitness	( self, murder_news);
	murder_news_offender		=	Npc_GetNewsOffender	( self, murder_news);
	murder_news_victim			=	Npc_GetNewsVictim	( self, murder_news);
			
	var int theft_news;	
	theft_news			=	Npc_HasNews	( self, NEWS_THEFT , NULL, victim);
	
			
	var int defeat_news;
	defeat_news			=	Npc_HasNews	( self, NEWS_DEFEAT , NULL, victim);
	
	var C_NPC	defeat_news_witness;
	var C_NPC	defeat_news_offender;
	var C_NPC	defeat_news_victim;
		
	defeat_news_witness			=	Npc_GetNewsWitness	( self, defeat_news);
	defeat_news_offender		=	Npc_GetNewsOffender	( self, defeat_news);
	defeat_news_victim			=	Npc_GetNewsVictim	( self, defeat_news);
	
	PrintDebugNpc 	(PD_ZS_CHECK, self.name);
	PrintGlobals	(PD_ZS_CHECK);
	
	if (murder_news	> 0)
	{
		PrintDebugNpc 	(PD_ZS_CHECK, "...Murder News");
		if (defeat_news > 0)
		{
			PrintDebugNpc 	(PD_ZS_CHECK, "...Murder News + Defeat news");
			if (B_CompareNpcInstance (murder_news_victim,defeat_news_victim))
			{
				PrintDebugNpc 	(PD_ZS_CHECK, "... gleiches Opfer");
				if (B_CompareNpcInstance (murder_news_offender,defeat_news_offender))
				{
					PrintDebugNpc 	(PD_ZS_CHECK, "...und gleicher Täter");
					Npc_DeleteNews	(self,defeat_news);
				};
			};
		};
		
		if (Npc_GetAttitude	( self, victim)	== ATT_FRIENDLY)
		{
			PrintDebugNpc 	(PD_ZS_CHECK, "... friendly to victim");
			return NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_VICTIM;
		};
	};
	if (theft_news > 0)
	{
		PrintDebugNpc 	(PD_ZS_CHECK, "Theft_News");
		var C_NPC	theft_news_witness;
		var C_NPC theft_news_victim;
		
		theft_news_witness		=	Npc_GetNewsWitness	(self,theft_news);
		theft_news_victim			=	Npc_GetNewsVictim	( self, theft_news);
		
		
		if (B_CompareNpcInstance (theft_news_victim, self) )
		{
			PrintDebugNpc 	(PD_ZS_CHECK, "... bin Diebstahlopfer");
			return NEWS_DONT_SPREAD;
		};
		// sollten Zeugen sich das wirklich merken ?
		if (B_CompareNpcInstance (theft_news_witness, self) )
		{
			PrintDebugNpc 	(PD_ZS_CHECK, "... bin Zeuge eines Diebstahls");
			return NEWS_DONT_SPREAD;
		};
		
		
		
		if (theft_news_victim.guild	== 	GIL_EBR || 	theft_news_victim.guild	== 	GIL_GUR ||	theft_news_victim.guild	== 	GIL_KDF ||	theft_news_victim.guild	== 	GIL_KDW )
		{
			PrintDebugNpc 	(PD_ZS_CHECK, "...wichtige Gilde ist beklaut worden");
			return	NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_WITNESS;
		};
	};
	
	if (defeat_news > 0)
	{
		PrintDebugNpc 	(PD_ZS_CHECK, "Defeat_News");
		
		
		
		if (Npc_IsPlayer	( defeat_news_victim))
		{
			PrintDebugNpc 	(PD_ZS_CHECK, "....Player == victim");
			if (B_CompareNpcInstance (defeat_news_offender, self) )
			{
				PrintDebugNpc 	(PD_ZS_CHECK, "...Ich habe Angegriffen");
				return NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_OFFENDER;
			};
		}
		else
		{	
			PrintDebugNpc 	(PD_ZS_CHECK, "...Player ist Sieger");
			if (B_CompareNpcInstance (defeat_news_witness, self))
			{
				PrintDebugNpc 	(PD_ZS_CHECK, "...bin Zeuge des Defeats");
				return	NEWS_SPREAD_NPC_FRIENDLY_TOWARDS_WITNESS;
			};
		};
			
	};
	*/
};	
