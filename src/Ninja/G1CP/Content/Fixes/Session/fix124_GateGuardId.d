/*
 * #124 Gate guard doesn't close castle gate in chapter 4
 */
func int G1CP_124_GateGuardId() {
    const string npcName = "GRD_280_Gardist";
    const string npcProp = "id";
    const int originalInt = 230;
    const int correctedInt = 280;

    return (G1CP_NpcChangeIntVar(npcName, npcProp, originalInt, correctedInt) > 0);
};
