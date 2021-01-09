// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "Einhandkampf Stufe 2"
//	- lp: 20
//	- Rückgabestring: "Einhandkampf Stufe 2 (20 Lernpunkte)"
//
// oder
//
//	- text: "Zweihandkampf Stufe 1"
//	- lp: 30
//  - ore: 200
//	- Rückgabestring: "Zweihandkampf Stufe 1 (200 Erz, 20 Lernpunkte)"
func string B_BuildLearnString (var string text, var int lp, var int ore)
{
	var string msg;
	
	msg	= ConcatStrings(text,	NAME_LearnPrefix);		// Bsp: "Zweihandkampf Stufe 1 ("

	if	(ore > 0)
	{
		msg = ConcatStrings(msg, IntToString(ore));		// Bsp: "Zweihandkampf Stufe 1 (200"
		msg = ConcatStrings(msg, NAME_LearnMidfix);		// Bsp: "Zweihandkampf Stufe 1 (200 Erz, "
	};

	msg = ConcatStrings(msg,	IntToString(lp));		// Bsp: "Zweihandkampf Stufe 1 (200 Erz, 20"
	if (lp == 1)
	{
		msg = ConcatStrings(msg,NAME_LearnPostfixS);	
	}
	else
	{
		msg = ConcatStrings(msg,NAME_LearnPostfixP);	// Bsp: "Zweihandkampf Stufe 1 (200 Erz, 20 Lernpunkte)"
	};

	return msg;
};




