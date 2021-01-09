/****************************************************
*               personalisierter TA                 *
*   Y´Berion liegt nach großer Beschwörung 		    *
*   am Boden 										*
****************************************************/
func void ZS_Drained_YBerion () 
{
    PrintDebugNpc	(PD_TA_FRAME,	"ZS_Drained_YBerion");
	
	AI_PlayAniBS 	(self,	"T_STAND_2_VICTIM_SLE",	BS_LIE);
};

func void ZS_Drained_YBerion_Loop ()
{
	PrintDebugNpc	(PD_TA_LOOP,	"ZS_Drained_YBerion_Loop");
		
	AI_Wait			(self,	1);
};

func void ZS_Drained_YBerion_End ()
{
    PrintDebugNpc	(PD_TA_FRAME,	"ZS_Drained_YBerion_End");
};


		
		
		
		
		
		
		