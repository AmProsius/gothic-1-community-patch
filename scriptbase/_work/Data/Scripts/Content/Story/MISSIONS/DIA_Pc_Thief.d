var int Diego_After_Gamestart;

// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Ich bin Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Ich bin...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Mich interessiert nicht, wer du bist. Du bist neu hier. Ich kümmere mich um die Neuen. Belassen wir es vorerst dabei.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Wenn du vorhast, länger zu leben, solltest du dich ein bißchen mit mir unterhalten. Ich werde dich allerdings nicht daran hindern, in dein Verderben zu rennen. Also, wie sieht's aus?
	
	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Danke für die Hilfe.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Wie du willst. War nett, dich gekannt zu haben.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Wir sehen uns im Alten Lager.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Weiter geht's.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Mach's gut.
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "Ich habe einen Brief für den obersten Feuermagier.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Ich habe einen Brief für den obersten Feuermagier.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //So...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Ein Magier hat ihn mir gegeben, kurz bevor sie mich reingeworfen haben.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Du kannst von Glück sagen, dass ich mich bei den Magiern nicht mehr blicken lassen kann. Jeder andere wird dir mit Freude für diesen Brief die Kehle durchschneiden.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //Die Magier belohnen ihre Boten immer sehr gut, und die meisten hier haben gar nichts, verstehst du?
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Wenn ich du wäre, würde ich die Schnauze halten, bis ich einen der Magier treffe. Obwohl das in deiner Lage nicht allzu wahrscheinlich ist.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Wieso nicht? 
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Die Magier sind in der Burg im Alten Lager. Nur Gomez' Leuten ist es erlaubt, die Burg zu betreten.
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "Warum hast du mir geholfen?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Warum hast du mir geholfen?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Weil du Hilfe gebraucht hast. Bullit und seine Jungs hätten dich vielleicht kaltgemacht.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //Und das konnte ich nicht mit ansehen. Schließlich bin ich den ganzen weiten Weg gekommen um dir einen Vorschlag zu machen.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Einen Vorschlag...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Ja. Deine Begegnung mit Bullit und seinen Jungs hat dir hoffentlich gezeigt, dass du Schutz brauchst.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Jeder, der hier ankommt, wird vor eine Wahl gestellt. Es gibt drei Lager in der Kolonie, und einem davon wirst du dich anschließen müssen.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Ich bin hier, um Neuen wie dir klarzumachen, dass sie bei uns im alten Lager am besten aufgehoben sind.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "Wo ist dieser Bullit jetzt?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //Wo ist dieser Bullit jetzt?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //Er und die anderen bringen die Waren aus der Außenwelt ins alte Lager. Dort kannst du ihn finden.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Aber wenn du vorhast, dich mit ihm anzulegen, sei vorsichtig. Er ist ein erfahrener Kämpfer.
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "Okay, was muss ich über diesen Ort wissen?";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Okay, was muss ich über diesen Ort wissen?                                                                                                                                                                     
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Wir nennen es die Kolonie. Du wirst sicher schon gehört haben, dass wir hier Erz für den König fördern.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Nun - zumindest wir vom alten Lager.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Es gibt drei Lager innerhalb der Barriere. Das alte Lager ist das größte von ihnen. Es war auch das erste.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "Erzähl mir was über die Barriere.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Erzähl mir was über die Barriere.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Da gibt es nicht viel zu erzählen. Sie ist undurchdringlich.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //Was passiert, wenn ich hier einfach wieder rausspaziere?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Der Letzte, der das versucht hat, ist tot auf der anderen Seite angekommen. Diese verdammte Barriere lässt dich zwar rein, aber raus kommst du hier nicht mehr.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Wenn es einen Weg hier raus gibt, werde ich ihn finden.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Hast du's SO eilig, hier wieder rauszukommen? Du bist ja gerade mal da!                                                                                                                             
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "Was ist mit den beiden anderen Lagern?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //Was ist mit den beiden anderen Lagern?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Die beiden anderen Lager haben sich abgespalten, um ihren schwachsinnigen Ausbruchsplänen nachzugehen.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //Es gibt das neue Lager im Westen der Kolonie. Die Magier dort meinen, wenn sie genug Erz zusammengekratzt haben, können sie die Barriere einfach sprengen.  
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //Dann gibt's im Osten die Sektenspinner. Sie haben ihr Lager im Sumpf und beten zu ihrem Götzen, er möge ihnen die Freiheit schenken.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Bis jetzt hat er sich noch nicht gemeldet.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Wenn ich du wäre, würde ich meine Zeit nicht mit den Spinnern verschwenden.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "Erzähl mir was über das alte Lager.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Erzähl mir was über das alte Lager.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //Es ist das größte und mächtigste der drei Lager. Gomez und seine Jungs kontrollieren das Lager und damit den ganzen Erzaustausch.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Einmal im Monat schickt der König uns alles, was wir fordern. Wir haben den alten Sack in der Hand, verstehst du? Er ist auf das Erz angewiesen.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Er schickt uns Wein, Brot, Fleisch, Waffen, einfach alles.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Du kannst auch deinen Teil davon bekommen. Alles, was du tun mußt, ist dich Gomez' Leuten anzuschließen.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "Wer ist Gomez?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Wer ist Gomez?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez ist der oberste Erzbaron. Der Boss des Alten Lagers. Der mächtigste Mann in der Kolonie.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "Wie kann ich mich Gomez' Leuten anschliessen?";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Mal angenommen, ich wollte mich seinen Leuten anschließen, was müßte ich tun.
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Am Eingang zur Burg findest du einen Mann, der Thorus heißt. Sag ihm Diego schickt dich.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC, "Um bei Gomez Leuten im Alten Lager aufgenommen zu werden, soll ich mich bei Thorus melden.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "Wie komme ich zum alten Lager?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Wie komme ich zum alten Lager?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Du mußt nur dem Weg hier folgen. Das Alte Lager ist der nächste halbwegs sichere Ort von hier aus gesehen.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Es treiben sich jede Menge wilder Bestien zwischen den Lagern herum. Ohne Waffe zu gehen ist Wahnsinn.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "Wo kriege ich eine Waffe her?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Wo kriege ich eine Waffe her?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Wenn du an der verlassenen Mine vorbeikommst, sieh dich mal ein bißchen um. Du findest bestimmt was Brauchbares.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Die Mine ist leicht zu finden, nur ein paar Meter die Schlucht entlang.
};

// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "Ich habe mit Thorus geredet.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Ich habe mit Thorus geredet.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //Und was sagt er?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Er will mich im Lager aufnehmen, wenn DU denkst, dass ich gut genug bin.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Sieht so aus, als hätte ich einen neuen Job.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Fangen wir direkt an?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Vorher solltest du ein paar Sachen wissen.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "Was muss ich wissen, um im Alten Lager aufgenommen zu werden?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Was muss ich wissen, um im Alten Lager aufgenommen zu werden?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Wenn du aufgenommen werden willst, mußt du Pluspunkte sammeln.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //Es gibt einige einflussreiche Leute hier im Außenring. Die meisten davon sind Schatten. Wenn du es schaffst, sie zu beeindrucken, bringt dir das Pluspunkte ein.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Dann mußt du eine Prüfung des Vertrauens ablegen.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Außerdem gibt es für einen Neuen wie dich jede Menge neuer Talente zu lernen. Je mehr du lernst, desto wertvoller bist du für uns.
	
	B_LogEntry( CH1_JoinOC, "Um aufgenommen zu werden, muss ich wichtige Leute im Aussenring beeindrucken und eine Prüfung des Vertrauens bei Diego ablegen.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "Wo finde ich die wichtigen Leute?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Wo finde ich die wichtigen Leute?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Nun, einer steht hier direkt vor dir, dann wäre da noch Thorus, den kennst du ja schon.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Was die anderen betrifft, das wirst du selbst rausfinden müssen. Wenn du dazu nicht in der Lage bist, hast du hier im Lager sowieso nichts verloren.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Geh einfach durch den Außenring und rede mit den Leuten. Du findest dann schon raus, an wen du dich halten mußt.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "Bei wem kann ich was lernen?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Bei wem kann ich was lernen?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Für den Anfang solltest du dich an Fingers halten. Er ist der Geschickteste von uns. 
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Wenn du die Augen aufhältst, wirst du noch andere Leute finden, die dir etwas beibringen können.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Wo finde ich diesen Fingers?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Seine Hütte liegt etwas zurück, direkt an der Burgmauer, wenn du von hier zur Arena gehst.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Wenn du vorm Burgtor stehst, geh links runter, da geht's Richtung Arena.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,	"Fingers kann mir TASCHENDIEBSTAHL und SCHLÖSSER ÖFFNEN beibringen, er wohnt in einer Hütte nahe der Arena, etwas zurükliegend an der Burgmauer.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "Kannst du mir was beibringen?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,	"Diego kann mir helfen STÄRKER und GESCHICKTER zu werden.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Kannst du mir was beibringen?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Ja. Bei mir kannst du lernen, deine Geschicklichkeit zu verbessern oder deine Kampfkraft zu steigern.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Deine Kampfkraft ist um einiges gestiegen.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Dein Geschick im Umgang mit Bögen und Armbrüsten ist schon besser geworden.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Komm bald wieder - es gibt viel zu lernen!
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************

VAR INT Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "Was ist die Prüfung des Vertrauens?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //Was ist die Prüfung des Vertrauens?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Du sollst für mich zur alten Mine gehen. Dort triffst du einen Kerl namens Ian. Er wird dir eine Liste geben.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //Diese Liste ist wichtig. Da steht drauf, was die Jungs in der Mine von uns brauchen.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Das schicken wir ihnen dann mit dem nächsten Convoy!
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //Kein Problem!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //Oh, doch! Das ist ein Problem. Das Neue Lager darf auf keinen Fall die Liste in die Finger bekommen!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Wie ich schon sagte, die Liste ist wichtig. Wenn du die Sache gut machst, bringt dich das einen großen Schritt weiter.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego hat mich zur Alten Mine geschickt. Dort soll ich von einem Mann namens Ian eine Liste bekommen. Die Liste darf auf keinen Fall dem Neuen Lager in die Finger fallen.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "Wenn die Liste so vichtig ist, wieso sollte Ian sie mir geben?";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Wenn die Liste so wichtig ist, wieso sollte Ian sie dann ausgerechnet MIR geben?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Weil du ihm sagst, Diego schickt dich. 
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Werd's ihm ausrichten.
	
	B_LogEntry    (CH1_BringList,"Ian wird mir die Liste geben, wenn ich ihm sage, dass Diego mich schickt.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Wo finde ich die Alte Mine?";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Wo finde ich die Alte Mine?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Geh zu Graham. Er zeichnet Karten. Sag ihm, du kommst von mir. Er soll dir 'ne Karte geben. Auf der wirst du die Mine finden.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Er wohnt drüben links neben dem Nordtor.
	
	B_LogEntry    (CH1_BringList,"Graham wird mir eine Karte geben, ich finde ihn links neben dem Nordtor.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Ich hab' die Liste von Ian.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Ich hab' die Liste von Ian.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego war sehr zufrieden als ich ihm Ian's Liste überreichte.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego war sehr zufrieden als ich ihm Ian's Liste überreichte. Er scheint Lares' Fälschung nicht durchschaut zu haben, oder habe ich gerade ein Funkeln in seinen Augen gesehen?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Gut gemacht! Das bringt dir einige Pluspunkte ein!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "Wie steht's mit meinem Ansehen im Lager?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Wie steht's mit meinem Ansehen im Lager?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Ich hab' mal mit ein paar Leuten geredet...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //Und?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty hat mir gesagt, du hast Kirgo besiegt. 
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty hat mir gesagt, du hast gegen Kirgo verloren. Er hat sich nicht seher begeistert angehört.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty hat mir gesagt, er wäre gespannt, wie du gegen Kirgo abschneidest.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Aber dass du den Mumm gehabt hast, gegen Kharim anzutreten hat ihm imponiert, obwohl du verloren hast.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Aber dass du gegen Kharim gewonnen hast, hat ihn total von den Socken gehauen - er hat gar nicht mehr aufgehört, von dir zu reden.
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //Und er war sehr gespannt, ob du Kharim herausfordern wirst.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler hat mir von der Sache mit Fisk erzählt... Also ich an deiner Stelle wäre ja mit dem Erz durchgebrannt. Aber egal - er hält jedenfalls große Stücke auf dich.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Ich hab' mit Whistler geredet. Du bist mit seinem Erz durchgebrannt, du gerissener Hund! Ich muss schon sagen, Mut hast du ja!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler wartet auf sein Schwert. Du solltest dich entscheiden, ob du's ihm bringen willst, sonst denkt er noch, du brennst mit seinem Erz durch!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly hat mir erzählt, du hast Nek gefunden. Er wirkte sehr zufrieden.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Ich denke, bei der Sache mit Nek liegt Sly falsch. Er hat zwar immer viel gemeckert, aber ins Neue Lager ist er sicher nicht gegangen.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Zu Fingers hab' ich dich ja schon geschickt - du solltest ruhig etwas von ihm lernen.
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers sagt, du hättest was gelernt. Er denkt, du wirst noch um einiges besser werden.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Mit Dexter muss ich noch ein ernstes Wörtchen reden. Er benutzt dich für seine eigenen Geschäfte. 
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Aber es gibt keine Regeln für die Probe. Wenn du DAS schaffst, bist du einen großen Schritt weiter.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Du hast es tatsächlich geschafft, Kalom das Rezept abzuluchsen. Ich bin mindestens genauso beeindruckt wie Dexter.
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Bei der Mordrag-Sache hast du 'nen ganz schönen Brocken als Auftrag angenommen. Er ist kein schlechter Kämpfer. Du solltest einigermaßen trainiert sein, wenn du ihn schaffen willst.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus sagt, so einen wie dich können wir brauchen - das allein ist schon verdammt viel Wert für dich.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus ist fast der Kopf geplatzt, so hat er geschrien - was hast du dir dabei gedacht, gerade diese Sache SO zu vermasseln?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk hat mir gesagt, du hättst ihn überascht. Er ist auf jeden Fall auf deiner Seite.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk ist echt sauer auf dich, Mann. Wenn ich du wäre würd ich mich um Ersatz für Mordrag kümmern.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Du hast genug Leute gefunden, die für dich sprechen.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Und die Prüfung des Vertrauens hast du auch bestanden. Geh zu Thorus. Ich habe ihm schon alles erzählt. Er wird dich zu Gomez lassen.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC, "Diego hat mir eine Audienz bei Gomez verschafft. Jetzt kann ich einer von Gomez Leuten werden und die Burg betreten, ich muss nur noch zu Thorus gehen.");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Aber die Prüfung des Vertrauens liegt noch vor dir.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //Alles in allem schon nicht so schlecht für eine Neuen.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Halt dich ran, es gibt noch viel zu tun, wenn du es hier im Lager zu was bringen willst.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "Was soll ich machen, wenn ich bei Gomez bin?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Was soll ich machen, wenn ich bei Gomez bin?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez entscheidet aus dem Bauch heraus. Wenn ihm deine Visage passt, bist du dabei.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Ab jetzt bist du auf dich allein gestellt - Mach das Beste draus! Viel Glück.
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //Kann ich eine Rüstung haben, wie du sie trägst?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //Hast du das nötige Erz in der Tasche?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text für die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Besorge dir das Erz, dann bekommst du die Rüstung.
	};
};  





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hey, ich dachte, du wärst tot.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //Das ein oder andere Mal hab' ich das auch gedacht.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Seit unserem ersten Treffen ist einiges passiert. Ich hörte, du warst nicht ganz unbeteiligt daran, dass die große Beschwörung stattfinden konnte. 
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Du kriegst ja anscheinend eine ganze Menge mit.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Mehr als du denkst... Jetzt bist du auf Fokus Suche?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Ja. Hier in der Gegend muss es irgendwo einen geben.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Ich weiß, wo einer liegt. Es gibt da nur ein Problem...
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Ich verstehe. Was willst du haben?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Du hast tatsächlich gelernt, aber das meine ich nicht.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Nein? Was ist dann dein Problem?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //Ein drei Tonnen schweres Problem. 
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Lass uns gehen. Du wirst es gleich verstehen.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,	"Bei der Annäherung zum nördlichsten Fokusort traf ich überraschenderweise Diego wieder. Er warnte mich vor irgendetwas 'Großem' dass am Ende der Schlucht auf mich warten soll.");
	B_LogEntry		(CH3_TrollCanyon,	"Irgendwoher wußte er sowohl über meine Aktivitäten im Sumpflager als auch von meiner Fokussuche. Wir setzen unseren Weg nun gemeinsam fort.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Auf der linken Seite dieser Schlucht gibt es einen Höhlengang, der zum Fokusplatz führt.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Alles klar. Doch zunächst sollten wir dieses Ungetüm da drüben loswerden.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Versuche, eine Schwachstelle oder irgendeine Möglichkeit zu finden, wie wir den Troll kleinkriegen können. 
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Ich lenke seine Aufmerksamkeit auf mich.

	B_LogEntry		(CH3_TrollCanyon,	"Wir haben einen riesigen Troll entdeckt, der unseren weiteren Weg versperrt. Diego will ihn ablenken während ich nach einem Weg finden muss, den Troll klein zu kriegen.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //Das war fantastisch. Mann, du hast ja einiges drauf. So, jetzt hol dir den Fokus. 
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ich passe auf, dass keine weiteren unangenehmen Überraschungen auf uns zu kommen.

	B_LogEntry		(CH3_TrollCanyon,	"Der Troll ist besiegt. Nun kann ich mich mit der Winde beschäftigen, die das Gitter zur Fokusplattform bewegen kann.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Die Winde scheint zu klemmen.
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Lass mich mal, vielleicht kann ich da was machen!

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //So, jetzt sollte es eigentlich wieder gehen.
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,	"Diego hat die verklemmte Winde repariert. Nun steht mir nichts mehr im Weg.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Hol dir den Fokus, ich warte hier!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Hey, du hast den Fokus also gefunden. Sehr gut.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Ich werde mal wieder die Lage im Alten Lager prüfen. Viel Glück noch.
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Sieh zu, das du am Leben bleibst.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Wir werden uns wieder sehen.

	B_LogEntry		(CH3_TrollCanyon,	"Der Fokus ist mein. Ich mußte allerdings noch einige Harpien davon überzeugen, ihn mir zu überlassen.");
	B_LogEntry		(CH3_TrollCanyon,	"Diego kehrt zum Alten Lager zurück. Es sollte mich wundern, wenn wir uns nicht irgendwann mal wieder über den Weg laufen sollten.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
};  











//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Hey... Pssst.... Sei ganz leise!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Hallo, Diego, ich habe Milten auf der anderen Seite des Lagers schon gesprochen!
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Gut, dann weißt du ja schon, was passiert ist.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //Aber weißt du auch von dem geplanten Überfall auf die Freie Mine?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Hallo, Diego, warum dieses Versteckspiel?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Hast du es noch nicht gehört?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //Was gehört?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //Die eingestürzte Alte Mine, die Ermordung der Feuermagier und die Pläne für den Überfall auf die Freie Mine?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //WAAAAS???? Was redest du da?
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Wie konnte die Alte Mine einstürzen?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Wie konnte die Alte Mine einstürzen?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Einer der Buddler, der sich retten konnte, erzählte davon, dass sie auf der untersten Minenebene einen unterirdischen Fluß angegraben haben.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Als das Wasser in die Mine einbrach, wusch es einige Stützpfeiler weg und der gesamte obere Bereich stürzte ein.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Nur eine Hand voll Leute haben es aus der Mine lebend herausgeschafft.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "Wieso sind die Feuermagier tot?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Wieso sind die Feuermagier tot?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //Das ist eine etwas längere Geschichte.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "Ein Überfall auf die Freie Mine?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Ein Überfall auf die Freie Mine?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //Das ist eine etwas längere Geschichte.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "Nun erzähl schon!";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Nun erzähl schon! Es ist nicht die erste längere Geschichte, die ich mir anhören muss!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //Nun gut. Ich hatte das Glück, mich beim Eintreffen der Nachricht vom Einsturz der Mine im Haus der Erzbarone aufzuhalten.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Gomez war über das Unglück völlig außer sich und sah dadurch sofort seine Machtposition gefährdet.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Klar. Wer das Erz kontrolliert, kontrolliert die Kolonie!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //Richtig. Nun, da er von seiner einzigen Einnahmequelle abgeschnitten ist, wird auch der Warenfluß von der Außenwelt bald stoppen.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Niemand wird mehr für ihn arbeiten wollen, wenn nicht bald eine andere Einnahmequelle aufgetrieben wird.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //Und deshalb ein Überfall auf die Freie Mine?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Das ist - neutral betrachtet - die einzige Chance, die Gomez hat, seine Macht zu erhalten.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Vor einigen Stunden sind zwei Dutzend Gardisten in Richtung Freie Mine aufgebrochen.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "Das ist Wahnsinn! Ich muss das Neue Lager warnen.";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //Das ist Wahnsinn! Ich muss das Neue Lager warnen.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //Dann solltest du dich beeilen, denn sie dürften die Freie Mine schon fast erreicht haben.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Aber sie würden niemals an den Befestigungen des Neuen Lagers vorbeikommen.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Das ist nicht nötig. Schon vor einigen Monaten haben sie einen Weg über die Berge zur Freien Mine gefunden, den niemand sonst kennt.
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "Ich habe Gardisten vor den verschlossenen Toren gesehen.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Ich habe Gardisten vor den verschlossenen Toren gesehen.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Halt dich bloß von ihnen fern. Sie greifen jeden an, der sich dem Lager nähert.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Sie haben wohl Angst vor den Vergeltungsmaßnahmen nach dem Überfall auf die Freie Mine.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "Aber was passierte mit den Feuermagiern?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Aber was passierte mit den Feuermagiern?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo und die anderen Magier waren die einzigen im Lager, die vernünftig blieben.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Sie verboten den Überfall und forderten eine Einigung mit den beiden anderen Lagern.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //Sie VERBOTEN Gomez den Überfall auf die Freie Mine?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //Tja, Corristo und die anderen hätten wohl weniger forsch auftreten sollen. Gomez verlor das Vertrauen zu ihnen und ließ sie hinterrücks niederstrecken.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "Was wollen Milten und du nun machen?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //Was wollen Milten und du nun machen?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Wir werden hier noch eine Weile ausharren und andere Freunde warnen, bevor sie den fanatischen Gardisten in die Hände laufen.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Aber du könntest uns noch einen Gefallen tun.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "Ist schon so gut wie erledigt. Sprich!";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Ist schon so gut wie erledigt. Sprich!
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Suche Lester und Gorn. Sie müssen wissen, was hier passiert ist.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Richte ihnen aus, dass wir vier uns wie immer am verabredeten Platz treffen.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Wenn ich sie vor euch treffe, werde ich sie warnen und zu eurem Treffpunkt schicken.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Danke, mein Freund. Du scheinst wirklich in Ordnung zu sein. Geh nun, wir sehen uns später.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Alle Feuermagier sind tot und die Situation spitzt sich zu. Diego hat mich beauftragt Lester und Gorn davon zu unterrichten, daß er sich mit Ihnen und Milten an einem geheimen Ort treffen will. Das scheinen sie nicht zum ersten gemacht zu haben."); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter Überfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schlägerei mit Folgen         (+3 Stärke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung für mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des Königs Gardisten. dummerweise hat der König viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("Stärke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich saß in der Kneipe und habe meine Meinung über König, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu spät daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du Männer die so ziemlich jedes mögliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("Stärke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
