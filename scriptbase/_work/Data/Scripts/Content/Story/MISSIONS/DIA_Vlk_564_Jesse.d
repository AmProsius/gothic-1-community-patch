// **************************************************
// 						 EXIT
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Wie sieht's aus?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Wie sieht's aus?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Neu hier, was? Du solltest wissen, dass man sich hier besser nicht mit den Gardisten anlegt.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Wenn sie Schutzgeld wollen, zahlst du besser, sonst hast du bald das halbe Lager gegen dich.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Hey, du! Ich hab' gehört, du wolltest Bloodwyn kein Schutzgeld zahlen?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Was willst du?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Dich warnen! Bloodwyn hat einige Leute bezahlt, damit sie dir Ärger machen.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Ich hab' zum Beispiel gesehen, wie er mit Herek da drüben geredet hat. Und nur die Götter wissen, mit wem noch!
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Was Herek betrifft, kommt deine Warnung etwas spät.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Er muss noch mit jemand anderem geredet haben - so viel hab' ich mitgekriegt. Also pass auf dich auf.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************

// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Warum hast du mir die Sache mit Bloodwyn erzählt?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Warum hast du mir die Sache mit Bloodwyn erzählt?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Weil hier eine Hand die andere wäscht. Du siehst nicht so aus wie einer, der das nicht begreifen würde.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //Und weil ich DIR jetzt einen Gefallen getan habe, möchte ich dir Gelegenheit geben, dich zu revanchieren.

	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Vergiß es! Ich schulde dir gar nichts!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"An was hattest du denn da gedacht?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Ich schulde dir GAR nichts!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //An was hattest du denn da gedacht?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //Ich hab' kein Erz mehr, und Bloodwyn hat schon versucht, das letzte Bröckchen aus mir rauszupressen.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Jetzt, wo ich dir geholfen habe, könntest du ihm doch meine 10 Erz geben, oder? Sag ihm, sie kommen von mir.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld

	Info_AddChoice		(DIA_Jesse_Mission,"Ich für dich zahlen? Vergiß es!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Ich werd sehen, was ich machen kann...",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Ich werd sehen, was ich machen kann ...
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Danke, Mann! Du bist meine Rettung! Sag mir Bescheid, wenn die Sache gelaufen ist, ja?
	Jesse_PayForMe = LOG_RUNNING;

	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Ich für dich zahlen? Vergiss es!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //So kann man sich in jemandem irren. Mit meiner Hilfe rechnest du am besten nicht mehr.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "Ich habe Bloodwyn bezahlt!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Ich habe Bloodwyn bezahlt!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Ja? Gut! Dann sind wir ja jetzt quitt.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT

	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"WAAAS?! Ich hab' 10 Erz ausgegeben für einen Tip, den ich sowieso schon kannte!?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Genau. Eine Hand wäscht die andere...",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //WAAAS?! Ich hab' 10 Erz ausgegeben für einen Tipp, den ich sowieso schon kannte!?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Sieht so aus.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Genau. Eine Hand wäscht die andere ...
};

//a) <Herek tot>
//b) Herek wird versuchen,


/* */
