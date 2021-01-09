// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "What are you doing?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //What are you doing?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //I'm making rice schnapps, boy.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Here - have a bottle. But don't tell Silas.
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "How's the distillery going?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //How's the distillery going?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //I can hardly keep up with these guys. Man, can they drink!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //It's a good thing really. While I'm busy, the Rice Lord's lapdogs leave me alone.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "What can you tell me about the Rice Lord?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //What can you tell me about the Rice Lord?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //He's a damn swine! His thugs pick on the weak and force 'em to work in the fields.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //The only one who could stand up to him is Horatio. But he doesn't do violence.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //I did once hear him say he'd love to smash the Rice Lord's head in, but he'd never really do it.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //It'd go against his beliefs.
};

