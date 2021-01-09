/************************************************************************* 
 * 							 G_PrintScreen
 *************************************************************************
 * PRCONDITIONS: 	NONE
 *************************************************************************/
func void G_PrintScreen( var string strMessage  )
{
	//
	//	PRINT TO SCREEN
	//
	PrintScreen		(strMessage, -1, 10, _STR_FONT_ONSCREEN, 3 );		
//	PrintDialog		(strMessage, -1, 10, _STR_FONT_ONSCREEN, 3 );		
	
	//
	//	PRINT DEBUG MESSAGE
	//
//	PrintDebugNpc	(PD_ZS_DETAIL, strMessage);				[ROMAN: FUEHRT DERZEIT MANCHMAL ZUM CRASH ZB. WG. NULL-STRING VERGLEICH] 
};
