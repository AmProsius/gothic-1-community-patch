// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Sld_11_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_Mine_Sld_11_EXIT_Condition;
	information	= Info_Mine_Sld_11_EXIT_Info;
	permanent	= 1;
	description = "END";
};                       

FUNC INT Info_Mine_Sld_11_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Mine_Sld_11_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Sld_11_EinerVonEuchWerden_Condition;
	information	= Info_Mine_Sld_11_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "How do I join you?";
};                       

FUNC INT Info_Mine_Sld_11_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};	

FUNC VOID Info_Mine_Sld_11_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_EinerVonEuchWerden_15_00"); //How do I join you?
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_01"); //If you wanna be one of us, you have to earn yourself a reputation.
	AI_Output(self,other,"Info_Mine_Sld_11_EinerVonEuchWerden_011_02"); //Go and prove your worth elsewhere, then maybe you'll be allowed to serve in the Hollow.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Sld_11_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Sld_11_WichtigePersonen_Condition;
	information	= Info_Mine_Sld_11_WichtigePersonen_Info;
	permanent	= 1;
	description = "Who gives the orders here?";
};                       

FUNC INT Info_Mine_Sld_11_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_WichtigePersonen_15_00"); //Who gives the orders here?
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_01"); //Here in the Hollow, everyone does what Okyl says. He knows all the bigshots in the Camp.
	AI_Output(self,other,"Info_Mine_Sld_11_WichtigePersonen_011_02"); //So if you do anything stupid, the water mages in the New Camp will know about it.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Mine_Sld_11_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Sld_11_DasLager_Condition;
	information	= Info_Mine_Sld_11_DasLager_Info;
	permanent	= 1;
	description = "Anything special go on here?";
};                       

FUNC INT Info_Mine_Sld_11_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DasLager_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DasLager_15_00"); //Anything special go on here?
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_01"); //Nothing but a hell of a lot of trouble if you try anything foolish.
	AI_Output(self,other,"Info_Mine_Sld_11_DasLager_011_02"); //Oh yeah, and more trouble if you try to get in the mine or the gatehouse without permission.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Sld_11_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Sld_11_DieLage_Condition;
	information	= Info_Mine_Sld_11_DieLage_Info;
	permanent	= 1;
	description = "How's it going?";
};                       

FUNC INT Info_Mine_Sld_11_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Sld_11_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Sld_11_DieLage_15_00"); //How's it going?
	AI_Output(self,other,"Info_Mine_Sld_11_DieLage_011_01"); //It's quiet. A bit too quiet for my liking.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Sld_11(var c_NPC slf)
{
	//B_AssignFindNpcInfos(slf);
	
	Info_Mine_Sld_11_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Sld_11_DieLage.npc				= Hlp_GetInstanceID(slf);
};
