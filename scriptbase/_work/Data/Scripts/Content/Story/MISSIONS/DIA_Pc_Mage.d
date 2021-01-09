//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //Weiter geht's.
	}
	else
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //Wir sehen uns.
	};
	AI_StopProcessInfos	(self);
};

//*********************************************
//					First
//*********************************************

instance DIA_Milten_First (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_First_Condition;
	information	= DIA_Milten_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Milten_First_Condition()
{
	if ( (CorKalom_BringMCQBalls != LOG_SUCCESS) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) )
	&& (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

func VOID DIA_Milten_First_Info()
{
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Du darfst keinen Fuß über diese Schwelle setzen, es sei denn Meister Corristo gestattet es.
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello_Condition;
	information	= DIA_Milten_Hello_Info;
	permanent	= 0;
	description = "Ich suche den obersten Magier des Feuers.";
};                       

FUNC INT DIA_Milten_Hello_Condition()
{
	if (Saturas_BringFoci == FALSE) && (!Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Ich suche den obersten Magier des Feuers.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Das ist Corristo. Was willst du von ihm?
};

//*********************************************
//					GotoCorristo
//*********************************************
	
instance DIA_Milten_GotoCorristo (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_GotoCorristo_Condition;
	information	= DIA_Milten_GotoCorristo_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_GotoCorristo_Condition()
{
	if  ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	{
		return 1;
	};
};

func VOID DIA_Milten_GotoCorristo_Info()
{
	if ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) )
	{
		//***kopierte AI_outputs, falls SC Brief noch hat***
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Ich suche den obersten Magier des Feuers.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Das ist Corristo. Was willst du von ihm?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //Ich habe einen Brief für den obersten Feuermagier.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Zeig mir den Brief.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Hier ist er.
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Wie sieht's mit einer Belohnung aus?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //Das ist nicht mehr nötig.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Wir haben von deiner Leistung in der Alten Mine gehört. Ohne die Minecrawler ist der Erzabbau viel sicherer geworden.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Auch Corristo weiß davon. Er wünscht dich zu sprechen. Geh zu ihm.
};

//*********************************************
//				 Got Brief
//*********************************************
	var int milten_HasLetter;
//*********************************************

instance DIA_Milten_Letter (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Letter_Condition;
	information	= DIA_Milten_Letter_Info;
	permanent	= 0;
	description = "Ich habe einen Brief für den obersten Feuermagier.";
};                       

FUNC INT DIA_Milten_Letter_Condition()
{
	if	( (Npc_KnowsInfo(hero, DIA_Milten_Hello)) && ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) ) )
	&&	(Kapitel < 4) && (Saturas_BringFoci == FALSE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Letter_Info()
{
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //Ich habe einen Brief für den obersten Feuermagier.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Zeig mir den Brief.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Erst will ich meine Belohnung.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Hier ist er.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Hier ist er.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Das ist ein Brief an Xardas!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //Und was ist daran so aufregend?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas ist schon lange kein Diener Innos mehr. Vor einigen Jahren hat er uns verlassen und sich der schwarzen Magie zugewandt.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Er lebt in einem Turm mitten im Orkgebiet und widmet sich dort seinen Studien.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Er sagte, er wolle auf seine Art herausfinden, was mit der Barriere nicht stimmt.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Warte hier. Ich bin gleich wieder da.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");

	if		Npc_HasItems(other,ItWr_Fire_Letter_01)
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
	}
	else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
	};
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Erst will ich meine Belohnung.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo wird Torrez anweisen, sie dir zu geben, sobald er den Brief erhalten hat.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Ich bin ein Diener Innos - ich lüge niemals. Gib mir den Brief jetzt.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Ich möchte den Brief lieber Torrez direkt geben.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Hier ist er.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Ich möchte den Brief lieber Torrez direkt geben.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Du lässt nicht mit dir reden, hm?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //Nein. Ich will erst meine Belohnung sehen!
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Nun gut. Du willst es nicht anders. Warte hier.

	Info_ClearChoices	(DIA_Milten_Letter);
	AI_StopProcessInfos	(self);

	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};

//*********************************************
//				 Got Brief
//*********************************************

instance DIA_Milten_ComesBack (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_ComesBack_Condition;
	information	= DIA_Milten_ComesBack_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_ComesBack_Condition()
{
	if ( (Npc_KnowsInfo(hero, DIA_Milten_Letter)) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_ComesBack_Info()
{
	if (milten_HasLetter==FALSE)
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo war nicht sehr erfreut, dass du den Dienern Innos so wenig Vertrauen entgegen bringst.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Aber er sagt, du sollst zu Torrez gehen und dir die übliche Belohnung geben lassen.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo war ganz außer sich vor Freude. Er sagt, du kannst zu Torrez gehen und dir deine Belohnung selbst aussuchen.
	};
};

//*********************************************
//			Wo finde ich Torrez?
//*********************************************
	
instance DIA_Milten_WoTorrez (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_WoTorrez_Condition;
	information	= DIA_Milten_WoTorrez_Info;
	permanent	= 0;
	description	= "Wo finde ich Torrez?";
};                       

FUNC INT DIA_Milten_WoTorrez_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WoTorrez_Info()
{
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //Wo finde ich Torrez?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //Er ist den ganzen Tag draußen hier vorm Tempelgebäude.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //Nachts ist er wie alle anderen drinnen - aber nur Magier dürfen das Tempelhaus betreten. Also kannst du ihn nur tagsüber sprechen.
};

//*********************************************
//				Noch ein Brief
//*********************************************
	
instance DIA_Milten_NochEinBrief (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_NochEinBrief_Condition;
	information	= DIA_Milten_NochEinBrief_Info;
	permanent	= 0;
	description = "Ich habe da noch einen Brief von den Wassermagiern.";
};                       

FUNC INT DIA_Milten_NochEinBrief_Condition()
{
	if ( (Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_NochEinBrief_Info()
{
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //Ich habe da noch einen Brief von den Wassermagiern.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ah! Sehr gut! Ich werde ihn an Corristo weiterleiten.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Wenn du wieder im Neuen Lager bist, werden die Wassermagier dich sicherlich für deine Mühen belohnen.
	
	Cronos_Messenger = LOG_SUCCESS;
	B_GiveInvItems (other,self,Cronos_Brief,1);
};

//*********************************************
//					PERM
//*********************************************
	
instance DIA_Milten_PERM (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_PERM_Condition;
	information	= DIA_Milten_PERM_Info;
	permanent	= 0;
	description = "Erzähl mir was über die Feuermagier.";
};                       

FUNC INT DIA_Milten_PERM_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_PERM_Info()
{
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Erzähl mir was über die Feuermagier.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Der Kreis des Feuers bezieht seine Macht von der Gnade Innos. Der Gott des Lichts, der Wahrheit und der Gerechtigkeit wacht über uns.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //Die Magier betrachten sich selber als die Erwählten - und so behandeln sie auch alle anderen.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Ich hatte das Glück, damals aufgenommen zu werden. Corristo hat mich zu seinem Lehrling gemacht. Vermutlich hatte er einfach Lust auf Unterhaltung.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Seitdem bemühe ich mich jeden Tag, meine magischen Fähigkeiten zu steigern, damit ich in den nächsten Kreis aufgenommen werden kann.
};

//*********************************************
//					WannaMage
//*********************************************
	
instance DIA_Milten_WannaMage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_WannaMage_Condition;
	information	= DIA_Milten_WannaMage_Info;
	permanent	= 1;
	description = "Ich will ein Lehrling der Magier werden - so wie du.";
};                       

FUNC INT DIA_Milten_WannaMage_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Ich will ein Lehrling der Magier werden - so wie du.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo hat mich damals erwählt, weil ich eine besondere Sache für die Erzbarone erledigt habe.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Ohne dass du etwas Herausragendes leistest, wird er dich nicht als Lehrling in Betracht ziehen.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //Du mußt außerdem dem Alten Lager angehören. Ich kann mir nicht vorstellen, dass Corristo ein Mitglied eines anderen Lagers als Lehrling akzeptiert.
};





		
	







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info SHWAIT
//***************************************************************************
instance Info_Milten_SHWAIT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHWAIT_Condition;
	information	= Info_Milten_SHWAIT_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHWAIT_Condition()
{
	if ( Npc_GetDistToWP ( hero, "OW_PATH_274")<1000)
	{
		return 1;
	};	
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc		(self,hero);
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Sei gegrüßt! Mein Freund Lester aus dem Sumpflager hat mir von deinen großen Taten dort erzählt!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Ich bin beeindruckt. Du bist sehr stark geworden.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Man tut, was man kann.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Ja, ja, immer bescheiden, was?
};

//***************************************************************************
//	Info SHGORN
//***************************************************************************
instance Info_Milten_SHGORN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHGORN_Condition;
	information	= Info_Milten_SHGORN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ich habe Gorn getroffen";
};

FUNC int Info_Milten_SHGORN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //Ich habe Gorn getroffen.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //Wirklich? Wo?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //An der alten Klosterruine am Meer. Wir haben sie gemeinsam nach Schätzen durchsucht.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Davon wird er mir bei unserem nächsten Treffen bestimmt erzählen.
};

//***************************************************************************
//	Info SHLESTER
//***************************************************************************
instance Info_Milten_SHLESTER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLESTER_Condition;
	information	= Info_Milten_SHLESTER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Lester und ich haben die Bergfestung ausgenommen";
};

FUNC int Info_Milten_SHLESTER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, PC_Psionic_FINISH))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester und ich haben die Bergfestung ausgenommen.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Er hat mir davon erzählt. Du scheinst vertrauenswürdig zu sein.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Wo habt ihr vier euch bisher getroffen?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Ach, hier und da. Wir treffen uns an den verschiedensten Orten.
};

//***************************************************************************
//	Info SHYOU
//***************************************************************************
instance Info_Milten_SHYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHYOU_Condition;
	information	= Info_Milten_SHYOU_Info;
	important	= 0;
	permanent	= 0;
	description	= "Was machst du hier?";
};

FUNC int Info_Milten_SHYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT))
	{
		return 1;
	};	
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //Was machst du hier?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Nicht weit von hier befindet sich ein uraltes Stonehenge, in dessen Mitte der Eingang zu einem unterirdischen Gewölbe liegt.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Eine Art Gruft?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Ja, so was in der Richtung.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //In dieser Gruft gibt es etwas, das ich gerne haben würde.
};

//***************************************************************************
//	Info SHME
//***************************************************************************
instance Info_Milten_SHME (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHME_Condition;
	information	= Info_Milten_SHME_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ich suche nach einem Fokusstein.";
};

FUNC int Info_Milten_SHME_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_SHWAIT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	{
		return 1;
	};	
};

func void Info_Milten_SHME_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Ich suche nach einem Fokusstein. Er muss irgendwo hier in der Gegend sein.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Hört sich fast so an, als ob wir beide etwas am gleichen Ort suchen würden.
};

//***************************************************************************
//	Info SHPROBLEM
//***************************************************************************
instance Info_Milten_SHPROBLEM (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHPROBLEM_Condition;
	information	= Info_Milten_SHPROBLEM_Info;
	important	= 0;
	permanent	= 0;
	description	= "Warum gehst du nicht in die Gruft und holst dir was du suchst?";
};

FUNC int Info_Milten_SHPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHYOU))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Warum gehst du nicht in die Gruft und holst dir was du suchst?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Oh, das ist nicht so schnell erzählt. Dafür müsste ich etwas weiter ausholen.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Erzähl, ich habe Zeit !
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Nun gut! Nach der Erschaffung der magischen Barriere, die uns alle hier gefangen hält ...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //...hat einer der beteiligten Magier ein magisches Artefakt dort unten versiegelt.
};

//***************************************************************************
//	Info SHFOCUS
//***************************************************************************
instance Info_Milten_SHFOCUS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHFOCUS_Condition;
	information	= Info_Milten_SHFOCUS_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ist dieses Artefakt einer der fünf Fokussteine?";
};

FUNC int Info_Milten_SHFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Ist dieses Artefakt einer der fünf Fokussteine?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Genau! Dann kennst du die Geschichte der fünf Fokussteine wohl schon. 
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Jetzt sag bloß, du bist auch hinter diesem Fokus her?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //Nein. Der Fokusstein interessiert mich nicht. Ich suche einen orkischen Talisman.
};

//***************************************************************************
//	Info SHSEAL
//***************************************************************************
instance Info_Milten_SHSEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSEAL_Condition;
	information	= Info_Milten_SHSEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Das Artefakt wurde versiegelt?";
};

FUNC int Info_Milten_SHSEAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //Das Artefakt wurde versiegelt?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Ja. Ein mächtiger Bannzauber bewirkt, dass der erste Grabräuber, der sich den Fokus unter den Nagel reißen will ...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //... zu einem Dasein als ruheloser Untoter verflucht wird, der fortan diese Gruft vor allen nachfolgenden Grabräuber beschützen soll.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Wie kommst du dann an diesem Bannzauber vorbei?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //Das ist nicht mehr nötig.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Vor einigen Jahren war ein Erzbaron, der zum Zeitvertreib Orks jagte, unvorsichtig genug, die Gruft zu betreten.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Nun ist ER der Wächter über alle Schätze dort unten.
};

//***************************************************************************
//	Info SHTALISMAN
//***************************************************************************
instance Info_Milten_SHTALISMAN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHTALISMAN_Condition;
	information	= Info_Milten_SHTALISMAN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Was hat es mit diesem Talisman auf sich?";
};

FUNC int Info_Milten_SHTALISMAN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHFOCUS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //Was hat es mit diesem Talisman auf sich?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Ich vermute, sein ehemaliger Besitzer benutzte ihn, um sich wütende Orks vom Hals zu halten.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Wenn ich Recht habe, kann der Talisman von großem Nutzen sein.
};

//***************************************************************************
//	Info SHOFFER
//***************************************************************************
instance Info_Milten_SHOFFER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER_Condition;
	information	= Info_Milten_SHOFFER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Wir sollten die Gruft gemeinsam ausheben!";
};

FUNC int Info_Milten_SHOFFER_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSEAL)
	&&		Npc_KnowsInfo(hero, Info_Milten_SHTALISMAN)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //Wir sollten die Gruft gemeinsam ausheben! Du bekommst den Talisman und ich den Fokusstein.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //Einverstanden, aber da gibt es noch ein 'kleines' Problem ...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Ein Problem?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Ja. Der Wächter da unten in der Gruft ...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //Kann man ihn nicht in handliche Stücke zerlegen?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //Zumindest nicht so einfach. Er scheint gegen die Wirkung normaler Waffen extrem widerstandsfähig zu sein.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Lass mich raten, du hast bereits einen Plan dafür, richtig?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Ähem ... tja also ... einen Plan habe ich schon, aber ich kann ihn nicht alleine durchführen.
};

//***************************************************************************
//	Info SHOFFER2
//***************************************************************************
instance Info_Milten_SHOFFER2 (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER2_Condition;
	information	= Info_Milten_SHOFFER2_Info;
	important	= 0;
	permanent	= 0;
	description	= "Lass hören!";
};

FUNC int Info_Milten_SHOFFER2_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Lass hören!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //Ich habe hier eine Spruchrolle, die einen sehr mächtigen Zauber enthält.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //Der Zauber vernichtet jeden Untoten, der davon getroffen wird.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Damit sollte das Ausheben der Gruft ein Kinderspiel werden.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Tja ... also... nicht ganz! Der Wächter hat mittlerweile Gesellschaft bekommen.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Wahrscheinlich nachfolgende Grabräuber, die wenig erfolgreich waren.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Ich war bereits einmal dort unten und wäre fast getötet worden. Einer alleine kann da nicht viel ausrichten.
};

//***************************************************************************
//	Info SHACCEPT
//***************************************************************************
instance Info_Milten_SHACCEPT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHACCEPT_Condition;
	information	= Info_Milten_SHACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description	= "Gib mir die Spruchrolle und wir heben diese Gruft gemeinsam aus!";
};

FUNC int Info_Milten_SHACCEPT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER2)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Gib mir die Spruchrolle und wir heben diese Gruft gemeinsam aus!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Gut, sehr gut. Ich hoffte, du würdest das sagen!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Wir haben aber nur diese eine Spruchrolle. Benutze sie für den Wächter!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Die anderen Untoten kann man auch im normalen Kampf besiegen.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Verstehe. Also, wo geht es zum Stonehenge?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Folge mir.

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,	"Ich traf den Feuermagier Milten in der Nähe des Stonehenge. Er erzählte mir, dass sich einer der Foki die ich suche in einer Gruft unter dieser Steinformation befindet.");
	B_LogEntry		(CH3_Stonehenge,	"Milten gab mir ein Spruchrolle um den untoten Wächter in der Gruft zu besiegen. Wir werden die Gruft gemeinsam ausheben.");
	
	CreateInvItem		(self,	ItArScrollDestroyUndead);
	B_GiveInvItems  (self, hero, ItArScrollDestroyUndead, 1);

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self, "SHGuide");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHARRIVED
//***************************************************************************
instance Info_Milten_SHARRIVED (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHARRIVED_Condition;
	information	= Info_Milten_SHARRIVED_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHARRIVED_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<500) )
	{
		return TRUE;
	};	
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Hier sind wir. Der Stollen hier führt direkt in die Gruft.
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Dann statten wir dem Wächter mal einen Besuch ab!

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHHEAL
//***************************************************************************
instance Info_Milten_SHHEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHHEAL_Condition;
	information	= Info_Milten_SHHEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ich bin verwundet. Bitte hilf mir!";
};

FUNC int Info_Milten_SHHEAL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&		(hero.attribute[ATR_HITPOINTS] < ((hero.attribute[ATR_HITPOINTS_MAX]*7)/10))
	&&		(Npc_HasItems(hero,ItFo_Potion_Health_02) == 0)								)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Ich bin verwundet. Bitte hilf mir!

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Nimm diesen Heiltrank. Aber sei nicht verschwenderisch, ich habe nicht unendlich viel davon.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //Ich habe keinen Heiltrank mehr.
	};	

	AI_StopProcessInfos		(self);
};

//***************************************************************************
//	Info SHRUNNING
//***************************************************************************
instance Info_Milten_SHRUNNING (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHRUNNING_Condition;
	information	= Info_Milten_SHRUNNING_Info;
	important	= 0;
	permanent	= 1;
	description	= "Der Wächter lebt noch!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Der Wächter lebt noch!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Dann vernichte ihn mit der Spruchrolle.
};

//***************************************************************************
//	Info SHSCROLL
//***************************************************************************
instance Info_Milten_SHSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSCROLL_Condition;
	information	= Info_Milten_SHSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ich habe die Spruchrolle verbraucht!";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //Ich habe die Spruchrolle verbraucht ... aber nicht auf den Wächter!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //Das ist großes Pech. Dann musst du einen anderen Weg finden, ihn zu besiegen.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Vielleicht kannst du in einem Lager eine weitere Spruchrolle oder sogar eine Rune kaufen.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Ich werde dort drüben, wo wir uns getroffen haben, auf dich warten.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHWait");
};

//***************************************************************************
//	Info SHNEWSCROLL
//***************************************************************************
instance Info_Milten_SHNEWSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHNEWSCROLL_Condition;
	information	= Info_Milten_SHNEWSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ich habe eine neue Spruchrolle 'Untote vernichten'!";
};

FUNC int Info_Milten_SHNEWSCROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSCROLL)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)	
	&&		((Npc_HasItems(hero, ItArScrollDestroyUndead)>0) ||	(Npc_HasItems(hero, ItArRuneDestroyUndead)>0))	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Ich habe eine neue Spruchrolle 'Untote vernichten'!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Sehr gut, dann können wir ja dem Wächter wieder einen Besuch abstatten.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Geh voraus, ich folge dir!

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHFollow");
};

//***************************************************************************
//	Info SHLEAVE
//***************************************************************************
instance Info_Milten_SHLEAVE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLEAVE_Condition;
	information	= Info_Milten_SHLEAVE_Info;
	important	= 1;
	permanent	= 1;
};

FUNC int Info_Milten_SHLEAVE_Condition()
{
	if	 Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)		
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")>10000)
  	&&	(self.aivar[AIV_PARTYMEMBER] ==	TRUE)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Du scheinst kein Interesse mehr an der Gruft zu haben.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Wenn du es dir anders überlegst, triff mich dort, wo wir uns vorhin schon einmal getroffen haben.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self,	"SHWait");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHCONTINUE
//***************************************************************************
instance Info_Milten_SHCONTINUE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHCONTINUE_Condition;
	information	= Info_Milten_SHCONTINUE_Info;
	important	= 0;
	permanent	= 1;
	description = "Wollen wir einen weiteren Versuch beim Wächter wagen?";
};

FUNC int Info_Milten_SHCONTINUE_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	&&	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<9000)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Wollen wir einen weiteren Versuch beim Wächter wagen?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Ich bin bereit. Geh voraus, ich folge dir!

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHSUCCESS
//***************************************************************************
instance Info_Milten_SHSUCCESS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSUCCESS_Condition;
	information	= Info_Milten_SHSUCCESS_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && Npc_HasItems(hero, ItMi_OrcTalisman))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Sehr gut. Du hast den Talisman!
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Hier, nimm ihn. So war unsere Abmachung!
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Danke, mein Freund. Ich vergesse niemanden, der mir geholfen hat. Du hast was gut bei mir!
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Ich gehe zurück ins Alte Lager, vielleicht sehen wir uns dort.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,	"Gemeinsam haben wir den WÄCHTER unter dem Stonehenge bezwungen. Milten nahm sich seinen Teil der Beute und kehrte ins Alte Lager zurück.");
	B_LogEntry		(CH3_Stonehenge,	"Saturas wird froh sein, dass ich hier einen Fokus gefunden habe!");
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self, "ReturnToOC");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Milten_OCWARN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWARN_Condition;
	information	= Info_Milten_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Sie ... sie sind alle tot. .. alle TOT. Ich konnte nicht helfen ... ich war ... war unterwegs ... ich ...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Ganz ruhig, Milten, ich habe Diego auf der anderen Seite des Lagers bereits getroffen.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Gut, dann weißt du ja Bescheid. Was sagte Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Wenn ich Gorn und Lester finden kann, werde ich sie warnen, und zu eurem Versammlungsplatz schicken.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Viel Glück und pass auf dich auf!
		B_LogEntry		(CH4_Firemages,	"Wie Diego, so hält auch Milten sich in der Nähe des Alten Lagers versteckt. Der Feuermagier warnt in sicherer Entfernung vor dem Haupttor Ankömmlinge, damit sie nicht den Gardisten in die Hände fallen.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Ganz ruhig, Milten, was ist los?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Sie haben die Feuermagier getötet. ALLE bis auf mich, und da hätte auch nicht mehr viel gefehlt.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Am besten du erzählst ganz von vorne und der Reihe nach.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //Ok. Ganz ruhig, Milten, ganz ruhig ... 
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Es fing alles damit an, dass die Alte Mine einstürzte.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //Die Alte Mine ist EINGESTÜRTZT???
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Ja. Es ging alles sehr schnell. Keiner aus der Mine hat es herausgeschafft.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Die Gardisten haben den Mineneingang gesperrt.
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Milten_OCMINE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCMINE_Condition;
	information	= Info_Milten_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Wie konnte die Mine einstürzen?";
};

FUNC int Info_Milten_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Wie konnte die Mine einstürzen?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Keine Ahnung. Einige Buddler, die vor dem Mineneingang warteten, erzählten von einem gewaltigen Beben und einer riesigen Staubwolke, die aus dem Stollen kam.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //Warst du dort?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Ja. Dort erfuhr ich dann auch vom Einsturz.
};

//***************************************************************************
//	Info OCKDW
//***************************************************************************
instance Info_Milten_OCKDW (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCKDW_Condition;
	information	= Info_Milten_OCKDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Was sagtest du über die Feuermagier?";
};

FUNC int Info_Milten_OCKDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //Was sagtest du über die Feuermagier?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //Ich weiß nur, dass sie kurz nach dem Einsturz alle von den Erzbaronen umgebracht wurden.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Als ich von unserem gemeinsamen Abenteuer unter dem Stonehenge zurückkehrte, griffen mich die Wachen am Tor plötzlich an.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Sie schrieen mir Worte wie 'Verräter' und 'Kollaborateur' entgegen. Ich konnte mich gerade noch in Sicherheit bringen.
};

//***************************************************************************
//	Info OCWHY
//***************************************************************************
instance Info_Milten_OCWHY (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWHY_Condition;
	information	= Info_Milten_OCWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Warum töten Erzbarone Feuermagier? Das gibt doch keinen Sinn...";
};

FUNC int Info_Milten_OCWHY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Warum töten Erzbarone Feuermagier? Das gibt doch keinen Sinn...
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //Das stimmt. Nur gaben mir die Wachen am Lagereingang keine Gelegenheit, danach zu fragen. Sie zogen sofort ihre Schwerter.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Vielleicht kann dir Diego mehr erzählen. Er war im Lager, als sich die Ereignisse zuspitzten.
};

//***************************************************************************
//	Info OCYOU
//***************************************************************************
instance Info_Milten_OCYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCYOU_Condition;
	information	= Info_Milten_OCYOU_Info;
	important	= 0;
	permanent	= 0;
	description = "Du solltest dich verstecken. Weit weg von hier!";
};

FUNC int Info_Milten_OCYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Du solltest dich verstecken. Weit weg von hier!
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //Nein. Diego und ich haben beschlossen, die beiden Tore im Auge zu behalten, und ahnungslose Freunde aus anderen Lagern zu warnen.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //Bitte sprich noch mit Diego!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,	"Nachdem mir Diego von den unglaublichen Ereignissen berichtet hat, traf ich auch Milten auf der Vorderseite des Alten Lagers. Hoffentlich lassen sich die beiden nicht erwischen.");
	};
};

//***************************************************************************
//	Info OCDIEGO
//***************************************************************************
instance Info_Milten_OCDIEGO (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCDIEGO_Condition;
	information	= Info_Milten_OCDIEGO_Info;
	important	= 0;
	permanent	= 0;
	description = "Wo kann ich Diego finden?";
};

FUNC int Info_Milten_OCDIEGO_Condition()
{
	if Npc_KnowsInfo(hero, Info_Milten_OCWHY)
	&& Npc_KnowsInfo(hero, Info_Milten_OCYOU)
	&& !Npc_KnowsInfo(hero, Info_Diego_OCSTORY)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //Wo kann ich Diego finden?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Er hält sich auf der anderen Seite des Alten Lagers in der Nähe des hinteren Tores versteckt.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //Bitte sprich mit ihm!

	B_LogEntry			(CH4_Firemages,	"Milten fing mich vor dem Alten Lager ab und berichtete mir vom Einsturz der Alten Mine und der Ermordung der Feuermagier.");
	B_LogEntry			(CH4_Firemages,	"Diego hält sich auf der anderen Seite des Alten Lagers in der Nähe des hinteren Tores auf. Ich soll unbedingt mit ihm sprechen, denn er weiß mehr über die Ereignisse.");
};










//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_LOADSWORD_Condition;
	information	= Info_Milten_LOADSWORD_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_LOADSWORD_Condition()
{
	if (LoadSword)
	{
		return TRUE;
	};	
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Sei gegrüßt, mein Freund, dich habe ich ja schon lange nicht mehr gesehen.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Hallo, Milten. Es ist viel passiert, seit wir uns das letzte Mal trafen.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //Ich würde dir gerne alles erzählen, doch im Moment ist keine Zeit dafür. Ich bin in Eile!
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD1 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD1_Condition;
	information		= Info_Milten_LOADSWORD1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Milten, ich brauche deine Hilfe!"; 
};

FUNC int Info_Milten_LOADSWORD1_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Milten, ich brauche deine Hilfe!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Um was geht es? Wie kann ich dir helfen?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Lass uns irgendwohin gehen, wo es nicht so viele Ohren gibt!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Wie du meinst. Folge mir!

	Npc_ExchangeRoutine	(self,	"LSAway");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info LSAWAY
//---------------------------------------------------------------------
instance Info_Milten_LSAWAY (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSAWAY_Condition;
	information		= Info_Milten_LSAWAY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD1)
	&&	(Npc_GetDistToWP(hero, "NC_KDW04_IN") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSAWAY_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //Nun sprich, worum geht es?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Ich brauche die magische Energie des Erzhaufens, und ich halte es für unklug, die anderen Wassermagier danach zu fragen!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //Du scherzt!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //Die Zeit des Scherzens ist vorbei, ich meine es todernst!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //Ich habe Xardas, den Dämonenbeschwörer, getroffen!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Ich handle in seinem Auftrag!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS??? Langsam machst du mir Angst!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Niemand hat mit ihm gesprochen, seit er das Alte Lager verlassen hat!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //Ich schon!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //Wofür benötigst du die Energie des Erzhaufens?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Ich will sie auf dieses Schwert hier übertragen.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Wow, was für eine Waffe!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //Es trägt den Namen URIZIEL!
};


//---------------------------------------------------------------------
//	Info LOADSWORD4
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD4 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD4_Condition;
	information		= Info_Milten_LOADSWORD4_Info;
	important		= 0;
	permanent		= 0;
	description		= "Xardas gab mir diese magische Formel!"; 
};

FUNC int Info_Milten_LOADSWORD4_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSAWAY)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD4_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas gab mir diese magische Formel, um den Transfer zu vollbringen!
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //Du musst sie aussprechen, während ich Schwert und Erz in Kontakt bringe!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Hmmm ... Hmmm ... es sieht so aus, als ob ich diese Zauberformel nur herunterlesen müsste ...
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Aber wir werden ernsthaften Ärger mit Saturas und den anderen Magiern bekommen!
};







//---------------------------------------------------------------------
//	Info LSRISK
//---------------------------------------------------------------------
instance Info_Milten_LSRISK (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSRISK_Condition;
	information		= Info_Milten_LSRISK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Das Risiko müssen wir eingehen!"; 
};

FUNC int Info_Milten_LSRISK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD4)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Das Risiko müssen wir eingehen!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //Es ist wirklich SEHR, SEHR wichtig!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Wichtig für ALLE Bewohner der Kolonie.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Ich verstehe nicht ...
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Es wird uns alle hier raus bringen! Du musst mir vertrauen!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Einverstanden! Nach all dem, was du bereits für uns getan hast, besitzt du mein Vertrauen.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //Außerdem scheinst du auch das von Xardas zu besitzen!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Triff mich unten beim Erzhaufen, und ... zu keinem ein Sterbenswörtchen!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Gut, wir treffen uns beim Erzhaufen. Bis dann!
	
	B_LogEntry			(CH5_Uriziel,	"Ich konnte meinen Freund Milten dazu überreden, mir bei der Energieübertragung in das Schwert behilflich zu sein. Wir treffen uns am Fuße des Erzhaufens der Wassermagier.");
	Npc_ExchangeRoutine	(self,	"LSOreHeap");
	B_ExchangeRoutine	(Sld_726_Soeldner,	"loadsword");

	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LSOREHEAP
//---------------------------------------------------------------------
instance Info_Milten_LSOREHEAP (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSOREHEAP_Condition;
	information		= Info_Milten_LSOREHEAP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSOREHEAP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSRISK )
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSOREHEAP_Info()
{
	//AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //Hast du das Schwert und die Zauberformel?
};
	
//***************************************************************************
//	Info LSNOW
//***************************************************************************
instance Info_Milten_LSNOW (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSNOW_Condition;
	information		= Info_Milten_LSNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hier, nimm die Zauberformel!"; 
};

FUNC int Info_Milten_LSNOW_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSOREHEAP)
	&&	Npc_HasItems (hero, Mythrilklinge01)
	&&	Npc_HasItems (hero, Scroll4Milten)
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 1000)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Hier, nimm die Zauberformel!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Bist du bereit?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //So bereit, wie man für solch eine Wahnsinnstat nur sein kann.
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Dann kann es ja losgehen!

	B_GiveInvItems 	(hero, self, Scroll4Milten, 1);	
	B_GiveInvItems 	(hero, self, Mythrilklinge01, 1);	

	StartChaptersSix = TRUE;

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info CHAPTERSIX
//---------------------------------------------------------------------
instance Info_Milten_CHAPTERSIX (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_CHAPTERSIX_Condition;
	information		= Info_Milten_CHAPTERSIX_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_CHAPTERSIX_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSNOW)
	&&	StartChaptersSix
	{
		return TRUE;
	};	
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(6);
};
	
//---------------------------------------------------------------------
//	Info LSDONE
//---------------------------------------------------------------------
instance Info_Milten_LSDONE (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSDONE_Condition;
	information		= Info_Milten_LSDONE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSDONE_Condition()
{
	if	(Kapitel == 6)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSDONE_Info()
{
	//AI_GotoNpc				(self, hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //Es ist vollbracht!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Unglaublich! Der unscheinbare graue Edelstein schimmert nun bläulich!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //Das ist ein gutes Zeichen! Die magische Energie des Erzhaufens scheint tatsächlich in das alte Schwert übertragen worden zu sein!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Aber unsere kleine Aktion hier scheint etwas Aufmerksamkeit erregt zu haben.
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //Du solltest dich am besten direkt hier heraus teleportieren!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //Was wird aus dir?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //Mach dir um mich keine Sorgen, ich werde mir schon was einfallen lassen. Geh jetzt!

	B_Story_UrizielLoaded	();
	
	AI_StopProcessInfos	(self);
};




//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
