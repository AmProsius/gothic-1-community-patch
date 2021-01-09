// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Wie oft hab' ich euch Pennern gesagt, rennt nicht durch meine Hütte.
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "Was ist dein Problem?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Was ist dein Problem?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Mann, lass mich bloß in Ruhe! Jeder hier hat ein Problem mit mir!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Es fing alles damit an, dass ich meine Hütte gebaut hab'.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Bau deine Hütte nicht an den Graben, haben sie gesagt.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Aber keiner von den Pennern hat mir gesagt, was passiert, wenn ich es doch tue.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Als ich vor ein paar Tagen aus der Mine wiederkam, hatte ich  'ne zweite Tür.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Diese Schweine. Ich hasse sie. Ich kann dir gar nicht sagen, wie ich sie hasse!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Jetzt rennt jeder durch meine Hütte. Jeder Arsch.
};

	
	
	
	
	


















