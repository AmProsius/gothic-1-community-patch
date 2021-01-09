	
// *********************************************************************
// leave game menu
// *********************************************************************

INSTANCE MENU_LEAVE_GAME(C_MENU_DEF) 
{
	backpic		= MENU_BACK_PIC;
	
	items[0]	= "MENUITEM_LEAVE_GAME_HEADLINE";	
	
	items[1]	= "MENUITEM_LEAVE_GAME_YES";
	items[2]	= "MENUITEM_LEAVE_GAME_NO";	
		
	defaultOutGame	= 2;	// NEWGAME
	defaultInGame	= 2;	// SAVEGAME
	
	flags = flags | MENU_SHOW_INFO;
};

INSTANCE MENUITEM_LEAVE_GAME_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		= "Really quit Gothic?";   		
	type		= MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=    0;		posy		= 3400;
	dimx		= 8100;		dimy		=  500;
	// Weitere Eigenschaften
	flags		=	IT_CHROMAKEYED|IT_TRANSPARENT|IT_MOVEABLE|IT_TXT_CENTER;		
};


INSTANCE MENUITEM_LEAVE_GAME_YES(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Yes";
	text[1]		= "Yes, I want to quit Gothic."; // Kommentar
	
	// Position und Dimension	
	posx		=    0;		posy		= 4400;	
	dimx		= 8100;		dimy		=  500;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_CLOSE;
	onSelAction_S[0]= "LEAVE_GAME";
	// Weitere Eigenschaften
	flags			= IT_CHROMAKEYED|IT_TRANSPARENT|IT_MOVEABLE|IT_SELECTABLE|IT_TXT_CENTER;
};

INSTANCE MENUITEM_LEAVE_GAME_NO(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "No";
	text[1]		= "No, I want to play on."; // Kommentar
	
	// Position und Dimension	
	posx		=    0;		posy		= 5000;	
	dimx		= 8100;		dimy		=  500;
	// Weitere Eigenschaften
	flags		= IT_CHROMAKEYED|IT_TRANSPARENT|IT_MOVEABLE|IT_SELECTABLE|IT_TXT_CENTER;
};


