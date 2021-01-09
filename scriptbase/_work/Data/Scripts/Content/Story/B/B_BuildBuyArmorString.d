// gibt einen String zur�ck, der in die Info_AddChoice-Befehle eingespeist werden kann
// Beispiel:
//	- text: "schwere Templerr�stung"
//	- price: 1500
//	- R�ckgabestring: "schwere Templerr�stung (1500 Erz)"
func string B_BuildBuyArmorString (var string text, var int price)
{
	var string msg;
	
	msg	= ConcatStrings(text,	NAME_BuyArmorPrefix);
	msg = ConcatStrings(msg,	IntToString(price));
	msg = ConcatStrings(msg,	NAME_BuyArmorPostfix);

	return msg;
};
