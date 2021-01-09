// *********************************************************************
// video options menu
// *********************************************************************

INSTANCE MENU_OPT_VIDEO(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	
	items[0]		= "MENUITEM_VID_HEADLINE";
	
	items[1]		= "MENUITEM_VID_DEVICE";	
	items[2]		= "MENUITEM_VID_DEVICE_CHOICE";
	
	items[3]		= "MENUITEM_VID_RESOLUTION";	
	items[4]		= "MENUITEM_VID_RESOLUTION_CHOICE";
		
	items[5]		= "MENUITEM_VID_BRIGHTNESS";
	items[6]		= "MENUITEM_VID_BRIGHTNESS_SLIDER";		
	
	items[7]		= "MENUITEM_VID_CONTRAST";
	items[8]		= "MENUITEM_VID_CONTRAST_SLIDER";		
	
	items[9]		= "MENUITEM_VID_GAMMA";
	items[10]		= "MENUITEM_VID_GAMMA_SLIDER";		
	
	items[11]		= "MENUITEM_VID_BACK";	
		
	flags = flags | MENU_SHOW_INFO;
};



INSTANCE MENUITEM_VID_HEADLINE(C_MENU_ITEM_DEF) 
{
	text[0]		=	"VIDEO SETTINGS";
	type		=	MENU_ITEM_TEXT;
	// Position und Dimension	
	posx		=	0;		posy		=	MENU_TITLE_Y;
	dimx		=	8100;
	
	flags		= flags & ~IT_SELECTABLE;
	flags		= flags | IT_TXT_CENTER;
};


//
// Device
//

INSTANCE MENUITEM_VID_DEVICE(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Video Card";
	text[1]		=	"Gothic must be restarted for this option!"; // Kommentar
	
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*0;
	dimx		=	3000;	dimy		=	600;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	// Weitere Eigenschaften	
	flags		= flags | IT_EFFECTS_NEXT;
};

INSTANCE MENUITEM_VID_DEVICE_CHOICE(C_MENU_ITEM_DEF)
{
	text[0]		= "";
	backPic		= MENU_CHOICE_BACK_PIC;
	type		= MENU_ITEM_CHOICEBOX;	
	fontName	= MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 3700;		posy		=	MENU_START_Y + MENU_DY*0 +  MENU_CHOICE_YPLUS;
	dimx 		= 3700;		dimy		= 	MENU_CHOICE_DY;
	// Aktionen
	onChgSetOption			= "zVidDevice";
	onChgSetOptionSection 	= "VIDEO";	
	onEventAction[EVENT_INIT] 	= Update_VideoOptions;
	// Weitere Eigenschaften	
	flags		= flags & ~IT_SELECTABLE;
	flags 		= flags  | IT_TXT_CENTER | IT_NEEDS_RESTART;
};

//
// Resolution
//

INSTANCE MENUITEM_VID_RESOLUTION(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Resolution";
	text[1]		= "Confirm resolution by pressing ENTER."; // Kommentar
	
	// Position und Dimension	
	posx		= 1000;		posy		= MENU_START_Y + MENU_DY*1;
	dimx		= 2700;		dimy		= 600;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;	
	onEventAction[EVENT_EXECUTE]= Apply_VideoResolution;
	// Weitere Eigenschaften
	flags			= flags | IT_EFFECTS_NEXT;
};

INSTANCE MENUITEM_VID_RESOLUTION_CHOICE(C_MENU_ITEM_DEF)
{
	text[0]		= "";
	backPic		= MENU_CHOICE_BACK_PIC;
	type		= MENU_ITEM_CHOICEBOX;	
	fontName	= MENU_FONT_SMALL;
	// Position und Dimension	
	posx		= 3700;		posy		=	MENU_START_Y + MENU_DY*1 + MENU_CHOICE_YPLUS;
	dimx 		= 3700;		dimy		= 	MENU_CHOICE_DY;		
	// Aktionen
	onChgSetOption			= "vidResIndex";
	onChgSetOptionSection 	= "INTERNAL";			
	// Eigenschaften
	flags		= flags & ~IT_SELECTABLE;
	flags 		= flags | IT_TXT_CENTER | IT_NEEDS_APPLY;
};

//
// Brightness
//

instance MENUITEM_VID_BRIGHTNESS(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Brightness";
	text[1]		= "Brightness"; // Kommentar
	
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*3;
	dimx		=	2700;	dimy		=	600;
	
	onSelAction[0]  = SEL_ACTION_UNDEF;
	flags			= flags | IT_EFFECTS_NEXT;
};


INSTANCE MENUITEM_VID_BRIGHTNESS_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;
	type		=	MENU_ITEM_SLIDER;	
	// Position und Dimension	
	posx		=	3700;	posy		= MENU_START_Y + MENU_DY*3 + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX; 	dimy		= MENU_SLIDER_DY;
	// Aktionen	
	onChgSetOption			= "zVidBrightness";
	onChgSetOptionSection 	= "VIDEO";	
	// Weitere Eigenschaften	
	userFloat[0]	= 35;
	userString[0]	= MENU_SLIDER_POS_PIC;
	flags		= flags & ~IT_SELECTABLE;
};

//
// CONTRAST
//

instance MENUITEM_VID_CONTRAST(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Contrast";
	text[1]		= "Contrast"; // Kommentar
	
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*4;
	dimx		=	2700;	dimy		=	600;
	
	onSelAction[0]  = SEL_ACTION_UNDEF;
	flags			= flags | IT_EFFECTS_NEXT;
};


INSTANCE MENUITEM_VID_CONTRAST_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;
	type		=	MENU_ITEM_SLIDER;	
	// Position und Dimension	
	posx		=	3700;	posy		= MENU_START_Y + MENU_DY*4 + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX; 	dimy		= MENU_SLIDER_DY;
	// Aktionen	
	onChgSetOption			= "zVidContrast";
	onChgSetOptionSection 	= "VIDEO";	
	// Weitere Eigenschaften	
	userFloat[0]	= 35;
	userString[0]	= MENU_SLIDER_POS_PIC;
	flags		= flags & ~IT_SELECTABLE;
};

//
// Gamma
//

instance MENUITEM_VID_GAMMA(C_MENU_ITEM_DEF)
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Gamma";
	text[1]		= "Gamma"; // Kommentar
	
	// Position und Dimension	
	posx		=	1000;	posy		=	MENU_START_Y + MENU_DY*5;
	dimx		=	2700;	dimy		=	600;
	
	onSelAction[0]  = SEL_ACTION_UNDEF;
	flags			= flags | IT_EFFECTS_NEXT;
};


INSTANCE MENUITEM_VID_GAMMA_SLIDER(C_MENU_ITEM_DEF)
{
	backPic		=	MENU_SLIDER_BACK_PIC;
	type		=	MENU_ITEM_SLIDER;	
	// Position und Dimension	
	posx		=	3700;	posy		= MENU_START_Y + MENU_DY*5 + MENU_SLIDER_YPLUS;
	dimx = MENU_SLIDER_DX; 	dimy		= MENU_SLIDER_DY;
	// Aktionen	
	onChgSetOption			= "zVidGamma";
	onChgSetOptionSection 	= "VIDEO";	
	// Weitere Eigenschaften	
	userFloat[0]	= 35;
	userString[0]	= MENU_SLIDER_POS_PIC;
	flags		= flags & ~IT_SELECTABLE;
};



INSTANCE MENUITEM_VID_BACK(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Back";
	// Position und Dimension	
	posx		=	1000;		posy		=	MENU_BACK_Y;
	dimx		=	6192;		dimy		=	MENU_DY;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;		
	flags = flags | IT_TXT_CENTER;
};



// -------------------------------------------------------------------
// Functions
// -------------------------------------------------------------------

func int Update_VideoOptions()
{
	Update_ChoiceBox("MENUITEM_VID_DEVICE_CHOICE");
	Update_ChoiceBox("MENUITEM_VID_RESOLUTION_CHOICE");	
	return 1;
};

func int Apply_VideoResolution()
{
	Apply_Options_Video();
	return 0;
};
