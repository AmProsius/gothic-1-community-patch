// ********************************
// 				EXIT
// ********************************

instance DIA_Sld_702_EXIT (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 999;
	condition	= DIA_Sld_702_EXIT_Condition;
	information	= DIA_Sld_702_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Sld_702_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Sld_702_First (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_First_Condition;
	information	= DIA_Sld_702_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Sld_702_First_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Sld_702_First_Info()
{
	AI_Output (self, other,"DIA_Sld_702_First_04_00"); //Du weißt, wo du hier hinkommst?
	AI_Output (other, self,"DIA_Sld_702_First_15_01"); //Wohin?
	AI_Output (self, other,"DIA_Sld_702_First_04_02"); //Hier geht es zu Lee, unserem Anführer.
};

// ********************************
// 				PERM
// ********************************

instance DIA_Sld_702_PERM (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_PERM_Condition;
	information	= DIA_Sld_702_PERM_Info;
	permanent	= 1;
	description = "Was muss ich machen, damit du mich zu Lee läßt?";
};                       

FUNC int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_PERM_Info()
{
	AI_Output (other, self,"DIA_Sld_702_PERM_15_00"); //Was muss ich machen, damit du mich zu Lee läßt?
	AI_Output (self, other,"DIA_Sld_702_PERM_04_01"); //Gar nichts!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_02"); //Das hier ist nicht das alte Lager und Lee ist nicht Gomez!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_03"); //Er braucht keine Armee von Schergen, hinter denen er sich verstecken kann. Er kann sich selber verteidigen.
	AI_Output (self, other,"DIA_Sld_702_PERM_04_04"); //WIR sind nur hier, falls er uns braucht.
};



