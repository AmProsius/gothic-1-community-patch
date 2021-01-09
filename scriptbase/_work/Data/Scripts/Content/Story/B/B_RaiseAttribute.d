func void B_RaiseAttribute (var int attribute,	var int value)
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_RaiseAttribute");

	//-------- Anhebung --------
	Npc_ChangeAttribute	(self,	attribute,	value);
		
	//-------- Bildschirmausgabe --------
	var string msg;
	
	if		(attribute == ATR_STRENGTH)			{	msg = ConcatStrings(NAME_RaiseStrength	, IntToString(value));	}
	else if	(attribute == ATR_DEXTERITY)		{	msg = ConcatStrings(NAME_RaiseDexterity , IntToString(value));	}
	else if	(attribute == ATR_MANA_MAX)			{	msg = ConcatStrings(NAME_RaiseManaMax	, IntToString(value));	}
	else if	(attribute == ATR_HITPOINTS_MAX)	{	msg = ConcatStrings(NAME_RaiseHealthMax , IntToString(value));	};

	PrintScreen	(msg, -1,-1,"FONT_OLD_20_WHITE.TGA",_TIME_MESSAGE_RAISEATTRIBUTE);
};


