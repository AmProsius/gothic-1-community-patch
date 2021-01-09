// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Who are you?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Who are you?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //I'm the best mining engineer this damn colony has ever seen, my boy.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //I make sure half our boys don't go getting themselves killed by falling rocks, just because they're too stupid to scrape the right places.
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "I'd like to join you as a scraper!";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //I'd like to join you as a scraper!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Oh yeah? Well, just don't think you're going to get anything much out of it. There's three portions of rice a day, any extra you'll have to see to yourself.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //D'you know why we're doin' this? We're doin' this job so one day we can all walk out of here to freedom.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //That means all the ore's to be handed in, then it goes on the big ore mound. And once a month everybody who's been working here gets 50 ore to get stoned on.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //That's the most important things you ought to know.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Do you at least have any experience on the job?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"No.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Yes.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Yes.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //Good! Then you know what to watch out for. Here's your protective clothin'. You'll have to find your own pickaxe. Enjoy yourself.
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //No.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //Of course you don't! Why's it always me? Okay. Listen carefully. You take this stuff and put it on - here.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //If an ore nugget falls on your foot while you're not wearing your protective clothing, you'll be crippled for life and only worth half of what you were before to us.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //There'll be a pickaxe lying somewhere around here.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //But you won't be able to do much with it - well - so what...
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "How much ore have you collected so far?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //How much ore have you collected so far?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //The mages say that we won't need much more. Go to the New Camp and have a look at the mound.
	AI_StopProcessInfos	(self);
};


