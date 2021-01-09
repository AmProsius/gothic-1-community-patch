// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_13_EXIT_Condition;
	information	= Info_Org_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Org_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_13_EinerVonEuchWerden_Condition;
	information	= Info_Org_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "What do I have to do to join the Camp?";
};                       

FUNC INT Info_Org_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00"); //What do I have to do to join the Camp?
	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01"); //Go out into the fields and help the peasants collect the rice.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_13_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_13_WichtigePersonen_Condition;
	information	= Info_Org_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Who calls the shots around here?";
};                       

FUNC INT Info_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00"); //Who calls the shots around here?
	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01"); //Lee's the head of the mercenaries, if THAT's what you mean. But I'm no mercenary and I'm damned if I'll let them boss me around!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_13_DasLager_Condition;
	information	= Info_Org_13_DasLager_Info;
	permanent	= 1;
	description = "I want to know more about this camp.";
};                       

FUNC INT Info_Org_13_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_13_DasLager_15_00"); //I want to know more about this camp.
	AI_Output(self,other,"Info_Org_13_DasLager_13_01"); //Then go on in and take a look round. So long as you're not one of Gomez' men, no-one'll stop you.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_13_DieLage_Condition;
	information	= Info_Org_13_DieLage_Info;
	permanent	= 1;
	description = "How's it going?";
};                       

FUNC INT Info_Org_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_13_DieLage_15_00"); //How's it going?
	AI_Output(self,other,"Info_Org_13_DieLage_13_01"); //And what do YOU want?
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_13_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_13_Krautprobe_Condition;
	information	= Info_Org_13_Krautprobe_Info;
	permanent	= 1;
	description = "You look like you could do with some swampweed.";
};                       

FUNC INT Info_Org_13_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_13_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00"); //You look like you could do with some swampweed.
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01"); //You got some? I'll have a stalk for 10 Ore.
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02"); //Come back anytime, brother.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_13_Krautprobe_No_Joint_13_00"); //But you've got none. Hey! Don't piss me around!
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_13(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Org_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Org_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Org_13_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_13_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
