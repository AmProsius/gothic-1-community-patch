// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_217_Exit (C_INFO)
{
	npc			= Grd_217_Torwache;
	nr			= 999;
	condition	= DIA_Grd_217_Exit_Condition;
	information	= DIA_Grd_217_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_217_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_217_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Hallo
// **************************************************

INSTANCE DIA_Grd_217_First (C_INFO)
{
	npc				= Grd_217_Torwache;
	nr				= 1;
	condition		= DIA_Grd_217_First_Condition;
	information		= DIA_Grd_217_First_Info;
	permanent		= 1;
	description		= "Hi!";
};

FUNC INT DIA_Grd_217_First_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grd_217_First_Info()
{
	AI_Output (other, self,"DIA_Grd_217_First_15_00"); //Hi!
	AI_Output (self, other,"DIA_Grd_217_First_06_01"); //Move your ass! Get in, or get out - I don't care. Just as long as you get out of my sight.
	AI_StopProcessInfos	( self );
};
