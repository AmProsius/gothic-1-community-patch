//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_OrcShaman_EXIT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	nr			= 999;
	condition	= Info_OrcShaman_EXIT_Condition;
	information	= Info_OrcShaman_EXIT_Info;
	important	= 0;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC int  Info_OrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_OrcShaman_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info THX
//---------------------------------------------------------------------
instance  Info_OrcShaman_THX (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_THX_Condition;
	information	= Info_OrcShaman_THX_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_THX_Condition()
{
	if	(Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC void  Info_OrcShaman_THX_Info()
{
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Dank schulden, Fremder.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Böse Orks töten wollen mich.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Alte Brüder seien heute Feinde.
};

//---------------------------------------------------------------------
//	Info WHO
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHO_Condition;
	information	= Info_OrcShaman_WHO_Info;
	important	= 0;
	permanent	= 0;
	description = "Wer bist du?";
};

FUNC int  Info_OrcShaman_WHO_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHO_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //Wer bist du?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Name Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Seien Sohn von Geist. Menschen nennen Schamane.
};

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance  Info_OrcShaman_TONGUE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_TONGUE_Condition;
	information	= Info_OrcShaman_TONGUE_Info;
	important	= 0;
	permanent	= 0;
	description = "Woher kannst du unsere Sprache?";
};

FUNC int  Info_OrcShaman_TONGUE_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_TONGUE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Woher kannst du unsere Sprache?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak gewesen Sklave bei Menschen in Mine.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Seien gelaufen weg. Seien viiiele Winter her.
};

//---------------------------------------------------------------------
//	Info MINE
//---------------------------------------------------------------------
instance  Info_OrcShaman_MINE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MINE_Condition;
	information	= Info_OrcShaman_MINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Du warst Sklave in der Mine? In welcher Mine?";
};

FUNC int  Info_OrcShaman_MINE_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_TONGUE))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MINE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //Du warst Sklave in der Mine? In welcher Mine?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Mine gewesen mit Dorf in Kessel darüber.
};

//---------------------------------------------------------------------
//	Info WHY
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHY_Condition;
	information	= Info_OrcShaman_WHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Warum kämpfen deine Stammesbrüder gegen dich?";
};

FUNC int  Info_OrcShaman_WHY_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Warum kämpfen deine Stammesbrüder gegen dich?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak gefallen in Ungnade.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Haben beschmutzt Ehrfurcht vor KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //Glauben, KRUSHAK seien böser Dämon.
};

//---------------------------------------------------------------------
//	Info KRUSHAK
//---------------------------------------------------------------------
instance  Info_OrcShaman_KRUSHAK (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_KRUSHAK_Condition;
	information	= Info_OrcShaman_KRUSHAK_Info;
	important	= 0;
	permanent	= 0;
	description = "Was heißt KRUSHAK?";
};

FUNC int  Info_OrcShaman_KRUSHAK_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_WHY))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_KRUSHAK_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //Was heißt KRUSHAK?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Menschen sagen SCHLAFEN.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Du meinst "Schläfer"?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Ja, Menschen sagen SCHLÄFER!
};

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_OrcShaman_SLEEPER (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SLEEPER_Condition;
	information	= Info_OrcShaman_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Was weißt du über den Schläfer?";
};

FUNC int  Info_OrcShaman_SLEEPER_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_KRUSHAK))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Was weißt du über den Schläfer?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //Fünf Brüder seien gewesen. Seien viiiiele Winter vorher!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Waren Söhne von Geist wie Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Fünf Schamanen also!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Haben gerufen KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Haben besiegen wollen Klan von Feind!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Fünf Brüder von damals haben gebaut Tempel in Erde für KRUSHAK!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Ein unterirdischer Tempel zu Ehren des Schläfers! Das muss Xardas gemeint haben mit 'unter der Ork-Stadt'!
};

//---------------------------------------------------------------------
//	Info CURSE
//---------------------------------------------------------------------
instance  Info_OrcShaman_CURSE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_CURSE_Condition;
	information	= Info_OrcShaman_CURSE_Info;
	important	= 0;
	permanent	= 0;
	description = "Was passierte dann im Tempel unter der Erde?";
};

FUNC int  Info_OrcShaman_CURSE_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_SLEEPER))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_CURSE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Was passierte dann im Tempel unter der Erde?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Brüder von damals haben gegeben Herz für KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Aber KRUSHAK gewesen böse. KRUSHAK verfluchen alle, die bauen Tempel.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Brüder ohne Herz nun seien tot und lebendig. Seien beides.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK haben Herz von Brüder. Herz seien Kraft für KRUSHAK.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Was passierte mit den Arbeitern, die den Tempel erbauten?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK verfluchen alle. Auch die gewesen Arbeiter. Seien allen tot und lebendig.
};

//---------------------------------------------------------------------
//	Info OUTSIDE
//---------------------------------------------------------------------
instance  Info_OrcShaman_OUTSIDE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OUTSIDE_Condition;
	information	= Info_OrcShaman_OUTSIDE_Info;
	important	= 0;
	permanent	= 0;
	description = "Haben die Orks an der Oberfläche nichts unternommen?";
};

FUNC int  Info_OrcShaman_OUTSIDE_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_CURSE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OUTSIDE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //Haben die Orks an der Oberfläche nichts unternommen?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Haben verschlossen Tempel. Brüder von heute anbeten KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK bekommen Opfer, damit nicht werden böse.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak Opfer finden falsch. Haben gesagt KRUSHAK böse.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Brüder wollen nicht hören. Brüder sagen Ur-Shak gehen. Brüder schlagen Ur-Shak.
};

//---------------------------------------------------------------------
//	Info INTEMPLE
//---------------------------------------------------------------------
instance  Info_OrcShaman_INTEMPLE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_INTEMPLE_Condition;
	information	= Info_OrcShaman_INTEMPLE_Info;
	important	= 0;
	permanent	= 0;
	description = "Ich muss in den unterirdischen Tempel!";
};

FUNC int  Info_OrcShaman_INTEMPLE_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OUTSIDE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_INTEMPLE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Ich muss in den unterirdischen Tempel! Kannst du mich dorthin bringen?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak sagen Dank zu Fremder. Fremder retten Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Aber Eingang von Tempel in Heimat. Ur-Shak nicht können gehen Heimat.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Ur-Shak glauben
};

//---------------------------------------------------------------------
//	Info MAP
//---------------------------------------------------------------------
instance  Info_OrcShaman_MAP (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MAP_Condition;
	information	= Info_OrcShaman_MAP_Info;
	important	= 0;
	permanent	= 0;
	description = "Kannst du mir sagen, wo auf meiner Karte hier die Orkstadt ist?";
};

FUNC int  Info_OrcShaman_MAP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE)
	&&	Npc_HasItems (hero, ItWrWorldmap)
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MAP_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Kannst du mir sagen, wo auf meiner Karte hier die Orkstadt ist?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Heimat von Ur-Shak seien, wo Karte nicht bemalt.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Fremder geben Karte, dann Ur-Shak machen Karte fertig!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //Erstaunlich, du bist ein guter Kartenzeichner. Danke!

	B_GiveInvItems  (hero, self, ItWrWorldmap, 1);
	Npc_RemoveInvItem(self, ItWrWorldmap);
	CreateInvItem	 (self, ItWrWorldmap_Orc);
	B_GiveInvItems  (self, hero, ItWrWorldmap_Orc, 1);
};

//---------------------------------------------------------------------
//	Info FIGHT
//---------------------------------------------------------------------
instance  Info_OrcShaman_FIGHT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FIGHT_Condition;
	information	= Info_OrcShaman_FIGHT_Info;
	important	= 0;
	permanent	= 0;
	description = "Nun, dann muss ich mir den Weg wohl freikämpfen!";
};

FUNC int  Info_OrcShaman_FIGHT_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FIGHT_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Nun, dann muss ich mir den Weg wohl freikämpfen!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Brüder in Heimat seien sehr stark! Brüder seien seeeehr viele!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Fremder nicht gehen. Viele Krieger! Fremder sterben!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Andere Söhne von Geist in Heimat. Machen Fremder Feuer, dann Fremder sterben!
};

//---------------------------------------------------------------------
//	Info OTHERWAY
//---------------------------------------------------------------------
instance  Info_OrcShaman_OTHERWAY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OTHERWAY_Condition;
	information	= Info_OrcShaman_OTHERWAY_Info;
	important	= 0;
	permanent	= 0;
	description = "Okay, okay, aber ich muss einen Weg in den Tempel finden!";
};

FUNC int  Info_OrcShaman_OTHERWAY_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_FIGHT))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OTHERWAY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Okay, okay, aber ich muss einen Weg in den Tempel finden!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak kennen Weg! Fremder tragen ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU??? Was ist ein Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //Seien Standarte der Freundschaft! Brüder respektieren ULU-MULU!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Fremder tragen ULU-MULU, dann Fremder nicht sterben!
};

//---------------------------------------------------------------------
//	Info ULUMULU
//---------------------------------------------------------------------
instance  Info_OrcShaman_ULUMULU (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ULUMULU_Condition;
	information	= Info_OrcShaman_ULUMULU_Info;
	important	= 0;
	permanent	= 0;
	description = "Wo bekomme ich ein solches Ulu-Mulu her?";
};

FUNC int  Info_OrcShaman_ULUMULU_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OTHERWAY))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_ULUMULU_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //Wo bekomme ich ein solches Ulu-Mulu her?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Fremder gehen zu Freund von Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Freund von Ur-Shak geben ULU-MULU! Fremder tragen ULU-MULU, dann Fremder nicht sterben!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //Ja, ja, das mit dem 'nicht sterben' habe ich verstanden, aber wo finde ich deinen Freund?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Freund von Ur-Shak seien in Mine von Menschen. Freund damals nicht laufen weg mit Ur-Shak. Freund damals gewesen krank.

	B_Story_FoundUrShak	();

	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU, "Warst du in der Freien Mine gefangen?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU, "Warst du in der Verlassenen Mine gefangen?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU, "Warst du in der Alten Mine gefangen?",										Info_OrcShaman_ULUMULU_AM);
};

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Warst du in der verlassenen Mine gefangen?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak nicht kennen Wort.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //Warst du in der Alten Mine gefangen?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nicht verstehen!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //Warst du in der Freien Mine gefangen?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak gefangen in Mine unter Dorf in Kessel.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak glauben, Menschen nennen so!

	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
};

//---------------------------------------------------------------------
//	Info BYEBYE
//---------------------------------------------------------------------
instance  Info_OrcShaman_BYEBYE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_BYEBYE_Condition;
	information	= Info_OrcShaman_BYEBYE_Info;
	important	= 0;
	permanent	= 0;
	description = "Danke für deine Hilfe!";
};

FUNC int  Info_OrcShaman_BYEBYE_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_ULUMULU))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_BYEBYE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Danke für deine Hilfe!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak danken Fremder. Fremder retten Ur-Shak. Fremder nun Freund von Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Freund nehmen Geschenk. Nehmen Talismann von Ur-Shak! Talisman schützen vor Atem von Feuerwaran!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nicht können gehen Heimat. Ur-Shak nun hier wohnen! Freund kommen, wenn brauchen Hilfe!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Vielleicht werde ich auf dein Angebot zurückkommen!

	B_Story_FriendOfUrShak	();

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info FRIENDLYHELLO
//---------------------------------------------------------------------
instance  Info_OrcShaman_FRIENDLYHELLO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FRIENDLYHELLO_Condition;
	information	= Info_OrcShaman_FRIENDLYHELLO_Info;
	important	= 0;
	permanent	= 0;
	description = "Wie geht es dir, mein Freund?";
};

FUNC int  Info_OrcShaman_FRIENDLYHELLO_Condition()
{
	if	Npc_KnowsInfo(hero, Info_OrcShaman_BYEBYE)
	&&	FriendOfUrShak
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FRIENDLYHELLO_Info()
{
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Wie geht es dir, mein Freund?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak seien gesund!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak suchen eigenes ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Vielleicht Ur-Shak gehen Heimat mit eigenes ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Freund kommen, wenn brauchen Hilfe!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Pass auf dich auf!
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info ORCCITY
//---------------------------------------------------------------------
instance  Info_OrcShaman_ORCCITY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ORCCITY_Condition;
	information	= Info_OrcShaman_ORCCITY_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_ORCCITY_Condition()
{
	if	(Npc_GetDistToWP(hero, "SPAWN_OW_WARAN_ORC_01")<1000)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_ORCCITY_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(hero, self);

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak grüßen Freund!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //Freund haben ULU-MULU! Seien gut!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //Freund nicht vergessen tragen ULU-MULU in Hand, wenn gehen über Brücke!
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //Freund haben kein ULU-MULU! Nicht gut!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Freund nicht gehen über Brücke, sonst sterben!
	};
};

//---------------------------------------------------------------------
//	Info YOUHERE
//---------------------------------------------------------------------
instance  Info_OrcShaman_YOUHERE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_YOUHERE_Condition;
	information	= Info_OrcShaman_YOUHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Was machst du hier so nah am Dorf?";
};

FUNC int  Info_OrcShaman_YOUHERE_Condition()
{
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_YOUHERE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Was machst du hier so nah am Dorf?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak beobachten Brüder in Heimat!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak glauben, KRUSHAK bald aufwachen!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak hier warten und kämpfen gegen KRUSHAK, wenn erwacht!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Der Schläfer wird bald erwachen??? Ich hoffe, du liegst falsch!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Bei allem, was ich bisher über diesen Erzdämon gehört habe, ist er mir schlafend bedeutend lieber!
};

//---------------------------------------------------------------------
//	Info SEAL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SEAL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SEAL_Condition;
	information	= Info_OrcShaman_SEAL_Info;
	important	= 0;
	permanent	= 0;
	description = "Du erzähltest mir, dass deine Brüder den Tempel verschlossen haben!";
};

FUNC int  Info_OrcShaman_SEAL_Condition()
{
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SEAL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Bei unserem letzten Treffen erzähltest du, dass deine Brüder den Tempel verschlossen haben!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Brüder von Ur-Shak haben verschlossen Tempel in Erde sehr gut!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Freund nicht können gehen hinein!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Freund müssen benutzen Zauber von Brüder, die seien Söhne von Geist wie Ur-Shak!
};

//---------------------------------------------------------------------
//	Info SCROLL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SCROLL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SCROLL_Condition;
	information	= Info_OrcShaman_SCROLL_Info;
	important	= 0;
	permanent	= 0;
	description = "Wo finde ich diesen Zauber?";
};

FUNC int  Info_OrcShaman_SCROLL_Condition()
{
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SEAL)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SCROLL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Wo finde ich diesen Zauber?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Müssen gehen in Höhle von Brüder, die seien Söhne von Geist wie Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Aber Freund müssen aufpassen, wenn benutzen Zauber!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Brüder von Ur-Shak nicht mögen! ULU-MULU nicht helfen, wenn Freund benutzen Zauber!

	B_LogEntry		(CH4_EnterTemple,	"Ich habe den Schamanen Ur-Shak vor der Orkstadt wiedergetroffen. Er verriet mir, dass ich nur mithilfe eines orkischen Zauberspruches in die Vorhalle des unterirdischen Tempels gelangen kann. Die anderen Ork-Schamanen bewahren solche Zauber in ihrer Höhle auf.");
};

//---------------------------------------------------------------------
//	Info IDOL
//---------------------------------------------------------------------
instance  Info_OrcShaman_IDOL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_IDOL_Condition;
	information	= Info_OrcShaman_IDOL_Info;
	important	= 0;
	permanent	= 0;
	description = "Gibt es noch einen anderen Weg in den Tempel?";
};

FUNC int  Info_OrcShaman_IDOL_Condition()
{
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SCROLL)
	&&	!OrcCity_Sanctum_OuterGateOpen
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_IDOL_Info()
{
	//SN: fliegt raus, da der Hinweis jetzt sofort nach dem Hinweis mit der Scroll gegeben wird.
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle lässt sich nicht öffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01)
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Freund haben gefunden Figur auf Säule!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Freund nun können öffnen Tor zu Tempelhalle!

		B_LogEntry	(CH4_EnterTemple,	"Es gibt noch einen weiteren Weg in den Tempel. Ich muss die Schläferfigur von der heiligen Säule der Orkschamanen benutzen. Sie öffnet das Tor zum Tempel.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Freund müssen nehmen Figur von große Säule!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figur öffnen Tor zu Tempelhalle!

		B_LogEntry	(CH4_EnterTemple,	"Es gibt noch einen weiteren Weg in den Tempel zu gelangen. Auf der heiligen Säule der Orkschamanen steht eine Schläferfigur, die das Tor zum Tempel öffnet. Allerdings werden Ur-Shak's Brüder wenig begeistert sein, wenn sie bemerken, dass ich mich ihrer heiligen Ikone bediene.");
	};
};

