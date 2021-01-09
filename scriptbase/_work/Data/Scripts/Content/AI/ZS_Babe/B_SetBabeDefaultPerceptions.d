func void B_SetBabeDefaultPerceptions()
{
	Npc_PercEnable( self, PERC_ASSESSTALK		 , B_Babe_RefuseTalk   		);
//	Npc_PercEnable( self, PERC_ASSESSPLAYER		 , B_Babe_AssessPlayer		);		

	Npc_PercEnable( self, PERC_ASSESSDAMAGE		 , ZS_Babe_Flee 		  	);		
	Npc_PercEnable( self, PERC_DRAWWEAPON		 , ZS_Babe_Flee        	  	);
//	Npc_PercEnable( self, PERC_ASSESSMAGIC		 , ZS_Babe_Flee 		  	);

//	Npc_PercEnable( self, PERC_ASSESSOTHERSDAMAGE, ZS_Babe_Flee 			);
//	Npc_PercEnable( self, PERC_ASSESSTHREAT		 , ZS_Babe_Flee 			);	
//	Npc_PercEnable( self, PERC_ASSESSWARN		 , ZS_Babe_Flee 		  	);			
		
//	Npc_PercEnable( self, PERC_OBSERVEINTRUDER	 , B_Babe_ObserveIntruder	);		
//	Npc_PercEnable( self, PERC_OBSERVESUSPECT	 , ZS_Babe_Flee     	  	);		
//	Npc_PercEnable( self, PERC_ASSESSSURPRISE	 , ZS_Babe_Flee     		);	
	
};

