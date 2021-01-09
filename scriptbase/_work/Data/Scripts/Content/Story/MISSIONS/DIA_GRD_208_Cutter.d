//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Ihr habt ganz schön viel Platz hier in der Burg.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Ihr habt ganz schön viel Platz hier in der Burg.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Ich habe dich hier noch nie gesehen. Wer bist du?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Ich bin neu hier. Wollte mich mal ein bisschen umsehen.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 10;
	description = "Was kannst du mir über die Burg sagen?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Was kannst du mir über die Burg sagen?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Nach dem großen Aufstand haben sich Gomez und seine Jungs die Burg unter den Nagel gerissen.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Ich hab' damals schnell gemerkt, dass es besser ist, sich ihm anzuschließen.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Schon als wir damals noch alle im Kerker eingepfercht waren, und in den Minen schuften mussten hatte er unter den Gefangenen am meisten zu sagen.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Es gibt Kerker unter der Burg?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Ja, aber sie sind heute leer. Seit dem großen Aufstand will da niemand mehr rein.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "Wie ist das Leben als Gardist?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Wie ist das Leben als Gardist?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Ruhig. Wir sind das größte und stärkste Lager in der Kolonie - mit uns legt sich keiner an.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Verstehe.
	AI_StopProcessInfos	(self);
};

	














/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Du hast die richtige Entscheidung getroffen. Das Leben als Gardist wird dir gefallen!
	AI_StopProcessInfos	(self);
};
