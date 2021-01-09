const int	LP_PER_LEVEL				= 10;	// Lernpunkte pro Spieler-Stufe
const int	HP_PER_LEVEL				= 12;	// Lebenspunkte pro Spieler-Stufe
const int	XP_PER_LEVEL_UNCONSCIOUS	= 5;	// Erfahrungspunkte für das Besiegen eines Gegners (pro Level Gegners)
const int	XP_PER_LEVEL_DEAD			= 10;	// Erfahrungspunkte für das Töten eines Gegners (pro Level Gegners)

func void B_GiveXP (var int add_xp)
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_GiveXP");

	if (hero.level == 0)
	{
		hero.exp_next = 500;
	};
	//----------------------------------------------------------------------------
	hero.exp = hero.exp + add_xp;

	//----------------------------------------------------------------------------
	var string msg;
	msg = NAME_XPGained;
	msg = ConcatStrings(msg,	IntToString(add_xp));
	PrintScreen	(msg, -1,_YPOS_MESSAGE_XPGAINED,"font_old_10_white.tga",_TIME_MESSAGE_XPGAINED);

	//----------------------------------------------------------------------------
	if ( hero.exp >= hero.exp_next ) // ( XP > (500*((hero.level+2)/2)*(hero.level+1)) )
	{
		hero.level = hero.level+1;
		hero.exp_next = hero.exp_next +((hero.level+1)*500);
		hero.attribute[ATR_HITPOINTS_MAX] = hero.attribute[ATR_HITPOINTS_MAX]+HP_PER_LEVEL;
		hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS]+HP_PER_LEVEL;
		hero.LP = hero.LP + LP_PER_LEVEL;				//+ hero.level;
		PrintScreen		(NAME_LevelUp, -1,_YPOS_MESSAGE_LEVELUP,"font_old_20_white.tga",_TIME_MESSAGE_LEVELUP);
		Snd_Play		("LevelUp");
	};
};

func void B_DeathXP()
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_DeathXP");
	PrintGlobals		(PD_ZS_CHECK);
	
	if	C_NpcIsHuman(self)
	&&	Npc_WasInState(self, ZS_Unconscious)
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Opfer ist bewußtloser Mensch!");
		// SN: keine XP für Finishing-Move!!!
	}
	else
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...Opfer ist entweder nicht bewußtlos oder kein Mensch!");
		B_GiveXP (self.level * XP_PER_LEVEL_DEAD);
	};
};

func void B_UnconciousXP()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"B_UnconciousXP");
	PrintGlobals	(PD_ZS_CHECK);
		
	//-------- Erfahrung nur beim ersten Sieg über Menschen --------
	if	!C_NpcIsHuman(self)
	||	!self.aivar[AIV_WASDEFEATEDBYSC]
	{
		PrintDebugNpc	(PD_ZS_CHECK,	"...erster Sieg!");
		B_GiveXP (self.level * XP_PER_LEVEL_DEAD);		// die vollen XP beim Sieg vergeben, da finishing-Move keine XPs mehr ergibt!
	};
};









