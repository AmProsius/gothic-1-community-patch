
// ************************ EXIT **************************

instance  Nov_1300_Talas_Exit (C_INFO)
{
	npc			=  Nov_1300_Talas;
	nr			=  999;
	condition	=  Nov_1300_Talas_Exit_Condition;
	information	=  Nov_1300_Talas_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1300_Talas_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1300_Talas_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_UR (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_UR_Condition;
	information		= Nov_1300_Talas_UR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Du bist Talas, der überfallen wurde"; 
};

FUNC int  Nov_1300_Talas_UR_Condition()
{
	if	Npc_KnowsInfo(hero, Info_CorKalom_BringBook)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_UR_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Du bist Talas, der überfallen wurde.
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Lass mich in Ruhe, ich will nicht darüber reden!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich kann dir helfen, den Almanach zurückbringen."; 
};

FUNC int  Nov_1300_Talas_HELP_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_UR)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};
};
FUNC void  Nov_1300_Talas_HELP_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Ich kann dir helfen, den Almanach zurückbringen.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Wirklich? Goblins haben mich überfallen! Und jetzt soll ich wieder zu ihnen gehen und das Buch zurückbringen! 
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //Ich mache dir einen Vorschlag. Ich zeige dir den Weg zum Almanach und du holst ihn zurück. 

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Einverstanden",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Das kostet dich 30 Erz",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Gib mir 50 Erz und ich bin dabei",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //Einverstanden.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //In Ordnung, wir können losgehen, sobald du bereit bist.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //Das kostet dich 30 Erz.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //In Ordnung, wir können losgehen, sobald du bereit bist.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Gib mir 50 Erz und ich bin dabei.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Was? Du beraubst mich. Nun gut, sag mir Bescheid, wenn du so weit bist. 
	CreateInvItems		(self,ItMiNugget,50);
	B_GiveInvItems      (self,hero,ItMiNugget,50);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};

// ***************************** INFOS ****************************************//
instance  Nov_1300_Talas_READY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_READY_Condition;
	information		= Nov_1300_Talas_READY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich bin bereit, wir können losgehen"; 
};

FUNC int  Nov_1300_Talas_READY_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_HELP)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_READY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Ich bin bereit, wir können losgehen.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //In Ordnung. Folge mir.
	
	B_LogEntry		(CH2_Book,	"Ich habe Talas angeboten, für ihn den Almanach wiederzubeschaffen. Er will mich zum Aufenthaltsort des Buches führen."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BRÜCKE ****************************************//
instance  Nov_1300_Talas_BRIDGE (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BRIDGE_Condition;
	information		= Nov_1300_Talas_BRIDGE_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BRIDGE_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_READY ))
	&&	(Npc_GetDistToWP(self, "LOCATION_29_02")<1000)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BRIDGE_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Hinter dieser Brücke ist die Höhle dieser verdammten kleinen Biester! Pass auf dich auf!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Du kommst nicht mit?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Ich werde hier auf dich warten und... ähem... unseren Rückzug decken

	B_LogEntry		(CH2_Book,	"Wir stehen nun vor dem Eingang einer Goblinhöhle. Dieser Feigling von Novize will mich doch tatsächlich alleine hinein gehen lassen.");
};

// ***************************** ZURÜCK INS LAGER ****************************************//
instance  Nov_1300_Talas_BACK (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACK_Condition;
	information		= Nov_1300_Talas_BACK_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACK_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_BRIDGE ))
	&&	(Npc_HasItems (hero,ItWrFokusbuch))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BACK_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Du hast den Almanach! Gut gemacht. Gehen wir wieder zurück ins Lager.

	B_LogEntry		(CH2_Book,	"Ich habe den Almanach gefunden und werde ihn zusammen mit Talas ins Sumpflager bringen.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zurück im Lager ****************************************//
instance  Nov_1300_Talas_RETURNED (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_RETURNED_Condition;
	information		= Nov_1300_Talas_RETURNED_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_RETURNED_Condition()
{
	if	(Npc_KnowsInfo (hero, Nov_1300_Talas_BACK ))
	&&	Npc_HasItems (hero,ItWrFokusbuch)
	&&	(Npc_GetDistToWP  (self, "PSI_START")<1000)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_RETURNED_Info()
{
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //Hier sind wir wieder. Am besten du bringst den Almanach gleich zu Cor Kalom.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Pass nur auf, dass du dich nicht überarbeitest.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Keine Angst, darauf achte ich sogar sehr! Mach dir um mich keine Sorgen. 

	B_LogEntry		(CH2_Book,	"Wir sind wieder im Sumpflager. Talas ist der größte Drückeberger, den ich kenne. Ich werde das Buch selber zu Cor Kalom bringen.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"BackInCamp");
	AI_StopProcessInfos	(self);
};


// ***************************** zum OGY ****************************************//
instance  Nov_1300_Talas_OGY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_OGY_Condition;
	information		= Nov_1300_Talas_OGY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cor Angar schickt mich."; 
};

FUNC int  Nov_1300_Talas_OGY_Condition()
{
	if ( Npc_KnowsInfo ( hero, GUR_1202_CorAngar_WHERE ))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_OGY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Cor Angar schickt mich. Er sagt, du sollst mich zum Ork-Friedhof bringen, damit ich dort Baal Lukor und seine Templer suchen kann.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //Schon wieder bin ich der Laufbursche. Verdammt!!! Ich hätte den Almanach einfach nicht verlieren dürfen...
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //Na gut, komm mit.
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"OGY");
};  

// ***************************** am OGY ****************************************//
instance  Nov_1300_Talas_BACKAGAIN (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACKAGAIN_Condition;
	information		= Nov_1300_Talas_BACKAGAIN_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACKAGAIN_Condition()
{
	if ( Npc_GetDistToWP(self,"OW_PATH_011")<1000 )
	{
		return 1;
	};
};

FUNC void  Nov_1300_Talas_BACKAGAIN_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Auch hier werde ich dich nicht über die Brücke begleiten, denn ich bin nicht lebensmüde.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Du musst verrückt sein, dort hinein zu gehen, wenn selbst Baal Lukor und seine Templer nicht wieder herauskamen.
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Das werden wir ja sehen. Geh zurück zum Lager, ich komme nach.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
