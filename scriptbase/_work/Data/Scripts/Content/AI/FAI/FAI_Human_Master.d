/// Nahkampf - AI
// Combos für NSC-AI enabled. neues Skript "FAI.D" wird benötigt, darin
/*neue Moves für NSCs definiert :


     MOVE_SIDEATTACK  :         Left --> Right
     MOVE_FRONTATTACK :         Left --> Foward    
     oder                       Foward --> Right
                                
     MOVE_TRIPLEATTACK :        Foward --> Right -->Left  
     oder                       Left --> Right -->Foward
     
     MOVE_WHIRLATTACK :       Left --> Right -->Left --> Right
     MOVE_MASTERATTACK :      Left --> Right --> Foward --> Foward -->
Foward --> Foward
*/
INSTANCE FA_ENEMY_PREHIT_4 (C_FightAI)
{
	move[0] = MOVE_PARADE;
	move[1] = MOVE_STRAFE;
	move[1] = MOVE_SIDEATTACK;
	
};				

INSTANCE FA_ENEMY_STORMPREHIT_4 (C_FightAI)
{
	move[0] = MOVE_STRAFE;
};



INSTANCE FA_MY_W_COMBO_4 (C_FightAI)
{
	move[0] = MOVE_WHIRLATTACK;
	
};

INSTANCE FA_MY_W_RUNTO_4 (C_FightAI)
{
	move[0] = MOVE_RUN;
	
	
};

INSTANCE FA_MY_W_STRAFE_4 (C_FightAI)
{
	move[0] = MOVE_TURN;
	
};

INSTANCE FA_MY_W_FOCUS_4 (C_FightAI)
{
	move[0] = MOVE_TRIPLEATTACK;
	move[1] = MOVE_MASTERATTACK;
	move[2] = MOVE_WHIRLATTACK;
	
};

INSTANCE FA_MY_W_NOFOCUS_4 (C_FightAI)
{
	move[0] = MOVE_TURN;
	
};

INSTANCE FA_MY_G_COMBO_4 (C_FightAI)
{
	move[0] = MOVE_TURN;
	
};

INSTANCE FA_MY_G_RUNTO_4 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_TURN;
	
};

INSTANCE FA_MY_G_STRAFE_4 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_TURN;
	
};

INSTANCE FA_MY_G_FOCUS_4 (C_FightAI)
{
	move[0] = MOVE_RUN;
	
	
};

INSTANCE FA_MY_FK_FOCUS_4 (C_FightAI)
{
	move[0] = MOVE_RUN;
	
	
};

INSTANCE FA_MY_G_FK_NOFOCUS_4 (C_FightAI)
{
	move[0] = MOVE_RUN;
	
};

// SN 08.10.00: Die neuen Instanzen wenn Gegner in Fernkampfreichweite und der NSC im Fernkampfmodus ist
INSTANCE FA_MY_FK_FOCUS_FAR_4 (C_FightAI)
{
	move[0] = MOVE_ATTACK;
	move[1] = MOVE_WAIT;
	move[2] = MOVE_WAIT;
	move[3] = MOVE_WAIT;
	move[4] = MOVE_WAIT;
	move[5] = MOVE_WAIT;	
};

INSTANCE FA_MY_FK_NOFOCUS_FAR_4 (C_FightAI)
{
	move[0] = MOVE_TURN;
};
