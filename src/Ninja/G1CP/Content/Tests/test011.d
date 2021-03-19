/*
 * #11 Player can pass guards in combat mode
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: Guards will now no longer react to drawing a weapon if the player has no access to enter.
 */
func void G1CP_Test_011() {
    if (G1CP_TestsuiteAllowManual) {
        // Supply a weapon
        if (!Npc_HasEquippedWeapon(hero))
        && (!Npc_HasReadiedWeapon(hero)) {
            var int weap; weap = MEM_GetSymbolIndex("ItMw_1H_Sword_Old_01");
            if (weap != -1) {
                CreateInvItem(hero, weap);
                EquipWeapon(hero, weap);
            };
        };
        // Teleport the player in front of the gate guards
        AI_Teleport(hero, "OCR_BEHIND_HUT_1");
    };
};
