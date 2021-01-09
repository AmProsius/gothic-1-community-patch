// *********************************************************************
// change keys menu
// *********************************************************************

instance MENU_OPT_CONTROLS(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENU_ITEM_CHG_KEYS_HEADLINE";
	
	// Items
	
	items[1]		= "MENU_ITEM_KEY_UP";
	items[2]		= "MENU_ITEM_KEY_DOWN";
	items[3]		= "MENU_ITEM_KEY_LEFT";
	items[4]		= "MENU_ITEM_KEY_RIGHT";
	items[5]		= "MENU_ITEM_KEY_STRAFE_LEFT";
	items[6]		= "MENU_ITEM_KEY_STRAFE_RIGHT";	
			
	items[7]		= "MENU_ITEM_KEY_WEAPON";	
	items[8]		= "MENU_ITEM_KEY_ACTION";	
	items[9]		= "MENU_ITEM_KEY_JUMPCLIMBSTRAFE";	
	items[10]		= "MENU_ITEM_KEY_RUNMODETOGGLE";
	items[11]		= "MENU_ITEM_KEY_SNEAK";		
	items[12]		= "MENU_ITEM_KEY_LOOK";
	items[13]		= "MENU_ITEM_KEY_LOOK_FP";
	
	items[14]		= "MENU_ITEM_KEY_INVENTORY";	
	items[15]		= "MENU_ITEM_KEY_SCREEN_STATUS";
	items[16]		= "MENU_ITEM_KEY_SCREEN_LOG";
		
	// Input
	
	items[17]		= "MENU_ITEM_INP_UP";
	items[18]		= "MENU_ITEM_INP_DOWN";
	items[19]		= "MENU_ITEM_INP_LEFT";
	items[20]		= "MENU_ITEM_INP_RIGHT";
	items[21]		= "MENU_ITEM_INP_STRAFE_LEFT";
	items[22]		= "MENU_ITEM_INP_STRAFE_RIGHT";		
		
	items[23]		= "MENU_ITEM_INP_WEAPON";
	items[24]		= "MENU_ITEM_INP_ACTION";	
	items[25]		= "MENU_ITEM_INP_JUMPCLIMBSTRAFE";	
	items[26]		= "MENU_ITEM_INP_RUNMODETOGGLE";
	items[27]		= "MENU_ITEM_INP_SNEAK";	
	items[28]		= "MENU_ITEM_INP_LOOK";		
	items[29]		= "MENU_ITEM_INP_LOOK_FP";		
	
	items[30]		= "MENU_ITEM_INP_INVENTORY";	
	items[31]		= "MENU_ITEM_INP_SCREEN_STATUS";
	items[32]		= "MENU_ITEM_INP_SCREEN_LOG";
	
	// 
	
	items[33]		= "MENU_ITEM_CHG_KEYS_SET_DEFAULT";			
	items[34]		= "MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE";			
	
	items[35]		= "MENUITEM_CHG_KEYS_BACK";
		
	flags = flags | MENU_SHOW_INFO;
};


const int ctrl_sp1_1 	= 1100;						// 1.Spalte (Beschreibung)
const int ctrl_sp1_2 	= ctrl_sp1_1 + 2700;		// 1.Spalte (Taste)

const int ctrl_dimx  	= 3200;		// Breite des Tastenfeldes

const int ctrl_y_step  	= 260;			// Abstand der Felder (y)
const int ctrl_y_title	= 800;	// Start der Felder (y)
const int ctrl_y_start 	= ctrl_y_title + ctrl_y_step*2;	// Start der Felder (y)
const int CTRL_GROUP1   = ctrl_y_step * 0;
const int CTRL_GROUP2   = ctrl_y_step * 1;
const int CTRL_GROUP3   = ctrl_y_step * 2;
const int CTRL_GROUP4	= ctrl_y_step * 3;
const int CTRL_GROUP5	= ctrl_y_step * 4;


INSTANCE MENU_ITEM_CHG_KEYS_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"TASTATUR EINSTELLUNGEN";
	type		=	MENU_ITEM_TEXT;	
	// Position und Dimension	
	posx		= 0;		
	posy		= ctrl_y_title;
	dimx		= 8100;
	fontName 	= MENU_FONT_BRIGHT;
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};

	

//
// Group 1
//

INSTANCE MENU_ITEM_KEY_UP(C_MENU_ITEM_DEF)
{
	text[0]			=	"Vorwärts";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			= 	ctrl_sp1_1;	posy	= 	ctrl_y_start + ctrl_y_step * 0 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"RUN MENU_ITEM_INP_UP";
	fontName 	= 	MENU_FONT_SMALL;
	flags 			= flags;	
};

INSTANCE MENU_ITEM_KEY_DOWN(C_MENU_ITEM_DEF)
{
	text[0]			=	"Rückwärts";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 1 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_DOWN";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};

INSTANCE MENU_ITEM_KEY_LEFT(C_MENU_ITEM_DEF)
{
	text[0]			=	"Links drehen";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 2 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_LEFT";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};
	
INSTANCE MENU_ITEM_KEY_RIGHT(C_MENU_ITEM_DEF)
{
	text[0]			=	"Rechts drehen";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 3 + CTRL_GROUP1;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_RIGHT";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};


INSTANCE MENU_ITEM_KEY_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	text[0]			=	"Seitwärts links";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 4 + CTRL_GROUP1;
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_STRAFE_LEFT";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};
	
INSTANCE MENU_ITEM_KEY_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	text[0]			=	"Seitwärts rechts";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 5 + CTRL_GROUP1;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_STRAFE_RIGHT";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};

	

//
// Group 2
//

INSTANCE MENU_ITEM_KEY_WEAPON(C_MENU_ITEM_DEF)
{
	text[0]			=	"Waffen";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 6 + CTRL_GROUP2;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_WEAPON";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;
};

INSTANCE MENU_ITEM_KEY_ACTION(C_MENU_ITEM_DEF)
{
	text[0]			=	"Aktion";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 7 + CTRL_GROUP2;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_ACTION";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};

INSTANCE MENU_ITEM_KEY_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	text[0]			=	"Springen/Seitstep";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 8 + CTRL_GROUP2;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_JUMPCLIMBSTRAFE";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;
};


INSTANCE MENU_ITEM_KEY_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{	
	text[0]			=	"Schnell laufen";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 9 + CTRL_GROUP2;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_RUNMODETOGGLE";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};

INSTANCE MENU_ITEM_KEY_SNEAK(C_MENU_ITEM_DEF)
{	
	text[0]			=	"Schleichen";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 10 + CTRL_GROUP2;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_SNEAK";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;
};

INSTANCE MENU_ITEM_KEY_LOOK(C_MENU_ITEM_DEF)
{
	text[0]			=	"Umsehen";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 11 + CTRL_GROUP2;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_LOOK";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;
};

INSTANCE MENU_ITEM_KEY_LOOK_FP(C_MENU_ITEM_DEF)
{
	text[0]			=	"Umsehen FirstPerson";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 12 + CTRL_GROUP2;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_LOOK_FP";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;
};

//
// Group 3
//

INSTANCE MENU_ITEM_KEY_INVENTORY(C_MENU_ITEM_DEF)
{
	text[0]			=	"Inventar";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx			=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 13 + CTRL_GROUP3;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_INVENTORY";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};

INSTANCE MENU_ITEM_KEY_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	text[0]		=	"Spielerstatus";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx		=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 14 + CTRL_GROUP3;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_SCREEN_STATUS";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};


INSTANCE MENU_ITEM_KEY_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	text[0]		=	"Missionen und Notizen";
	text[1]			=   "Taste ENTF zum Löschen und RETURN zum definieren"; // Kommentar
	posx		=	ctrl_sp1_1;		posy	=	ctrl_y_start + ctrl_y_step * 15 + CTRL_GROUP3;
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"RUN MENU_ITEM_INP_SCREEN_LOG";  
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;	
};

//
// Group 1
//

INSTANCE MENU_ITEM_INP_UP(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	type		= 	MENU_ITEM_INPUT;
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 0 + CTRL_GROUP1;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;		
	
	onChgSetOption 			= "keyUp";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};

INSTANCE MENU_ITEM_INP_DOWN(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 1 + CTRL_GROUP1;	
	dimx		=	ctrl_dimx;	dimy		=	300;
	
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keyDown";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_INP_LEFT(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 2 + CTRL_GROUP1;
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	onChgSetOption 			= "keyLeft";
	onChgSetOptionSection 	= "KEYS";
	flags		=	IT_CHROMAKEYED|IT_TRANSPARENT;
};
	
INSTANCE MENU_ITEM_INP_RIGHT(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 3 + CTRL_GROUP1;
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	onChgSetOption 			= "keyRight";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};


INSTANCE MENU_ITEM_INP_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 4 + CTRL_GROUP1;
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	onChgSetOption 			= "keyStrafeLeft";
	onChgSetOptionSection 	= "KEYS";
	flags		=	IT_CHROMAKEYED|IT_TRANSPARENT;
};
	
INSTANCE MENU_ITEM_INP_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 5 + CTRL_GROUP1;
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	onChgSetOption 			= "keyStrafeRight";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};

//
// Group 2
//

INSTANCE MENU_ITEM_INP_WEAPON(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 6 + CTRL_GROUP2;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keyWeapon";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};



INSTANCE MENU_ITEM_INP_ACTION(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 7 + CTRL_GROUP2;
	dimx		=	ctrl_dimx;	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keyAction";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};
	

INSTANCE MENU_ITEM_INP_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 8 + CTRL_GROUP2;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;	
	
	onChgSetOption 			= "keySMove";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
	
};


instance MENU_ITEM_INP_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 9 + CTRL_GROUP2;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keySlow";
	onChgSetOptionSection 	= "KEYS";	
	flags		=	flags & ~IT_SELECTABLE;
};


INSTANCE MENU_ITEM_INP_SNEAK(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 10 + CTRL_GROUP2;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keySneak";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_INP_LOOK(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 11 + CTRL_GROUP2;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keyLook";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};


INSTANCE MENU_ITEM_INP_LOOK_FP(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;	posy		=	ctrl_y_start + ctrl_y_step * 12 + CTRL_GROUP2;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keyLookFP";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};

//
// Group 3
//

INSTANCE MENU_ITEM_INP_INVENTORY(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;		posy	=	ctrl_y_start + ctrl_y_step * 13 + CTRL_GROUP3;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keyInventory";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};


INSTANCE MENU_ITEM_INP_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;		posy	=	ctrl_y_start + ctrl_y_step * 14 + CTRL_GROUP3;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keyShowStatus";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_INP_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_INPUT;
	text[1] 	=   "Gewünschte Taste betätigen.";
	
	posx		=	ctrl_sp1_2;		posy	=	ctrl_y_start + ctrl_y_step * 15 + CTRL_GROUP3;
	dimx		=	ctrl_dimx;
	dimy		=	300;
	fontName 	= 	MENU_FONT_SMALL;	
	backPic		=	MENU_KBDINPUT_BACK_PIC;
	
	onChgSetOption 			= "keyShowLog";
	onChgSetOptionSection 	= "KEYS";
	flags		=	flags & ~IT_SELECTABLE;
};


//
// Weitere Elemente
//

INSTANCE MENU_ITEM_CHG_KEYS_SET_DEFAULT(C_MENU_ITEM_DEF)
{
	text[0]		=	"Standard-Einstellung";	
	text[1]		=	"Aktiviert die Standardbelegung der Tastatur."; // Kommentar
	posx		=	ctrl_sp1_1;		posy		=	ctrl_y_start + ctrl_y_step * 16 + CTRL_GROUP4;
	dimy		=	300;
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"SETDEFAULT";
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;
};

INSTANCE MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE(C_MENU_ITEM_DEF)
{
	text[0]		=	"Alternativ-Einstellung";	
	text[1]		=	"Aktiviert eine alternative Belegung der Tastatur."; // Kommentar
	posx		=	ctrl_sp1_1;		posy		=	ctrl_y_start + ctrl_y_step * 17 + CTRL_GROUP4;
	dimy		=	300;
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]= 	"SETALTERNATIVE";
	fontName 	= 	MENU_FONT_SMALL;
	flags = flags;
};



INSTANCE MENUITEM_CHG_KEYS_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Zurück";
	// Position und Dimension	
	posx		=	ctrl_sp1_1;		posy		=	ctrl_y_start + ctrl_y_step * 18 + CTRL_GROUP5;
	dimy		=	300;
	// Aktionen
	fontName 	= 	MENU_FONT_SMALL;
	onSelAction[0]	= 	SEL_ACTION_BACK;	
	flags = flags | IT_TXT_CENTER;
};
