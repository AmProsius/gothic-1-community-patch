// *********************************************************************
// game options menu
// *********************************************************************

INSTANCE MENU_OPT_GAME(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENUITEM_GAME_HEADLINE";
				
	items[1]		= "MENUITEM_GAME_SUB_TITLES";
	items[2]		= "MENUITEM_GAME_SUB_TITLES_CHOICE";
	
	items[3]		= "MENUITEM_GAME_ANIMATE_WINDOWS";
	items[4]		= "MENUITEM_GAME_ANIMATE_WINDOWS_CHOICE";

	items[5]		= "MENUITEM_GAME_LOOKAROUND_INVERSE";
	items[6]		= "MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE";
	
	items[7]		= "MENUITEM_M";
	items[8]		= "MENUITEM_M_CHOICE";
	
	items[9]		= "MENUITEM_MSENSITIVITY";
	items[10]		= "MENUITEM_MSENSITIVITY_SLIDER";
	
	items[11]		= "MENUITEM_GAME_BLOOD";
	items[12]		= "MENUITEM_GAME_BLOOD_CHOICE";
				
	items[13]		= "MENUITEM_GAME_BACK";
	
	flags = flags | MENU_SHOW_INFO;
};


INSTANCE MENUITEM_GAME_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"SPIEL EINSTELLUNGEN";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8100;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;	
};


//
// Lookaround
//

INSTANCE MENUITEM_GAME_SUB_TITLES(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Untertitel";
	text[1]		= 	"Visuelle Einblendung von Dialogen."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*0;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_SUB_TITLES_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	"nein|ja";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*0 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "subTitles";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};


//
// Fenster faden
//

INSTANCE MENUITEM_GAME_ANIMATE_WINDOWS(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Animierte Fenster";
	text[1]		= 	"Animierte Dialogfenster."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*1;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_ANIMATE_WINDOWS_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"nein|ja";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*1 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "animatedWindows";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;	
	flags		= flags  | IT_TXT_CENTER;
};



//
// Lookaround
//

INSTANCE MENUITEM_GAME_LOOKAROUND_INVERSE(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Umschau umkehren";
	text[1]		= 	"Inverse Kamerasteuerung."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*2;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;		
	text[0]		= 	"nein|ja";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		=	MENU_START_Y + MENU_DY*2 + MENU_CHOICE_YPLUS;
	dimx = MENU_SLIDER_DX;	dimy 		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "camLookaroundInverse";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


//
// M.
//

INSTANCE MENUITEM_M(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Maus";
	text[1]		= 	"Aktiviert eine Maussteuerung"; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*3;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_M_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"aus|an";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*3 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "enableMouse";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


//
// M-Sensibility
//

INSTANCE MENUITEM_MSENSITIVITY(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Maus Empfindlichkeit";
	text[1]		= 	""; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*4;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

instance MENUITEM_MSENSITIVITY_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;	
	type		=	MENU_ITEM_SLIDER;	
	text[0]		= 	"";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*4 + MENU_SLIDER_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_SLIDER_DY;
	// Aktionen
	onChgSetOption													= "mouseSensitivity";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	userFloat[0]	= 20;
	userString[0]	= MENU_SLIDER_POS_PIC;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER;
};


//
// Bluteffekte
//

INSTANCE MENUITEM_GAME_BLOOD(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Blut Details";
	text[1]		= 	"Grad der Darstellung von Bluteffekten."; // Kommentar
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*5;
	dimx		=	4000;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT | IT_EXTENDED_MENU;
};

instance MENUITEM_GAME_BLOOD_CHOICE(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_CHOICE_BACK_PIC;
	type		=	MENU_ITEM_CHOICEBOX;	
	text[0]		= 	"keine|wenige|mehrere|viele";
	fontName	=   MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 5000;		posy		= MENU_START_Y + MENU_DY*5 + MENU_CHOICE_YPLUS;
	dimx 		= 2000;		dimy 		= MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption													= "bloodDetail";
	onChgSetOptionSection 											= "GAME";
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags  | IT_TXT_CENTER | IT_EXTENDED_MENU;
};



INSTANCE MENUITEM_GAME_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Zurück";
	// Position und Dimension	
	posx		=	1000;		posy		=	MENU_BACK_Y;
	dimx		=	6192;		dimy		=	MENU_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;	
	flags = flags | IT_TXT_CENTER;
};
