//////////////////////////////////////////////////////////////////////////
//	B_SetGuildAttitude
//	==================
//	Setzt die Gilden-Attitüde von 'fromGuild' gegenüber 'toGuild' auf den
//	Wert 'attitude'. Menschen und Orks können mit der Sammelbezeichnung
//	GIL_SEPERATOR_HUM bzw. GIL_SEPERATOR_ORC angegeben werden
//////////////////////////////////////////////////////////////////////////
func void B_SetGuildAttitude (var int fromGuild, var int attitude, var int toGuild)
{
	if		(toGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_NONE	);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_EBR		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_SLD		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_STT		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_KDF		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_VLK		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_KDW		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_GRD		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_ORG		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_BAU		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_SFB		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_GUR		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_NOV		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_TPL		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_DMB		);
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	GIL_BAB		);
	}
	else if	(fromGuild == GIL_SEPERATOR_HUM)
	{
		Wld_SetGuildAttitude	(GIL_NONE		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_EBR		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_SLD		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_STT		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_KDF		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_VLK		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_KDW		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_GRD		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_ORG		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_BAU		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_SFB		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_GUR		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_NOV		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_TPL		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_DMB		,	attitude,	toGuild		);
		Wld_SetGuildAttitude	(GIL_BAB		,	attitude,	toGuild		);
	}
	else
	{
		Wld_SetGuildAttitude	(fromGuild		,	attitude,	toGuild		);
	};
};
 
