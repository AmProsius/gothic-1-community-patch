//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
// Publikum		1	  ////////////////////////////////////////
//////////////////////////////////////////////////////////////

INSTANCE IEFan1_EXIT (C_INFO)
{
	npc			= IEFan1;
	nr			= 999;
	condition		= IEFan1_EXIT_Condition;
	information		= IEFan1_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE;
};                       

FUNC INT IEFan1_EXIT_Condition()
{
	return 1;
};

FUNC VOID IEFan1_EXIT_Info()
{	
	AI_StopProcessInfos	( self );
};


//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
// Publikum		2	  ////////////////////////////////////////
//////////////////////////////////////////////////////////////

INSTANCE IEFan2_EXIT(C_INFO)
{
	npc			= IEFan2;
	nr			= 999;
	condition		= IEFan2_EXIT_Condition;
	information		= IEFan2_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE;
};                       

FUNC INT IEFan2_EXIT_Condition()
{	
	return 1;
};

FUNC VOID IEFan2_EXIT_Info()
{	
	AI_StopProcessInfos	( self );
};


//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
// Publikum		3	  ////////////////////////////////////////
//////////////////////////////////////////////////////////////

INSTANCE IEFan3_EXIT (C_INFO)
{
	npc			= IEFan3;
	nr			= 999;
	condition		= IEFan3_EXIT_Condition;
	information		= IEFan3_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT IEFan3_EXIT_Condition()
{	
	return 1;
};

FUNC VOID IEFan3_EXIT_Info()
{	
	AI_StopProcessInfos	( self );
};


//////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////
// Publikum		4	  ////////////////////////////////////////
//////////////////////////////////////////////////////////////

INSTANCE IEFan4_EXIT (C_INFO)
{
	npc			= IEFan4;
	nr			= 999;
	condition		= IEFan4_EXIT_Condition;
	information		= IEFan4_EXIT_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_ENDE;
};                       

FUNC INT IEFan4_EXIT_Condition()
{	
	return 1;
};

FUNC VOID IEFan4_EXIT_Info()
{	
	AI_StopProcessInfos	( self );
};

