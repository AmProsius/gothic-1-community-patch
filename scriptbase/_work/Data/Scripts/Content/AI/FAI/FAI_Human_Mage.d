// ****************************
// Nahkampf - AI Human Mage (25)
// ****************************

/*
CONST INT	MOVE_RUN			=	 1;	// Gegner in meinem Fokus + steht wer dazwischen? (G)
CONST INT	MOVE_RUNBACK		=	 2; // Gegner in meinem Fokus
CONST INT	MOVE_JUMPBACK		=	 3;	// l�st t_ParadeJumpB aus (Attacke wird nur pariert, wenn man schnell genug aus der W-Reichweite kommt!
CONST INT	MOVE_TURN			= 	 4;	// Immer bis Gegner im Fokus (also nie durch neue Aktion unterbrochen, h�chstens durch Gegner-Attacke)
CONST INT	MOVE_STRAFE			=	 5; // (Richtung wird vom Programm entschieden)

CONST INT 	MOVE_ATTACK			=	 6;	// in ComboZone = Combo / im Rennen = Sturmattacke?
const INT 	MOVE_SIDEATTACK		=	 7;
CONST INT 	MOVE_FRONTATTACK	=	 8;
CONST INT 	MOVE_TRIPLEATTACK	=	 9;
CONST INT 	MOVE_WHIRLATTACK	=	10;
CONST INT 	MOVE_MASTERATTACK	=	11;

CONST INT	MOVE_PARADE			=	17;	// (keine Attacke = oben)
CONST INT	MOVE_STANDUP		=	18;
CONST INT 	MOVE_WAIT			=	19; // 200 ms
*/


// W  - Waffen-Reichweite (FIGHT_RANGE_FIST * 3)
// G  - Gehen-Reichweite (3 * W). Puffer f�r Fernk�mpfer in dem sie zur NK-Waffe wechseln sollten
// FK - Fernkampf-Reichweite (30m)



//////////////////////////////////////////////////
// Meine Reaktionen auf Gegner-Aktionen:
//////////////////////////////////////////////////

// Gegner attackiert mich
INSTANCE FA_ENEMY_PREHIT_25 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
	move[1] = MOVE_PARADE;
	move[2] = MOVE_JUMPBACK;
};

// Gegner macht Sturmattacke
INSTANCE FA_ENEMY_STORMPREHIT_25 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
	move[1] = MOVE_PARADE;
	move[2] = MOVE_JUMPBACK;
};


//////////////////////////////////////////////////
// Meine Aktionen wenn Gegner in Waffenreichweite:
//////////////////////////////////////////////////

// was tun, wenn ich im Combofenster einer Attacke bin?
INSTANCE FA_MY_W_COMBO_25 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_FRONTATTACK;
};


// was tun, wenn ich gerade auf den Gegner zurenne?
INSTANCE FA_MY_W_RUNTO_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

// was tun, wenn ich gerade Strafe?
INSTANCE FA_MY_W_STRAFE_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_W_FOCUS_25 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_STRAFE;
};

// was tun, wenn ich den Gegner nicht im Focus habe?
INSTANCE FA_MY_W_NOFOCUS_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
};


////////////////////////////////////////////////////////////
// Meine Aktionen wenn Gegner Waffenreichweite * 3 entfernt:
////////////////////////////////////////////////////////////

INSTANCE FA_MY_G_COMBO_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

// was tun, wenn ich gerade auf den Gegner zurenne?
INSTANCE FA_MY_G_RUNTO_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;
};

// was tun, wenn ich gerade Strafe?
INSTANCE FA_MY_G_STRAFE_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_G_FOCUS_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
};


////////////////////////////////////
// Gegner weiter als Waffenreichweite * 3 entfernt
////////////////////////////////////

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_FK_FOCUS_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

// was tun, wenn ich den Gegner nicht im Focus habe? (gilt auch f�r G-Distanz!)
INSTANCE FA_MY_G_FK_NOFOCUS_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
};



// SN 08.10.00: Die neuen Instanzen wenn Gegner in Fernkampfreichweite und der NSC im Fernkampfmodus ist
INSTANCE FA_MY_FK_FOCUS_FAR_25 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_WAIT;	
};

INSTANCE FA_MY_FK_NOFOCUS_FAR_25 (C_FightAI)
{
	move[0] = MOVE_TURN;
};
