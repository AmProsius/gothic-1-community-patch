// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_534_Exit (C_INFO)
{
	npc			= Vlk_534_Buddler;
	nr			= 999;
	condition	= DIA_Vlk_534_Exit_Condition;
	information	= DIA_Vlk_534_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_Vlk_534_LeaveMe (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_LeaveMe_Condition;
	information		= DIA_Vlk_534_LeaveMe_Info;
	permanent		= 1;
	description		= "Warum bist du hier und nicht im Lager?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //Warum bist du hier und nicht im Lager?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //Ich warte darauf, dass ein Kumpel von mir aus der Mine kommt. Er schuldet mit noch Erz.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //Ohne das Erz kann ich mich nicht im Lager sehen lassen - sonst kann ich den Gardisten kein Schutzgeld zahlen und dann kann die Sache für einen ziemlich unangenehm werden.

	AI_StopProcessInfos	(self);
};
