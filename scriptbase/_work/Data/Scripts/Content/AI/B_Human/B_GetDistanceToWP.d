func int B_GetDistanceToWP (var C_NPC slf, var string wp)
{
    var int Dist;
    
    Dist = Npc_GetDistToWP (slf, slf.wp);
    return Dist;
};