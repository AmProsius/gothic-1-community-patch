// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Who are you?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Who are you?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //I am Nefarius. Magician of the Circle of Water.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"Where can I find Saturas?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //Where can I find Saturas?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Go through the big round gate. You'll find him there.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"I'd like to become a Magician of the Circle of Water!";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //I'd like to become a Magician of the Circle of Water!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //Not so fast, my boy!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Before we let a young man join us, he needs to have done something great.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //And he must have served us for some time.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //If you're really serious, you should join our mercenaries. There you can serve us.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //And maybe one day you'll be granted a chance to do something great.
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"Am I ready for the Circle of Water?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Am I ready for the Circle of Water?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Become one of our mercenaries, then we'll see...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //I see, you've become one of our mercenaries. Very good, very good...
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //Time will attend to the rest...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //Is there any news of our friends in the Old Camp?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Gomez has had all the Magicians of Fire killed!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //No! The cretin! I warned Corristo - he was never to be trusted! You must tell Saturas about it!
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Wait!
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //You have braved great dangers on our behalf.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //I think you are now ready to wear the robe of a Magician of Water.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //But now speak to Saturas! Hurry!
	};
	AI_StopProcessInfos	(self);
};
