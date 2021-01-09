func void B_LookAround ()
// 4.6.0. fertig // 25.5.00 Konzeptänderung auf 1 sec. Laut Konzept 3.5.00 soll die Frequenz 0,5 betragen, bisher aber nur integer Werte möglich
{
	PrintDebugNpc( PD_ZS_FRAME, "B_LookAround" );	
	Npc_SetPercTime ( self, 1);
	AI_StandUp ( self);
	AI_PlayAni ( self, "T_SEARCH");
};