/*
 * #192 Mages auto-equip melee/ranged weapons
 *
 * This fix requires #59 to be applied to work.
 */
func int G1CP_192_MagicUserAutoEquip() {
    return G1CP_IsFixApplied(59);
};

/*
 * This function is called from #59 to intercept equipping of weapons for magic users
 */
func int G1CP_192_MagicUserAutoEquip_IsMagicUser(var C_Npc npc) {
    G1CP_ReportFuncToSpy();

    // Define possibly missing symbols locally
    const int FAI_HUMAN_MAGE = -2;
    if (FAI_HUMAN_MAGE == -2) {
        FAI_HUMAN_MAGE = G1CP_GetIntConst("FAI_HUMAN_MAGE", 0, -1);
    };

    // This function is also called if the fix is not applied, so check that first
    return (G1CP_IsFixApplied(192)) && (npc.fight_tactic == FAI_HUMAN_MAGE);
};
