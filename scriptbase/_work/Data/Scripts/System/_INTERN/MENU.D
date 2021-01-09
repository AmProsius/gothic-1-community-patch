CONST INT MAX_USERSTRINGS		= 10;
CONST INT MAX_ITEMS				= 150;
CONST INT MAX_EVENTS			= 10;
CONST INT MAX_SEL_ACTIONS		= 5;
CONST INT MAX_USERVARS			= 4;


CONST INT SEL_ACTION_UNDEF			= 0;
CONST INT SEL_ACTION_BACK			= 1;
CONST INT SEL_ACTION_STARTMENU		= 2;
CONST INT SEL_ACTION_STARTITEM		= 3;
CONST INT SEL_ACTION_CLOSE			= 4;
CONST INT SEL_ACTION_CONCOMMANDS	= 5;			// -> console commands
CONST INT SEL_ACTION_PLAY_SOUND		= 6;
CONST INT SEL_ACTION_EXECCOMMANDS	= 7;			// -> dynamic build in func.


CONST INT MENU_ITEM_UNDEF		= 0;
CONST INT MENU_ITEM_TEXT		= 1;
CONST INT MENU_ITEM_SLIDER		= 2;
CONST INT MENU_ITEM_INPUT		= 3;
CONST INT MENU_ITEM_CURSOR		= 4;
CONST INT MENU_ITEM_CHOICEBOX	= 5;
CONST INT MENU_ITEM_BUTTON		= 6;
CONST INT MENU_ITEM_LISTBOX		= 7;

CONST INT IT_CHROMAKEYED		= 1;
CONST INT IT_TRANSPARENT		= 2;
CONST INT IT_SELECTABLE			= 4;
CONST INT IT_MOVEABLE			= 8;
CONST INT IT_TXT_CENTER			= 16;
CONST INT IT_DISABLED			= 32;
CONST INT IT_FADE				= 64;
const int IT_EFFECTS_NEXT		= 128;
const INT IT_ONLY_OUT_GAME		= 256;
CONST INT IT_ONLY_IN_GAME		= 512;
CONST INT IT_PERF_OPTION		= 1024;
const int IT_MULTILINE			= 2048;
const int IT_NEEDS_APPLY 		= 4096; // die mit dem Menuepunkt verknuepfte Option wird NUR ueber ein APPLY aktiv
const int IT_NEEDS_RESTART		= 8192; // die mit dem Menuepunkt verknuepfte Option wird NUR ueber ein RESTART aktiv
const int IT_EXTENDED_MENU		= 16384;

CONST INT MENU_OVERTOP			= 1;
CONST INT MENU_EXCLUSIVE		= 2;
CONST INT MENU_NOANI			= 4;
const int MENU_DONTSCALE_DIM	= 8;
const int MENU_DONTSCALE_POS	= 16;
const int MENU_ALIGN_CENTER		= 32;
const int MENU_SHOW_INFO		= 64;

CONST INT EVENT_UNDEF			= 0;
CONST INT EVENT_EXECUTE			= 1;
CONST INT EVENT_CHANGED			= 2;
CONST INT EVENT_LEAVE			= 3;
CONST INT EVENT_TIMER			= 4;
CONST INT EVENT_CLOSE			= 5;
CONST INT EVENT_INIT			= 6;
CONST INT EVENT_SEL_PREV		= 7;
CONST INT EVENT_SEL_NEXT		= 8;

CONST INT CLOSE_ITEM			= 1;

CLASS C_MENU_ITEM
{
	VAR		STRING 	fontName;
	VAR		STRING 	text[MAX_USERSTRINGS];
	VAR		STRING 	backPic;
	VAR 	string 	alphaMode;
	VAR		INT    	alpha;
	VAR		INT    	type;
	VAR		INT    	onSelAction[MAX_SEL_ACTIONS];
	VAR		STRING 	onSelAction_S[MAX_SEL_ACTIONS];
	var		STRING 	onChgSetOption;
	VAR		STRING 	onChgSetOptionSection;

	var		FUNC   	onEventAction[MAX_EVENTS];
	var		INT    	posx,posy;
	// VAR		INT    	txtPosX,txtPosY;		// txt offset position in virtual coords relativ to this item	
	VAR		INT    	dimx,dimy;		// -1 = AUTODETECT (FONTWISE)
	VAR		FLOAT  	sizeStartScale;
	VAR		INT    	flags;
	VAR 	FLOAT  	openDelayTime;
	VAR 	FLOAT  	openDuration;
	VAR 	FLOAT  	userFloat [MAX_USERVARS];
	VAR 	string 	userString[MAX_USERVARS];	
	var		int		frameSizeX;
	var		int		frameSizeY;

}; 

CLASS C_MENU 
{
	VAR 	STRING 	backPic;
	VAR 	STRING 	backWorld;
	VAR 	INT    	posx,posy;
	VAR 	INT    	dimx,dimy;	
	// VAR     FLOAT  	sizeStartScale;
	VAR 	INT    	alpha;
	VAR		STRING 	musicTheme;
	VAR		INT    	eventTimerMSec;
	VAR 	STRING 	items[MAX_ITEMS];
	VAR		INT    	flags;	
	var		int 	defaultOutGame;	
	var		int 	defaultInGame;		
};

PROTOTYPE C_MENU_ITEM_DEF(C_MENU_ITEM)
{
	fontName 		= 	MENU_FONT_DEFAULT;
	text			=	"";
	alphaMode		=	"BLEND";
	alpha			=	254;			// NOTE: Must be under 255 to support chroma keying, chroma color is black
	type			=	MENU_ITEM_TEXT;
	posx			=	0;
	posy			=	0;
	dimx			=	-1;			// -1 = AUTODETECT
	dimy			=	-1;			// -1 = AUTODETECT
	flags			=	IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE;
	
	openDelayTime	=	0;
	openDuration	=	-1;	
	
	sizeStartScale  = 	1;
	
	userFloat[0]    =	100;	
	userFloat[1]	=	200;
	
	onSelAction[0]			= 	SEL_ACTION_BACK;
	onChgSetOption  		=	"";
	onChgSetOptionSection 	= "INTERNAL";
	
	frameSizeX		= 0;
	frameSizeY		= 0;
};

PROTOTYPE C_MENU_DEF(C_MENU)
{
//	backWorld	=	"cutscenes\INTRO.zen";
	posx		=	0;
	posy		=	0;
	dimx		=	8191;
	dimy		= 	8191;	
	alpha		=	254;			// NOTE: Must be under 255 to support chroma keying, chroma color is black
	items[0]	=	"ITEM_BACK";
	flags		=	MENU_EXCLUSIVE|MENU_DONTSCALE_DIM|MENU_ALIGN_CENTER;
	eventTimerMSec	=	1000;			// 1 second cycle with EVENT_TIMER
	musicTheme	=	"";	
	defaultOutGame	= -1;		// no item is default
	defaultInGame	= -1;		// no item is default	
};


