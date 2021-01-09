// *********************** HOHER PRIESTER ***********************
INSTANCE Info_HighPriest5 (C_INFO)
{
	npc				= ORC_Priest_5;
	nr				= 1;
	condition		= Info_HighPriest5_Condition;
	information		= Info_HighPriest5_Info;
	important		= 1;
};                       

FUNC INT Info_HighPriest5_Condition()
{
	return TRUE;
};

FUNC VOID Info_HighPriest5_Info()
{
	//B_SelectWeapon		(self, other);
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	
	if ( Npc_HasItems ( hero, Mythrilklinge02 )) || ( Npc_HasItems ( hero, UrizielRune ))
	{
		AI_Output 			(self, other,"Info_HighPriest5_17_04"); //DU HASSST EINE MÄCHTIGEEE WAFFFEE!!!
		AI_Output 			(self, other,"Info_HighPriest5_17_05"); //ICCH WERDDDEEEE DIIICH AUFFHALTEEEEEN!!!

		AI_StopProcessInfos	(self);
		self.npctype 		= NPCTYPE_MAIN;

		Npc_SetAttitude 	(self, ATT_HOSTILE);
		Npc_SetTempAttitude (self, ATT_HOSTILE);	
	}
	else
	{
		AI_Output 			(self, other,"Info_HighPriest5_17_01"); //UMKEEEHREN MUSST DU HIEEER!!!
		AI_Output 			(self, other,"Info_HighPriest5_17_02"); //NIEEEMAND DARF DIE RUHEEE MEINEEES MEEEISTERS STÖÖÖÖREN!!!
		AI_Output 			(other, self,"Info_HighPriest5_15_03"); //Irrtum, dein SCHLÄFER wird schon bald hellwach sein!
	
		AI_StopProcessInfos	(self);
	
		B_Story_EncounteredHighPriest();
	};
};

// *********************** HOHER PRIESTER ***********************
INSTANCE Info_HighPriest5FAILED (C_INFO)
{
	npc				= ORC_Priest_5;
	nr				= 2;
	condition		= Info_HighPriest5FAILED_Condition;
	information		= Info_HighPriest5FAILED_Info;
	important		= 1;
};                       

FUNC INT Info_HighPriest5FAILED_Condition()
{
	if 	Npc_KnowsInfo(hero, Info_HighPriest5)
	&&	(self.aivar[AIV_MISSION1] >= HighPriest_MaxHit)
	&&	!Npc_HasItems(hero, Mythrilklinge02)
	&&	!Npc_HasItems(hero, UrizielRune)
	{
		return TRUE;
	};
};

FUNC VOID Info_HighPriest5FAILED_Info()
{
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_01"); //Verdammt! Ich bewirke nicht den geringsten Schaden! Ich brauche eine andere ...
	AI_Output			(self, other,"Info_HighPriest5FAILED_17_02"); //NUUUUN WIIIIRST DUUUU STEEEERBEEEEEN!!!!!
	AI_Output			(other, self,"Info_HighPriest5FAILED_15_03"); //Nichts wie weg hier!
	AI_RemoveWeapon		(other);
	AI_TurnAway			(other,	self);	
	
	self.npctype 		= NPCTYPE_MAIN;
	Npc_SetAttitude 	(self, ATT_HOSTILE);
	Npc_SetTempAttitude (self, ATT_HOSTILE);	

	B_LogEntry			(CH4_EnterTemple,	"Grash-Varrag-Arushat schient kein untoter Orkschamane wie die anderen zu sein. Es ist weitaus mächtiger und meine Waffen richteten nicht den geringsten Schaden an. Ich brauche eine Waffe, die mächtiger als alles andere ist!");
	B_GiveXP			(XP_RetreatFromLastPriest);

	AI_StopProcessInfos	(self);
};
