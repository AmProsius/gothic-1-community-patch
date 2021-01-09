// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Herek_Exit (C_INFO)
{
	npc			= Vlk_511_Herek;
	nr			= 999;
	condition	= DIA_Herek_Exit_Condition;
	information	= DIA_Herek_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Herek_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Herek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Herek_Bully (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Bully_Condition;
	information		= DIA_Herek_Bully_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Herek_Bully_Condition()
{	
	if ( (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Bully_Info()
{
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //Warte doch mal! Ich hab' gehört, du hast dich mit Bloodwyn unterhalten?
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //Warum? Was willst du?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //Fand ich echt gut von dir, dass du dich geweigert hast, ihm Schutzgeld zu zahlen!
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //Das heißt, wir anderen müssen deinen Teil mitbezahlen!
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Ich werde dafür sorgen, dass du dich daran erinnerst, wenn er dich das nächste Mal fragt ...
	
	Npc_SetPermAttitude (self,ATT_ANGRY);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

// **************************************************
// 					Motz
// **************************************************

INSTANCE DIA_Herek_Motz (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Motz_Condition;
	information		= DIA_Herek_Motz_Info;
	permanent		= 0;
	description		= "Na, wie sieht's aus?";
};

FUNC INT DIA_Herek_Motz_Condition()
{	
	if (Herek_ProtectionBully==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Motz_Info()
{
	AI_Output (other, self,"DIA_Herek_Motz_15_00"); //Na, wie sieht's aus?
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //In diesem Lager ist nicht genug Platz für uns beide!
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //Bitte was?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //Wenn es nach mir ginge, würdest du hier nicht alt!
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //Weißt du, warum ich hier bin? In einer Nacht habe ich ein Dutzend Leute umgebracht. Einfach nur so ... hä hä hä!
	
	Npc_SetPermAttitude (self,ATT_ANGRY);
		
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					Anlegen!
// **************************************************

INSTANCE DIA_Herek_Anlegen (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Anlegen_Condition;
	information		= DIA_Herek_Anlegen_Info;
	permanent		= 1;
	description		= "Du denkst, du bist einer von den Harten? Versuch's doch nochmal bei mir.";
};

FUNC INT DIA_Herek_Anlegen_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Motz)) || (Npc_KnowsInfo(hero,DIA_Herek_Bully)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Anlegen_Info()
{
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //So, du denkst also, du bist einer von den Harten? Versuch's doch mal bei mir ...
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //Du willst'n paar aufs Maul?! Kannst du haben!!
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


