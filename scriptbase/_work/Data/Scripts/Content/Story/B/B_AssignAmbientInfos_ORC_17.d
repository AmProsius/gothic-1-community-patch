INSTANCE Info_Orc_17_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Orc_17 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Orc_17_EXIT_Condition;
	information	= Info_Orc_17_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Orc_17_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Orc_17_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

FUNC VOID B_AssignAmbientInfos_Orc_17(var c_NPC slf)
{
	Info_Orc_17_EXIT.npc					= Hlp_GetInstanceID(slf);
};
