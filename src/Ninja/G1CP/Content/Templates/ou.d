/*
 * Switch speaker and listener of an output unit / SVM. Returns true on success.
 */
func int G1CP_Tpl_ChangeOuSpeaker(
        var string infoFuncName,
        var string ouName,
        var int correctSpeaker,
        var int correctListener
    ) {
    var int funcId; funcId = G1CP_GetFuncId(infoFuncName, "void|none");
    var int ret;
    ret = G1CP_ReplaceOuInst(funcId, 0, ouName, correctListener, correctSpeaker, correctSpeaker, correctListener);
    return (ret > 0);
};
