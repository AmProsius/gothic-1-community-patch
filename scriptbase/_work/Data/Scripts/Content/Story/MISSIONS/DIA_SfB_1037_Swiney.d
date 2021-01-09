// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Wer bist du?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Wer bist du?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Ich bin der beste Bergbauer, den diese verdammte Kolonie jemals gesehen hat, mein Junge.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Ich passe auf, dass nicht die Hälfte unserer Jungs von Steinen erschlagen werden, weil sie zu dumm sind, an der richtigen Stelle zu schürfen.
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "Ich will bei euch als Schürfer mitmachen!";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Ich will bei euch als Schürfer mitmachen!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //So? Denk bloß nicht, du kannst hier viel erwarten. Jeden Tag gibt's 3 Portionen Reis und für den Rest musst du selber sorgen.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Du weißt, warum wir das hier machen? Wir machen die Arbeit, damit alle hier eines Tages wieder rausspazieren können.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Das heißt, alles Erz wird abgegeben und kommt auf den großen Haufen. Und einmal im Monat kriegt jeder, der hier hart gearbeitet hat, 50 Brocken Erz zum Versaufen.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //Das waren auch schon die wichtigsten Sachen, die du wissen musst.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //Kennst du dich wenigstens mit der Arbeit aus?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer, "Nein."	,Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer, "Ja." 		,Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Ja.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //Gut! Dann weißt du ja, worauf du zu achten hast. Hier ist Schutzkleidung. 'Ne Spitzhacke musst du dir suchen. Viel Spaß.
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Nein.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //Natürlich nicht! Warum immer ich? Gut. Pass auf. Du nimmst jetzt diese Klamotten und ziehst sie dir an - hier.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Wenn dir ein Erzbrocken auf den Fuß fällt und du keine Schutzkleidung trägst, bist du ein Krüppel und nur noch die Hälfte für uns wert.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //'Ne Spitzhacke liegt hier bestimmt irgendwo noch rum.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Aber viel anfangen kannst du damit sowieso nicht - na ja - was soll's ...
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Wieviel Erz habt ihr schon gesammelt?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Wie viel Erz habt ihr schon gesammelt?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Die Magier sagen, viel brauchen wir nicht mehr. Geh ins Neue Lager und sieh dir den Haufen an.
	AI_StopProcessInfos	(self);
};


