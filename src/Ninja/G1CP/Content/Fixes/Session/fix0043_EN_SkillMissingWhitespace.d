/*
 * #43 Missing whitespace for skill point(s)
 */
func int G1CP_0043_EN_SkillMissingWhitespace() {
    var int symb1fixed;
    var int symb2fixed;

    symb1fixed = G1CP_ReplaceStringConst("NAME_LearnPostfixS", "skill point)", " skill point)");
    symb2fixed = G1CP_ReplaceStringConst("NAME_LearnPostfixP", "skill points)", " skill points)");

    return (symb1fixed) && (symb2fixed);
};
