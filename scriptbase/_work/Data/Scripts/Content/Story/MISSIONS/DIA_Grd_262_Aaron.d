// ************************ EXIT **************************

instance  GRD_262_Aaron_Exit (C_INFO)
{
	npc			=  GRD_262_Aaron;
	nr			=  999;
	condition	=  GRD_262_Aaron_Exit_Condition;
	information	=  GRD_262_Aaron_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_262_Aaron_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_262_Aaron_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//************************ EXIT **************************
instance  GRD_262_Aaron_CHEST (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_CHEST_Condition;
	information	=  GRD_262_Aaron_CHEST_Info;
	important	= 0;	
	permanent	= 1;
	description = "Was machst du hier?";
};                       

FUNC int  GRD_262_Aaron_CHEST_Condition()
{	
	if ( Npc_GetDistToWp (self,"OM_CAVE1_34") <400 )
	&& (!Npc_KnowsInfo   (hero,GRD_262_Aaron_BLUFF))
	{
		return 1;
	};
};
FUNC VOID  GRD_262_Aaron_CHEST_Info()
{
	AI_Output			(other, self,"GRD_262_Aaron_CHEST_Info_15_01"); //Was machst du hier?
	AI_Output			(self, other,"GRD_262_Aaron_CHEST_Info_09_02"); //Ich pass auf, dass so Buddler wie Snipes da dr�ben die Finger von meiner Truhe hier lassen.
};

//***************** BLUFF *****************************
instance  GRD_262_Aaron_BLUFF (C_INFO)
{
	npc				= GRD_262_Aaron;
	condition		= GRD_262_Aaron_BLUFF_Condition;
	information		= GRD_262_Aaron_BLUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= "(Aaron weglocken)"; 
};

FUNC int  GRD_262_Aaron_BLUFF_Condition()
{	
	if	Npc_KnowsInfo (hero,VLK_584_Snipes_DEAL)
	&&	(Aaron_lock != LOG_RUNNING)
	&&	(Aaron_lock != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  GRD_262_Aaron_BLUFF_Info()
{
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,DIALOG_BACK												,GRD_262_Aaron_BLUFF_BACK);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Ian schickt mich. Du sollst sofort zu ihm kommen!"		,GRD_262_Aaron_BLUFF_IAN);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Ich hab' geh�rt, das Banditen in der Mine sind."			,GRD_262_Aaron_BLUFF_BANDIT);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Die Buddler haben einen riesigen Erzbrocken gefunden!"	,GRD_262_Aaron_BLUFF_ORE);
};

FUNC void   GRD_262_Aaron_BLUFF_ORE ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_01");//Die Buddler haben einen riesigen Erzbrocken gefunden!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_02");//Na und?
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_ORE_15_03");//Den musst du dir unbedingt ansehen!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_ORE_09_04");//Vergiss es.
};  
FUNC VOID GRD_262_Aaron_BLUFF_BANDIT ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BANDIT_15_01"); //Ich hab' geh�rt, dass Banditen in der Mine sind. Sie wollen das Erz!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BANDIT_09_02"); //H�ltst du mich f�r bl�d? Das w�rden sie niemals wagen!
};
func void  GRD_262_Aaron_BLUFF_IAN()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_IAN_15_01"); //Ian schickt mich. Du sollst sofort zu ihm kommen!
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_IAN_09_02"); //Was will er denn?
	
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Keine Ahnung"					,GRD_262_Aaron_BLUFF_UGLY);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Es gibt �rger f�r dich"		,GRD_262_Aaron_BLUFF_BAD);
	Info_AddChoice		(GRD_262_Aaron_BLUFF,"Belohnung f�r gute Dienste"	,GRD_262_Aaron_BLUFF_GOOD);
};  
func void GRD_262_Aaron_BLUFF_GOOD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_GOOD_15_01"); //Er will dir eine Belohnung f�r deine guten Dienste geben.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_GOOD_09_02"); //Ach, tats�chlich? Ich glaube, du gehst jetzt besser.
	Npc_SetTempAttitude (self, ATT_ANGRY);
	AI_StopProcessInfos	(self);
};
func void 	GRD_262_Aaron_BLUFF_BAD ()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_BAD_15_01"); //Er will dir kr�ftig in den Arsch treten, weil du so faul bist.
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_BAD_09_02"); //Na, das ist doch nichts Neues. Geh weg!
	AI_StopProcessInfos	(self);
};
func void GRD_262_Aaron_BLUFF_UGLY()
{
	AI_Output			(other, self,"GRD_262_Aaron_BLUFF_UGLY_15_01"); //Keine Ahnung. Das wird Ian dir schon selber sagen! Glaubst du, er erz�hlt mir so was?
	AI_Output			(self, other,"GRD_262_Aaron_BLUFF_UGLY_09_02"); //Dann werde ich mal zu ihm gehen!

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine	(self,	"trick");
	
	Aaron_lock = LOG_RUNNING;
	Snipes_Deal = LOG_SUCCESS;
	GRD_262_Aaron_BLUFF.permanent = 0;
	
	B_LogEntry		(CH2_SnipesDeal,	"Ich habe Aaron unter dem Vorwand, dass Ian ihn sehen will, von der Truhe weggelockt. Ich hoffe er hat etwas Humor.");
};

func void GRD_262_Aaron_BLUFF_BACK()
{
	Info_ClearChoices	(GRD_262_Aaron_BLUFF);
};

// ***************** Aaron ist angepisst *****************************
instance  GRD_262_Aaron_PISSED (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_PISSED_Condition;
	information	=  GRD_262_Aaron_PISSED_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC int  GRD_262_Aaron_PISSED_Condition()
{
	if	(Aaron_lock == LOG_RUNNING)
	&&	(Npc_GetDistToWP(hero, "OM_CAVE1_47") < 1000)
	{
		return TRUE;
	};
};
FUNC VOID  GRD_262_Aaron_PISSED_Info()
{
	AI_DrawWeapon		(self);
	AI_Output			(self, other,"Info_Aaron_PISSED_09_01"); //HEY, DU!!! Wenn du mich noch einmal so verarschst, dann gibt's ne ordentliche Tracht Pr�gel, verstanden?
	AI_RemoveWeapon		(self);

	Npc_ExchangeRoutine	(self,	"start");
	Aaron_lock = LOG_SUCCESS;
	
	B_LogEntry		(CH2_SnipesDeal,	"Ich habe Aaron wiedergetroffen und festgestellt, dass er KEINEN Humor hat."); 
};

// ***************** Schl�ssel verkaufen *****************************
instance  GRD_262_Aaron_SELL (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELL_Condition;
	information	=  GRD_262_Aaron_SELL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Hey, vermisst du nicht deinen Schl�ssel?";
};                       

FUNC int  GRD_262_Aaron_SELL_Condition()
{
	if ( Npc_KnowsInfo (hero,VLK_584_Snipes_DEAL_RUN )) 
	{
		return 1;
	};
};

FUNC VOID  GRD_262_Aaron_SELL_Info()
{
	AI_Output			(other, self,"Info_Aaron_SELL_15_01"); //Hey, vermisst du nicht deinen Truhenschl�ssel?
	AI_Output			(self, other,"Info_Aaron_SELL_09_02"); //Tats�chlich. Ich will gar nicht wissen, woher oder warum du etwas �ber den Schl�ssel wei�t.
	AI_Output			(self, other,"Info_Aaron_SELL_09_03"); //Aber ich gebe dir 20 Erz, wenn du mir meinen Schl�ssel wiederholst.

	B_LogEntry		(CH2_SnipesDeal,	"Aaron hat mir 20 Erz geboten, wenn ich ihm den Schl�ssel seiner Truhe besorge!"); 
};

// ***************** Schl�ssel verkaufen 2*****************************
instance  GRD_262_Aaron_SELLNOW (C_INFO)
{
	npc			=  GRD_262_Aaron;
	condition	=  GRD_262_Aaron_SELLNOW_Condition;
	information	=  GRD_262_Aaron_SELLNOW_Info;
	important	= 0;	
	permanent	= 0;
	description = "(Schl�ssel verkaufen)";
};                       

FUNC int  GRD_262_Aaron_SELLNOW_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_262_Aaron_SELL) ) && ( Npc_HasItems ( hero,ItKe_OM_02))
	{
		return 1;
	};
};
FUNC VOID  GRD_262_Aaron_SELLNOW_Info()
{
	AI_Output			(other, self,"Info_Aaron_SELLNOW_15_01"); //Hier ist dein Schl�ssel.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_02"); //Tats�chlich. Also, wie abgemacht, hier sind 20 Erz f�r dich.
	AI_Output			(self, other,"Info_Aaron_SELLNOW_09_03"); //Du solltest dich aber in Zukunft vorsehen. Ab jetzt habe ich ein Auge auf dich!
	
	CreateInvItems 		(self,ItMinugget,20);
	B_GiveInvItems      (self,other,ItMinugget,20);
	B_GiveInvItems      (hero, self, ItKe_OM_02, 1);

	B_GiveXP			(XP_SellKeyToAaron);

	B_LogEntry		(CH2_SnipesDeal,	"Ich habe Aaron seinen eigenen Schl�ssel verkauft. Alles in allem habe ich bei der ganzen Sache ordentlich Profit gemacht!"); 
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_SUCCESS);
};


