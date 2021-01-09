/*****************************************************
*      NSC sucht SPEECH-FP und stelt sich hin        *
*****************************************************/

//### Gesten fehlen noch

func void ZS_Speech()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Speech");
    
	B_SetPerception (self);
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode für den Zustand
	if !(Npc_IsOnFP(self,"SPEECH"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "SPEECH"))
	{
		AI_GotoFP (self,"SPEECH"); 
		        
	};
	AI_AlignToFP( self );				//Richte Dich aus

};

func void ZS_Speech_Loop()
{
    PrintDebugNpc(PD_TA_LOOP,"ZS_Speech_Loop");   
    AI_Wait(self,1);
	//AI_AlignToFP(self);	
};

func void ZS_Speech_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Speech_End");
};
	
