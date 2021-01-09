// ************************	EXIT **************************

instance  Grd_260_Drake_Exit (C_INFO) //E1
{
	npc			=  Grd_260_Drake;
	nr			=  999;
	condition	=  Grd_260_Drake_Exit_Condition;
	information	=  Grd_260_Drake_Exit_Info;
	important	=  0;
	permanent	=  1;
	description	= DIALOG_ENDE;
};

FUNC int  Grd_260_Drake_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_260_Drake_Exit_Info()
{
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //See ya.
	AI_StopProcessInfos	( self );
};
/**************** GEFAHREN *********************/

INSTANCE  Grd_260_Drake_Gefahr (C_INFO)	//E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Gefahr_Condition;
	information		= Grd_260_Drake_Gefahr_Info;
	important		= 0;
	permanent		= 0;
	description		= "What do I need to look out for in the mine?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//What do I need to look out for in the mine?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Minecrawlers, mainly. Dangerous beasts.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//We've had to give up a few caves because of them. They've eaten quite a few diggers, too.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Tell me about the crawlers.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Oh, but my tongue's so dry...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//You bring me a beer, and I'll tell you something about the crawlers.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(give beer)";
};

FUNC INT  Grd_260_Drake_Crawler_Okay_Condition()
{
	if (Npc_KnowsInfo (hero,Grd_260_Drake_Gefahr))
	{
			return 1;
	};
};
FUNC void Grd_260_Drake_Crawler_Okay_Info()
{
	if	( Npc_HasItems (hero,ItFobeer) )
	{
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Here, drink to my health!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Thanks. Well, crawlers live in large packs, mostly in the side caves.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//They've never attacked us here in the main shaft yet. If you ever meet one of 'em, run!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Or stand with your back to the wall. That way you may stand a chance!

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Are you kidding me? Come back when you have some beer.
   		Grd_260_Drake_Crawler_Okay.permanent = 1;
   };
};
// ***************** DIE MINE *****************************

instance  Grd_260_Drake_Mine (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Condition;
	information		= Grd_260_Drake_Mine_Info;
	important		= 0;
	permanent		= 0;
	description		= "Can you tell me anything about the mine?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Can you tell me anything about the mine?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Well, this part we're standing in now is the main shaft. A system of catwalks takes you down to the bottom.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//And they're digging for ore everywhere. But you need to be careful, there are many minecrawlers there as well.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Right at the bottom is the smelting place. We're smelting a part of the ore to use it right there.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tell me more about the mine!";
};

FUNC int  Grd_260_Drake_Mine_Mehr_Condition()
{
	if ( Npc_KnowsInfo (hero, Grd_260_Drake_Mine) )
	{
		return 1;
	};
};
func void  Grd_260_Drake_Mine_Mehr_Info	()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Tell me more about it!
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//If you want to know more, go to Viper. He's the smelter.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Or talk to Ian. He's the boss. He organizes everything here in the mine.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Where can I find Ian?";
};

FUNC int  Grd_260_Drake_Ian_Condition()
{
	if !(Npc_KnowsInfo (hero,STT_301_IAN_HI)) && ( Npc_KnowsInfo (hero,	Grd_260_Drake_Mine_Mehr))
	{
		return TRUE;
	};

};
FUNC void  Grd_260_Drake_Ian_Info()
{
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Where can I find Ian?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//He's right in the middle of the main shaft, next to the storeroom.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Oh, one more thing - you know Thorus, don't you? Forget him!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//There's just one person who has the say in here and that's Ian. He's the boss.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//If you get into trouble with him, you'll be in trouble with us all. Understood?
};	 

/*------------------------------------------------------------------------
//						GARDEAUFNAHME								//
------------------------------------------------------------------------*/
instance Grd_260_Drake_GARDEAUFNAHME (C_INFO)
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_GARDEAUFNAHME_Condition;
	information		= Grd_260_Drake_GARDEAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_260_Drake_GARDEAUFNAHME_Condition()
{	
	if (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	&& ( Npc_GetTrueGuild  (hero) == GIL_STT)
	&& (! Npc_KnowsInfo   (hero,Grd_264_Gardist_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void  Grd_260_Drake_GARDEAUFNAHME_Info()
{
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hey, you did a good job with the crawlers! You deserve to be admitted as a guard now!
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Just go over to the Old Camp and speak to Thorus about it!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"As soon as I've returned the eggs, I should have a word with Thorus. Maybe he'll let me join the guards.");
};

