/*
 * #157 Potion of Velocity has wrong ore value
 */
func int G1CP_157_SpeedPotion2Value() {
    // Get content of potion values
    var int Value_Haste2;
    if (G1CP_IsIntConst("Value_Haste2", 0)) {
        // Find value from constant
        Value_Haste2 = G1CP_GetIntConst("Value_Haste2", 0, 0);
    } else {
        // This one is strictly required
        return FALSE;
    };

    var int Value_Haste1;
    if (G1CP_IsIntConst("Value_Haste1", 0)) {
        // Find value from constant
        Value_Haste1 = G1CP_GetIntConst("Value_Haste1", 0, 0);
    } else if (Itm_GetPtr(G1CP_GetItemInstId("ItFo_Potion_Haste_01"))) {
        // If not found, determine from level one speed potion
        Value_Haste1 = item.value;
    } else {
        // If neither is found, we cannot compare and be sure that the potion values are not intended
        return FALSE;
    };

    return G1CP_ItemChangeIntVar("ItFo_Potion_Haste_02", "value", Value_Haste1, Value_Haste2);
};
