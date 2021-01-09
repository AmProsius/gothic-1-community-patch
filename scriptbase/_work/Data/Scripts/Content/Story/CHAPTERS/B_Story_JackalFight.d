//#####################################################################
//##
//##							KAPITEL 4
//##							=========
//##	Jackal und die beiden anderen Gardisten vor der Freien
//##	Mine greifen den Spieler jetzt an. 						
//##
//#####################################################################
func void B_Story_JackalFight()
{
	//-------- Tagesabläufe austauschen --------
	B_ExchangeRoutine	(Grd_283_Gardist,	"FMTaken2");	//FMC-Guard(Mineneingang)			
	B_ExchangeRoutine	(Grd_285_Gardist,	"FMTaken2");	//FMC-Guard(Mineneingang)	
	var C_NPC jackal;
	jackal = Hlp_GetNpc(Grd_201_Jackal);
	Npc_ExchangeRoutine	(jackal,			"FMTaken2");	//wird aus dem Jackal-Dialog heraus aufgerufen!

	//-------- Gardisten-Eroberer auf feindlich setzen --------
	B_SetPermAttitude	(Grd_283_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(Grd_285_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(Grd_201_Jackal,	ATT_HOSTILE);
};