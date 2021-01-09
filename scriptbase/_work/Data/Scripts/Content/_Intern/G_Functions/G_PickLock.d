/************************************************************************* 
 * 							 G_PickLock
 *************************************************************************
 * PRCONDITIONS: 	self	: Player
 *************************************************************************/
func void G_PickLock( var int bSuccess, var int bBrokenOpen  )
{
	var string	strSoundFX;
	var string	strMessage;
	var int		strYPos;
	
	strSoundFX = _STR_INVALID;
	strMessage = _STR_INVALID;
	
	if ( bSuccess)
	{
		if ( bBrokenOpen )
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_UNLOCK;
			strMessage	= _STR_MESSAGE_PICKLOCK_UNLOCK;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_UNLOCK;
		}
		else
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_SUCCESS;
			strMessage	= _STR_MESSAGE_PICKLOCK_SUCCESS;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_SUCCESS;
		};
	}
	else
	{
		if ( bBrokenOpen )
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_BROKEN;
			strMessage	= _STR_MESSAGE_PICKLOCK_BROKEN;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_BROKEN;
		}
		else
		{
			strSoundFX	= _STR_SOUND_PICKLOCK_FAILURE;
			strMessage	= _STR_MESSAGE_PICKLOCK_FAILURE;
			strYPos		= _YPOS_MESSAGE_PICKLOCK_FAILURE;
		};
	};
	
	//
	//	PLAY APPROPRIATE SOUND
	//
	Snd_Play3d( self, strSoundFX );
	
	//
	//	PRINT THE MESSAGE
	//
	PrintScreen	(strMessage, -1, strYPos, _STR_FONT_ONSCREEN, _TIME_MESSAGE_PICKLOCK );		
};
