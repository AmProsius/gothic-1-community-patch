func void B_SetFaceExpression (var C_NPC slf, var C_NPC oth)
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_SetFaceExpression");

	var int attitude;
	
	attitude = Npc_GetTempAttitude(slf, oth);
	
	if (Npc_IsInState(self, ZS_Flee) || self.aivar[AIV_WASDEFEATEDBYSC])
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...to frightened!");
		Mdl_StartFaceAni	(self,	"S_FRIGHTENED",	1,	-1);
	}
	else if	(attitude == ATT_FRIENDLY)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...to friendly!");
		Mdl_StartFaceAni	(self,	"S_NEUTRAL",	1,	-1);
	}
	else if	(attitude == ATT_NEUTRAL)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...to neutral!");
		Mdl_StartFaceAni	(self,	"S_NEUTRAL",	1,	-1);
	}
	else if	(attitude == ATT_ANGRY)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...to angry!");
		Mdl_StartFaceAni	(self,	"S_ANGRY",		1,	-1);
	}
	else if	(attitude == ATT_HOSTILE)
	{
		PrintDebugNpc		(PD_ZS_CHECK,	"...to hostile!");
		Mdl_StartFaceAni	(self,	"S_HOSTILE",	1,	-1);
	};
};


func void B_ResetFaceExpression (var C_NPC slf)
{
	PrintDebugNpc		(PD_ZS_FRAME,	"B_ResetFaceExpression");

	Mdl_StartFaceAni	(self,	"S_NEUTRAL",	1,	-1);
};



