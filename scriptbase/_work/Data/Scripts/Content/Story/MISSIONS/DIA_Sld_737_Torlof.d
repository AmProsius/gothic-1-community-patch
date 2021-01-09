// ********************************
// 				EXIT
// ********************************

instance DIA_Torlof_EXIT (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 999;
	condition	= DIA_Torlof_EXIT_Condition;
	information	= DIA_Torlof_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Torlof_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Torlof_Hallo (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 1;
	condition	= DIA_Torlof_Hallo_Condition;
	information	= DIA_Torlof_Hallo_Info;
	permanent	= 0;
	description = "Wer bist du?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Wer bist du?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //Ich bin Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //Hab als Maat auf einem der königlichen Kriegsschiffe bei ner Meuterei mitgemacht. 
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //Kam nicht so gut an. Der größte Teil der Mannschaft war auf der Seite des Käptn's.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //Seitdem bin ich hier.
};

// ********************************
// 				Mitmachen
// ********************************

instance DIA_Torlof_Mitmachen (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 2;
	condition	= DIA_Torlof_Mitmachen_Condition;
	information	= DIA_Torlof_Mitmachen_Info;
	permanent	= 1;
	description = "Ich will bei euch mitmachen.";
};                       

FUNC int DIA_Torlof_Mitmachen_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	||	(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return 1;
	};
};

FUNC VOID  DIA_Torlof_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //Ich will bei euch mitmachen.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Bevor du nicht einiges auf'm Kasten hast, wird Lee dich nicht nehmen, das sag ich dir gleich.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //Und bis du besser bist, solltest du dich mit Lares und seinen Jungs gut stellen.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //Wenn du nen Tipp willst, Junge: Klau was wichtiges aus dem Alten Lager oder der Alten Mine.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //Wenn die Jungs hier merken, dass du gegen Gomez bist, hast du hier keine Probleme mehr.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //Und wie stelle ich das an?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //Du mußt ihr VERTRAUEN gewinnen - und dann haust du sie über's Ohr!
};

/*

// ********************************
// 				PERM
// ********************************

instance DIA_Torlof_PERM (C_INFO)
{
	npc			= Sld_737_Torlof;
	nr			= 3;
	condition	= DIA_Torlof_PERM_Condition;
	information	= DIA_Torlof_PERM_Info;
	permanent	= 1;
	description = "Was kannst du mir über dieses Lager sagen?";
};                       

FUNC int DIA_Torlof_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_PERM_Info()
{
	AI_Output (other, self,"DIA_Torlof_PERM_15_00"); //Was kannst du mir über dieses Lager sagen?
	AI_Output (self, other,"DIA_Torlof_PERM_04_01"); //Ist wie auf'm Piratenschiff, Junge. Solange ab und zu ein fetter Fischzug gegen Gomez drin ist, sind die Banditen zufrieden.
	AI_Output (self, other,"DIA_Torlof_PERM_04_02"); //Wenn sie kein Erz mehr haben, um sich in der Kneipe vollaufen zu lassen, gibt's ne Menge Schlägereien.
};

*/














