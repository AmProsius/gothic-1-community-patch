func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas was quite surprised that I had managed to get into the underground temple. Looks like he thinks I'm the icon from an old Orcish prophecy.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardas identified the strange sword I found in the Sleeper's temple as URIZIEL. This ancient blade supposedly had immense powers before, but in the course of the years it's lost its magic energy. I need to find a way to restore the weapon to its old powers.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
