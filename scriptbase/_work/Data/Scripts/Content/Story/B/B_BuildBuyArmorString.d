// gibt einen String zurück, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "schwere Templerrüstung"
//	- price: 1500
//	- Rückgabestring: "schwere Templerrüstung (1500 Erz)"
func string B_BuildBuyArmorString (var string text, var int price)
{
	var string msg;
	
	msg	= ConcatStrings(text,	NAME_BuyArmorPrefix);
	msg = ConcatStrings(msg,	IntToString(price));
	msg = ConcatStrings(msg,	NAME_BuyArmorPostfix);

	return msg;
};
