/*
 * #213 Cauldron in the New Camp can be used without a scoop pt. 2
 *
 * There does not seem an easy way to test this fix programmatically, so this test relies on manual confirmation.
 *
 * Expected behavior: The cauldron is not usable anymore (without a spoon).
 */
func void G1CP_Test_213() {
    if (!G1CP_TestsuiteAllowManual) {
        return;
    };

    // Check for the item
    var int itemId; itemId = G1CP_GetItemInstID("ITMISCOOP");
    if (itemId == -1) {
        G1CP_TestsuiteErrorDetail("Item 'ItMiScoop' not found");
        return;
    };

    // Give the player item to check
    if (!Npc_HasItems(hero, itemId)) {
        CreateInvItem(hero, itemId);
    };

    // Teleport the player to the MOB
    AI_Teleport(hero, "NC_HUT21_OUT");
};
