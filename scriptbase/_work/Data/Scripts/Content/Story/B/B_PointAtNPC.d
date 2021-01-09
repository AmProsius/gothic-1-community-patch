FUNC VOID B_PointAtNpc(var C_NPC slf, var C_NPC oth, var C_NPC targ)
{
	AI_WaitTillEnd(slf,oth);	// MH: funzt nicht
	AI_PointAtNpc(slf, targ); 
	B_Say (slf,oth,"$THEREHEIS");
	AI_StopPointAt(slf);
};