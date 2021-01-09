//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //WER WAGT ES, MEINE STUDIEN ZU UNTERBRECHEN?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Mein Name ist ...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Ich will deinen Namen nicht wissen. Er ist unwichtig.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Wichtig ist nur, dass du der Erste seit vielen Jahren bist, der meine Golemrätsel gelöst hat.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Gab es andere Besucher?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Gab es andere Besucher?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Nicht viele und als sie mir lästig wurden, machten sie Bekanntschaft mit einem meiner höheren Wesen.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Du bist wohl gerne ungestört, was?
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Saturas schickt mich. Wir brauchen deine Hilfe!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Saturas schickt mich. Wir brauchen deine Hilfe!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Die Wassermagier wollen ihren großen Erzhaufen ...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Der Erzhaufen ist NICHT die Lösung!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //Nein?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //NEIN!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Die Feuermagier sind alle tot!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Die Feuermagier sind alle tot!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez hat sie ermorden lassen.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Das wundert mich nicht sonderlich. Diesen dummen barbarischen Schlächtern in der Burg, allen voran Gomez, war noch nie zu trauen.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo und die anderen Magier haben sich ihren Henker selbst gewählt, als sie Gomez damals halfen, die Macht an sich zu reißen.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Der so genannte 'Schläfer' soll ein übler Erzdämon sein.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //Der so genannte "Schläfer" soll ein übler Erzdämon sein.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Das hat die Bruderschaft im Sumpf herausgefunden.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Die Wassermagier glauben nun, dass wir alle in der Kolonie in großer Gefahr seien.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Die Gefahr ist größer als irgendjemand innerhalb der Barriere erahnen kann.
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "Wenn die Sprengung des Erzhaufens die große Gefahr nicht beseitigt...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Wenn die Sprengung des Erzhaufens die große Gefahr nicht beseitigt ...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //... Vergiss den großen Erzhaufen! Seine Energie wird die Barriere nicht sprengen können.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Hätten Corristo und Saturas in den letzten Jahren weniger Zeit für ihre törichten und eitlen Streitereien verschwendet, dann wüssten sie jetzt vielleicht auch das, was ich weiß.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //Was denn?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //Keiner der zwölf Magier von damals scheint sich je gefragt zu haben, warum die Erschaffung der Barriere außer Kontrolle geriet und sie diese riesigen Ausmaße annahm.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "Hast du es herausgefunden?";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //Hast du es herausgefunden?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Eins ist auf jeden Fall klar! Die Antwort liegt tief unter der Stadt der Orks.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //Die Stadt der Orks?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Die Orks sind nicht etwa, wie viele glauben, Tiere. Ihre Kultur reicht fast ebenso weit zurück, wie die der Menschen.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Vor vielen hundert Jahren beschwörten fünf Ork-Schamanen einen uralten Erzdämonen, um ihrem Klan die Macht zu verleihen, ihre Feinde zu vernichten.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //War dieser Erzdämon der Schläfer?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Diesen Namen gaben ihm die Orks erst viel später. Doch warum sie das taten und warum sie heute vor diesem Überwesen in Furcht erzittern, werde ich dir nicht erzählen!
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "Warum nicht?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Warum nicht?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Ich glaube du könntest der ... NEIN, um mir ganz sicher zu sein, musst du noch eine weitere Aufgabe lösen!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Was für eine Aufgabe?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Hör gut zu: Die Orks haben einen ihrer Schamanen aus ihrer Stadt verbannt.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Warum haben sie ihn verbannt?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //Warum haben sie ihn verbannt?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //Das konnte der sterbende Ork-Krieger, der von einem meiner Dämonen befragt wurde, nicht mehr von sich geben.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "Was hat dieser Ork Schamane mit meiner Aufgabe zu tun?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Was hat dieser Ork-Schamane mit meiner Aufgabe zu tun?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //Er wird dir den fehlenden Teil der Geschichte über den Schläfer erzählen.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //Ein Ork-Schamane wird sich wohl kaum mit mir unterhalten!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Willst du nun meine Hilfe oder willst du sie nicht?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Doch schon, aber ...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Dann stelle meine Worte nie wieder in Frage!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Suche den Schamanen. Er ist nicht gut auf seine Brüder in der Orkstadt zu sprechen, also wird er dir vielleicht zuhören, bevor er dich zu einer lebenden Fackel macht!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Sehr beruhigend!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Wo hält sich dieser Verbannte auf?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Wo hält sich dieser Verbannte auf?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Gehe zum alten Kastell östlich von hier. Es ist nicht zu übersehen, denn es steht auf dem Gipfel eines hohen Berges, der schon von weitem zu sehen ist.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //Kann man es so einfach betreten?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //Es wird zwar noch Altes Kastell genannt, aber genau genommen stehen da nur noch die Grundmauern. Es ist schon seit vielen Jahrzehnten eine Ruine.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "Ich werde mir die Antworten von diesem Schamanen holen!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //Ich werde mir die Antworten von diesem Schamanen holen!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Mein Diener hat dir ja bereits eine Teleportations-Rune für das Pentagramm einen Stock tiefer gegeben.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //Damit sollte es kein Problem für dich sein, wieder hierher zurück zu kehren.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Ich suche magisches Wissen"; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Ich suche magisches Wissen.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "Ich habe mir die Antworten vom Ork-Schamanen geholt!";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //Ich habe mir die Antworten vom Ork-Schamanen geholt!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //Gut, dann berichte!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Die fünf Ork-Schamanen, die den Schläfer riefen, erbauten ihm einen unterirdischen Tempel, dessen Zugang in der Ork-Stadt liegt.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //Das ist richtig!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Undankbarerweise entriss er ihnen ihre Herzen und verfluchte sie und die Arbeiter zu ewigem Untoten-Dasein!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Sehr gut, sehr gut!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Die Orks verschlossen den Tempel und bringen ihm seitdem Opfer, um ihn zu besänftigen!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Hast du einen Weg gefunden, wie du in den Tempel gelangst?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Ja, es gibt da einen Ork, der ...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //Keine Einzelheiten! Begib dich zum unterirdischen Tempel! Dort wirst du den einzigen Weg finden, die Barriere zu zerstören!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Ich verstehe nicht!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //War es nicht die Zerstörung der Barriere, weswegen du mich aufgesucht hast?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //Richtig, aber ...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //DANN GEH! Es ist schon genug Zeit verstrichen! Geh und such die Antwort im unterirdischen Tempel!

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich habe einen Weg in den unterirdischen Tempel gefunden!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Ich habe einen Weg in den unterirdischen Tempel gefunden!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //DU HAST ... DU ... Bemerkenswert!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Du bist sehr stark geworden! Stärker als jeder andere innerhalb der Barriere.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Vielleicht bist du doch derjenige, von dem die alten orkischen Prophezeiungen sprechen!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Prophezeiungen? Welche Prophezeiungen?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Prophezeiungen? Welche Prophezeiungen?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Uralte orkische Schriften aus der Zeit kurz nach der Versiegelung des unterirdischen Tempels sprechen von einem 'Heiligen Feind'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //Ein Heiliger Feind?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Einer, der kommen wird, um den SCHLÄFER für immer aus unserer Welt zu verbannen!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //Ich soll der Gegenstand einer uralten Prophezeiung sein??? Du musst dich irren!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Vielleicht ... aber vielleicht auch nicht!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich habe dieses seltsame Schwert hier gefunden."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Ich habe dieses seltsame Schwert hier gefunden.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Zeig mal her.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Interessant ... hier steht 'URIZIEL'.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //Ich habe schon von diesem Schwert gehört, es ist eine Waffe aus alten Tagen, als die Menschheit noch jung war.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Die Waffe ist aus einem völlig unbekannten Material geschmiedet. Auch über den Erschaffer steht nichts geschrieben!
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //Angeblich soll diese Klinge unglaubliche Kräfte besessen haben, aber ich kann keinerlei magische Aura feststellen!
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "URIZIEL besaß unglaubliche Kräfte?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL besaß unglaubliche Kräfte?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Es steht geschrieben, dass der Träger dieser Waffe die stärksten Panzerungen durchbohren und die mächtigsten Schutzzauber überwinden kann.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //Wie konnte diese mächtige Waffe in den Besitz der Orks gelangen?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Es heißt, dass die Orks dieses Schwert damals einem mächtigen Feldherren der Menschen geraubt hatten. Sie konnten es zwar nicht benutzen, aber sie konnten es gut verstecken!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Nicht gut genug!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kann man die damaligen Kräfte der Waffe wiederherstellen?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Kann man die damaligen Kräfte der Waffe wiederherstellen?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Dafür würdest du eine sehr starke magische Energiequelle benötigen.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //In etwa SO stark, dass man die magische Barriere damit sprengen könnte?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //In etwa ...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Außerdem wirst du eine sehr spezielle Zauberformel benötigen, die den Energietransfer vollbringen kann.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Gib mir ein wenig Zeit und ich kann dir die magische Formel herstellen.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich werde mich in der Zwischenzeit nach einer besseren Rüstung umsehen!"; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //Ich werde mich in der Zwischenzeit nach einer besseren Rüstung umsehen!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Die paar zusammengeflickten Minecrawler-Platten haben im unterirdischen Tempel einfach zu viel Hiebe durchgelassen!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Die paar blauen Stofflaken hier haben mich im unterirdischen Tempel nicht ausreichend geschützt!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //Die Untoten im Tempel haben gewaltige Beulen in meinen Panzer gehauen!
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Du solltest meinen alten Turm aufsuchen.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Deinen alten Turm?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Er versank bei einem dieser Beben in einem See im Osten. Die Turmspitzen ragen noch immer aus dem Wasser heraus.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //Dort lagern noch einige Artefakte. Ich hatte mir nie die Mühe gemacht, sie zu bergen.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Wie gelange ich hinein?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Ich war nach dem Beben nicht mehr dort, du musst also selbst einen Weg hinein finden.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Aber nimm diesen Schlüssel. Er öffnet eine Truhe, in der ich besonders seltene Artefakte aufbewahrte.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Ahh, wie ich sehe trägst du die Erzrüstung.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Ahh, wie ich sehe, hast du die Erzrüstung gefunden.
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Ich habe sie in einer der Kisten im versunkenen Turm gefunden.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Sie gehörte dem Feldherren der einst URIZIEL in die Schlacht gegen die Orks führte.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Ich hoffe, sie bringt mir mehr Glück als ihm!
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hast du die magische Formel für das Aufladen von URIZIEL fertiggestellt?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //Hast du die magische Formel für das Aufladen von URIZIEL fertig gestellt?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Sie ist vollendet. Aber du wirst sie nicht alleine benutzen können.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Warum nicht?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Sie muss von einem Magier gesprochen werden, während du das Schwert mit der Kraftquelle in Berührung bringst.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Dann werde ich mich nach Unterstützung umschauen müssen!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Nimm die Formel an dich und gib der Waffe ihre alte Macht zurück. Du wirst sie brauchen!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Als Magier werde ich mich schwertun, URIZIEL wirksam zu führen!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Als Magier werde ich mich schwer tun, URIZIEL wirksam zu führen!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Es gibt da einen Weg ...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Aber zuerst musst du der Klinge ihre alten Kräfte wiedergeben! Kehre dann zurück!
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich habe URIZIEL aufgeladen!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Ich habe URIZIEL aufgeladen!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Unglaublich, das Schwert hat seine alten Kräfte wiedergewonnen. Nun führst du eine wahrhaft mächtige Waffe!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige Lösung für´s Ich-brauch-Orc-Statue-Massaker ***Björn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Du erwähntest einen Weg, wie ich URIZIEL auch als Magier führen könnte!"; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Du erwähntest einen Weg, wie ich URIZIEL auch als Magier wirksam führen könnte!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Wenn du URIZIEL genau betrachtest, wird dir der große, blau schimmernde Edelstein in der Klinge sofort auffallen.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //Er ist das Gefäß für die magischen Kräfte der Klinge.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Wenn ich den Stein entferne, kann ich daraus eine Zauberrune herstellen, welche die Eigenschaften von URIZIEL selbst in sich trägt.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Eine Zauberrune aus URIZIEL?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //Mit der Kraft der Rune wirst du deine Feinde ebenso besiegen wie mit der Kraft des Schwertes!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Aber sei gewahr, dass nur ein Meister des sechsten Kreises der Magie eine solche machtvolle Zauberrune beherrschen kann!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "Entferne den Stein aus URIZIEL!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Entferne den Stein aus URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Du beherrscht noch nicht den sechsten Kreis der Magie!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Dieser Schritt ist endgültig. Soll ich den Stein wirklich aus der Klinge entfernen?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,	"JA, tu es!"				,	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,	"NEIN, lieber doch nicht!"	,	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //JA, tu es!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Du hast es so gewollt. Hier, nimm das leere Schwert und die Rune!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,	"Xardas entfernte den magischen Edelstein aus dem Schwert URIZIEL. Die Macht dieser Klinge schlummert nun in einer Zauberrune von unvergleichlicher Kraft.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NEIN, lieber doch nicht!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //So sei es. Die Klinge behält ihre magischen Kräfte!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Kannst du mich unterrichten?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Ich werde dich in den sechsten der magischen Kreise aufnehmen.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Denn wisse, nur die mächtigsten Magier werden in den sechsten Kreis aufgenommen. Er ist denen vorbehalten, deren Leben ein Zeichen ist.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Dein Zeichen ist die Verbindung der Elemente.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Mit dem sechsten Kreis bist du in der Lage, die Magie sämtlicher Runen anzuwenden.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //Und vergiss nie: Fordere nicht die Macht, sondern diene ihr.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() übergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem für Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Noch nicht, du hast das Talent, aber es fehlt dir an Erfahrung. Lerne erst bei Saturas, dann werde ich dich unterweisen.
		
		AI_StopProcessInfos	( self );
	};
};

	
