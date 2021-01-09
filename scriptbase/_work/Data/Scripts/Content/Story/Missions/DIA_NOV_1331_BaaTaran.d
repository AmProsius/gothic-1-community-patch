// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "I'm new here. Who are you?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //I'm new here. Who are you?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //I am Baal Taran of the Brotherhood of the Sleeper.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "What is the Brotherhood of the Sleeper?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //What is the Brotherhood of the Sleeper?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //We're a community of believers in a new faith.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Our camp is situated in the east, in the swamp. I've come to preach the words of the Sleeper to strangers like you.
};

// **************************************************
//					Wer ist der Schläfer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Who is the Sleeper?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Who is the Sleeper?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //The Sleeper is our redeemer. He disclosed himself five years ago through Y'Berion, our master.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Since then, we have all renounced the three gods. And you should do so as well.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //The gods just stood by and watched while we were exiled to this prison. But the Sleeper will lead us to freedom.
};

// **************************************************
//					Lehre des Schläfers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Tell me about the Sleeper's teachings.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Tell me about the Sleeper's teachings.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //The Sleeper is a powerful being, maybe even more powerful than Innos, the god of light.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //He is with us in spirit. But his power is still limited. He has been sleeping for a thousand years, but now the moment of his awakening is near.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //He has chosen us to be witnesses to his awakening and to spread his word.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //So listen, all those who join the Sleeper will have immortal souls, but those who are against him will be punished.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //But the Sleeper is compassionate and sends proof of his might to all who doubt him.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "What will the way to freedom look like?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //What will the way to freedom look like?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //We are preparing a great invocation of the Sleeper, in which all novices create the contact together.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //In this invocation, the Sleeper will reveal the path to freedom.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "How does your god prove his might?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //How does your god prove his might?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //He speaks to us through visions. Whoever hears his voice, no longer doubts his might.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //If you take the weed which grows in the swamp, you will be close to the Sleeper and able to hear him. Some people even see images.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //I see.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "How do I get to the Brotherhood's camp?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //How do I get to the Brotherhood's camp?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //I'm busy. But Baal Parvez should be somewhere in this camp as well.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //He's near the market place, on the other side of the castle. I believe he's even got his own hut there.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"A novice called Baal Parvez can lead me to the swamp camp of the Brotherhood. He is at the market square behind the castle of the Old Camp.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "I need to get into the castle. Can you help me?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //I need to get into the castle. Can you help me?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //I fear I cannot, brother. The only ones among us who may enter the castle are those who supply the weed to Gomez.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //We gather swampweed and sell part of it to the Old Camp, in exchange for goods from the outside world.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //If you were one of the couriers working for Cor Kalom, you could get into the castle. But for that you would need to be one of us.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //What do you want to do in the castle anyway?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"I want to meet somebody there.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"I have a letter for the High Magician of the Circle of Fire.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //I want to meet somebody there.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Do you? Who? And why don't you just wait until he comes out?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"That's none of your business.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"He's one of the magicians.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //I have a letter for the High Magician of the Circle of Fire.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Oh? And where did you get that from? The mages gave you that before they threw you in here, right?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //You're stupid to tell people about it. But don't worry - I won't tell anybody.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //But do yourself a favor, and don't tell anybody else about it either. The people here might slit anybody's throat for a thing like that!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Most people would love to earn the reward you get for a message from the outside world.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //He's one of the magicians.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Oh! Well, they never leave the castle. You really will have to get in.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //What do you want from them anyway? Magic runes? Or potions?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"That's none of your business.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"That's right.",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //That's none of your business.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Fine, man. I just wanted to help...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //That's right.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //I knew it! What else would a guy like you want with the mages.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //I can give you some good advice: Forget the mages. They take far too much ore for their stuff.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Magic runes and potions are much cheaper in our camp.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
