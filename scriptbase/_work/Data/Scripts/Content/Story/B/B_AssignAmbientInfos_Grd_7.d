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
	description = "Was muß ich tun, um bei Gomez' Gardisten aufgenommen zu werden?";
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
	AI_Output(other,self,"Info_grd_7_EinerVonEuchWerden_15_00"); //Was muss ich tun, um bei Gomez' Gardisten aufgenommen zu werden?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_01"); //Du?! Du machst mir Spaß. Kommst hier rein und willst direkt ganz nach oben, was?
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_02"); //Gomez macht nur die Besten seiner Leute zu Gardisten.
	AI_Output(self,other,"Info_grd_7_EinerVonEuchWerden_07_03"); //Du wirst wie alle anderen anfangen müssen, und deine Loyalität als Schatten unter Beweis stellen.
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
	description = "Wer hat hier das Sagen?";
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
	AI_Output(other,self,"Info_grd_7_WichtigePersonen_15_00"); //Wer hat hier das Sagen?
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_01"); //Thorus kontrolliert alles, was im Lager läuft. Diego ist seine rechte Hand.
	AI_Output(self,other,"Info_grd_7_WichtigePersonen_07_02"); //Wenn du hier aufgenommen werden willst, sind das die Leute, mit denen du reden musst.
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
	description = "Arbeiten alle Leute hier für die Erzbarone?";
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
	AI_Output(other,self,"Info_grd_7_DasLager_15_00"); //Arbeiten alle Leute hier für Gomez?
	AI_Output(self,other,"Info_grd_7_DasLager_07_01"); //Nein. Die meisten hier sind einfache Buddler.
	AI_Output(self,other,"Info_grd_7_DasLager_07_02"); //Nur wir Gardisten und die Schatten sind Gomez' Leute.
	Info_ClearChoices(Info_grd_7_DasLager);
	Info_AddChoice(Info_grd_7_DasLager, "ZURÜCK", Info_grd_7_DasLager_Zurueck);
	Info_AddChoice(Info_grd_7_DasLager, "Was tun die Gardisten?", Info_grd_7_DasLager_Gardisten);
	Info_AddChoice(Info_grd_7_DasLager, "Was ist die Aufgabe der Schatten?", Info_grd_7_DasLager_Schatten);
	Info_AddChoice(Info_grd_7_DasLager, "Wofür sind die Buddler da?", Info_grd_7_DasLager_Buddler);
};

FUNC VOID Info_grd_7_DasLager_ZURUECK()
{
	Info_ClearChoices(Info_grd_7_DasLager);
};

FUNC VOID Info_grd_7_DasLager_Gardisten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_WasIstAerger_15_00"); //Was tun die Gardisten?
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_01"); //Wir bewachen das Lager und beschützen die Buddler.
	AI_Output(self,other,"Info_grd_7_DasLager_WasIstAerger_07_02"); //Mit Sold, den Gomez uns zahlt und dem Schutzgeld, das wir von den Buddlern bekommen, kann man seine Zeit ganz gut rumkriegen.
};

FUNC VOID Info_grd_7_DasLager_Schatten()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Schatten_15_00"); //Was ist die Aufgabe der Schatten?
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_01"); //Die Schatten sorgen dafür, dass Gomez' Befehle ausgeführt werden.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_02"); //Die meisten von ihnen sind Speichellecker, die sich hocharbeiten wollen, aber wenn du hier was werden willst, ist das der einzige Weg.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_03"); //Wenn du lange genug deine Aufgaben erledigt hast, ohne zu versagen, kannst du einer von uns werden.
	AI_Output(self,other,"Info_grd_7_DasLager_Schatten_07_04"); //Wenn du erst zu Gomez' Leuten gehörst, kann dir niemand in der ganzen Kolonie mehr was anhaben, Kleiner!
};

FUNC VOID Info_grd_7_DasLager_Buddler()
{
	AI_Output(other,self,"Info_grd_7_DasLager_Buddler_15_00"); //Wofür sind die Buddler da?
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_01"); //Gute Frage! Die Dreckfresser sollten wir eigentlich gar nicht aus der Mine rauslassen.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_02"); //Wenn sie 'ne Zeit lang in der Mine waren, kommen sie her, um ihren Anteil auszugeben.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_03"); //Wenn alles verprasst ist, geht's wieder ab in die Mine. Die meisten hier leben so.
	AI_Output(self,other,"Info_grd_7_DasLager_Buddler_07_04"); //Du siehst aus, als wenn du mehr draufhättest, als nur ne Hacke zu schwingen. Du solltest mit Thorus reden, wenn du's nicht schon getan hast.
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
	description = "Wie steht's?";
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
	AI_Output(other,self,"Info_grd_7_DieLage_15_00"); //Wie steht's?
	AI_Output(self,other,"Info_grd_7_DieLage_07_01"); //Für dich? Solange du keinem Lager angehörst, nimmt dich hier keiner ernst, Kleiner!
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
