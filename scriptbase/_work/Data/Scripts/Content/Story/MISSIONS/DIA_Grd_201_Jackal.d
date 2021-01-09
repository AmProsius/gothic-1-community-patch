// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //Ah! Ein neues Gesicht.
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Was willst du?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Ich will dir meine Hilfe anbieten. Du bist neu hier und Neue bekommen schnell Ärger ... Mit einer kleinen Spende an mich könntest du dir einiges davon ersparen.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Nur 10 Erz, Mann! Das ist nicht viel.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"Und wenn ich nicht zahle?" ,Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"Und was bekomme ich dafür?" ,Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Hier. 10 Erz. Und du hilfst mir, wenn ich Ärger habe." ,Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Hier. 10 Erz. Und du hilfst mir, wenn ich Ärger habe.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Wenn ich in der Nähe bin, kannst du auf mich zählen. Du kannst mich jederzeit zischen dem Marktplatz und dem Südtor finden.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Um die anderen Bereiche kümmern sich Fletcher und Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Hey, verarsch mich nicht! Komm wieder, wenn du das Erz hast!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //Und was bekomme ich dafür?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Solange du in meinem Viertel bist, passe ich auf dich auf.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Wenn du mal Ärger mit Typen aus dem Neuen Lager haben solltest oder mit einem der Sektenspinner, die dir die Backe voll quatschen, kannst du auf mich zählen.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Wenn du dich mit einem Buddler anlegst, helfen wir dem, der gezahlt hat - so einfach ist das.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //Und wenn beide gezahlt haben?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Dann sehen wir uns die Show an. Aber oft kommt das nicht vor.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //Und wenn ich nicht zahle?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Hey Mann, mach dir keinen Stress! Du bist neu hier - sieh dich mal ein bisschen um. Sammel' erst mal etwas Erz und wenn du bereit bist zu zahlen - dann zahlst du.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Du kannst das jederzeit nachholen - nur bitte rechne nicht mit meiner Hilfe, solange du nicht einen kleinen Beitrag zu meinen Unkosten geleistet hast - das verstehst du doch?
	Info_AddChoice		(Info_Jackal_Hello,"Wir sehen uns später." ,Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //Wir sehen uns später.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Pass solange gut auf dich auf.
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "Ich hab' noch mal über das Schutzgeld nachgedacht - hier sind deine 10 Erz.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) )
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Ich hab' noch mal über das Schutzgeld nachgedacht - hier sind deine 10 Erz.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Du hast eine gute Wahl getroffen, Mann. Ab jetzt pass ich auf dich auf!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Ich sehe keine 10 Erz, Mann. Komm wieder, wenn du 10 Erz hast.
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "Na, wie sieht's aus?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //Na, wie sieht's aus?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Du kannst nach wie vor auf mich zählen, Kleiner!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Du hast dich ziemlich schnell nach oben gearbeitet! Gut gemacht, Mann!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Sieh mal einer an. Der Verräter, der das Lager gewechselt hat!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Du hättest dich nicht mit diesen Verlierern einlassen sollen, dann würdest du noch zu uns gehören!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Sieh mal einer an. Der Typ aus dem Neuen Lager, der uns schon so viel Ärger gemacht hat!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Wenn du damals schlauer gewesen wärst, würdest du heute zu uns - den Siegern - gehören!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Sieh mal einer an. Der Typ aus dem Sumpflager.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Du hast dich zu lange bei diesen Spinnern aufgehalten, die haben dein Hirn weich gekocht!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Da hilft dir auch nicht, dass du mir Schutzgeld bezahlt hast.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Hättest mich damals bezahlen sollen, als es noch Zeit war.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Ihr seid zu weit gegangen! Der Überfall auf die Mine war dumm von euch!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Scheint aber funktioniert zu haben. Und du wirst daran auch nichts ändern, dafür werde ich persönlich Sorge tragen!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //LOS, WIR MACHEN IHN KALT, JUNGS!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

