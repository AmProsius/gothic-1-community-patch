//////////////////////////////////////////////////////////////////////////
//	B_MagicHurtNpc
//	==============
//	Verwundet den NSC und berücksichtigt dabei den magischen Rüstschutz
//	'self' ist der zu verwundende NSC
//////////////////////////////////////////////////////////////////////////
func void B_MagicHurtNpc (var C_NPC attacker, var int damage)
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_MagicHurtNpc");

	var int effectiveDamage;
	
	effectiveDamage = damage - self.protection[PROT_MAGIC];
	if (effectiveDamage < 0)
	{
		effectiveDamage = 0;
	};

	Npc_ChangeAttribute (self,	ATR_HITPOINTS, -effectiveDamage);

	if	Npc_IsDead(self)
	{
		if	Npc_IsPlayer   (attacker)
		||	(C_NpcIsHuman  (attacker) && attacker.aivar[AIV_PARTYMEMBER])
		||	(C_NpcIsMonster(attacker) && attacker.aivar[AIV_MM_PARTYMEMBER])
		{
			B_DeathXP();	// vergibt XP an SC
		};
	};
};