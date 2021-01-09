
// ************************ EXIT **************************

instance  Stt_302_Viper_Exit (C_INFO)
{
	npc			=  Stt_302_Viper;
	nr			=  999;
	condition	=  Stt_302_Viper_Exit_Condition;
	information	=  Stt_302_Viper_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Stt_302_Viper_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_302_Viper_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Stt_302_Viper_GREET (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_GREET_Condition;
	information		= Stt_302_Viper_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich habe gehört, du bist der Schmelzer"; 
};

FUNC int  Stt_302_Viper_GREET_Condition()
{
	return 1;
};


FUNC void  Stt_302_Viper_GREET_Info()
{
	AI_Output (other, self,"Stt_302_Viper_GREET_Info_15_01"); //Ich habe gehört, du bist der Schmelzer.
	AI_Output (self, other,"Stt_302_Viper_GREET_Info_11_02"); //Du bist ja ein ganz schlauer Bursche. 
};  
// ***************************** SCHMELZGESCHICHTE ****************************************//
instance  Stt_302_Viper_MELT (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_MELT_Condition;
	information		= Stt_302_Viper_MELT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich habe gehört, ihr schmelzt nur einen Teil des Erzes ein"; 
};

FUNC int  Stt_302_Viper_MELT_Condition()
{	
	if Npc_KnowsInfo (hero,Stt_302_Viper_GREET) && Npc_KnowsInfo (hero,Grd_260_Drake_Mine_Mehr) 
	{
		return 1;
	};

};
FUNC void  Stt_302_Viper_MELT_Info()
{
	AI_Output (other, self,"Stt_302_Viper_MELT_Info_15_01"); //Ich habe gehört, ihr schmelzt nur einen Teil des Erzes ein.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_02"); //Früher haben wir alles Erz eingeschmolzen. Aber damit waren Gomez und die Magier nicht einverstanden. 
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_03"); //Wochenlang haben sie sich hier rumgetrieben und haben das Erz und alles andere untersucht. 
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_04"); //Sie haben hier rumgeschnüffelt und ihre feinen Nasen in Sachen gesteckt, von denen sie keine Ahnung haben.
	AI_Output (self, other,"Stt_302_Viper_MELT_Info_11_05"); //Das Ende vom Lied war, dass wir nur noch einen Teil des Erzes einschmelzen. Die Magier sind nicht mehr hier runter gekommen.
};
// *****************************  ****************************************//
instance  Stt_302_Viper_BUY (C_INFO)
{
	npc				= Stt_302_Viper;
	condition		= Stt_302_Viper_BUY_Condition;
	information		= Stt_302_Viper_BUY_Info;
	important		= 0;
	permanent		= 1;
	description		= "Kannst du mir Erz geben?"; 
	trade           = 1;
};

FUNC int  Stt_302_Viper_BUY_Condition()
{	
	if Npc_KnowsInfo (hero,Stt_302_Viper_GREET)
	{ 
		return 1;
	};

};
FUNC void  Stt_302_Viper_BUY_Info()
{
	AI_Output (other, self,"Stt_302_Viper_BUY_Info_15_01"); //Kannst du mir Erz geben?
	AI_Output (self, other,"Stt_302_Viper_BUY_Info_11_02"); //Wenn du mir Waren geben kannst.
};

