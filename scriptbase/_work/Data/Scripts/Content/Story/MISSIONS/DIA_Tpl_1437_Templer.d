
// ************************ EXIT **************************

instance  Tpl_1437_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1437_Templer;
	nr			=  999;
	condition	=  Tpl_1437_Templer_Exit_Condition;
	information	=  Tpl_1437_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1437_Templer_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Tpl_1437_Templer_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** BESSER NICHT ANSPRECHEN ****************************************//

instance  Tpl_1437_Templer_NERV (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_NERV_Condition;
	information		= Tpl_1437_Templer_NERV_Info;
	important		= 0;
	permanent		= 1;
	description		= "Was liegt an?"; 
};

FUNC int  Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};


FUNC void  Tpl_1437_Templer_NERV_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_NERV_Info_15_01"); //Was liegt an?
	AI_Output (self, other,"Tpl_1437_Templer_NERV_Info_13_02"); //Hör mal, musst du eigentlich jeden anquatschen, der hier rumläuft?
	AI_StopProcessInfos	( self );
};  
// ERNEUTES ANSPRECHEN ------------------------------------
instance  Tpl_1437_Templer_LEAVE (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_LEAVE_Condition;
	information		= Tpl_1437_Templer_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Alles klar bei dir?"; 
};

FUNC int  Tpl_1437_Templer_LEAVE_Condition()
{	
	if Npc_KnowsInfo (hero, Tpl_1437_Templer_NERV)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1437_Templer_LEAVE_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //Alles klar bei dir?
	AI_Output (self, other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Ich will meine Ruhe haben, verstanden? Also geh einfach weg und mach irgendwas, irgendwas anderes!
	AI_StopProcessInfos	( self );
};
// ERNEUTES ANSPRECHEN ------------------------------------
instance  Tpl_1437_Templer_LEAVENOW (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_LEAVENOW_Condition;
	information		= Tpl_1437_Templer_LEAVENOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nein, ich verstehe dich einfach nicht!"; 
};

FUNC int  Tpl_1437_Templer_LEAVENOW_Condition()
{	
	if Npc_KnowsInfo (hero, Tpl_1437_Templer_LEAVE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1437_Templer_LEAVENOW_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //Nein, ich verstehe dich einfach nicht!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Na gut dann will ich es dir mal deutlich machen.
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //Verschwinde!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Verlass diese Mine!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //Sprich mich NIE wieder an!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //Hau ab! lass mich in Ruhe!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //VERPISS DICH !!!
	AI_StopProcessInfos	( self );
};

