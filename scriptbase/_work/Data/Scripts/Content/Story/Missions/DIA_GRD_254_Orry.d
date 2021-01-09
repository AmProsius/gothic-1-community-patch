// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //You'd better make sure you reach the Old Camp in one piece!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "What are you doing here?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //What are you doing here?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Making sure no-one gets near the exchange place. Especially none of those cut-throats from the New Camp.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //You're the new guy they chucked in today, right?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //That's me.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //Then you'd better watch out for the guys from the New Camp!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //I work for the Old Camp, same as the others you saw at the exchange place.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //I assume you've talked to Diego...?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"No.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Yes.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //No.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Then do so! He's the one that deals with newcomers.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //He knows a lot about the colony - things that are important to new people like you.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Yes, I have.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Good. Then you know what's what around here.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Why do I have to watch out for the guys from the New Camp?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Why do I have to watch out for the guys from the New Camp?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Compared to the New Camp, the Old Camp's a quiet, peaceful sort of place.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //The New Camp doesn't get any deliveries from the outside world. Most of the rogues there just steal whatever they need.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "And the Old Camp?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //And the Old Camp?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //The Ore Barons have everything under control. Next in line to them are the guards, followed by the Shadows. The diggers are the lowest.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Everyone who arrives here starts out as a digger. If you want to become something better than that, you'll have to get accepted as a Shadow first.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "When I was washed ashore, one of the guys punched me in the face."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //When I was washed ashore, one of the guys punched me in the face.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //They do that to all the newcomers. They call it 'Standing Godfather'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Oh. Are all the guys like that in the Old Camp?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //We do have a few suckers. But they won't touch you as long as you pay them protection money.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "I saw a woman being sent down with the goods."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //I saw a woman being sent down with the goods.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Yeah, the Ore Barons get everything they want.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //D'you mean to say the King exchanges women for ore?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //They're convicted criminals too, of course. But if Gomez hadn't asked for them, they'd be sitting in some dungeon or other.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //I'm not sure what's worse...
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "I'm looking for a weapon..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //I'm looking for a weapon...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //There should be some old weapons by the derelict mine further down the canyon.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //But don't go and start a war with nothing but a rusty pickaxe for a weapon - those things are slow and heavy.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //An inexperienced fighter should never use one of them unless it's an emergency.
	
};



