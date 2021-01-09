/****************************************************
*               personalisierter TA                 *
*   Y�Berion sucht PREACH-FP: beginnt Ansprache     *
*   �bernahme in Predigt-Sizuation von Y�Berion?    *
****************************************************/


func void ZS_Preach_YBerion ()  //### Freepoint in der Welt fehlt noch
{	
    PrintDebugNpc(PD_TA_FRAME,"ZS_Preach_YBerion");
    
	B_SetPerception (self);    
	AI_SetWalkmode (self,NPC_WALK);		// Walkmode f�r den Zustand 
	if !(Npc_IsOnFP(self,"PREACH"))
	{
		AI_GotoWP(self, self.wp);               // Gehe zum Tagesablaufstart
	};
	if (Wld_IsFPAvailable (self, "PREACH"))
	{
		AI_GotoFP (self,"PREACH");         
	};
	AI_AlignToFP( self );				//Richte Dich aus
  
};

func void ZS_Preach_YBerion_Loop ()
{
	PrintDebugNpc(PD_TA_LOOP,"ZS_Preach_YBerion_Loop");
		
	var int preachtime;
	preachtime = Hlp_Random (100);
	if (preachtime <= 3)
	{
		AI_Output(self, NULL,"ZS_Preach_YBerion01");	//Der Schl�fer hat zu mir gesprochen.
	} 
	else if (preachtime >= 98)
	{
		AI_Output(self, NULL,"ZS_Preach_YBerion02");	//Der Schl�fer wird uns alle befreien.
	}
	else if (preachtime >= 95)
	{
		AI_Output(self, NULL,"ZS_Preach_YBerion03");	//Der Schl�fer erwache!
	};
	AI_Wait(self,1);
};

func void ZS_Preach_YBerion_End ()
{
    PrintDebugNpc(PD_TA_FRAME,"ZS_Preach_YBerion_End");
};

