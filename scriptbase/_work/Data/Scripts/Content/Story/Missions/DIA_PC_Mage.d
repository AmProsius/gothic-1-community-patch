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
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //On we go.
	}
	else
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //See you later.
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
	AI_Output (self, other,"DIA_Milten_First_02_00"); //You may not cross this doorstep unless Master Corristo allows it.
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
	description = "I'm looking for the High Magician of the Circle of Fire.";
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
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //I'm looking for the High Magician of the Circle of Fire.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //That is Corristo. What do you want with him?
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
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //I'm looking for the High Magician of the Circle of Fire.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //That is Corristo. What do you want with him?
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //I have a letter for the High Magician of the Circle of Fire.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Show me the letter.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Here it is.
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //What about some kind of reward?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //There will be no need for that now.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //We have heard what you achieved in the Old Mine. Without the minecrawlers, ore mining has become much safer.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Corristo knows of your achievements, too. He wishes to speak to you. Go to him.
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
	description = "I have a letter for the High Magician of the Circle of Fire.";
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
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //I have a letter for the High Magician of the Circle of Fire.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Are you a messenger from the outside world?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Yes. A magician gave me the letter shortly before they threw me into the colony.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Show me the letter.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"I want my reward first.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Here it is.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Here it is.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //This letter is addressed to Xardas!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //What's so exciting about that?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas has not been a servant of Innos for ages. He left us some years ago and turned towards black magic.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //He lives in a tower in the middle of the Orc land and concentrates on his studies.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //He said he would go his own way to find out what went wrong with the Barrier.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Wait here. I'll be back in a moment.
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
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //I want my reward first.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo will ask Torrez to give it to you as soon as he has the letter.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //I'm a servant of Innos - I never lie. Now give me the letter.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"I'd rather give the letter to Torrez himself.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Here it is.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //I'd rather give the letter to Torrez himself.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //I can't talk you out of that, can I?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //No. I want to see my reward first.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Well then. If that's what you want. Wait here.

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
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo was not very pleased to see that you have so little faith in the servants of Innos.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //But he says you may go to Torrez and let him give you the usual reward.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo was beside himself with delight. He said that you may go to Torrez and choose your reward.
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
	description	= "Where can I find Torrez?";
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
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //Where can I find Torrez?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //He is in front of the temple building all day.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //At night he is inside like all the others - but only magicians may enter the temple house, so you can only speak to him during the day.
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
	description = "I have a letter from the Magicians of Water.";
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
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //I have a letter from the Magicians of Water.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ah! Very good! I'll give it to Corristo.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //When you're back in the New Camp, the Magicians of Water will surely reward you for your efforts.
	
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
	description = "Tell me something about the Magicians of Fire.";
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
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Tell me something about the Magicians of Fire.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //The Circle of Fire takes its powers from the grace of Innos. The god of light, truth and justice watches over us.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //The magicians consider themselves to be the chosen ones - and that's how they treat others.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //I was lucky to be admitted. Corristo made me his apprentice. He probably just wanted some entertainment.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Since then, I've been trying to improve my magic skills every day in order to be admitted to the next Circle.
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
	description = "I want to become a magician's apprentice, too. Just like you.";
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
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //I want to become a magician's apprentice, too. Just like you.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo chose me because I did something special for the Ore Barons.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //Unless you do something truly exceptional, he will never consider you for apprenticeship.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //Besides, you must belong to the Old Camp. I doubt if Corristo would take a member of any other camp for his apprentice.
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
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Greetings! My friend Lester from the swamp camp told me about your great deeds there!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //I am impressed. You have become very strong.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //I do my best.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Ah, yes. Always modest, aren't you?
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
	description	= "I met Gorn.";
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
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //I met Gorn.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //Really? Where?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //By the old ruined monastery by the sea. The two of us searched it for treasures.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //I am sure he'll tell me all about it when we meet again.
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
	description	= "Lester and I took out the mountain fort.";
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
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Lester and I took out the mountain fort.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //He told me about it. Apparently you can be trusted.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Where have the four of you been meeting so far?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Oh, here and there. We meet in a lot of different places.
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
	description	= "What are you doing here?";
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
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //What are you doing here?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //There is an ancient ring of stone not far from here. In its center lies the entrance to an underground vault.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Some sort of tomb?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Yes, something like that.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //There is something in that tomb that I'd like to have.
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
	description	= "I'm looking for a focus stone.";
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
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //I'm looking for a focus stone. It must be here somewhere.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //That almost sounds as if we were both looking for something in the same place.
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
	description	= "Why don't you go down into the tomb and get what you're looking for?";
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
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Why don't you go down into the tomb and get what you're looking for?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //Oh, that's a long story. I'd have to go a long way back to explain.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Go ahead, I'm in no hurry.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //Alright! After the creation of the Magic Barrier which imprisons us all...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //... one of the magicians sealed a magic artefact down there.
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
	description	= "Is this artefact one of the five focus stones?";
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
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Is this artefact one of the five focus stones?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Exactly! So you already know the story of the five focus stones?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Don't tell me you're after the focus as well!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //No. I'm not interested in the focus stone. I'm looking for an Orcish talisman.
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
	description	= "The artefact was sealed away?";
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
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //The artefact was sealed away?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Yes. A powerful spell protects it. The first grave robber trying to swipe the focus...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //... will be cursed, and doomed to an existence as a restless undead, who will have to protect the tomb from other grave robbers.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //How can you get past that curse?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //There will be no need for that now.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Some years ago, an Ore Baron out pleasure hunting for Orcs was careless enough to enter the tomb.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Now HE is the guard of the treasures down there.
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
	description	= "What about that talisman?";
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
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //What about that talisman?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //I believe its former owner used it to defend himself against angry Orcs.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //If I'm right, the talisman may be of great use.
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
	description	= "We should seek out the tomb together!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //We should seek out the tomb together! You get the talisman, and I'll have the focus stone.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //Alright, but there is one little problem...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //A problem?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Yes. The guard down there in the tomb...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //Can't he be cut into handy little pieces?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //That wouldn't be too easy. He seems to be extremely resistant against the effects of normal weapons.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Let me guess, you already got a plan, right?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Uhm... well... I have a plan but I can't carry it out on my own.
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
	description	= "Tell me!";
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
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Tell me!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //I have a spell scroll with a very powerful spell here.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //The spell will destroy all the undead who fall under it.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Then it should be child's play to take out the tomb.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Mhmm... Well... Not quite! The guard is not on his own any longer.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Probably later grave robbers who were no more successful than he was.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //I went down there once, and I was nearly killed. One man on his own cannot do much there.
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
	description	= "Give me the spell scroll and we'll do it together!";
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
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Give me the spell scroll and we'll do it together!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Good, very good. I hoped you would say that!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //However, we only have one spell scroll. Use it for the guard!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //The other undead can be defeated in normal fights as well.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //I see. Well, which way leads to the ring of stone?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Follow me.

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"I met Milten, the Magician of Fire, near the ring of stone. He told me that one of the focus stones I'm looking for was in a crypt underneath the stone formation.");
	B_LogEntry		(CH3_Stonehenge,"Milten gave me a spell scroll to defeat the undead guardian in the crypt. We'll get into the crypt together.");
	
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

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Here we are. The tunnel here leads directly to the tomb. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Then let's go and visit the guard!

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
	description	= "I'm wounded. Please help me.";
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
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //I'm wounded. Please help me.

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Take this healing potion.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //I don't have any healing potion left.
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
	description	= "The guard's still alive!";
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
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//The guard's still alive!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Then destroy him with the spell scroll.
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
	description	= "I used the spell scroll!";
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
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //I used the spell scroll - but not on the guard!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //This is a catastrophe! Then you will have to find another way to defeat him!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Perhaps you can buy another spell scroll or a rune in one of the camps.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //I'll wait for you over there, where we met.

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
	description	= "I have a new 'Death to the Undead' spell scroll!";
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
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //I have a new 'Death to the Undead' spell scroll!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Very good. Now we can pay another visit to the guard.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Go first, I'll follow.

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

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//You seem to have lost interest in the tomb.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//If you change your mind, you can meet me where we met before.

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
	description = "Shall we dare to have another go at the guard?";
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

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Shall we dare to have another go at the guard?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //I'm ready. Go ahead, I'll follow.

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

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Good. You have the talisman.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Here, take it. That was our deal!
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Thank you, my friend. I never forget anybody who helped me.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //I'll go back to the Old Camp, perhaps we'll meet there.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Together we defeated the GUARDIAN under the ring of stone. Milten took his share of the booty and returned to the Old Camp.");
	B_LogEntry		(CH3_Stonehenge,"Saturas will be happy that I found a focus here!");
	
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

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //They... They are all dead  .. all DEAD. I couldn't help them... I was... was not there... I...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Calm down, Milten, I've already met Diego on the other side of the Camp.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Good, then you know. What did Diego say?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //If I can find Gorn and Lester, I'll warn them and send them to your meeting place.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Good luck and take care!
		B_LogEntry		(CH4_Firemages,"Just like Diego, Milten is hiding near the Old Camp. At a safe distance from the main gate, the Magician of Fire warns those who arrive there, so that they don't fall into the guards' hands.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Calm down, Milten, what happened?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //They killed the Magicians of Fire. ALL OF THEM apart from me, and I was close to death as well.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //You'd better tell me the whole story from the beginning, one thing after the other.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //Okay. Keep cool, Milten, keep cool...
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //It all started with the Old Mine caving in...
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //The Old Mine CAVED IN???
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Yes. It all happened very fast. Nobody in the mine made it out.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //The guards blocked the entrance to the mine.
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
	description = "How could the mine cave in?";
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
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //How could the mine cave in?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //I've no idea. Some of the diggers who were waiting in front of the entrance said something about a massive earthquake and a huge cloud of dust coming from the tunnel.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //Were you there?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Yes. That's where I learned about the cave-in.
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
	description = "What was that you said about the Magicians of Fire?";
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
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //What was that you said about the Magicians of Fire?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //I only know that they were all killed by the Ore Barons shortly after the mine caved in.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //When I returned from our adventure under the ring of stone, the guards at the gate suddenly attacked me.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //They shouted words like 'traitor' and 'collaborator' at me. I had a very narrow escape.
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
	description = "Why would the Ore Barons want to kill the magicians...";
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
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Why would the Ore Barons want to kill the magicians? It doesn't make sense...
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //That's right. The guards just didn't give me any opportunity to ask. They drew their swords immediately.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Perhaps Diego knows more. He was in the Camp when things got worse.
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
	description = "You should hide. Far away from here.";
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
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //You should hide. Far away from here.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //No. Diego and I agreed to keep an eye on the two gates and to warn our unsuspecting friends from the other camps.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //Please talk to Diego!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"After Diego told me about the unbelievable events, I met Milten at the front of the Old Camp. I hope they don't get caught.");
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
	description = "Where can I find Diego?";
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
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //Where can I find Diego?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //He's hiding on the other side of the Old Camp, near the back gate.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //Please talk to him!

	B_LogEntry			(CH4_Firemages,"Milten caught me in front of the Old Camp and told me about the collapse of the Old Mine and the assassination of the Magicians of Fire.");
	B_LogEntry			(CH4_Firemages,"Diego is staying on the other side of the Old Camp, near the back gate. I should talk to him, he knows more about what happened.");
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

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Greetings, my friend, I haven't seen you for ages.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Hello, Milten. A lot has happened since we met the last time.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //I would like to tell you everything but I don't have the time right now. I'm in a hurry.
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
	description		= "Milten, I need your help!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Milten, I need your help!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //What's up? How can I help you?
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Let's go somewhere where we can talk.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //Fine. Follow me.

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

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //Now tell me, what is it?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //I need the magic powers of the ore mound and I don't think it would be a good move to ask the other Magicians of Water.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //You're joking!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //This is no time for jokes. I'm deadly serious.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //I've seen Xardas, the Necromancer!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //I'm working under his orders!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS??? You're beginning to scare me!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Nobody has spoken to him since he left the Old Camp.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //I have!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //What do you need the powers of the ore mound for?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //I want to transfer them to this sword here.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Wow, what a weapon!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //It's name is URIZIEL!
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
	description		= "Xardas gave me this magic spell!"; 
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
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas gave me this magic spell to carry out the transfer!
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //You will have to recite it while I bring the sword and the ore together!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Mmmm... Mmmm... It looks as if I only have to read out this spell ...
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //But we'll get into trouble with Saturas and the other magicians!
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
	description		= "We'll have to take that risk!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //We'll have to take that risk!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //It really is VERY, VERY important!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Important for ALL inhabitants of the colony.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //I don't understand...
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //It will get us out of here! You have to trust me!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //Alright! After all you have done for us, I trust you completely.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //Besides, it seems Xardas trusts you as well.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Meet me down at the ore mound, and... Don't tell anybody!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Good, let's meet at the ore mound! See you there!
	
	B_LogEntry			(CH5_Uriziel,"I could convince my friend Milten to help me transfer the energy to the sword. We'll meet at the bottom of the ore mound of the Magicians of Water.");
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

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //Have you got the sword and the spell?
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
	description		= "Here, take the spell!"; 
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
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Here, take the spell!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Are you ready?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //As ready as one can be for this crazy plan.
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Then let's do it!

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

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //It's done!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Unbelievable! The plain gray gem is shimmering bluish now!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //That's a good sign! The magic powers of the ore mound really seem to be in the old sword now!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //But our little operation here seems to have attracted some attention.
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //You should teleport yourself directly out of here!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //What about you?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //Don't worry about me, I'll think of something. Go now!

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
