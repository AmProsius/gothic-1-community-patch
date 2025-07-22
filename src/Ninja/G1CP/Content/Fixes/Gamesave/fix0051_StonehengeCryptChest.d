/*
 * #51 Chest in stonehenge crypt behind wall
 */

/*
 * Make the positions available to the functions below
 */
const float G1CP_0051_StonehengeCryptChest_OriginalPos[3] = {-35498.5625, 2331.01416, -13830.9131};
const float G1CP_0051_StonehengeCryptChest_CorrectedPos[3] = {-35311.8100, 2281.0100, -14096.8200};

/*
 * Apply the fix
 */
func int G1CP_0051_StonehengeCryptChest() {
    return G1CP_ChangeVobLocation(_@(G1CP_0051_StonehengeCryptChest_OriginalPos),
                                  _@(G1CP_0051_StonehengeCryptChest_CorrectedPos), Hlp_Is_oCMobContainer);
};

/*
 * This function reverts the changes
 */

func int G1CP_0051_StonehengeCryptChestRevert() {
    if (!G1CP_IsFixApplied(51)) {
        return FALSE;
    };

    return G1CP_ChangeVobLocation(_@(G1CP_0051_StonehengeCryptChest_CorrectedPos),
                                  _@(G1CP_0051_StonehengeCryptChest_OriginalPos), Hlp_Is_oCMobContainer);
};
