func int B_SetDayTolerance()
{
	if (Wld_IsTime	(22,00,23,59))
	{
		return Wld_GetDay()+1;
	}
	else
	{
		return Wld_GetDay();
	};
};