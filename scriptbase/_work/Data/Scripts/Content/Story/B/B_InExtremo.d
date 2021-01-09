//#############################################################################################
//
//	InExtremo
//	---------
//	Enthält alle Funktionen zum Vor- und Nachbereiten des InExtremo-Auftritts.
//
//#############################################################################################

func void B_InsertInExtremo()
{
	Wld_InsertNpc				(InExtremo_DrPymonte,		"OCR_IE_PYMONTE");	//MHARP
	Wld_InsertNpc				(InExtremo_TheFlail,		"OCR_IE_FLAIL");	//DRUM
	Wld_InsertNpc				(InExtremo_ThomasTheForger,	"OCR_IE_THOMAS");	//MCELLO
	Wld_InsertNpc				(InExtremo_Unicorn,			"OCR_IE_UNICORN"); 	//MLUTE
	Wld_InsertNpc				(InExtremo_YellowPfeiffer,	"OCR_IE_PFEIFFER");	//MPIPE
	Wld_InsertNpc				(InExtremo_Lutter,			"OCR_IE_LUTTER");	//MDRUMSCHEIT
	Wld_InsertNpc				(InExtremo_Flex,			"OCR_IE_FLEX");		//M2PIPE
	Wld_InsertNpc				(IE_397_Announcer,			"OCR_AUDIENCE_02");
	Wld_InsertNpc				(Charlotte,					"OCR_AUDIENCE_03");

	Wld_InsertNpc				(IEFan1,					"OCR_CROWD_01");
	Wld_InsertNpc				(IEFan2,					"OCR_CROWD_02");
	Wld_InsertNpc				(IEFan3,					"OCR_CROWD_03");
	Wld_InsertNpc				(IEFan4,					"OCR_CROWD_04");


};

func void B_KillInExtremo()
{
	B_ExchangeRoutine			(InExtremo_DrPymonte,		"off");	
	B_ExchangeRoutine			(InExtremo_TheFlail,		"off");	
	B_ExchangeRoutine			(InExtremo_ThomasTheForger,	"off");	
	B_ExchangeRoutine			(InExtremo_Unicorn,			"off"); 	
	B_ExchangeRoutine			(InExtremo_YellowPfeiffer,	"off");	
	B_ExchangeRoutine			(InExtremo_Lutter,			"off");	
	B_ExchangeRoutine			(InExtremo_Flex,			"off");		
	B_ExchangeRoutine			(IE_397_Announcer,			"off"); 
	B_ExchangeRoutine			(Charlotte,					"off"); 

	B_ExchangeRoutine			(IEFan1,					"off"); 
	B_ExchangeRoutine			(IEFan2,					"off"); 
	B_ExchangeRoutine			(IEFan3,					"off"); 
	B_ExchangeRoutine			(IEFan4,					"off"); 


	B_ExchangeRoutine			(Vlk_580_Grim,				"start");
};

func void B_InExtremoStartMusic()
{
//	Um die Musikzone zu aktivieren (damit die OC-Musik um die Bühne herum nicht zu hören ist, solange IE spielen!)
	Wld_SendTrigger ("INEXTREMO_IE");

// SoundVob zu aktivieren, der das Musikstück spielt
	Wld_SendTrigger ("INEXTREMO_MUSIK");

	InExtremoPlaying = TRUE;
};

func void B_InExtremoStopMusic()
{
// Sound-Vob deaktivieren, der das Musikstück spielt
	Wld_SendUnTrigger ("INEXTREMO_MUSIK");

// Um die Musikzone zu deaktivieren (OC-Musik-Zone wieder aktiv)
	Wld_SendUnTrigger ("INEXTREMO_IE");

	InExtremoPlaying = FALSE;
};


