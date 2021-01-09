// infos 
instance Info_TPL_1455_GorBoba (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba_Condition;
	information		= Info_TPL_1455_GorBoba_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1455_GorBoba_Condition()
{
	return TRUE;
};

func void Info_TPL_1455_GorBoba_Info()
{
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Verschwinde, du bist hier nicht erw�nscht.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Willst DU mich aufhalten?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //Willst DU mich aufhalten?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //JA! Ich werde dich aufhalten, damit du Meister Kalom nicht von seinem Vorhaben abhalten kannst, den Schl�fer zu erwecken.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Versuche nicht, mich anzugreifen, der Hohepriester hat Meister Kalom und uns anderen einen Teil seiner Macht verliehen, wir sind nun unsterblich.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Ich kann dir zeigen, wie unsterblich du bist!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Mache dich bereit, deinem Sch�pfer gegen�ber zu treten.

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel", "GorBoba hat sich mir in den Weg gestellt um micht auf zu halten. Ich habe noch von ihm erfahren, dass Kalom und seine Anh�nger von dem Hohenpriester Macht verliehen bekommen haben, so dass sie nicht mehr mit menschlichen Waffen verletzt werden k�nnen." ); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
