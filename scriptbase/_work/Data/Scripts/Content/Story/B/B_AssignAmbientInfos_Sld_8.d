// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Sld_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Sld_8_EXIT_Condition;
	information	= Info_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "ENDE";
};                       

FUNC INT Info_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "K�nnt ihr noch einen guten Mann brauchen?";
};                       

FUNC INT Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //K�nnt ihr noch einen guten Mann brauchen?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Lee wird keine Leute bei den S�ldnern zulassen, die nicht schon 'ne Zeit lang hier waren und Erfahrung gesammelt haben.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //Wenn du hier im Lager bleiben willst, musst du dich zuerst mit den Banditen rumschlagen.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Sld_8_WichtigePersonen_Condition;
	information	= Info_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Wer hat hier das Sagen?";
};                       

FUNC INT Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //Wir S�ldner folgen alle Lee. Er hat den Deal mit den Magiern gemacht - wir besch�tzen sie, und sie bringen uns hier raus.
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02"); //Also f�hren die Magier das Lager?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03"); //Nein. Niemand f�hrt das Lager. Die meisten hier sind einfach M�nner, die im Alten Lager nicht bleiben konnten oder wollten.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04"); //Hier kocht jeder sein eigenes S�ppchen. Die Jungs sind sich nur in einem einig: Besser das ganze Erz auf einen Haufen sch�tten und in die Luft jagen, als es dem verdammten K�nig in den Rachen zu schieben!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Sld_8_DasLager_Condition;
	information	= Info_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "Was kannst du mir �ber dieses Lager erz�hlen?";
};                       

FUNC INT Info_Sld_8_DasLager_Condition()
{	
	if (!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};
FUNC VOID Info_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //Was kannst du mir �ber dieses Lager erz�hlen?
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //Pass auf dich auf, w�hrend du hier bist. Im Lager sind 'ne Menge Halsabschneider unterwegs.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //Es gibt 'ne Reihe ungeschriebener Gesetze hier. Erstens: Nur die S�ldner kommen in den Bereich der Magier.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Zweitens: Wer versucht, an den Erzhaufen ranzukommen, ist ein toter Mann. Drittens: Ich w�rde nicht versuchen, in die Kneipe auf dem See zu gehen.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Die geh�rt n�mlich den Banditen und die sehen es nicht gerne, wenn gr�ne Jungs wie du da aufkreuzen.
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Sld_8_DieLage_Condition;
	information	= Info_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "Wie sieht's aus?";
};                       

FUNC INT Info_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //Wie sieht's aus?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //Wie immer - wir passen auf, dass keiner den Magiern und dem Erz zu nahe kommt.
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Sld_8_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Sld_8_Krautprobe_Condition;
	information	= Info_Sld_8_Krautprobe_Info;
	permanent	= 1;
	description = "Ich hab Sumpfkraut dabei - willst du was?";
};                       

FUNC INT Info_Sld_8_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00"); //Ich hab Sumpfkraut dabei - willst du was?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01"); //Warum nicht. Gib mir was f�r 10 Erz.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02"); //Frag mal ein paar von den anderen Jungs, die wollen sicher auch was.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_8_Krautprobe_No_Joint_08_00"); //Ich will erst das Kraut sehen. Du hast doch gar nichts dabei.
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Sld_8(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Sld_8_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
