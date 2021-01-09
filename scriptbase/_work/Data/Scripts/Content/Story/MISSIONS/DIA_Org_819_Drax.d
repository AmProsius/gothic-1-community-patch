
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Ihr jagt hier - richtig?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Ihr jagt hier - richtig?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Sieht so aus... was willst du?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Hast du ein paar Tipps für die Jagd?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Ich könnte dir schon was beibringen - aber alles hat seinen Preis.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Und der wäre?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Für den Anfang reicht ein ordentlicher Schluck Bier - danach sehen wir weiter.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Hier, nimm ein Bier und erzähl mir was über's Jagen.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Hier, nimm ein Bier und erzähl mir was übers Jagen.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Scavenger, so nennen wir die großen Vögel, greift man am besten einzeln an. Du kannst einzelne Scavenger leicht aus dem Rudel locken.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Wenn du ihnen zu nahe kommst, reagieren sie gereizt. Nach einer Weile stürmen sie dann auf dich los. Du solltest zu diesem Zeitpunkt schon mit erhobener Waffe warten.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Wenn du gut bist, und ihn triffst, bevor er dich trifft, heißt es dranbleiben, dann kannst du das Vieh besiegen, ohne einen Kratzer abzubekommen.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //Wenn es DICH zuerst trifft - nun ja - pass einfach auf, dass es dich nicht zuerst trifft.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Ich hab' kein Bier.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Dann geh und hol eins, so billig kommst du nie wieder an einen guten Rat. Und wenn du schon mal dabei bist - bring gleich noch etwas Erz mit!
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Ich kann dir einiges über Tiere beibringen, aber das kostet dich was!
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW, "Der Bandit Drax bot an, mir viel über das Ausnehmen von Tieren hier beizubringen, wenn ich seine Preise bezahlen kann. Er jagt am Weg vom Austauschplatz zum Alten Lager.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "Was kannst du mir noch über die Jagd beibringen?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Was kannst du mir noch über die Jagd beibringen?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //'Ne ganze Menge - aber das wird dich mehr kosten als nur ein Bier.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Wenn du weißt wie, kannst du den Viechern Zähne, Haut oder Krallen abziehen. An die Sachen ist schwer ranzukommen, also sind sie wertvoll.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //Zumindest wird jeder Händler diese Dinge mit dir tauschen.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures, "Du verlangst verdammt viel für dein Wissen." 				,Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures, "Zähne entfernen (Kosten: 1 Lernpunkt, 50 Erz)" 		,Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "Fell abziehen (Kosten: 1 Lernpunkt, 100 Erz)"		,Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "Krallen abzuziehen (Kosten: 1 Lernpunkt, 50 Erz)" 	,Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures, "Häuten von Reptilien (Kosten: 1 Lernpunkt, 100 Erz)"	,Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Ich habe dir alles beigebracht, was ich weiß.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Du verlangst verdammt viel für dein Wissen.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Mag sein, aber du kannst 'ne Menge Erz damit verdienen.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Alle Tiere, die du tötest, ohne zu wissen, wie man sie vernünftig ausschlachtet, werden einfach verwesen.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //Das ist eine verschwendete Gelegenheit, ihnen das Fell abzuziehen und teuer zu verkaufen.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //Wenn ich du wäre, würde ich mir dieses Wissen so schnell wie möglich aneignen.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Wie komme ich an die Zähne?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Lerne: Zähne nehmen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Du mußt vor allem darauf achten, dass die Zähne nicht splittern. Um das zu verhindern, mußt du dein Messer in der Mitte des Zahns ansetzen und vorsichtig hebeln.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Zähne kannst du von Wölfen, Schattenläufern oder Snappern nehmen.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Wissen über Zähne entfernen - Wolf, Orchund, Snapper, Beisser, Bluthund, Schattenläufer.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Wie kann ich den Viechern das Fell abziehen? 
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Lerne: Fell abziehen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Wichtig ist vor allem: Immer von vorne nach hinten. Wenn du den Bogen einmal raushast, ist es kein Problem. Felle sind sehr wertvoll!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Das Fell von Wölfen oder Schattenläufern eignet sich zum Herstellen von Kleidung. Du wirst merken, ob ein erlegtes Tier ein brauchbares Fell hat, wenn du es untersuchst.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Wissen über Fell abziehen - Wolf, Orkhund, Schattenläufer, Troll");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Lerne: Krallen abziehen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Bring mir bei, Krallen abzuziehen!  
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Ist im Grunde ganz einfach, wenn du weißt, wie's geht. Du mußt die Krallen nach vorne wegknicken, auf keinen Fall nach hinten und NICHT ziehen!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Krallen kannst du vor allem von Echsen nehmen. Du wirst ab jetzt erkennen, von welchem erlegten Biest du die Krallen nehmen kannst.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Wissen über Krallen abziehen - Warane, Snapper, Lurker, Beisser, Razor");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Erst will ich mein Erz sehen - wie gesagt: Es hat alles seinen Preis!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Lerne: Echsen häuten", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Worauf muss ich beim Häuten von Reptilien achten?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Die einzigen Reptilien, die dafür geeignet sind, sind der Lurker und der Sumpfhai.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Wenn du die Haut an den Seiten anschneidest, löst sie sich wie von selbst. Du solltest ab jetzt kein Problem mehr haben, Echsen zu häuten.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Wissen über Häuten - Lurker, Sumpfhai");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Du mußt mehr Erfahrung sammeln, vorher wird dich mein Wissen nicht weiterbringen.
			PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Erst will ich mein Erz sehen - wie gesagt: Alles hat seinen Preis!
	};
};
