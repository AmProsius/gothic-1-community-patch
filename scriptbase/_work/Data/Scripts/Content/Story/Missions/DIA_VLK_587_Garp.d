
// ************************ EXIT **************************

instance  Vlk_587_Garp_Exit (C_INFO)
{
	npc			=  Vlk_587_Garp;
	condition	=  Vlk_587_Garp_Exit_Condition;
	information	=  Vlk_587_Garp_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Vlk_587_Garp_Exit_Condition()
{
	return 1;
};

FUNC VOID  Vlk_587_Garp_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Vlk_587_Garp_ORK (C_INFO)
{
	npc				= Vlk_587_Garp;
	condition		= Vlk_587_Garp_ORK_Condition;
	information		= Vlk_587_Garp_ORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "What's the Orc doing here?"; 
};

FUNC int  Vlk_587_Garp_ORK_Condition()
{
	return 1;
};


FUNC void  Vlk_587_Garp_ORK_Info()
{
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_01"); //What's the Orc doing here?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_02"); //The guards caught him. Ever since he's been forced to work here.
	AI_Output (other, self,"Vlk_587_Garp_ORK_Info_15_03"); //He's not even in chains. Why doesn't he just run away?
	AI_Output (self, other,"Vlk_587_Garp_ORK_Info_01_04"); //He tried that once. The guards gave it to him in such a way that he couldn't walk for a couple of weeks. Since then, he's never tried it again.
};  




