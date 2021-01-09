func void B_Story_FoundUrShak()
{
	//-------- Missionsgegenst�nde --------
	

	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH4_FindOrcShaman,	"Ich habe den Ork-Schamanen mit Namen Ur-Shak vor der Wut seiner eigenen Stammesbr�der gerettet. Zum Dank daf�r erz�hlte er mir den restlichen Teil der Schl�fer-Geschichte. Nun kann ich zu Xardas zur�ckkehren, um meinen Auftrag zu erf�llen.");

	Log_CreateTopic		(CH4_UluMulu,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_UluMulu,		LOG_RUNNING);
	B_LogEntry			(CH4_UluMulu,		"Ur-Shak, der verbannte Schamane verriet mir den einzigen Weg, in den unterirdischen Schl�fertempel unter der Ork-Stadt zu gelangen, ohne gegen alle Orks k�mpfen zu m�ssen. Ich brauche ein ULU-MULU, eine Art heilige Ork-Standarte, die von allen Orks als Symbol respektiert wird. Ein Freund von Ur-Shak, der in einer Mine der Meschen gefangen gehalten wird, kann mir eine solche Standarte herstellen."); 

	//-------- Erfahrung --------
	B_GiveXP			(XP_FoundOrcShaman);

	//-------- Tagesabl�ufe �ndern --------
	var C_NPC riordian;	riordian= Hlp_GetNpc(KDW_605_Riordian);	Npc_ExchangeRoutine(riordian,	"FoundUrShak");	
	
	
	//-------- globale Variable setzen --------
	UrShak_SpokeOfUluMulu = TRUE;
};