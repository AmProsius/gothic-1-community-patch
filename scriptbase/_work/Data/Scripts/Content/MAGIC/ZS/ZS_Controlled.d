// übernommener nsc, den man dann steuert
// zustand wird von programmlogik beendet
// Befehle, die hier stehen werden ignoriert, da der Spieler entweder nur Tastatur- oder Zustandsgesteuert sein kann
// andere NSCs können aber den Zustand des Spielers abfragen

func void ZS_Controlled()
{
	PrintDebugNpc			(PD_ZS_FRAME,	"ZS_Controlled");	
};


func void ZS_Controlled_Loop()
{		
	PrintDebugNpc			(PD_ZS_LOOP, "ZS_Controlled_Loop" );
};


func void ZS_Controlled_End()
{
	PrintDebugNpc			(PD_ZS_FRAME, "ZS_Controlled_End" );

	//-------- zu Boden fallen ! --------
	B_FullStop				(self);
	AI_PlayAni				(self,	"T_PSI_VICTIM");
	AI_Wait					(self,	3.5);
	
	//-------- fallgelassene Waffe aufheben ! --------
	B_RegainDroppedWeapon	(self);		// Check ob Waffe/Rüstung herumliegt ist leider vom Stand vor der Ani T_PSI_VICTIM und könnte veraltet sein!!!
	B_RegainDroppedArmor	(self);		// dito
	
	//-------- Gegner behandeln ! --------
	Npc_SetTarget			(self,	hero);
	Npc_GetTarget			(self);
	AI_StartState			(self,	ZS_AssessEnemy, 1, "");
};
