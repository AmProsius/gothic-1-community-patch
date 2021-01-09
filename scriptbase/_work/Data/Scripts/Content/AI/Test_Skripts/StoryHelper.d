INSTANCE SH(NPC_DEFAULT)
// PlayerInstanz
{
	//-------- primary data --------
	name 			= "StoryHelper";
	Npctype			= Npctype_Main;
	guild			= GIL_NONE;
	level			= 10;
	voice			= 15;
	id				= 0;
	

	//-------- visuals --------
	// 						animations
	Mdl_SetVisual		(self,"HUMANS.MDS");
	//						Body-Mesh			Body-Tex	Skin-Color	Head-MMS    		Head-Tex	Teeth-Tex 	Armor-Tex
	Mdl_SetVisualBody (self,"hum_body_Naked0",	4,			1,			"Hum_Head_Pony",	9, 			0,			-1);
	
	//-------- ai ----------
	start_aistate = ZS_SH_Hangaround;
};

func void ZS_SH_Hangaround ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_SH_Hangaround");

	Npc_PercEnable  	(self,	PERC_ASSESSTALK,	B_AssessTalk		);
};

func void ZS_SH_Hangaround_Loop ()
{
	PrintDebugNpc	(PD_ZS_LOOP,	"ZS_SH_Hangaround_Loop");
};

func void ZS_SH_Hangaround_End ()
{
	PrintDebugNpc	(PD_ZS_FRAME,	"ZS_SH_Hangaround_End");
};

//***************************************************************************
//	Rahmen-Infos
//***************************************************************************
instance  StoryHelper_Exit (C_INFO)
{
	npc			=  SH;
	nr			=  999;
	condition	=  StoryHelper_Exit_Condition;
	information	=  StoryHelper_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = "ENDE";
};                       

FUNC int  StoryHelper_Exit_Condition()
{
	return 1;
};

FUNC VOID  StoryHelper_Exit_Info()
{
	AI_StopProcessInfos	( self );
};



//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
INSTANCE StoryHelper_INFO2 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO2_Condition;
	information		= StoryHelper_INFO2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 2"; 
};

FUNC INT StoryHelper_INFO2_Condition()
{		
	return TRUE;
};

func VOID StoryHelper_INFO2_Info()
{

	Info_ClearChoices	( StoryHelper_INFO2 );
	
	Info_AddChoice		( StoryHelper_INFO2, "ZURÜCK"			                			, StoryHelper_BACK2);
	Info_AddChoice		( StoryHelper_INFO2, "II:  Vorbereitung für die Beschwörung"		, StoryHelper_PrepareRitual );
	Info_AddChoice		( StoryHelper_INFO2, "II:  Hole den Almanach"						, StoryHelper_CorKalom_BringBook_RUNNING );
	Info_AddChoice		( StoryHelper_INFO2, "II:  Hole die MCQ-Eier"						, StoryHelper_CorKalom_BringMCQBalls_RUNNING );
	Info_AddChoice		( StoryHelper_INFO2, "II:  Bringe Fokus zu Cor Kalom"				, StoryHelper_YBerion_BringFocus_SUCCESS );
	Info_AddChoice		( StoryHelper_INFO2, "II:  Kapitelanfang"							, StoryHelper_Chapter2Start );
};

//---------------------------------------------------------------------
//	Kapitelanfang
//---------------------------------------------------------------------
func void StoryHelper_Chapter2Start()
{
	
	//-------- was davor geschah --------	

	//-------- was neu geschieht --------	
	B_Kapitelwechsel		(2);
	
	//-------- Menü --------	
	Info_ClearChoices		(StoryHelper_INFO2);
	AI_StopProcessInfos		(self);
};

//---------------------------------------------------------------------
//	Bringe Fokus zu Cor Kalom
//---------------------------------------------------------------------
func void StoryHelper_YBerion_BringFocus_SUCCESS()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel		(2);

	//-------- was neu geschieht --------	
	CreateInvItem			(hero, Focus_1);
	YBerion_BringFocus 		= LOG_SUCCESS;

	//-------- Menü --------	
	Info_ClearChoices		(StoryHelper_INFO2 );
	AI_StopProcessInfos		(self);
};

//---------------------------------------------------------------------
//	Hole die MCQ-Eier
//---------------------------------------------------------------------
func void StoryHelper_CorKalom_BringMCQBalls_RUNNING()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel		(2);
	YBerion_BringFocus 		= LOG_SUCCESS;

	//-------- was neu geschieht --------	
	GUR_1201_CorKalom_WEG_ACCEPT();				// Log-Entry anlegen!
	CorKalom_BringMCQBalls 	= LOG_RUNNING;

	//-------- Menü --------	
	Info_ClearChoices		(StoryHelper_INFO2);
	AI_StopProcessInfos		(self);
};  

//---------------------------------------------------------------------
//	Hole den Almanach
//---------------------------------------------------------------------
func void StoryHelper_CorKalom_BringBook_RUNNING()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel		(2);
	YBerion_BringFocus 		= LOG_SUCCESS;

	//-------- was neu geschieht --------	
	CorKalom_BringMCQBalls 	= LOG_SUCCESS;
	CorKalom_BringBook 		= LOG_RUNNING;

	//-------- Menü --------	
	Info_ClearChoices		(StoryHelper_INFO2 );
	AI_StopProcessInfos		(self);
};  

//---------------------------------------------------------------------
//	Vorbereitung auf die große Beschwörung
//---------------------------------------------------------------------
func void StoryHelper_PrepareRitual()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel		(2);
	YBerion_BringFocus 		= LOG_SUCCESS;
	CorKalom_BringMCQBalls 	= LOG_SUCCESS;

	//-------- was neu geschieht --------	
	CorKalom_BringBook 		= LOG_SUCCESS;
	B_Story_PrepareRitual	();

	//-------- Menü --------	
	Info_ClearChoices		(StoryHelper_INFO2 );
	AI_StopProcessInfos		(self);
};  

//-------- ZURÜCK ---------
func void StoryHelper_BACK2()
{
	Info_ClearChoices	( StoryHelper_INFO2 );
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################
INSTANCE StoryHelper_INFO3 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO3_Condition;
	information		= StoryHelper_INFO3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 3"; 
};

FUNC INT StoryHelper_INFO3_Condition()
{		
	return TRUE;
};

func void StoryHelper_INFO3_Info()
{
	Info_ClearChoices	( StoryHelper_INFO3 );
	
	Info_AddChoice		( StoryHelper_INFO3, DIALOG_BACK						, StoryHelper_BACK3 );
	Info_AddChoice		( StoryHelper_INFO3, "III: Saturas  - 4 Foki holen"		, StoryHelper_SaturasBringFoci_RUNNING);
	Info_AddChoice		( StoryHelper_INFO3, "III: CorAngar - zum NC gehen"		, StoryHelper_CorAngar_SendToNC);
	Info_AddChoice		( StoryHelper_INFO3, "III: BaalLukor - besiegt"			, StoryHelper_BaalLukor_DEFEAT);
	Info_AddChoice		( StoryHelper_INFO3, "III: Bereit für den Ork-Friedhof"	, StoryHelper_OrcGraveyard);
};

//---------------------------------------------------------------------
//	Bereit für den Ork-Friedhof
//---------------------------------------------------------------------
func void StoryHelper_OrcGraveyard()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel		(2);
	B_Story_PrepareRitual	();

	//-------- was neu geschieht --------	
	B_Kapitelwechsel		(3);
	B_Story_GotoOrcGraveyard();
	
	//-------- Menü --------	
	Info_ClearChoices	(StoryHelper_INFO3);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	BaalLukor - besiegt
//---------------------------------------------------------------------
func void StoryHelper_BaalLukor_DEFEAT()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel		(2);
	B_Story_PrepareRitual	();
	B_Kapitelwechsel		(3);
	B_Story_GotoOrcGraveyard();

	//-------- was neu geschieht --------	
	BaalLukor_BringParchment = 4;
	
	//-------- Menü --------	
	Info_ClearChoices	( StoryHelper_INFO3 );
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	CorAngar - zum NC gehen
//---------------------------------------------------------------------
func void StoryHelper_CorAngar_SendToNC()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel		(2);
	B_Story_PrepareRitual	();
	B_Kapitelwechsel		(3);
	B_Story_GotoOrcGraveyard();

	//-------- was neu geschieht --------	
	B_Story_BackFromOrcGraveyard();
	CreateInvItem			(hero,	focus_1);
	CreateInvItem			(hero,	ItWrFokusbuch);
	B_Story_SentToNC		();
	
	//-------- Menü --------	
	Info_ClearChoices	( StoryHelper_INFO3 );
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Saturas  - 4 Foki holen
//---------------------------------------------------------------------
func void StoryHelper_SaturasBringFoci_RUNNING()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel			(2);
	B_Story_PrepareRitual		();
	B_Kapitelwechsel			(3);
	B_Story_GotoOrcGraveyard	();
	B_Story_BackFromOrcGraveyard();
	B_Story_SentToNC			();

	//-------- was neu geschieht --------	
	B_Story_BringFoci			();

	//-------- Menü --------	
	Info_ClearChoices			(StoryHelper_INFO3);
	AI_StopProcessInfos			(self);
};

//-------- ZURÜCK ---------
func void StoryHelper_BACK3()
{
	Info_ClearChoices			(StoryHelper_INFO3);
};




//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################
INSTANCE StoryHelper_INFO4 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO4_Condition;
	information		= StoryHelper_INFO4_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 4"; 
};

FUNC INT StoryHelper_INFO4_Condition()
{		
	return TRUE;
};

func void StoryHelper_INFO4_Info()
{
	Info_ClearChoices	( StoryHelper_INFO4 );
	
	Info_AddChoice		( StoryHelper_INFO4, "ZURÜCK"										, StoryHelper_BACK4 );
	Info_AddChoice		( StoryHelper_INFO4, "IV:  Suche Teile für Ulu-Mulu"				, StoryHelper_SearchForUluMulu);
	Info_AddChoice		( StoryHelper_INFO4, "IV:  Bereit für Angriff auf die Freie Mine"	, StoryHelper_AttackFreeMine);
	Info_AddChoice		( StoryHelper_INFO4, "IV:  Xardas  - Finde Ork Schamanen"			, StoryHelper_XardasFindOrcShaman);
	Info_AddChoice		( StoryHelper_INFO4, "IV:  Xardas  - Erste Begegnung"				, StoryHelper_XardasIntro);
	Info_AddChoice		( StoryHelper_INFO4, "IV:  Saturas - Finde Xardas"					, StoryHelper_SaturasFindXardas);
	Info_AddChoice		( StoryHelper_INFO4, "IV:  Diego   - Freie Mine wurde überfallen"	, StoryHelper_FreeMineAmbush);
	Info_AddChoice		( StoryHelper_INFO4, "IV:  Saturas - Feuermagier holen"				, StoryHelper_SaturasBringFoci_SUCCESS);
};


//---------------------------------------------------------------------
//	Saturas  - Feuermagier holen
//---------------------------------------------------------------------
func void StoryHelper_SaturasBringFoci_SUCCESS()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel			(2);
	B_Story_PrepareRitual		();
	B_Kapitelwechsel			(3);
	B_Story_GotoOrcGraveyard	();
	B_Story_BackFromOrcGraveyard();
	B_Story_SentToNC			();
	B_Story_BringFoci			();

	//-------- was neu geschieht --------	
	B_Story_BroughtFoci			();
	B_KapitelWechsel			(4);

	//-------- Menü --------	
	Info_ClearChoices			(StoryHelper_INFO4);
	AI_StopProcessInfos			(self);
};

//---------------------------------------------------------------------
//	Diego - Freie Mine überfallen
//---------------------------------------------------------------------
func void StoryHelper_FreeMineAmbush()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel			(2);
	B_Story_PrepareRitual		();
	B_Kapitelwechsel			(3);
	B_Story_GotoOrcGraveyard	();
	B_Story_BackFromOrcGraveyard();
	B_Story_SentToNC			();
	B_Story_BringFoci			();
	B_Story_BroughtFoci			();
	B_KapitelWechsel			(4);

	//-------- was neu geschieht --------	
	B_Story_FMTaken				();

	//-------- Menü --------	
	Info_ClearChoices			(StoryHelper_INFO4);
	AI_StopProcessInfos			(self);
};

//---------------------------------------------------------------------
//	Saturas - Finde Xardas
//---------------------------------------------------------------------
func void StoryHelper_SaturasFindXardas()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel			(2);
	B_Story_PrepareRitual		();
	B_Kapitelwechsel			(3);
	B_Story_GotoOrcGraveyard	();
	B_Story_BackFromOrcGraveyard();
	B_Story_SentToNC			();
	B_Story_BringFoci			();
	B_Story_BroughtFoci			();
	B_KapitelWechsel			(4);
	B_Story_FMTaken				();

	//-------- was neu geschieht --------	
	B_Story_CordsPost			();
	B_Story_FindXardas			();
	
	//-------- Menü --------	
	Info_ClearChoices			(StoryHelper_INFO4);
	AI_StopProcessInfos			(self);
};

//---------------------------------------------------------------------
//	Xardas - Erste Begegnung
//---------------------------------------------------------------------
func void StoryHelper_XardasIntro()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel			(2);
	B_Story_PrepareRitual		();
	B_Kapitelwechsel			(3);
	B_Story_GotoOrcGraveyard	();
	B_Story_BackFromOrcGraveyard();
	B_Story_SentToNC			();
	B_Story_BringFoci			();
	B_Story_BroughtFoci			();
	B_KapitelWechsel			(4);
	B_Story_FMTaken				();
	B_Story_CordsPost			();
	B_Story_FindXardas			();

	//-------- was neu geschieht --------	
	B_Story_AccessToXardas		();
	
	//-------- Menü --------	
	Info_ClearChoices			(StoryHelper_INFO4);
	AI_StopProcessInfos			(self);
};

//---------------------------------------------------------------------
//	Xardas - Finde den Ork Schamanen
//---------------------------------------------------------------------
func void StoryHelper_XardasFindOrcShaman()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel			(2);
	B_Story_PrepareRitual		();
	B_Kapitelwechsel			(3);
	B_Story_GotoOrcGraveyard	();
	B_Story_BackFromOrcGraveyard();
	B_Story_SentToNC			();
	B_Story_BringFoci			();
	B_Story_BroughtFoci			();
	B_KapitelWechsel			(4);
	B_Story_FMTaken				();
	B_Story_CordsPost			();
	B_Story_FindXardas			();
	B_Story_AccessToXardas		();

	//-------- was neu geschieht --------	
	B_Story_FindOrcShaman		();
		
	//-------- Menü --------	
	Info_ClearChoices			(StoryHelper_INFO4);
	AI_StopProcessInfos			(self);
};

//---------------------------------------------------------------------
//	Bereit für Angriff auf die Freie Mine
//---------------------------------------------------------------------
func void StoryHelper_AttackFreeMine()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel			(2);
	B_Story_PrepareRitual		();
	B_Kapitelwechsel			(3);
	B_Story_GotoOrcGraveyard	();
	B_Story_BackFromOrcGraveyard();
	B_Story_SentToNC			();
	B_Story_BringFoci			();
	B_Story_BroughtFoci			();
	B_KapitelWechsel			(4);
	B_Story_FMTaken				();
	B_Story_CordsPost			();
	B_Story_FindXardas			();
	B_Story_AccessToXardas		();
	B_Story_FindOrcShaman		();

	//-------- was neu geschieht --------	
	B_Story_FoundUrShak			();
	B_Story_FriendOfUrShak		();
	B_Story_ReturnedFromUrShak		();
			
	//-------- Menü --------	
	Info_ClearChoices			(StoryHelper_INFO4);
	AI_StopProcessInfos			(self);
};

//---------------------------------------------------------------------
//	Suche Teile für Ulu-Mulu
//---------------------------------------------------------------------
func void StoryHelper_SearchForUluMulu()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel			(2);
	B_Story_PrepareRitual		();
	B_Kapitelwechsel			(3);
	B_Story_GotoOrcGraveyard	();
	B_Story_BackFromOrcGraveyard();
	B_Story_SentToNC			();
	B_Story_BringFoci			();
	B_Story_BroughtFoci			();
	B_KapitelWechsel			(4);
	B_Story_FMTaken				();
	B_Story_CordsPost			();
	B_Story_FindXardas			();
	B_Story_AccessToXardas		();
	B_Story_FindOrcShaman		();
	B_Story_FoundUrShak			();
	B_Story_FriendOfUrShak		();
	B_Story_ReturnedFromUrShak	();

	//-------- was neu geschieht --------	
	B_Story_CancelFindXardas	();
	B_Story_GornJoins			();
	Knows_GetMCPlates = 		TRUE;
	B_Story_JackalFight			();
	B_Story_FoundOrcSlave		();
	B_Story_CuredOrc			();
	B_Story_LeftFM				();
				
	//-------- Menü --------	
	Info_ClearChoices			(StoryHelper_INFO4);
	AI_StopProcessInfos			(self);
};

//-------- ZURÜCK ---------
func void StoryHelper_BACK4()
{
	Info_ClearChoices			(StoryHelper_INFO4);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################
INSTANCE StoryHelper_INFO5 (C_INFO)
{
	npc				= SH;
	condition		= StoryHelper_INFO5_Condition;
	information		= StoryHelper_INFO5_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kapitel 5"; 
};

FUNC INT StoryHelper_INFO5_Condition()
{		
	return TRUE;
};

func void StoryHelper_INFO5_Info()
{
	Info_ClearChoices	( StoryHelper_INFO5 );
	
	Info_AddChoice		( StoryHelper_INFO5, "ZURÜCK"									, StoryHelper_BACK5 );
	Info_AddChoice		( StoryHelper_INFO5, "V:  URIZIEL ist aufgeladen"				, StoryHelper_UrizielLoaded);
	Info_AddChoice		( StoryHelper_INFO5, "V:  Bereit für das Laden von URIZIEL"		, StoryHelper_LoadUriziel);
	Info_AddChoice		( StoryHelper_INFO5, "V:  Erforsche den versunkenen Turm"		, StoryHelper_ExploreSunkenTower);
	Info_AddChoice		( StoryHelper_INFO5, "V:  Uriziel gefunden"						, StoryHelper_FoundUriziel);
	Info_AddChoice		( StoryHelper_INFO5, "V:  Bereit für die Ork-Stadt"				, StoryHelper_ReadyForOrcCity);
};

//---------------------------------------------------------------------
//	Bereit für die Ork-Stadt
//---------------------------------------------------------------------
func void StoryHelper_ReadyForOrcCity()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel				(2);
	B_Story_PrepareRitual			();
	B_Kapitelwechsel				(3);
	B_Story_GotoOrcGraveyard		();
	B_Story_BackFromOrcGraveyard	();
	B_Story_SentToNC				();
	B_Story_BringFoci				();
	B_Story_BroughtFoci				();
	B_KapitelWechsel				(4);
	B_Story_FMTaken					();
	B_Story_CordsPost				();
	B_Story_FindXardas				();
	B_Story_AccessToXardas			();
	B_Story_FindOrcShaman			();
	B_Story_FoundUrShak				();
	B_Story_FriendOfUrShak			();
	B_Story_ReturnedFromUrShak		();
	B_Story_CancelFindXardas		();
	B_Story_GornJoins				();
	Knows_GetMCPlates = 			TRUE;
	B_Story_JackalFight				();
	B_Story_FoundOrcSlave			();
	B_Story_CuredOrc				();
	B_Story_LeftFM					();

	//-------- was neu geschieht --------	
	B_Story_GotUluMulu				();
	B_Kapitelwechsel				(5);
	CreateInvItem					(hero, CRW_ARMOR_H);
					
	//-------- Menü --------	
	Info_ClearChoices				(StoryHelper_INFO5);
	AI_StopProcessInfos				(self);
};

//---------------------------------------------------------------------
//	Uriziel gefunden
//---------------------------------------------------------------------
func void StoryHelper_FoundUriziel()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel				(2);
	B_Story_PrepareRitual			();
	B_Kapitelwechsel				(3);
	B_Story_GotoOrcGraveyard		();
	B_Story_BackFromOrcGraveyard	();
	B_Story_SentToNC				();
	B_Story_BringFoci				();
	B_Story_BroughtFoci				();
	B_KapitelWechsel				(4);
	B_Story_FMTaken					();
	B_Story_CordsPost				();
	B_Story_FindXardas				();
	B_Story_AccessToXardas			();
	B_Story_FindOrcShaman			();
	B_Story_FoundUrShak				();
	B_Story_FriendOfUrShak			();
	B_Story_ReturnedFromUrShak		();
	B_Story_CancelFindXardas		();
	B_Story_GornJoins				();
	Knows_GetMCPlates = 			TRUE;
	B_Story_JackalFight				();
	B_Story_FoundOrcSlave			();
	B_Story_CuredOrc				();
	B_Story_LeftFM					();
	B_Story_GotUluMulu				();
	B_Kapitelwechsel				(5);
	CreateInvItem					(hero, CRW_ARMOR_H);

	//-------- was neu geschieht --------	
	EnteredTemple =					TRUE;
	B_Story_FoundUriziel			();
	B_Story_EncounteredHighPriest	();
	B_Story_ShowedUrizielToXardas	();
						
	//-------- Menü --------	
	Info_ClearChoices				(StoryHelper_INFO5);
	AI_StopProcessInfos				(self);
};

//---------------------------------------------------------------------
//	Erforsche den versunkenen Turm
//---------------------------------------------------------------------
func void StoryHelper_ExploreSunkenTower()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel				(2);
	B_Story_PrepareRitual			();
	B_Kapitelwechsel				(3);
	B_Story_GotoOrcGraveyard		();
	B_Story_BackFromOrcGraveyard	();
	B_Story_SentToNC				();
	B_Story_BringFoci				();
	B_Story_BroughtFoci				();
	B_KapitelWechsel				(4);
	B_Story_FMTaken					();
	B_Story_CordsPost				();
	B_Story_FindXardas				();
	B_Story_AccessToXardas			();
	B_Story_FindOrcShaman			();
	B_Story_FoundUrShak				();
	B_Story_FriendOfUrShak			();
	B_Story_ReturnedFromUrShak		();
	B_Story_CancelFindXardas		();
	B_Story_GornJoins				();
	Knows_GetMCPlates = 			TRUE;
	B_Story_JackalFight				();
	B_Story_FoundOrcSlave			();
	B_Story_CuredOrc				();
	B_Story_LeftFM					();
	B_Story_GotUluMulu				();
	B_Kapitelwechsel				(5);
	CreateInvItem					(hero, CRW_ARMOR_H);
	EnteredTemple =					TRUE;
	B_Story_FoundUriziel			();
	B_Story_EncounteredHighPriest	();
	B_Story_ShowedUrizielToXardas	();

	//-------- was neu geschieht --------	
	B_Story_ExploreSunkenTower		();
							
	//-------- Menü --------	
	Info_ClearChoices				(StoryHelper_INFO5);
	AI_StopProcessInfos				(self);
};

//---------------------------------------------------------------------
//	Bereit für das Laden von URIZIEL
//---------------------------------------------------------------------
func void StoryHelper_LoadUriziel()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel				(2);
	B_Story_PrepareRitual			();
	B_Kapitelwechsel				(3);
	B_Story_GotoOrcGraveyard		();
	B_Story_BackFromOrcGraveyard	();
	B_Story_SentToNC				();
	B_Story_BringFoci				();
	B_Story_BroughtFoci				();
	B_KapitelWechsel				(4);
	B_Story_FMTaken					();
	B_Story_CordsPost				();
	B_Story_FindXardas				();
	B_Story_AccessToXardas			();
	B_Story_FindOrcShaman			();
	B_Story_FoundUrShak				();
	B_Story_FriendOfUrShak			();
	B_Story_ReturnedFromUrShak		();
	B_Story_CancelFindXardas		();
	B_Story_GornJoins				();
	Knows_GetMCPlates = 			TRUE;
	B_Story_JackalFight				();
	B_Story_FoundOrcSlave			();
	B_Story_CuredOrc				();
	B_Story_LeftFM					();
	B_Story_GotUluMulu				();
	B_Kapitelwechsel				(5);
	CreateInvItem					(hero, CRW_ARMOR_H);
	EnteredTemple =					TRUE;
	B_Story_FoundUriziel			();
	B_Story_EncounteredHighPriest	();
	B_Story_ShowedUrizielToXardas	();
	B_Story_ExploreSunkenTower		();

	//-------- was neu geschieht --------	
	CreateInvItem					(hero, ORE_ARMOR_M);
	CreateInvItem					(hero, ItArRuneTeleport1);	// zu den Feuermagiern
	B_Story_LoadSword				();
								
	//-------- Menü --------	
	Info_ClearChoices				(StoryHelper_INFO5);
	AI_StopProcessInfos				(self);
};

//---------------------------------------------------------------------
//	URIZIEL ist aufgeladen
//---------------------------------------------------------------------
func void StoryHelper_UrizielLoaded()
{
	//-------- was davor geschah --------	
	B_Kapitelwechsel				(2);
	B_Story_PrepareRitual			();
	B_Kapitelwechsel				(3);
	B_Story_GotoOrcGraveyard		();
	B_Story_BackFromOrcGraveyard	();
	B_Story_SentToNC				();
	B_Story_BringFoci				();
	B_Story_BroughtFoci				();
	B_KapitelWechsel				(4);
	B_Story_FMTaken					();
	B_Story_CordsPost				();
	B_Story_FindXardas				();
	B_Story_AccessToXardas			();
	B_Story_FindOrcShaman			();
	B_Story_FoundUrShak				();
	B_Story_FriendOfUrShak			();
	B_Story_ReturnedFromUrShak		();
	B_Story_CancelFindXardas		();
	B_Story_GornJoins				();
	Knows_GetMCPlates = 			TRUE;
	B_Story_JackalFight				();
	B_Story_FoundOrcSlave			();
	B_Story_CuredOrc				();
	B_Story_GotUluMulu				();
	B_Kapitelwechsel				(5);
	CreateInvItem					(hero, CRW_ARMOR_H);
	EnteredTemple =					TRUE;
	B_Story_FoundUriziel			();
	B_Story_EncounteredHighPriest	();
	B_Story_ShowedUrizielToXardas	();
	B_Story_ExploreSunkenTower		();
	CreateInvItem					(hero, ORE_ARMOR_M);
	CreateInvItem					(hero, ItArRuneTeleport1);	// zu den Feuermagiern
	B_Story_LoadSword				();

	//-------- was neu geschieht --------	
	B_Kapitelwechsel				(6);
	B_Story_UrizielLoaded			();
								
	//-------- Menü --------	
	Info_ClearChoices				(StoryHelper_INFO5);
	AI_StopProcessInfos				(self);
};










//-------- ZURÜCK ---------
func void StoryHelper_BACK5()
{
	Info_ClearChoices		(StoryHelper_INFO5);
};

