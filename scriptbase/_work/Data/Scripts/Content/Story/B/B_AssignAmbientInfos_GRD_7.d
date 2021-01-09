// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_7_EXIT_Condition;
	information	= Info_grd_7_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_EinerVonEuchWerden_Condition;
	information	= Info_grd_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "What do I have to do to get accepted as one of Gomez' guards?";
};                       

FUNC INT Info_grd_7_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //What do I have to do to get accepted as one of Gomez' guards?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //You?! You're kidding. You think you can just come in here strutting and get straight to the top, or what?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gomez has only the best people for guards.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //You're gonna have to work your way up like everyone else, and prove your loyalty as a Shadow.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_WichtigePersonen_Condition;
	information	= Info_grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Who calls the shots around here?";
};                       

FUNC INT Info_grd_7_WichtigePersonen_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Who calls the shots around here?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus controls all that goes on in the Camp. Diego's his lieutenant.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //If you want to get anywhere here, they're the guys you need to talk to.
	var C_NPC Diego;		Diego 	= Hlp_GetNpc(PC_Thief);
	Diego.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_7_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_7_DasLager_Condition;
	information	= Info_grd_7_DasLager_Info;
	permanent	= 1;
	description = "Do all the people here work for Gomez?";
};                       

FUNC INT Info_grd_7_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Do all the people here work for Gomez?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Na. Most of them are just ordinary diggers.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Only we guards and the Shadows are with Gomez.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager,"BACK", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager,"What do the guards do?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager,"What do the Shadows do?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager,"What do the diggers do?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //What do the guards do?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //We guard the Camp and protect the diggers.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //We get paid by Gomez and the diggers pay us protection money. It's a pretty lucrative business.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //What do the Shadows do?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //The Shadows see to it that Gomez' orders are obeyed.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Most of them are common bootlickers trying to work their way up through the ranks. If you wanna make it anywhere round here, that's the way to go.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //You do your chores long enough without failing, and you may become one of us.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Once you're with Gomez, nobody in the entire colony will push you around anymore, kid!
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //What do the diggers do?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //That's a good question! We shouldn't even really let those mudeaters out of the mine.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //When they've been in the mine for a while they come out here to spend their loot.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Once they've squandered the lot, they go back into the mine. That's what most people round here do.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //You look like you're cut out for more than just swinging a pickaxe. You should have a word with Thorus, if you haven't already.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_7_DieLage_Condition;
	information	= Info_grd_7_DieLage_Info;
	permanent	= 1;
	description = "How's it going?";
};                       

FUNC INT Info_grd_7_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //How's it going?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //For you, you mean? Until you decide which camp you're with, nobody's gonna take you seriously, kid!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_7(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_grd_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_grd_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
