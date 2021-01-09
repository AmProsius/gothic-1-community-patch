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
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Viel Glück noch.
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Dir auch, Jungchen, dir auch.
	
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
	description		= "Bist du schon lange hier?"; 
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
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Bist du schon lange hier?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Ich bin schon seit 10 Jahren hier. Du kannst mir glauben, dass ich schon einiges gesehen und erlebt hab'.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //So manche Gefahr hab' ich schon gemeistert und es immer verstanden, am Leben zu bleiben!
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Damals, als wir noch in der inzwischen verlassenen Mine gearbeitet haben und die Stützbalken eingekracht sind ...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Aber das sind alte Geschichten.
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Du hast doch bestimmt auch eine Menge Ausbruchspläne mitgekriegt."; 
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
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Du hast doch bestimmt auch eine Menge Ausbruchspläne mitgekriegt.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Hör zu, mein Junge: Ich weiß genau, du willst hier raus - aber vergiss es.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //Gewöhn dich direkt daran und vergiss die Gedanken vom Ausbruch. Ich hab' die Gesichter der Leute gesehen, die versucht haben, aus der Barriere zu fliehen.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Mach nicht denselben Fehler, die Barriere hält jeden auf!
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Ich habe nicht vor, die nächsten 10 Jahre meines Lebens hier zu schürfen!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Nein. Das wirst du nicht. Vielleicht wirst du zu den ganz Grossen gehören, wer weiß.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Du wirst dich nach oben arbeiten, aber ganz egal, wie weit du auch kommst, die Barriere wird dich aufhalten!
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
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Ein neues Gesicht. Na, schon mal Erz geschürft, Jungchen?
};  
