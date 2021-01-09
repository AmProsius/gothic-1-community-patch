// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Hey, du!
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Wer? Ich?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Du weißt genau, mit wem ich rede, Bürschchen!
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Ich will dir mal was sagen: Das hier ist MEIN Viertel. Und ich will hier keinen Ärger!
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Aber neue Typen wie du bedeuten immer Ärger. Vor allem, wenn sie hier mitten in der Nacht rumlaufen.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Also, warum sorgst du nicht dafür, dass ich dich hier nicht mehr sehe. Die Hütte gegenüber der Arena mit dem Vordach ist frei. Leg dich 'ne Runde ins Bett.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Wenn ich dich in einer der anderen Hütten erwische, zieh ich dir das Fell über die Ohren.
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Hey, du!
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Wenn du dein Schutzgeld loswerden willst - heute ist nicht der Tag.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //So? Und warum nicht?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Weil ich gar nicht da bin.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Verstehe." 	,DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Wie kommt es dann, dass wir beide uns unterhalten?"	,DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Wo bist du denn?"	,DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Wo bist du denn?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //Eigentlich bin ich in der Burg, am großen Lagerfeuer, und trinke ein Bier.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Wie kommt es dann, dass wir beide uns unterhalten?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek ist verschwunden. Er ist normalerweise für dieses Viertel verantwortlich.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //Bis er wieder da ist, hat Thorus MICH hier eingesetzt.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Verstehe.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "Weißt du, wo Nek geblieben ist?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Weißt du, wo Nek geblieben ist?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Nein, und ich werde es auch nicht rausfinden.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Wenn einer was weiß, dann die Buddler aus diesem Viertel. Aber die Buddler reden nicht mit Gardisten.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Vor allem nicht jetzt, denn sie wissen, dass ich diese Drecksarbeit hier verabscheue, und insgeheim lachen sie sich über mich tot!
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,	"Die Buddler im Arenaviertel wissen vielleicht, wohin Nek verschwunden ist.");
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "Warum sammelst du nicht trotzdem Schutzgeld?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Warum sammelst du nicht trotzdem Schutzgeld?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Kurz bevor er verschwunden ist, hat Nek noch einmal alle kräftig zur Kasse gebeten. Da ist nicht mehr viel zu holen.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "Wegen Nek...";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //Wegen Nek ...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Ja?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Ich glaub', ich hab' ihn gefunden.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Was? Wo ist er?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Er ist Futter für die Ratten.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //Nein! Verdammt! Dann muss ICH jetzt den Laden hier schmeißen. Ich hatte gehofft, er kommt wieder.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Jetzt hab' ich ein Problem ...
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //Noch nichts Neues.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Halt mich auf dem Laufenden.
	};
};

// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "Was ist dein Problem?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Was ist dein Problem?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Ich habe Schulden bei Scatty. 'Ne Menge Schulden. Jetzt, wo er weiß, dass ich Neks Job mache, wird er jeden Tag bei mir auf der Matte stehen ...
};	












//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Du hast ziemlich schnell kapiert, wie es hier läuft. Willkommen bei der Garde!
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Fletcher_DIE (C_INFO)
{
	npc			= Grd_255_Fletcher;
	condition	= Info_Fletcher_DIE_Condition;
	information	= Info_Fletcher_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Fletcher_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Fletcher_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Du Verräter! Na dich haben wir mal zum Gardisten gemacht. PAH!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //Da ist noch einer von diesen verräterischen Feuermagiern! PAH!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Hallo Verräter! Auch dein früherer Status als einer von Gomez' Schatten wird dir jetzt nichts mehr helfen!
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Moment. Wovon redest du, Fletcher?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Steckst mit diesem abtrünnigen Abschaum aus dem Neuen Lager unter einer Decke, was?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Warte mal ...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Hattest wohl gedacht, wir würden nicht dahinter kommen, wie?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Jetzt aber mal halblang ...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Wir werden DICH halblang machen. Oder genauer gesagt, einen Kopf kürzer.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //STIRB, VERRÄTER!!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,	"Bloodwyn, hat sich am hinteren Tor verschanzt. Er reagierte ähnlich wie Fletcher am Haupttor. Mir ist nicht klar warum, aber es muss etwas mit meiner Fokussuche für das Neue Lager zu tun haben.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,	"Fletcher, der nun mit einer Gruppe Gardisten am Haupttor des Alten Lagers Wache hält, bezeichnete mich als Verräter und Abtrünniger. Er lies sich auf keine Diskussion ein und griff mich sofort an!");
			B_LogEntry			(CH4_BannedFromOC,	"Es sieht so aus, als ob ich nun aus dem alten Lager verbannt wurde!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Sieh mal einer an. Einer aus dem Neuen Lager!
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Sieh mal einer an. Einer aus dem Sumpflager!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //Ja, und? Was geht dich das an?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //Bald wird auch eure Mine zu uns gehören.
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Davon träumst du doch nur!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Leider können wir es nicht zulassen, dass du das irgendwo herumerzählst!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Warte mal, ich bin nicht auf Streit aus ...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Das hättest du dir überlegen sollen, bevor du hier aufkreuzt!
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //He, was soll der Unfug ...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Auf ihn Jungs, den schnappen wir uns!
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,	"Die Tore des Alten Lagers sind nun verschlossen und werden von Gardisten bewacht. Sie attackieren jeden der dem Lager zu nahe kommt.");
	};
	
	AI_StopProcessInfos	(self);
};

