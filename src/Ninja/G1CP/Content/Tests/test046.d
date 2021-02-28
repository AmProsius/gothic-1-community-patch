/*
 * #46 Smith's door has wrong key instance
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation. The PC
 * gets the key in the inventory.
 *
 * Expected behavior: The door should be accessible with the key an remain unlocked over saving and loading. If removing
 * the patch (or the entire fix) the door should be locked again and the key will not unlock it.
 */
func void Ninja_G1CP_Test_046() {
    if (Ninja_G1CP_TestsuiteAllowManual) {
        // Check if the key exists
        var int symbId; symbId = MEM_FindParserSymbol("ItKe_OB_Smith_01");
        if (symbId == -1) {
            Ninja_G1CP_TestsuiteErrorDetail("Item 'ItKe_OB_Smith_01' not found");
            return;
        };

        // Allow the player to confirm
        CreateInvItem(hero, symbId);
        AI_Teleport(hero, "OCC_STABLE_STAIRCASE_TOP");
    };
};
