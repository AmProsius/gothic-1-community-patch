// *******************************
// Kampf AI Klasse und Konstanten
// *******************************

// Reaktionen von NSCs können sein :
CONST INT	MOVE_RUN		=	 1;	// Gegner in meinem Fokus + steht wer dazwischen? (G)
CONST INT	MOVE_RUNBACK		=	 2; 	// Gegner in meinem Fokus
CONST INT	MOVE_JUMPBACK		=	 3;
CONST INT	MOVE_TURN		= 	 4;	// Immer bis Gegner im Fokus (also nie durch neue Aktion unterbrochen, höchstens durch Gegner-Attacke)
CONST INT	MOVE_STRAFE		=	 5; 	// (Richtung wird vom Programm entschieden)
CONST INT 	MOVE_ATTACK		=	 6;	// in ComboZone = Combo / im Rennen = Sturmattacke?
const INT 	MOVE_SIDEATTACK		=	 7;
CONST INT 	MOVE_FRONTATTACK	=	 8;
CONST INT 	MOVE_TRIPLEATTACK	=	 9;
CONST INT 	MOVE_WHIRLATTACK	=	10;
CONST INT 	MOVE_MASTERATTACK	=	11;
CONST INT 	MOVE_TURNTOHIT		=	15;	// Version > 0.92 => No Effect 
CONST INT	MOVE_PARADE		=	17;	// (keine Attacke = oben)
CONST INT	MOVE_STANDUP		=	18;
CONST INT 	MOVE_WAIT		=	19;

CONST INT	MAX_MOVE		=	 6;

CONST INT 	MAX_FIGHTAI		=       30;	// Anzahl vorhandener Fight-AIs

CLASS C_FightAI 
{
	VAR INT move[MAX_MOVE];
};

