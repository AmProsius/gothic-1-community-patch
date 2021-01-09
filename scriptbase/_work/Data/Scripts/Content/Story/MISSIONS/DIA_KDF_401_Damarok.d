instance KDF_401_Damarok_WELCOME (C_INFO)
{
	npc				= KDF_401_Damarok;
	condition		= KDF_401_Damarok_WELCOME_Condition;
	information		= KDF_401_Damarok_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_401_Damarok_WELCOME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_402_Corristo_ROBE))
	&& (Npc_KnowsInfo (hero,KDF_403_Drago_RUNE))
	&& (Npc_KnowsInfo (hero,KDF_405_Torrez_BOOK))
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  KDF_401_Damarok_WELCOME_Info()
{

	AI_GotoNpc (self,hero);
	AI_Output (self, other,"KDF_401_Damarok_WELCOME_Info_14_01"); //Möge das Feuer dich allzeit beschützen!
	
	Corristo_KDFAufnahme = 6;
	B_Story_Feueraufnahme();
	AI_StopProcessInfos	( self );
};
// ************************ EXIT **************************

instance  KDF_401_Damarok_Exit (C_INFO)
{
	npc			=  KDF_401_Damarok;
	nr			=  999;
	condition	=  KDF_401_Damarok_Exit_Condition;
	information	=  KDF_401_Damarok_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  KDF_401_Damarok_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  KDF_401_Damarok_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
//-----------------------------------------------------------
instance KDF_401_Damarok_HEAL (C_INFO)
{
	npc				= KDF_401_Damarok;
	condition		= KDF_401_Damarok_HEAL_Condition;
	information		= KDF_401_Damarok_HEAL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_401_Damarok_HEAL_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDF)
	&& (Npc_IsInRoutine  (self,Rtn_START_401))
	{
		return TRUE;
	};
};
func void  KDF_401_Damarok_HEAL_Info()
{
	AI_Output (self, other,"KDF_401_Damarok_HEAL_Info_14_01"); //Wenn du Schaden nehmen solltest, werde ich dich heilen.
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  KDF_401_Damarok_HEALINFO (C_INFO)
{
	npc				= KDF_401_Damarok;
	nr				= 100;
	condition		= KDF_401_Damarok_HEALINFO_Condition;
	information		= KDF_401_Damarok_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ich bin verletzt. Kannst du mich heilen?"; 
};

FUNC int  KDF_401_Damarok_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild (hero) == GIL_KDF)
	{
		return TRUE;
	};

};
FUNC void  KDF_401_Damarok_HEALINFO_Info()
{
	AI_Output (other, self,"KDF_401_Damarok_HEALINFO_Info_15_01"); //Ich bin verletzt. Kannst du mich heilen?
	AI_Output (self, other,"KDF_401_Damarok_HEALINFO_Info_14_02"); //Der Körper gesundet, der Geist wird klar.
	Snd_Play  ("MFX_Heal_Cast"); 
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
};  
