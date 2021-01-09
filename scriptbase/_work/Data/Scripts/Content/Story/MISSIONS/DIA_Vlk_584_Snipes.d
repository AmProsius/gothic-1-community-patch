// ************************ EXIT **************************

instance  VLK_584_Snipes_Exit (C_INFO)
{
	npc			=  VLK_584_Snipes;
	nr			=  999;
	condition	=  VLK_584_Snipes_Exit_Condition;
	information	=  VLK_584_Snipes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_584_Snipes_Exit_Info()
{
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Wir sehen uns.
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //Na, aber sicher doch!
	
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_Condition;
	information		= VLK_584_Snipes_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie siehts aus?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
	return 1;
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//Wie sieht's aus?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Ich schlage dir ein Geschäft vor.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Wenn du Aaron dazu kriegst, dass er von der Truhe abhaut, dann gebe ich dir 10 Erz!
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,	"Der Buddler Snipes hat mir 10 Erz angeboten, wenn ich es schaffe, den Gardisten Aaron von seiner Truhe wegzulocken!");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Du schuldest mir 10 Erz"; 
};

FUNC int  VLK_584_Snipes_DEAL_RUN_Condition()
{
	if (Snipes_deal == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC void  VLK_584_Snipes_DEAL_RUN_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Du schuldest mir 10 Erz
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Hier, die 10 Erz hast du dir verdient.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Ach noch was, den Schlüssel für seine Truhe hab' ich auch. Für dich nur 30 Erz!
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,	"Snipes hat mir für weitere 30 Erz den Schlüssel zu Aarons Truhe angeboten."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(Schlüssel kaufen)"; 
};

FUNC int  VLK_584_Snipes_DEAL_2_Condition()
{
	if ( Npc_KnowsInfo (hero, VLK_584_Snipes_DEAL_RUN) )
	&& (Npc_HasItems   (self,ItKe_OM_02))
	{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_2_Info()
{
	
	if ( Npc_HasItems (hero, ItMinugget)  >= 30 ) 
	{
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Gib mir den Schlüssel.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Du hast ein gutes Geschäft gemacht!
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Ich frage mich, was dein Gewinn an der Sache ist.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Ich freue mich immer, wenn ich den Gardisten eins auswischen kann. Und wenn die den Inhalt der Truhe bei mir finden, bin ich dran!
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,	"Ich habe Snipes den Truhenschlüssel abgekauft! Wie Aaron wohl darauf reagieren wird, wenn ich ihm davon erzähle?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Ich sagte 30 Erz! Gib mir das Erz und ich gebe dir den Schlüssel!
	};
};  
