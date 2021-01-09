// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Good luck.
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Same to you, boy, same to you.
	
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Have you been here long?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Have you been here long?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //I've already been here 10 years. Believe me, I've learned and experienced quite a lot here.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //I've encountered many dangers and managed to stay alive.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //In the old times, when we worked in the abandoned mine, the one which is deserted now, and the supporting beams collapsed...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //But that's old stories...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "You must have heard about many escape plans as well."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //You must have heard about many escape plans as well.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Listen, boy: I know you want to get out of here - but forget it.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //You better forget the thought of escape. I saw the faces of those who tried to get out of the Barrier.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Don't make the same mistake, the Barrier will stop everybody.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //I don't want to dig in the mine for the next ten years of my life!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //No, you won't. Perhaps you'll be one of the real big shots, who knows.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //You'll work your way up, but no matter how far you'll get, the Barrier will finally stop you.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //A new face. Have you ever dug ore, boy?
};  
