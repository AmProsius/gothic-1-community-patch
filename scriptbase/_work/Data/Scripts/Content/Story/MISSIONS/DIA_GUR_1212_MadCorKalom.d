instance  GUR_1212_MadCorKalom_Talk2SC (C_INFO)
{
	npc				= GUR_1212_MadCorKalom;
	condition		= GUR_1212_MadCorKalom_Talk2SC_Condition;
	information		= GUR_1212_MadCorKalom_Talk2SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GUR_1212_MadCorKalom_Talk2SC_Condition()
{
	return TRUE;
};

FUNC void GUR_1212_MadCorKalom_Talk2SC_Info ()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, hero);
	
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_01"); //Schließlich sehen wir uns also wieder!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_02"); //Mein Meister hat mir bereits von deiner Ankunft berichtet!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_03"); //Er kann deine Nähe spüren.
	AI_Output			(hero, self,"GUR_1212_MadCorKalom_Talk2SC_15_04"); //Schon bald werde ich ihm näher sein, als ihm lieb ist!
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_05"); //Wir werden nicht zulassen, dass du unsere Pläne durchkreuzt.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_06"); //Die Welt steht kurz vor dem Erwachen des Erlösers und keiner kann ihn aufhalten.
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_07"); //All die Ungläubigen da draußen werden ihren Preis bezahlen .
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_08"); //Und du hast die Ehre, der Erste zu sein, der diesen Preis bezahlen darf .
	AI_Output			(self, hero,"GUR_1212_MadCorKalom_Talk2SC_10_09"); //SCHLÄÄÄÄÄÄÄÄÄÄFEEEEEEEEEEEER ERWAAAAAAAAAAAACHEEEEEEEEEEEEE !!!!!!!!!

	AI_StopProcessInfos	(self);

	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	
	
	AI_Wait				(self, 2);
	Npc_SetTarget		(self, hero );
	AI_StartState		(self, ZS_Attack, 0, "" );
};
