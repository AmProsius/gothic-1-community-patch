// ************************************************************
// 			  				   EXIT 
// ************************************************************
	var int Pock_ForgetAll;
// ************************************************************

INSTANCE DIA_Pock_EXIT (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 999;
	condition	= DIA_Pock_EXIT_Condition;
	information	= DIA_Pock_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pock_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Pock_EXIT_Info()
{	
	Pock_ForgetAll = TRUE;
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Pock_Wasser(C_INFO) // E1
{
	npc			= Bau_902_Pock;
	nr			= 800;
	condition	= Info_Pock_Wasser_Condition;
	information	= Info_Pock_Wasser_Info;
	permanent	= 1;
	description = "Lefty schickt mich. Ich hab' Wasser für dich.";
};                       

FUNC INT Info_Pock_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Pock_Wasser_Info()
{
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Lefty schickt mich. Ich hab' Wasser für dich.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Danke, Junge! Das hab' ich gebraucht!
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Aber du hast nichts mehr. Ist schon gut, Junge. Ich werd mich an die andern halten.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Pock_Hello (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_Hello_Condition;
	information	= DIA_Pock_Hello_Info;
	permanent	= 0;
	description	= "Hi! Ich bin neu hier.";
};                       

FUNC INT DIA_Pock_Hello_Condition()
{
	if (Pock_ForgetAll == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_Hello_Info()
{	
	AI_Output (other, self,"DIA_Pock_Hello_15_00"); //Hi! Ich bin neu hier.
	AI_Output (self, other,"DIA_Pock_Hello_04_01"); //Schön mal wieder ein neues Gesicht zu sehen.
	AI_Output (other, self,"DIA_Pock_Hello_15_02"); //Du bist schon lange in der Kolonie, hm?
	AI_Output (self, other,"DIA_Pock_Hello_04_03"); //Stimmt genau, Junge. Ich war einer der Ersten.
};

// ************************************************************
// 						Weißt ne Menge
// ************************************************************

INSTANCE DIA_Pock_KnowMuch (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_KnowMuch_Condition;
	information	= DIA_Pock_KnowMuch_Info;
	permanent	= 0;
	description	= "Dann weißt du bestimmt ne Menge über all das hier?";
};                       

FUNC INT DIA_Pock_KnowMuch_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_KnowMuch_Info()
{	
	AI_Output (other, self,"DIA_Pock_KnowMuch_15_00"); //Dann weißt du bestimmt ne Menge über all das hier?
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_01"); //Tja wie man's nimmt, die meiste Zeit verbringe ich hier beim Reispflücken.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_02"); //Nur dadurch bin ich so alt geworden. Wir bekommen etwas Reis ab und vielleicht mal Schnaps, nicht viel, aber es reicht.
};

// ************************************************************
// 							Warum hier?
// ************************************************************

INSTANCE DIA_Pock_WhyJail (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 2;
	condition	= DIA_Pock_WhyJail_Condition;
	information	= DIA_Pock_WhyJail_Info;
	permanent	= 0;
	description	= "Weshalb bist du hier?";
};                       

FUNC INT DIA_Pock_WhyJail_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_WhyJail_Info()
{	
	AI_Output (other, self,"DIA_Pock_WhyJail_15_00"); //Weshalb bist du hier?
	AI_Output (self, other,"DIA_Pock_WhyJail_04_01"); //Die Steuern, mein Junge, die Steuern. Meine Scheune war so leer wie mein Bauch, da konnte ich nicht mehr zahlen.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_02"); //Irgendwann kamen die Soldaten und brachten mich her. Aber hier ist es nicht schlechter als draußen. Ich werde wenigstens nicht vor Hunger sterben.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_03"); //Hab immer meine Steuern gezahlt - jahrelang. Aber das hat dem Hurensohn mit der Krone nicht gereicht!
};

// ************************************************************
// 						PERM (Forget)
// ************************************************************

INSTANCE DIA_Pock_ForgotAll (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_ForgotAll_Condition;
	information	= DIA_Pock_ForgotAll_Info;
	permanent	= 1;
	description	= "Alles klar bei dir?";
};                       

FUNC INT DIA_Pock_ForgotAll_Condition()
{
	if (Pock_ForgetAll == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_ForgotAll_Info()
{	
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_00"); //Alles klar bei dir?
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_01"); //Schön mal wieder ein neues Gesicht zu sehen.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_02"); //Moment mal! Wir hatten uns schon unterhalten.
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_03"); //Nein! Nein, das ist ausgeschlossen. Dich hab' ich hier noch nie gesehen.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_04"); //Natürlich ...
};

