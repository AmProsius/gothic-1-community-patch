func void B_Story_GotUluMulu()
{
	//-------- Missionsgegenstände --------
	CreateInvItem		(hero, UluMulu);
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_UluMulu,	"Es ist vollbracht. Tarrok hat von mir alle vier Bestandteile erhalten und baute mir daraus ein Ulu-Mulu. Ich will hoffen, dass es von den Orks in der Stadt über dem Schläfer-Tempel auch wirklich respektiert wird.");
	Log_SetTopicStatus	(CH4_UluMulu,	LOG_SUCCESS);
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_GotUluMulu);

	//-------- globale Variable setzen --------
	FreemineOrc_LookingUlumulu = LOG_SUCCESS;
};