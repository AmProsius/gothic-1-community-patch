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
	description = "Who are you?";
};                       

FUNC int DIA_Torlof_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torlof_Hallo_Info()
{
	AI_Output (other, self,"DIA_Torlof_Hallo_15_00"); //Who are you?
	AI_Output (self, other,"DIA_Torlof_Hallo_04_01"); //I'm Torlof.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_02"); //I was involved in a mutiny as mate of a royal warship.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_03"); //It wasn't such a good idea. The greater part of the crew was on the captain's side.
	AI_Output (self, other,"DIA_Torlof_Hallo_04_04"); //That's how I came to be here.
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
	description = "I'd like to join you.";
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
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_00"); //I'd like to join you.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_01"); //Lee won't take you on until you get real good, I'm telling you now.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_02"); //And until then you'd better stay on good terms with Lares and his crowd.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_03"); //You want some advice, boy: Steal something important from the Old Camp or the Old Mine.
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_04"); //As soon as the boys notice that you're against Gomez, you won't have any more trouble here.
	AI_Output (other, self,"DIA_Torlof_Mitmachen_15_05"); //And how do I do that?
	AI_Output (self, other,"DIA_Torlof_Mitmachen_04_06"); //You need to win their TRUST - and then you can rip 'em off!
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














