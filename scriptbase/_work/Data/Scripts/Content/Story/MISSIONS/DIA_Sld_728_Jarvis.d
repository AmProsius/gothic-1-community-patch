// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Pass auf deinen Rücken auf!
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Hast du vor, durch dies Tor zu gehen?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //Willst du mich aufhalten?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Nein, aber du solltest wissen, was dich erwartet. Es läuft hier nicht so wie im Alten Lager und erst recht nicht wie bei den Sektenspinnern!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //Und wie läuft es hier?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Es gibt hier keine Gardisten oder Templer, die auf dich aufpassen. Jeder ist sich selbst der Nächste, und die einzigen, die zusammenhalten, sind wir Söldner.
};

// ************************************************************
// 						Söldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "Was machen die Söldner?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Was machen die Söldner?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Wir - wir sind die Söldner der Wassermagier.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Unser Ziel ist es, hier auszubrechen. Wir arbeiten hart dafür und wir wollen uns hier keinen Lenz machen, wie die Lumpen aus dem Alten Lager, die sich nur auf den Schultern der Buddler ausruhen.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //Und wir alle folgen Lee. Er ist ein großer Mann. Nur er hält dieses verdammte Lager zusammen.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "Was machen die Magier?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Was machen die Magier?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Sie erforschen die magischen Eigenschafen des Erzes, das unsere Schürfer aus der Mine holen.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //Soweit ich das verstanden habe, wollen sie den ganzen verdammten Erzhaufen in die Luft jagen, um die Barriere wegzusprengen.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //Klingt gefährlich.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Sie sagen, wir sollen uns keine Sorgen machen.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "Ihr habt einen riesigen Haufen Erz hier?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Ihr habt einen riesigen Haufen Erz hier?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Kann man wohl sagen. Wenn wir den mit der Außenwelt tauschen würden, würde uns der König seine Frau dafür verkaufen .
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Aber wir werden einen Dreck tun, dem alten Sack das Erz zu geben. Wir wollen hier RAUS!
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "Wo ist der Erzhaufen?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Wo ist der Erzhaufen?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Willst mal richtig viel Erz sehen, was? In der Mitte der Höhle ist ein Loch, da kippen sie alles rein.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Aber ran kommst du da nicht, das kann ich dir gleich sagen. Die Magier und unsere Leute bewachen das Erz Tag und Nacht.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Ich war nur neugierig.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "Was ist mit dem Rest der Leute?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //Was ist mit dem Rest der Leute?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Alles Banditen. Sie kümmern sich keinen Deut um das Lager. Ich würde sie nicht mal das Vortor bewachen lassen, wahrscheinlich wäre es sinnvoller, dort ein paar Bauern hinzustellen.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "Wie ist die Lage zur Zeit?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Wie ist die Lage zur Zeit?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Die Schürfer sammeln noch. Wenn sie genug Erz haben, jagen wir den Haufen in die Luft.
};

/*------------------------------------------------------------------------
//							SÖLDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hey, ich habe gehört, du hast die Crawler in der Mine ganz schön aufgemischt.
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee ist bestimmt bereit, dich als Söldner aufzunehmen. Sprich doch einfach mal mit ihm.

	self.flags = 0;		// Immortal-Flag löschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Ich sollte mal mit Lee reden. Vielleicht nimmt er mich in die Reihen der Söldner auf.");
};






	


