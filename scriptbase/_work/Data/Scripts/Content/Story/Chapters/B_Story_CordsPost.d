//#####################################################################
//##
//##							KAPITEL 4
//##							=========
//##	Gorn, Cord und 2 Söldner beziehen zwischen NC und FM
//##	einen provisorischen Wachposten						
//##
//#####################################################################
func void B_Story_CordsPost()
{
	//-------- neue Tagesabläufe --------
	var C_NPC gorn; gorn = Hlp_GetNpc(PC_FIGHTER);	Npc_ExchangeRoutine(gorn, "GuardNC");	// könnte 'self' sein, also kein B_ExchangeRoutine()
	B_ExchangeRoutine	(Sld_709_Cord,		"FMTaken");
	B_ExchangeRoutine	(Sld_735_Soeldner,	"FMTaken");
	B_ExchangeRoutine	(Sld_736_Soeldner,	"FMTaken");
};