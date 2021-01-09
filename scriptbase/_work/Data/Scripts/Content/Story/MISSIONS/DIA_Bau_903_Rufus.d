// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Lefty schickt mich. Ich hab' Wasser f�r dich.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Lefty schickt mich. Ich hab' Wasser f�r dich.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Danke, Mann. Ich sterbe vor Durst.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Wasser! Hey, Mann! Du hast nichts mehr! Haben wieder alle was gekriegt bis auf mich?
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "Hi! Ich bin neu hier. Wollte mal fragen, was hier so l�uft.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Hi! Ich bin neu hier. Wollte mal fragen, was hier so l�uft.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Frag jemand anderen. Ich arbeite den ganzen Tag auf den Feldern und krieg nichts von dem mit, was hier l�uft.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Mann, wie gerne w�rd' ich zum Reislord gehen und ihm sagen, er soll seinen Schei� alleine machen!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Wenn's dir nicht gef�llt, warum arbeitest du dann hier? ";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Wenn's dir nicht gef�llt, warum arbeitest du dann hier?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //Es war am ersten Tag als ich hier war. Lefty, einer der Schl�ger, die f�r den Reislord arbeiten, kam zu mir und fragte mich, ob ich mal kurz auf den Reisfeldern helfen k�nnte.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Klar, hab' ich gesagt. Ich war neu und wollte mich n�tzlich machen.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Als ich mich am n�chsten Tag von der Arbeit ausruhte, steht der Typ schon wieder vor mir.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //'Du willst doch nicht deine Kollegen ganz alleine schuften lassen?', hat er gesagt.
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Ich hab' ihm erkl�rt, dass ich kaputt bin vom Tag vorher, dass ich mich ausruhen muss und so. Aber er hat mir nicht zugeh�rt.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Er hat mich am Kragen gepackt und auf die Felder geschleift.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Seit dem Tag stand er jeden Morgen vor meiner T�r - irgendwann bin ich dann von alleine gekommen - ich wollte keinen �rger mit den Typen.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //Das sind richtige Halsabschneider, mit denen legst du dich besser nicht an.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 1;
	description	= "Wer ist der Reislord?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Wer ist der Reislord?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //Er war einer der Ersten hier. Hat das Lager mit gegr�ndet und die Reisfelder angelegt.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Heute steht er nur noch vor seinem Lagerhaus und streckt seine Wampe raus, der alte Fettsack!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
