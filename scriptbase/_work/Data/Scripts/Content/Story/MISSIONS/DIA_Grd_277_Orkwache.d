/*------------------------------------------------------------------------
							Sitzender Ork									
------------------------------------------------------------------------*/

instance  Grd_277_Gardist_SITTINGORK (C_INFO)
{
	npc				= Grd_277_Gardist;
	condition		= Grd_277_Gardist_SITTINGORK_Condition;
	information		= Grd_277_Gardist_SITTINGORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Was ist mit dem Ork da?"; 
};

FUNC int  Grd_277_Gardist_SITTINGORK_Condition()
{	
	if (Ian_gearwheel != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Grd_277_Gardist_SITTINGORK_Info()
{
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Was ist mit dem Ork da?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //Unser Gefangener. Sein Glück, dass das Zahnrad des Stampfers gebrochen ist.So kann dieser Hundesohn ausruhen.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Wenn der Stampfer repariert ist, wird er wieder arbeiten. Schließlich ist er nicht zum Faulenzen hier!
};  
/*------------------------------------------------------------------------
							WORKINGORK							
------------------------------------------------------------------------*/

instance  Grd_277_Gardist_WORKINGORK (C_INFO)
{
	npc				= Grd_277_Gardist;
	condition		= Grd_277_Gardist_WORKINGORK_Condition;
	information		= Grd_277_Gardist_WORKINGORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich sehe, der Stampfer ist schon repariert."; 
};

FUNC int  Grd_277_Gardist_WORKINGORK_Condition()
{	
	if (Ian_gearwheel == LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Grd_277_Gardist_WORKINGORK_Info()
{
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Ich sehe, der Stampfer ist schon repariert.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Ja, wenn es darum geht, die Leute zum Arbeiten zu bringen, sind wir ziemlich schnell.
};  
