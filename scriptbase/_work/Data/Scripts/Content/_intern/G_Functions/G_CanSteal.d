/************************************************************************* 
 * 							 G_CanSteal
 *************************************************************************
 * PRCONDITIONS: self 	:	Burgler	
 *				 other	:	Victim
 *************************************************************************/
func int G_CanSteal()
{
	if	( ( other.npcType != NPCTYPE_FRIEND ) && ( other.npcType != NPCTYPE_MAIN ) )
	{
		return TRUE;
	}
	else
	{
		PrintScreen	(_STR_MESSAGE_CANNOTSTEAL, -1, _YPOS_MESSAGE_CANNOTSTEAL, _STR_FONT_ONSCREEN, _TIME_MESSAGE_CANNOTSTEAL );		
		
		return FALSE;
	};
};
