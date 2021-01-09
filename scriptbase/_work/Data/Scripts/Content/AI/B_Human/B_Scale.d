func void B_Scale (var C_Npc n)
{
	PrintDebugNpc( PD_ZS_FRAME, "B_Scale" );
	if (n.attribute[ATR_STRENGTH] < 10)
	{
		if (n.attribute[ATR_HITPOINTS_MAX]	< 19)
		{
									// breite / Höhe / tiefe
			Mdl_SetModelScale		(n,0.9, 1, 1);
		}
		else if (n.attribute[ATR_HITPOINTS_MAX] > 18 && n.attribute[ATR_HITPOINTS_MAX] < 26)
		{
			Mdl_SetModelScale		(n, 0.9, 1, 1);
		}
		else if (n.attribute[ATR_HITPOINTS_MAX] >25 )
		{
			Mdl_SetModelScale		(n, 0.9, 1, 1);
		};
	}
	else if (n.attribute[ATR_STRENGTH] >9 && n.attribute[ATR_STRENGTH] <14 )
	{
		if (n.attribute[ATR_HITPOINTS_MAX]	< 19)
		{
									// breite / Höhe / tiefe
			Mdl_SetModelScale		(n,1, 1, 1);
		}
		else if (n.attribute[ATR_HITPOINTS_MAX] > 18 && n.attribute[ATR_HITPOINTS_MAX] < 26)
		{
			Mdl_SetModelScale		(n, 1, 1, 1);
		}
		else if (n.attribute[ATR_HITPOINTS_MAX] >25 )
		{
			Mdl_SetModelScale		(n, 1, 1, 1);
		};
	}
	else if (n.attribute[ATR_STRENGTH] > 12)
	{
		if (n.attribute[ATR_HITPOINTS_MAX]	< 19)
		{
									// breite / Höhe / tiefe
			Mdl_SetModelScale		(n,1.1, 1, 1);
		}
		else if (n.attribute[ATR_HITPOINTS_MAX] > 18 && n.attribute[ATR_HITPOINTS_MAX] < 26)
		{
			Mdl_SetModelScale		(n, 1.1, 1, 1);
		}
		else if (n.attribute[ATR_HITPOINTS_MAX] >25 )
		{
			Mdl_SetModelScale		(n, 1.1, 1, 1);
		};
	};
};