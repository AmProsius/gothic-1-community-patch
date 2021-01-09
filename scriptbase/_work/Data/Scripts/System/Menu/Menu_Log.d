instance MENU_LOG(C_MENU_DEF) 
{
	items[0]		= "MENU_ITEM_SEL_MISSIONS_ACT";		
	items[1]		= "MENU_ITEM_SEL_MISSIONS_OLD";
	items[2]		= "MENU_ITEM_SEL_MISSIONS_FAILED";	
	items[3]		= "MENU_ITEM_SEL_LOG";

	items[4]		= "MENU_ITEM_DAY_TITLE";
	items[5]		= "MENU_ITEM_TIME_TITLE";
	items[6]		= "MENU_ITEM_DAY";
	items[7]		= "MENU_ITEM_TIME";
	
	items[8]		= "MENU_ITEM_LIST_MISSIONS_ACT";
	items[9]		= "MENU_ITEM_LIST_MISSIONS_FAILED";
	items[10]		= "MENU_ITEM_LIST_MISSIONS_OLD";	
	items[11]		= "MENU_ITEM_LIST_LOG";	
	
	items[12]		= "MENU_ITEM_CONTENT_VIEWER";
	alpha			= 255;
	posx			= 0;
	posy			= 0;
	dimx			= 8191;
	dimy			= 8191;
	backPic			= LOG_BACK_PIC;
	flags			= flags|MENU_OVERTOP|MENU_NOANI;	
};

//
// Menüpunkte
//

const int LOG_ITEM_X1 	= 1200;
const int LOG_ITEM_DX1 	= 1800;

const int LOG_ITEM_LIST_X 		= 3000;
const int LOG_ITEM_LIST_Y 		= 1000;
const int LOG_ITEM_LIST_HEIGHT 	= 6100;
const int LOG_ITEM_LIST_WIDTH	= 4500;

INSTANCE MENU_ITEM_SEL_MISSIONS_ACT(C_MENU_ITEM_DEF)
{
	text[0]		=	"Current\nMissions";
	posx		=	LOG_ITEM_X1;
	posy		=   	1500;
	dimx 		= 	LOG_ITEM_DX1;
	dimy		=   	1000;
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE|IT_MULTILINE|IT_TXT_CENTER;	
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_MISSIONS_ACT";	
};

INSTANCE MENU_ITEM_SEL_MISSIONS_OLD(C_MENU_ITEM_DEF)
{
	text[0]		=	"Completed\nMissions";
	
	posx		=	LOG_ITEM_X1;
	posy		=   	2500;
	dimx 		= 	LOG_ITEM_DX1;
	dimy		=   	1000;
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE|IT_MULTILINE|IT_TXT_CENTER;	
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_MISSIONS_OLD";		
};


INSTANCE MENU_ITEM_SEL_MISSIONS_FAILED(C_MENU_ITEM_DEF)
{
	text[0]		=	"Failed\nMissions";
	
	posx		=	LOG_ITEM_X1;
	posy		=   	3500;
	dimx 		= 	LOG_ITEM_DX1;
	dimy		=   	1000;	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE|IT_MULTILINE|IT_TXT_CENTER;	
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_MISSIONS_FAILED";		
};


INSTANCE MENU_ITEM_SEL_LOG(C_MENU_ITEM_DEF)
{
	text[0]		=	"General\nInfo";
	
	posx		=	LOG_ITEM_X1;
	posy		=   	4500;
	dimx 		= 	LOG_ITEM_DX1;
	dimy		=   	1000;
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE|IT_MULTILINE|IT_TXT_CENTER;	
	
	onSelAction[0]	=	SEL_ACTION_EXECCOMMANDS;
	onSelAction_S[0]=	"EFFECTS MENU_ITEM_LIST_LOG";		
};


//
// Listen
//

instance MENU_ITEM_LIST_MISSIONS_ACT(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_LISTBOX;	
	text[0]		= 	"Act Missions";
	
	posx		=	LOG_ITEM_LIST_X;
	posy		=   LOG_ITEM_LIST_Y;
	dimx 		= 	LOG_ITEM_LIST_WIDTH;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_EFFECTS_NEXT;
	flags		= 	flags & ~IT_SELECTABLE;	
	flags		= 	flags & ~IT_TXT_CENTER;	
	userString[0]	=	"CURRENTMISSIONS";	
	
	frameSizeX	= 	250;
	frameSizeY	= 	0;
};

instance MENU_ITEM_LIST_MISSIONS_FAILED(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_LISTBOX;	
	text[0]		= 	"Old Missions";
	
	posx		=	LOG_ITEM_LIST_X;
	posy		=   LOG_ITEM_LIST_Y;
	dimx 		= 	LOG_ITEM_LIST_WIDTH;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_EFFECTS_NEXT;	
	flags		= 	flags & ~IT_SELECTABLE;
	flags		= 	flags & ~IT_TXT_CENTER;	
	userString[0]	=	"OLDMISSIONS";
	
	frameSizeX	= 	250;
	frameSizeY	= 	0;
};

instance MENU_ITEM_LIST_MISSIONS_OLD(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_LISTBOX;	
	text[0]		= 	"Failed Missions";
	
	posx		=	LOG_ITEM_LIST_X;
	posy		=   LOG_ITEM_LIST_Y;
	dimx 		= 	LOG_ITEM_LIST_WIDTH;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_EFFECTS_NEXT;	
	flags		= 	flags & ~IT_SELECTABLE;
	flags		= 	flags & ~IT_TXT_CENTER;	
	userString[0]	=	"FAILEDMISSIONS";
		
	frameSizeX	= 	250;
	frameSizeY	= 	0;
};

instance MENU_ITEM_LIST_LOG(C_MENU_ITEM_DEF)
{
	type		= 	MENU_ITEM_LISTBOX;	
	text[0]		= 	"Log";
	
	posx		=	LOG_ITEM_LIST_X;
	posy		=   LOG_ITEM_LIST_Y;
	dimx 		= 	LOG_ITEM_LIST_WIDTH;
	dimy		=	LOG_ITEM_LIST_HEIGHT;
	
	fontName	=	LOG_FONT_DEFAULT;
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_EFFECTS_NEXT;	
	flags		= 	flags & ~IT_SELECTABLE;
	flags		= 	flags & ~IT_TXT_CENTER;		
	userString[0]	=	"LOG";
	
	frameSizeX	= 	250;
	frameSizeY	= 	0;
};

//
// Content-Viewer
//

INSTANCE MENU_ITEM_CONTENT_VIEWER(C_MENU_ITEM_DEF)
{
	text[0]		=	"no content";
	
	posx		=	0;
	posy		=   0;	
	dimx 		= 	8192;
	dimy		=   8192;
	fontName	=	LOG_FONT_VIEWER;
	
	flags		=	flags|IT_CHROMAKEYED|IT_TRANSPARENT|IT_MULTILINE;
	flags		= 	flags & ~IT_SELECTABLE;	
	
	frameSizeX	= 	800;
	frameSizeY	= 	1000;
	
	backPic		=   LOG_VIEWER_BACK_PIC;
};

INSTANCE MENU_ITEM_DAY_TITLE(C_MENU_ITEM_DEF)
{
	text[0]		= 	"Day";
	posx 		= 	1800; // see dimx of MENU_ITEM_DAY!!
	posy		= 	6000;
	fontName	=	LOG_FONT_DATETIME;
	flags		= 	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_TIME_TITLE(C_MENU_ITEM_DEF)
{
	text[0]		= 	"Time:";
	posx 		= 	1500;
	posy		= 	6300;
	fontName	=	LOG_FONT_DATETIME;
	flags		= 	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_DAY(C_MENU_ITEM_DEF)
{	
	text[0]		=	"XX.";
	posx 		= 	1500;
	posy		= 	6000;
	dimx		=	300;
	fontName	=	LOG_FONT_DATETIME;
	flags		= 	flags & ~IT_SELECTABLE;
};

INSTANCE MENU_ITEM_TIME(C_MENU_ITEM_DEF)
{
	text[0]		= 	"XX:XX";
	posx 		= 	2200;
	posy		= 	6300;
	fontName	=	LOG_FONT_DATETIME;
	flags		= 	flags & ~IT_SELECTABLE;
};
