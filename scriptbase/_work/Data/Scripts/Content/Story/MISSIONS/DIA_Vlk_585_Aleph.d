// ************************ EXIT **************************

instance  VLK_585_Aleph_Exit (C_INFO)
{
	npc			=  VLK_585_Aleph;
	nr			=  999;
	condition	=  VLK_585_Aleph_Exit_Condition;
	information	=  VLK_585_Aleph_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_585_Aleph_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_585_Aleph_Exit_Info()
{
	if	!Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH)
	{
		AI_Output (other, self,"VLK_585_Aleph_Exit_Info_15_01"); //Viel Glück noch.
		AI_Output (self, other,"VLK_585_Aleph_Exit_Info_05_02"); //Du weißt ja, wo du mich findest.
	};
	
	AI_StopProcessInfos	( self );

};
// ***************** ALEPH IST EIN FAULPELZ *****************************
instance VLK_585_Aleph_CLEVER (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_CLEVER_Condition;
	information		= VLK_585_Aleph_CLEVER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_585_Aleph_CLEVER_Condition()
{
	return 1;
};

func void  VLK_585_Aleph_CLEVER_Info()
{
	AI_Output (self,other,"VLK_585_Aleph_CLEVER_Info_05_01"); //Hehehe, die Wachen erwischen mich nie!
};
// ***************** ALEPH ERKLÄRT SEINE ARBEITSHALTUNG *****************************

instance  VLK_585_Aleph_GUARDS (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GUARDS_Condition;
	information		= VLK_585_Aleph_GUARDS_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wie meinst du das?"; 
};

FUNC int  VLK_585_Aleph_GUARDS_Condition()
{	
	if Npc_KnowsInfo (hero,VLK_585_Aleph_CLEVER) 
	{
		return 1;
	};
};

FUNC void  VLK_585_Aleph_GUARDS_Info()
{
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_01"); //Wie meinst du das?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_02"); //Ich arbeite nur, wenn Wachen in der Nähe sind oder mich sehen können. Ansonsten häng' ich hier meine Zeit ab.
	AI_Output (other, self,"VLK_585_Aleph_GUARDS_Info_15_03"); //Werden sie nicht misstrauisch?
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_04"); //Nun ja, ich schürfe natürlich weniger Erz als alle anderen. Es reicht natürlich nicht immer, da muss ich halt mal ein bisschen geschickt tauschen.
	AI_Output (self, other,"VLK_585_Aleph_GUARDS_Info_05_05"); //Ich halt immer meine Ohren offen und bekomme viele nützliche Dinge mit. Du hast nicht zufällig etwas Erz bei dir? So ungefähr 10 Erz?

	Npc_ExchangeRoutine (self,"BUSY");
	
	var C_Npc Brandick; 				
	Brandick = Hlp_GetNpc(GRD_261_Brandick);
	Npc_ExchangeRoutine (Brandick,"WATCH");
	AI_ContinueRoutine(Brandick);	// TEST!!!
};
// ***************** ALEPH BIETET INFO *****************************

instance VLK_585_Aleph_INFO (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_INFO_Condition;
	information		= VLK_585_Aleph_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "(10 Erz geben)";
};

FUNC int  VLK_585_Aleph_INFO_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  (Npc_KnowsInfo (hero, VLK_585_Aleph_GUARDS) ) 
	{
		return 1;
	};
};

func void  VLK_585_Aleph_INFO_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_INFO_Info_15_01"); //In Ordnung, hier sind 10 Erz für dich.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_02"); //Danke. Wenn du zurück zum Hauptschacht gehst und den Stegen weiter nach unten folgst, kommst du bald an zwei Nebenhöhlen.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_03"); //In der zweiten Höhle steht eine Wache. Da steht auch ein alter Stampfer.
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_04"); //Dort liegt noch irgendwo ein Heiltrank, aber sei vorsichtig und nimm dich vor den Crawlern in Acht!
	AI_Output (self,other,"VLK_585_Aleph_INFO_Info_05_05"); //Und wenn du mal wieder was brauchst oder hörst, dann komm ruhig zu mir, ich kann dir bestimmt weiterhelfen ...
	
	B_GiveInvItems (hero, other, ItMiNugget,10);
};
// ***************** WIRD ALEPH ANGESCHWÄRZT IST ER SAUER*****************************
instance VLK_585_Aleph_ANGRY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_ANGRY_Condition;
	information		= VLK_585_Aleph_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};	

FUNC int  VLK_585_Aleph_ANGRY_Condition()
{
	if ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_ANGRY_Info()
{
	
	AI_Output (self,other,"VLK_585_Aleph_ANGRY_Info_05_01"); //Du hast mich bei Brandick angeschwärzt? Mach, dass du wegkommst!
	
	AI_StopProcessInfos	( self );
	Npc_SetTempAttitude (self,ATT_ANGRY);
};
//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_KEY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_KEY_Condition;
	information		= VLK_585_Aleph_KEY_Info;
	important		= 0;
	permanent		= 0;
	description     = "Hast du noch ein paar nützliche Informationen?";
};
FUNC int  VLK_585_Aleph_KEY_Condition()
{
	if ! ( Npc_KnowsInfo (hero,GRD_261_Brandick_ALEPH) ) &&  ( Npc_KnowsInfo (hero, VLK_585_Aleph_INFO))
	{
		return 1;
	};
};

func void  VLK_585_Aleph_KEY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_KEY_Info_15_01"); //Hast du noch ein paar nützliche Informationen?
	AI_Output (self,other,"VLK_585_Aleph_KEY_Info_05_02"); //Na klar, hast du noch 10 Erz?
};

//***************** LOCKPICKS*****************************
instance VLK_585_Aleph_GLEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_GLEN_Condition;
	information		= VLK_585_Aleph_GLEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "(10 Erz geben)";
};
FUNC int  VLK_585_Aleph_GLEN_Condition()
{
	if ( Npc_HasItems (hero,ItMinugget) ) >= 10 &&  ( Npc_KnowsInfo (hero,VLK_585_Aleph_KEY) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_GLEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_GLEN_Info_15_01"); //Für mein Erz erwarte ich auch eine gute Information!
	AI_Output (self,other,"VLK_585_Aleph_GLEN_Info_05_02"); //Hier gibt's eine Menge verschlossener Truhen. Glen, der Buddler, der ganz oben steht, kann dir ein paar Dietriche besorgen.
	
	B_GiveInvItems (hero, self, ItMinugget,10); 
};
//***************** LAGERSCHUPPENSCHLÜSSEL*****************************
func void B_Aleph_StorageShedKey()
{
	B_LogEntry		(CH2_StorageShed,	"Aleph hat mir den Schlüssel für die Truhen im Lagerschuppen verkauft!");
};

instance VLK_585_Aleph_SCHUPPEN (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_SCHUPPEN_Condition;
	information		= VLK_585_Aleph_SCHUPPEN_Info;
	important		= 0;
	permanent		= 0;
	description     = "Weißt du was über den Schlüssel für die Truhen im Lagerschuppen?";
};
FUNC int  VLK_585_Aleph_SCHUPPEN_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( !Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};

func void  VLK_585_Aleph_SCHUPPEN_Info()
{
	
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_01"); //Weißt du was über den Schlüssel für die Truhen im Lagerschuppen?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_02"); //Nun, das kommt ganz darauf an ...
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_Info_15_03"); //Darauf, wieviel Erz ich dir gebe?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_Info_05_04"); //Du lernst schnell.
	
	Info_ClearChoices ( VLK_585_Aleph_SCHUPPEN );
	
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,DIALOG_BACK 	   ,VLK_585_Aleph_SCHUPPEN_Back);
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"50 Erz zahlen",VLK_585_Aleph_SCHUPPEN_50 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"30 Erz zahlen",VLK_585_Aleph_SCHUPPEN_30 );
	Info_AddChoice ( VLK_585_Aleph_SCHUPPEN,"15 Erz zahlen",VLK_585_Aleph_SCHUPPEN_15 );
};


func void VLK_585_Aleph_SCHUPPEN_50 ()
{
	
	if (Npc_HasItems (hero, ItMiNugget) >= 50)
	{ 
		AI_Output			(other,self,"VLK_585_Aleph_SCHUPPEN_50_15_01"); //50 Erz sind mehr als genug für dich!
		AI_Output			(self,other,"VLK_585_Aleph_SCHUPPEN_50_05_02"); //Überaus großzügig. Hier ist der Schlüssel. Und nimm auch diesen Ring. Mir hat er immer Glück gebracht.

		CreateInvItems		(self, ItKe_OM_03,	1);			// nur für die korrekte Textausgaben!!!
		B_GiveInvItems      (self, hero, ItKe_OM_03, 2);
		Npc_RemoveInvItem	(hero, ItKe_OM_03);

		Npc_RemoveInvItem	(self, Staerkering);
		CreateInvItem		(hero, Staerkering);

		B_GiveInvItems	    (hero, self, ItMinugget,50);  

		Npc_SetPermAttitude (self, ATT_FRIENDLY ); 
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN);
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_50_05_03"); //So viel Erz hast du nicht!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	};
};

func void VLK_585_Aleph_SCHUPPEN_30 ()
{
	
	
	if (Npc_HasItems (hero, ItMiNugget) >= 30)
	{ 
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		B_GiveInvItems	(hero, self, ItMinugget,30);  
		Info_ClearChoices	(VLK_585_Aleph_SCHUPPEN );
		AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_30_15_01"); //30 Erz sollten reichen.
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_02"); //Nun gut, zufällig habe ich hier einen Schlüssel.
		VLK_585_Aleph_SCHUPPEN.permanent = 0;
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_30_05_03"); //So viel Erz hast du nicht!
		VLK_585_Aleph_SCHUPPEN.permanent = 1;
	}; 
};	
func void VLK_585_Aleph_SCHUPPEN_15 ()
{
	AI_Output (other,self,"VLK_585_Aleph_SCHUPPEN_15_15_01"); //Bist du mit 15 Erz einverstanden?
	AI_Output (self,other,"VLK_585_Aleph_SCHUPPEN_15_05_02"); //15 Erz? Ich weiß nichts von einem Schlüssel!
	VLK_585_Aleph_SCHUPPEN.permanent = 0;
};	
func void VLK_585_Aleph_SCHUPPEN_Back ()
{
	Info_ClearChoices	(  VLK_585_Aleph_SCHUPPEN );
	VLK_585_Aleph_SCHUPPEN.permanent = 1;
};

// WENN DER SPIELER ALEPH BEI BRANDICK ANGESCHWÄRZT HAT
instance  VLK_585_Aleph_DIRTY (C_INFO)
{
	npc				= VLK_585_Aleph;
	condition		= VLK_585_Aleph_DIRTY_Condition;
	information		= VLK_585_Aleph_DIRTY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Weißt du was über den Schlüssel für die Truhen im Lagerschuppen?"; 
};

FUNC int  VLK_585_Aleph_DIRTY_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRUNK) ) && ( Npc_KnowsInfo (hero, GRD_261_Brandick_ALEPH) )
	{
		return 1;
	};
};


FUNC void  VLK_585_Aleph_DIRTY_Info()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_01"); //Weißt du was über den Schlüssel für die Truhen im Lagerschuppen?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_02"); //Nun, das kommt ganz darauf an ...
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_Info_15_03"); //Darauf, wieviel Erz ich dir gebe?
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_Info_05_04"); //Du lernst schnell. Ich will 100 Erz.
	
	Info_ClearChoices ( VLK_585_Aleph_DIRTY );
	
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(100 Erz zahlen)",VLK_585_Aleph_DIRTY_100 );
	Info_AddChoice ( VLK_585_Aleph_DIRTY,"(Nicht zahlen)",VLK_585_Aleph_DIRTY_NO );
};  
func void VLK_585_Aleph_DIRTY_100()
{
	if Npc_HasItems (hero,ItMinugget)>=100
	{ 
		AI_Output (other,self,"VLK_585_Aleph_DIRTY_100_Info_15_01"); //Na gut, du Halsabschneider. Hier sind deine 100 Erz.
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_02"); //Du hättest mich halt nicht verpfeifen sollen. Hier ist der Schlüssel.
		B_GiveInvItems	(hero, self, ItMinugget,100);
		CreateInvItem		(self, ItKe_OM_03);
		B_GiveInvItems      (self, other, ItKe_OM_03, 1);
		Info_ClearChoices	( VLK_585_Aleph_DIRTY );
		VLK_585_Aleph_DIRTY.permanent = 0;	
		B_Aleph_StorageShedKey();
	}
	else
	{
		AI_Output (self,other,"VLK_585_Aleph_DIRTY_100_Info_05_03"); //Für wie blöd hältst du mich eigentlich? 100 Erz, nicht einen Brocken weniger!
		VLK_585_Aleph_DIRTY.permanent = 1;
	};
};
func void VLK_585_Aleph_DIRTY_NO()
{
	AI_Output (other,self,"VLK_585_Aleph_DIRTY_NO_Info_15_01"); //Ich werfe dir doch keine 100 Erz in den Rachen!
	AI_Output (self,other,"VLK_585_Aleph_DIRTY_NO_Info_05_02"); //Hey, immerhin bist du derjenige, der mich die ganze Zeit anquatscht!
	VLK_585_Aleph_DIRTY.permanent = 0;	
};
