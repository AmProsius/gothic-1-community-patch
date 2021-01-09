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
	description = "Lefty sent me. I've brought you some water.";
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
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Lefty sent me. I've brought you some water.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Thanks, man. My mouth's like a desert!
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
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Water! Hey, man! There's none left! Don't tell me everyone got some except me, again?
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
	description	= "Hi! I'm new here. I just wanted to know what goes on around here.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Hi! I'm new here. I just wanted to know what goes on around here.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Ask someone else, will ya. I do nothin' but work out here in the fields, I don't know nothin'.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Man, I'd love to tell the Rice Lord to do his own damn dirty work!
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
	description	= "If you don't like it, why are you working here?";
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
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //If you don't like it, why are you working here?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //It happened the first day I got here. Lefty, one of the thugs that works for the Rice Lord, came up to me and asked if I could lend a hand in the rice fields.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Sure, I said. I was new here and I wanted to make myself useful.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //The next day, when I was taking a short rest, the guy turned up again.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //You don't wanna let your colleagues do all their work by themselves, do you?' he asked.
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //I told him I was exhausted from the previous day's work, that I needed a rest and all that. But he never listened.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //He grabbed me by the collar and dragged me back to the field.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //From that day on, he stood outside my doorstep every day - until I got used to going on my own. I didn't want any trouble with those guys.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //They're real cut-throats, you'd better steer clear of them.
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
	description	= "Who is the Rice Lord?";
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
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Who is the Rice Lord?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //He was one of the first to arrive here. He helped found the Camp and start up the rice fields.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //These days he just hangs out at the warehouse stretching his stomach, the fat pig!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
