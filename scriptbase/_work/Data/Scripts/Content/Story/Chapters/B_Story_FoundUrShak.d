func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenstände --------
	

	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_FindOrcShaman,"I saved the Orc shaman called Ur-Shak from his own people. He was so grateful that he told me the remaining part of the Sleeper's story. Now I can return to Xardas to fulfill my quest.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,"Ur-Shak, the banished shaman, told me the only way to get into the Sleeper's underground temple below the Orc town without having to fight all the Orcs. I need an ULU-MULU, a kind of holy standard which is respected as a symbol by all Orcs. A friend of Ur-Shak who's being held in the humans' mine can make me such a standard."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabläufe ändern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};
