/*
 * #43 Missing whitespace for skill point(s)
 */
func int Ninja_G1CP_043_EN_SkillMissingWhitespace() {
    var int symb1Ptr; symb1Ptr = MEM_GetSymbol("NAME_LearnPostfixS");
    var int symb2Ptr; symb2Ptr = MEM_GetSymbol("NAME_LearnPostfixP");

    if (symb1Ptr) && (symb2Ptr) {
        symb1Ptr = MEM_ReadInt(symb1Ptr + zCParSymbol_content_offset);
        symb2Ptr = MEM_ReadInt(symb2Ptr + zCParSymbol_content_offset);

        // Check if the strings are as expected
        if (Hlp_StrCmp(MEM_ReadString(symb1Ptr), "skill point)"))
        && (Hlp_StrCmp(MEM_ReadString(symb2Ptr), "skill points)")) {

            // Only then, fix them
            MEM_WriteString(symb1Ptr, " skill point)");
            MEM_WriteString(symb2Ptr, " skill points)");

            return TRUE;
        };
    };

    return FALSE;
};
