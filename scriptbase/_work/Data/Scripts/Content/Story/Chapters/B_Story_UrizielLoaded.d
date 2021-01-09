func void B_Story_UrizielLoaded()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,"It's been accomplished. URIZIEL seems to have been restored to its old powers. Saturas and his Magicians of Water are really fed up with me, and I'd rather not meet them at the moment. But that doesn't matter, the Sleeper is awaiting me!");
	
	if (Npc_GetTrueGuild(hero) != GIL_KDW)
	{
		Log_SetTopicStatus(CH5_Uriziel,	LOG_SUCCESS);
	}
	else
	{
		B_LogEntry		(CH5_Uriziel,"During my last visit, Xardas mentioned that there might be a way for me to use URIZIEL's powers, even as a magician, but he wanted to have a look at the charged sword. I should visit him.");
	};
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_LoadedUriziel);

	//-------- Wassermagier sauer machen --------
	B_SetPermAttitude	(Kdw_600_Saturas,	ATT_HOSTILE);	
	B_SetPermAttitude	(Kdw_601_Myxir, 	ATT_HOSTILE);
	B_SetPermAttitude	(Kdw_602_Merdarion,	ATT_HOSTILE);
	B_SetPermAttitude	(Kdw_603_Nefarius, 	ATT_HOSTILE);
	B_SetPermAttitude	(Kdw_604_Cronos, 	ATT_HOSTILE);
	B_SetPermAttitude	(Kdw_605_Riordian, 	ATT_HOSTILE);
	
	B_ClearImmortal		(Kdw_600_Saturas	);	
	B_ClearImmortal		(Kdw_601_Myxir		); 	
	B_ClearImmortal		(Kdw_602_Merdarion	); 	
	B_ClearImmortal		(Kdw_603_Nefarius	); 	
	B_ClearImmortal		(Kdw_604_Cronos		); 	
	B_ClearImmortal		(Kdw_605_Riordian	); 	
	
	B_SetNpcType		(Kdw_600_Saturas,	NPCTYPE_MAIN);	
	B_SetNpcType		(Kdw_601_Myxir, 	NPCTYPE_MAIN);
	B_SetNpcType		(Kdw_602_Merdarion,	NPCTYPE_MAIN);
	B_SetNpcType		(Kdw_603_Nefarius, 	NPCTYPE_MAIN);
	B_SetNpcType		(Kdw_604_Cronos, 	NPCTYPE_MAIN);
	B_SetNpcType		(Kdw_605_Riordian, 	NPCTYPE_MAIN);
};
