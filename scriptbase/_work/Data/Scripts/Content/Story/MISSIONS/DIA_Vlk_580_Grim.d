// **************************************************
// 						 EXIT
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				FALLE (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Falle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Falle_Condition;
	information		= DIA_Grim_Falle_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grim_Falle_Condition()
{
	if	(Grim_ProtectionBully == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Falle_Info()
{
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Hey, du! Du bist doch der Typ, der hier im Lager aufgenommen werden will?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //Und wenn es so wäre?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Ich könnte dir dabei helfen ...
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //Und wie?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Draußen vorm Lager sitzen zwei Typen rum, von denen einer die Erzbarone bestohlen hat. Es ist ein wertvolles Amulett, das mit dem letzten Konvoi gekommen sein sollte.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Einer von ihnen müsste das Amulett noch haben. Wenn wir beide auf sie draufgehen, schaffen wir sie - alleine kann ich's nicht machen. Was sagst du?

	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Kein Interesse - such dir einen anderen."	,DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Was passiert, wenn wir das Amulett haben?"	,DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"Ich bin dabei!"							,DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //Kein Interesse - such dir einen anderen.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //Mit der Einstellung kommst du hier nicht weit - sag mir Bescheid, falls du's dir doch noch überlegen solltest!
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //Was passiert, wenn wir das Amulett haben?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //Ganz einfach! Ich geb's zurück und kassier die Belohnung - dabei sag' ich, dass du mir geholfen hast. Damit hast du bei Gomez 'nen Stein in Brett.

	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Kein Interesse - such dir einen anderen."	,DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Wir machen Halbe-Halbe! Oder du kannst dich alleine mit den Typen anlegen!"	,DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"Ich bin dabei!"							,DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Nein! Wir machen halbe-halbe! Oder du kannst dich alleine mit den Typen anlegen!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Okay, okay, halbe-halbe. Wird schon genug dabei rausspringen. Also - bist du dabei?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //Ich bin dabei!
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //Gut, sag Bescheid, sobald wir losgehen können!
	Info_ClearChoices	(DIA_Grim_Falle );
};

// **************************************************
// 				Bereit für Falle
// **************************************************

INSTANCE DIA_Grim_ReadyToGo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_ReadyToGo_Condition;
	information		= DIA_Grim_ReadyToGo_Info;
	permanent		= 0;
	description		= "Ich bin bereit, mit dir zu gehen - lass uns das Amulett holen!";
};

FUNC INT DIA_Grim_ReadyToGo_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_ReadyToGo_Info()
{
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Ich bin bereit, mit dir zu gehen - lass uns das Amulett holen!
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Gut! Dann wollen wir mal ...

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				OC DRAUSSEN ANGEKOMMEN
// **************************************************

instance  DIA_Grim_AtOCdraussen(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 3;
	condition	= DIA_Grim_AtOCdraussen_Condition;
	information	= DIA_Grim_AtOCdraussen_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC int  DIA_Grim_AtOCdraussen_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo)) && (Npc_GetDistToWp (hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500 )
	{
		return 1;
	};
};

FUNC VOID  DIA_Grim_AtOCdraussen_Info()
{
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //So, hier sind wir. Schön weit weg von deinem Freund Diego.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Wir sollen dir schöne Grüße von Bloodwyn bestellen!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Ich soll dir schöne Grüße von Bloodwyn bestellen ...
	};

	AI_StopProcessInfos	(self);

	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");

	var C_NPC Bu520; Bu520 = Hlp_GetNpc(Vlk_520_Buddler);
	var C_NPC Bu534; Bu534 = Hlp_GetNpc(Vlk_534_Buddler);

	if ( (Npc_GetDistToNpc(self,Bu520)<1000) && (!Npc_IsDead(Bu520)) )
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_ATTACK,1,"");
	};

	if ( (Npc_GetDistToNpc(self,Bu534)<1000) && (!Npc_IsDead(Bu534)) )
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_ATTACK,1,"");
	};
};

// **************************************************
// 				NACH Falle
// **************************************************

INSTANCE DIA_Grim_NACHFalle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_NACHFalle_Condition;
	information		= DIA_Grim_NACHFalle_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grim_NACHFalle_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen)) && (Npc_GetDistToNpc(self,other)<ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_NACHFalle_Info()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Du Penner wolltest mir also nur 'ne Falle stellen ...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Hey, Mann! Wir spielen beide dasselbe Spiel! Ich hab' auch keine Lust, in den Minen buddeln zu gehen.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Also werd' ich tun, was mir die Gardisten sagen, dann werde ich hier bald aufgenommen.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Dass ich ausgerechnet DIR aufs Maul hauen sollte, hast du dir im Grunde selber zuzuschreiben. Warum legst du dich auch mit den Gardisten an.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Persönlich hab' ich nichts gegen dich. Also was ist - Frieden oder weiterprügeln?

	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Weiterprügeln."	,DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Frieden."			,DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Mir ist eher nach Weiterprügeln!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Oh Mann, du schaffst mich ...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Frieden klingt gut.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Freut mich, dass du das Ganze durch meine Augen sehen kannst. Die Sache ist vergessen. Ab jetzt bin ich auf deiner Seite.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Wenn du noch mal Ärger haben solltest - kannst du auf mich zählen - schließlich schulde ich dir was.
	Info_ClearChoices	(DIA_Grim_NACHFalle );

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

// **************************************************
// 				Hallo
// **************************************************
	var int FirstOver;
// **************************************************

INSTANCE DIA_Grim_Hallo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 1;
	condition		= DIA_Grim_Hallo_Condition;
	information		= DIA_Grim_Hallo_Info;
	permanent		= 0;
	description		= "Ich bin neu hier!";
};

FUNC INT DIA_Grim_Hallo_Condition()
{
	if (Grim_ProtectionBully==TRUE)
	{
		FirstOver = TRUE;
	};

	if (FirstOver == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Hallo_Info()
{
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Ich bin neu hier!
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //Gerade angekommen, was? Ich bin Grim - bin auch noch nicht so lange da. Bin eine Fuhre vor dir mit reingeworfen worden.
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_Leben (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Leben_Condition;
	information		= DIA_Grim_Leben_Info;
	permanent		= 0;
	description		= "Wie ist das Leben hier so?";
};

FUNC INT DIA_Grim_Leben_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Wie ist das Leben hier so?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Ganz ruhig, so lange du dein Schutzgeld an die Gardisten bezahlst.
};

// **************************************************
// 						Aufnahme
// **************************************************

INSTANCE DIA_Grim_Aufnahme (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Aufnahme_Condition;
	information		= DIA_Grim_Aufnahme_Info;
	permanent		= 0;
	description		= "Was muss ich machen, wenn ich in dieses Lager aufgenommen werden will?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Was muss ich machen, wenn ich in diesem Lager aufgenommen werden will?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Also zuerst mal wirst du Schatten. Dazu musst du einen Fürsprecher finden. Jemand, der dir alles erklärt und für dich einsteht.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Ich an deiner Stelle würd' mich direkt an Diego halten - hab' ich auch gemacht - der ist ganz in Ordnung.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //Er stellt dir die Prüfung des Vertrauens - die sieht bei jedem anders aus. Dann gibt's noch einige kleinere Aufgaben von anderen Schatten.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Wenn du die gelöst hast, bist du dabei.
};

// **************************************************
// 						Wie weit bist DU?
// **************************************************
var int Grim_Tests;
// **************************************************

INSTANCE DIA_Grim_HowFarAreYou (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_HowFarAreYou_Condition;
	information		= DIA_Grim_HowFarAreYou_Info;
	permanent		= 1;
	description		= "Und - wie weit bist du mit deinen Prüfungen?";
};

FUNC INT DIA_Grim_HowFarAreYou_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_HowFarAreYou_Info()
{
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //Und - wie weit bist du mit deinen Prüfungen?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Ich hab' schon mit Dexter, Sly und Fingers geredet. Das sind einige der einflussreichsten Schatten hier im Lager.

	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC, "Einflussreiche Schatten sind Dexter, Sly und Fingers");
		Grim_Tests = TRUE;
	};
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_YourPDV (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 5;
	condition		= DIA_Grim_YourPDV_Condition;
	information		= DIA_Grim_YourPDV_Info;
	permanent		= 0;
	description		= "Was ist DEINE Prüfung des Vertrauens?";
};

FUNC INT DIA_Grim_YourPDV_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_YourPDV_Info()
{
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //Was ist DEINE Prüfung des Vertrauens?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //Das kann ich dir nicht sagen, Mann. Über solche Dinge musst du hier schweigen!
};



//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMO
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMO(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMO_Condition;
	information	= DIA_Grim_INEXTREMO_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC int  DIA_Grim_INEXTREMO_Condition()
{
	if	(Kapitel == 2)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMO_Info()
{
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Hey, hast du schon gehört?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //In Extremo ist hier. Sie sind drüben auf der Bühne.
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Schnell, sonst versäumst du noch den Auftritt!

	Npc_ExchangeRoutine	(self,	"InExtremo");

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMOAWAY
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMOAWAY(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMOAWAY_Condition;
	information	= DIA_Grim_INEXTREMOAWAY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Wo sind InExtremo?";
};

FUNC int  DIA_Grim_INEXTREMOAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Grim_INEXTREMO)
	&&	(Kapitel == 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Wo sind InExtremo?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Sie sind weitergezogen. Schade, ich hatte mich an die Abende vor der Bühne gewöhnt.

	AI_StopProcessInfos	(self);
};

