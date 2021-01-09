// ****************************
// Nahkampf - AI Bloodfly (24)
// ****************************

/*
CONST INT	MOVE_RUN			=	 1;	// Gegner in meinem Fokus + steht wer dazwischen? (G)
CONST INT	MOVE_JUMPBACK		=	 3;	// löst t_ParadeJumpB aus (Attacke wird nur pariert, wenn man schnell genug aus der W-Reichweite kommt!
CONST INT	MOVE_TURN			= 	 4;	// Immer bis Gegner im Fokus (also nie durch neue Aktion unterbrochen, höchstens durch Gegner-Attacke)
CONST INT	MOVE_STRAFE			=	 5; // (Richtung wird vom Programm entschieden)

CONST INT 	MOVE_ATTACK			=	 6;	// in ComboZone = Combo / im Rennen = Sturmattacke?
CONST INT	MOVE_PARADE			=	17;	// (keine Attacke = oben)

CONST INT 	MOVE_WAIT			=	19; // 200 ms
*/


// W  - Waffen-Reichweite (FIGHT_RANGE_FIST * 3)
// G  - Gehen-Reichweite (3 * W). Puffer für Fernkämpfer in dem sie zur NK-Waffe wechseln sollten
// FK - Fernkampf-Reichweite (30m)



// Test für Extremverhalten STRAFE

//////////////////////////////////////////////////
// Meine Reaktionen auf Gegner-Aktionen:
//////////////////////////////////////////////////

// Gegner attackiert mich
INSTANCE FA_ENEMY_PREHIT_24 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
};

// Gegner macht Sturmattacke
INSTANCE FA_ENEMY_STORMPREHIT_24 (C_FightAI)
{
// FIXME: Wenn Parade angegeben und ich einfach so auf das Monster zurenne, macht es eine ParadeJumpB!
	move[0] = MOVE_STRAFE;
};


//////////////////////////////////////////////////
// Meine Aktionen wenn Gegner in Waffenreichweite:
//////////////////////////////////////////////////

// was tun, wenn ich gerade auf den Gegner zurenne?
INSTANCE FA_MY_W_RUNTO_24 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
};

// was tun, wenn ich gerade Strafe?
INSTANCE FA_MY_W_STRAFE_24 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
};

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_W_FOCUS_24 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_STRAFE;
};

// was tun, wenn ich den Gegner nicht im Focus habe?
INSTANCE FA_MY_W_NOFOCUS_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
};


////////////////////////////////////////////////////////////
// Meine Aktionen wenn Gegner Waffenreichweite * 3 entfernt:
////////////////////////////////////////////////////////////

// was tun, wenn ich gerade auf den Gegner zurenne?
INSTANCE FA_MY_G_RUNTO_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

// was tun, wenn ich gerade Strafe?
INSTANCE FA_MY_G_STRAFE_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_G_FOCUS_24 (C_FightAI)
{
	move[0] = MOVE_RUN;
};


////////////////////////////////////
// Gegner weiter als Waffenreichweite * 3 entfernt
////////////////////////////////////

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_FK_FOCUS_24 (C_FightAI)
{
	move[0] = MOVE_RUN;
};

// was tun, wenn ich den Gegner nicht im Focus habe? (gilt auch für G-Distanz!)
INSTANCE FA_MY_G_FK_NOFOCUS_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
};



/*

//////////////////////////////////////////////////
// Meine Reaktionen auf Gegner-Aktionen:
//////////////////////////////////////////////////

// Gegner attackiert mich
INSTANCE FA_ENEMY_PREHIT_24 (C_FightAI)
{
	move[0] = MOVE_JUMPBACK;
	move[1] = MOVE_STRAFE;
	move[2] = MOVE_WAIT;
};

// Gegner macht Sturmattacke
INSTANCE FA_ENEMY_STORMPREHIT_24 (C_FightAI)
{
// FIXME: Wenn Parade angegeben und ich einfach so auf das Monster zurenne, macht es eine ParadeJumpB!
	move[0] = MOVE_JUMPBACK;
};


//////////////////////////////////////////////////
// Meine Aktionen wenn Gegner in Waffenreichweite:
//////////////////////////////////////////////////

// was tun, wenn ich gerade auf den Gegner zurenne?
INSTANCE FA_MY_W_RUNTO_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

// was tun, wenn ich gerade Strafe?
INSTANCE FA_MY_W_STRAFE_24 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
};

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_W_FOCUS_24 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_ATTACK;
	move[2] = MOVE_STRAFE;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_STRAFE;
};

// was tun, wenn ich den Gegner nicht im Focus habe?
INSTANCE FA_MY_W_NOFOCUS_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
};


////////////////////////////////////////////////////////////
// Meine Aktionen wenn Gegner Waffenreichweite * 3 entfernt:
////////////////////////////////////////////////////////////

// was tun, wenn ich gerade auf den Gegner zurenne?
INSTANCE FA_MY_G_RUNTO_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
};

// was tun, wenn ich gerade Strafe?
INSTANCE FA_MY_G_STRAFE_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
	move[1] = MOVE_ATTACK;};
};

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_G_FOCUS_24 (C_FightAI)
{
	move[0] = MOVE_RUN;
};


////////////////////////////////////
// Gegner weiter als Waffenreichweite * 3 entfernt
////////////////////////////////////

// was tun, wenn ich den Gegner im Focus habe?
INSTANCE FA_MY_FK_FOCUS_24 (C_FightAI)
{
	move[0] = MOVE_RUN;
};

// was tun, wenn ich den Gegner nicht im Focus habe? (gilt auch für G-Distanz!)
INSTANCE FA_MY_G_FK_NOFOCUS_24 (C_FightAI)
{
	move[0] = MOVE_TURN;
};


*/