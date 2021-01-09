// *************************************************************************************
// 										KONSTANTEN
// *************************************************************************************

const int AIV_MM_PercRange 			= 1;
const int AIV_MM_DrohRange 			= 2;
const int AIV_MM_AttackRange 		= 3;
const int AIV_MM_DrohTime 			= 4;
const int AIV_MM_FollowTime 		= 5;
const int AIV_MM_FollowInWater 		= 6;
// ----------------------------------------
const int AIV_MM_Behaviour 			= 7;
const int 	PASSIVE 			= 0;
const int 	HUNTER 				= 1;
const int 	PACKHUNTER 			= 2;
// ----------------------------------------
const int AIV_MM_TEMP_PRIO 			= 8;
const int 	PRIO_PREY 			= 0;
const int 	PRIO_ATTACKER 		= 1;
// ----------------------------------------
const int AIV_MM_SleepStart 		= 9;
const int AIV_MM_SleepEnd 			= 10;
const int AIV_MM_RestStart 			= 11;
const int AIV_MM_RestEnd 			= 12;		
const int AIV_MM_RoamStart 			= 13;
const int AIV_MM_RoamEnd 			= 14;
const int AIV_MM_EatGroundStart 	= 15;
const int AIV_MM_EatGroundEnd 		= 16;
const int AIV_MM_WuselStart 		= 17;
const int AIV_MM_WuselEnd 			= 18;
const int 	OnlyRoutine 		= -1;
// ----------------------------------------
const int AIV_MM_ShrinkState 		= 19;			// merkt sich das Schrumpf-Stadium des Monsters, wenn es von einem Shrink-Zauber getroffen wird
const int AIV_MM_DistToMaster		= 20;			// die Distanz, die vom SC beschwörte Monster versuchen, zu ihrem Meister einzuhalten 
const int AIV_MM_TimeLooseHP		= 21;			// Zeit in Sekunden, die das vom SC beschwörte Monster aushält, bevor es einen Lebenspunkt verliert 
// ----------------------------------------
const int AIV_MM_REAL_ID			= 22;
const int	ID_NONE				= 0;
const int	ID_WOLF				= 1;
const int	ID_BLACKWOLF		= 2;
const int	ID_SNAPPER			= 3;
const int	ID_ORCBITER			= 4;
const int	ID_SHADOWBEAST		= 5;
const int	ID_BLOODHOUND		= 6;
const int	ID_TROLL			= 7;
const int	ID_WARAN			= 8;
const int	ID_FIREWARAN		= 9;
const int	ID_RAZOR			= 10;
const int	ID_LURKER			= 11;
const int	ID_SWAMPSHARK		= 12;
const int	ID_MINECRAWLER		= 13;
const int	ID_MINECRAWLERWARRIOR= 14;
const int	ID_BLOODFLY			= 15;
const int	ID_BLACKGOBBO		= 16;
const int	ID_GOBBO			= 17;
const int	ID_SCAVENGER		= 18;
const int	ID_SKELETON			= 19;
const int	ID_SKELETONWARRIOR	= 20;
const int	ID_SKELETONSCOUT	= 21;
const int	ID_SKELETONMAGE		= 22;
const int	ID_DEMON			= 23;
const int	ID_DEMONLORD		= 24;
const int	ID_MINECRAWLERQUEEN	= 25;
const int	ID_MOLERAT 			= 26;
const int	ID_UNDEADORCWARRIOR	= 27;
const int	ID_UNDEADORCSHAMAN	= 28;
const int	ID_HARPIE			= 29;
const int	ID_SLEEPER			= 30;
const int	ID_STONEGOLEM		= 31;
const int	ID_FIREGOLEM		= 32;
const int	ID_ICEGOLEM			= 33;
const int	ID_MEATBUG			= 34;
const int	ID_ZOMBIE			= 35;
// ----------------------------------------
const int AIV_MM_PARTYMEMBER		= 23;	// SN:  (begleitet den Spieler - für XP-Vergabe)
const int AIV_MM_DEATHINVGIVEN		= 24;	// SN:  da ZS_Dead auch nach jedem Load Game ausgeführt wird!









// IDs für Sezial-Monster
const int MID_CANYONTROLL 		= 5000;
const int MID_THEKEEPER 		= 5001;
const int MID_DAMLURKER 		= 5002;
const int MID_YOUNGTROLL		= 5003;
	