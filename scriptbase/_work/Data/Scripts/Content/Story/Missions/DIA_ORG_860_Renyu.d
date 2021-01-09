// ************************************************************
// 							EXIT 
// ************************************************************
instance Info_Renyu_EXIT(C_INFO)
{
	npc			= ORG_860_Renyu;
	nr			= 999;
	condition	= Info_Renyu_EXIT_Condition;
	information	= Info_Renyu_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Renyu_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Renyu_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//*****************************************************************
//						Verpiß dich								
//*****************************************************************

instance ORG_860_Renyu_GetLost (C_INFO)
{
	npc			= ORG_860_Renyu;
	nr			= 1;
	condition	= ORG_860_Renyu_GetLost_Condition;
	information	= ORG_860_Renyu_GetLost_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int ORG_860_Renyu_GetLost_Condition()
{
	if (Npc_IsInState(self,ZS_Talk))
	{
		return TRUE;
	};
};

FUNC VOID ORG_860_Renyu_GetLost_Info()
{
	AI_Output (self, other,"Org_860_Renyu_GetLost_Info_06_00"); //Get lost!
	AI_StopProcessInfos	( self );
};

/* 

//*******************************************************
//					DEAL					
//*******************************************************

instance  ORG_860_Renyu_DEAL (C_INFO)
{
	npc				= ORG_860_Renyu;
	condition		= ORG_860_Renyu_DEAL_Condition;
	information		= ORG_860_Renyu_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich bin hier, um euch ein Angebot zu unterbreiten."; 
};

FUNC int  ORG_860_Renyu_DEAL_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_862_Jacko_ANGEBOT))
	&& ( Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  ORG_860_Renyu_DEAL_Info()
{
	AI_Output (other, self,"ORG_860_Renyu_DEAL_Info_15_01"); //Ich bin hier, um euch ein Angebot zu unterbreiten.
	AI_Output (self, other,"ORG_860_Renyu_DEAL_Info_06_02"); //Da bin ich ja mal gespannt, um was gehts?
	AI_Output (other, self,"ORG_860_Renyu_DEAL_Info_15_03"); //Die Bruderschaft weiß, was ihr hier veranstaltet.Sie schicken mich um dafür zu sorgen das ihr aufhört!
	AI_Output (self, other,"ORG_860_Renyu_DEAL_Info_06_04"); //Komm zur Sache!
	
	Info_ClearChoices (ORG_860_Renyu_DEAL);
	Info_AddChoice  (ORG_860_Renyu_DEAL,"Gebt mir 500 Erz",ORG_860_Renyu_DEAL_500);
	Info_AddChoice  (ORG_860_Renyu_DEAL,"Gebt mir 250 Erz",ORG_860_Renyu_DEAL_250);
};  	
func void 	ORG_860_Renyu_DEAL_500()
{
	AI_Output (other, self,"ORG_860_Renyu_DEAL_500_Info_15_01"); //Gebt mir 500 Erz dann sorge ich dafür, das die Bruderschaft euch in Ruhe lässt.!
	AI_Output (self, other,"ORG_860_Renyu_DEAL_500_Info_06_02"); //Und wenn wir nicht zahlen? Was machst du dann?
	AI_Output (other, self,"ORG_860_Renyu_DEAL_500_Info_15_03"); //Dann schicke ich euch ein paar Templer vorbei, die bekommen alle einen dicken Sack Kraut von mir, wenn sich euch fertigmachen!
	AI_Output (self, other,"ORG_860_Renyu_DEAL_500_Info_06_04"); //Weißt du, ich denke wir sollten der Bruderschaft zeigen,das wir es ernst meinen. Wir schicken ihnen deine Überreste, als Warnung! 
	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
	Npc_SetPermAttitude (self,ATT_HOSTILE);
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Npc_SetTarget		(Killian,	hero);
	AI_StartState		(Killian,	ZS_Attack,	1,	"");	
	Npc_SetPermAttitude (Killian,ATT_HOSTILE);
	var C_NPC jacko; 	
	jacko = Hlp_GetNpc(ORG_862_jacko);
	Npc_SetTarget		(jacko,	hero);
	AI_StartState		(jacko,	ZS_Attack,	1,	"");	
	Npc_SetPermAttitude (jacko,ATT_HOSTILE);
};
func void 	ORG_860_Renyu_DEAL_250()
{
	AI_Output (other, self,"ORG_860_Renyu_DEAL_250_Info_15_01"); //Gebt mir 250 erz, dann sorge ich dafür, das die Bruderschaft euch in ruhe lässt.
	AI_Output (self, other,"ORG_860_Renyu_DEAL_250_Info_06_02"); //Hmmm.... nun gut. Einverstanden.Aber wenn du versuchst, mich reinzulegen, dann wirst du dri wünschen mich nie getroffen zu haben.Habn wir eine Abmachung? 
	AI_Output (other, self,"ORG_860_Renyu_DEAL_250_Info_15_03"); //Klar, her mit dem Erz! 
	CreateInvItems (self,ItMinugget,250);
	B_GiveInvItems	(self, other, itminugget, 250);
	idiots_deal = TRUE;
};

//*******************************************************
//					Maul					
//*******************************************************

instance  ORG_860_Renyu_LOST (C_INFO)
{
	npc				= ORG_860_Renyu;
	condition		= ORG_860_Renyu_LOST_Condition;
	information		= ORG_860_Renyu_LOST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Was sagst du jetzt? Du mieser Schwächling! "; 
};

FUNC int  ORG_860_Renyu_LOST_Condition()
{	
	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Renyu.aivar[AIV_WASDEFEATEDBYSC] ;
	
	if  (Renyu.aivar[AIV_WASDEFEATEDBYSC] == TRUE) 
	&&  (Npc_KnowsInfo (hero,ORG_860_Renyu_DEAL))
	&&  ( Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  ORG_860_Renyu_LOST_Info()
{
	AI_Output (other, self,"ORG_860_Renyu_LOST_Info_15_01"); //Was sagst du jetzt? Du mieser Schwächling! 
	AI_Output (self, other,"ORG_860_Renyu_LOST_Info_06_02"); //In Ordnung, mann du hast gewonnen! Wir werden aufhören! Das Kraut gehört dir!
	Kalom_DrugMonopol = LOG_SUCCESS;
	Npc_ExchangeRoutine (self,"ARBEITSLOS");
	
	var C_NPC jacko; 	
	jacko = Hlp_GetNpc(ORG_862_jacko);
	Npc_ExchangeRoutine (jacko,"ARBEITSLOS");
};  


*/







