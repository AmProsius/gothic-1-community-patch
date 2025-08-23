/*
 * Change the value of a C_Info instance integer variable. Returns true on success.
 */
func int G1CP_Tpl_ChangeInfoIntVar(var string infoInst, var string prop, var int originalVal, var int correctVal) {
    var int infoId; infoId = G1CP_GetInfoInstId(infoInst);
    return (G1CP_ReplaceAssignInt(infoId, 0, ConcatStrings("C_Info.", prop), originalVal, correctVal) > 0);
};

/*
 * Change the description of a C_Info instance. Returns true on success.
 */
func int G1CP_Tpl_ChangeInfoStrVar(var string infoInst, var string prop, var string originalVal, var string correctVal)
{
    var int infoId; infoId = G1CP_GetInfoInstId(infoInst);
    return (G1CP_ReplaceAssignStr(infoId, 0, ConcatStrings("C_Info.", prop), originalVal, correctVal) > 0);
};

/*
 * Change the display text of an dialog choice (Info_AddChoice). Returns true on success.
 */
func int G1CP_Tpl_ChangeDialogChoiceText(var string infoFuncName, var string originalStr, var string correctStr) {
    var int funcId; funcId = G1CP_GetFuncId(infoFuncName, "void|none");
    return (G1CP_ReplacePushStr(funcId, 0, originalStr, correctStr) > 0);
};
