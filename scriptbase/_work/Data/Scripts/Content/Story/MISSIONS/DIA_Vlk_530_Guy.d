// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
	npc			= Vlk_530_Guy;
	nr			= 999;
	condition	= DIA_Guy_Exit_Condition;
	information	= DIA_Guy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_Hello_Condition;
	information		= DIA_Guy_Hello_Info;
	permanent		= 0;
	description 	= "Hallo!";
};

FUNC INT DIA_Guy_Hello_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_Hello_Info()
{
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Hallo!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Hm? Dich hab' ich hier noch nie gesehen - du bist neu hier, oder?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Vor kurzem angekommen ...
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Hast du dir schon überlegt, welchem Lager du dich anschließen willst?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //Nein, was würdest du mir raten?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Kommt drauf an - jedes Lager hat seine Vorteile - denke ich.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Bist du dir's überlegt hast, kannst du hier wohnen - ist gerade 'ne Hütte freigeworden.
};

// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Guy_AdOC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_AdOC_Condition;
	information		= DIA_Guy_AdOC_Info;
	permanent		= 1;
	description 	= "Was sind die Vorteile des Alten Lagers?";
};

FUNC INT DIA_Guy_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdOC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //Was sind die Vorteile des Alten Lagers?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Wenn du den Gardisten dein Schutzgeld zahlst, hast du ein ruhiges Leben. Sie mischen sich in alle Kämpfe ein, in denen jemand angegriffen wird, den sie beschützen.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Außerdem kommt man nur hier günstig an Außenwelt-Waren. In den anderen Lagern sind diese Sachen unbezahlbar.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC, "Ich denke, ich hab' genug über's alte Lager gehört..." ,DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC, "Was sind hier wertvolle Waren?"			,DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC, "Und was ist, wenn zwei Leute kämpfen, die beide Schutzgeld zahlen?"			,DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Ich denke, ich hab' genug über's Alte Lager gehört...
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Also, mir gefällt's hier.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //Was sind hier wertvolle Waren?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Alles, was aus der Außenwelt kommt. Brot, Käse, Schinken und vor allem Bier und Wein - nicht der billige Reisschnaps aus dem Neuen Lager, sondern richtig guter Stoff.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Für Waffen bekommt man fast immer was und Rüstungen sind RICHTIG teuer.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Die Gardisten haben sich die alten Rüstungen der Aufseher unter den Nagel gerissen, nachdem sie sie alle umgebracht hatten.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Diese Rüstungen sind so was wie ihr Erkennungszeichen, die verkaufen sie nur an ihresgleichen, da kommst du als Fremder gar nicht ran.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //Und was ist, wenn zwei Leute kämpfen, die beide Schutzgeld zahlen?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Dann sehen sich die Gardisten das in aller Seelenruhe an. Aber wehe, wenn der eine den anderen umbringt. Dann ist er selber dran!
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Guy_AdNC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 3;
	condition		= DIA_Guy_AdNC_Condition;
	information		= DIA_Guy_AdNC_Info;
	permanent		= 0;
	description 		= "Was spricht für das Neue Lager?";
};

FUNC INT DIA_Guy_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdNC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //Was spricht für das Neue Lager?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Wenn du kein Problem damit hast, wegen einem Stück Brot die Kehle durchgeschnitten zu kriegen, bist du da richtig!
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //Nein - ganz so schlimm ist es nicht. Aber es geht anders zu als hier.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Hier sorgt Gomez dafür, das alles halbwegs ruhig bleibt. Im Neuen Lager gibt es kein Gesetz.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Die einzigen, die mächtig genug wären, den Laden zu schmeißen, sind die Wassermagier, und die forschen den ganzen Tag an der Barriere herum.
};	

// **************************************************
// 				Advantages ST
// **************************************************

INSTANCE DIA_Guy_AdST (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 4;
	condition		= DIA_Guy_AdST_Condition;
	information		= DIA_Guy_AdST_Info;
	permanent		= 0;
	description 		= "Warum sollte ich mich der Sekte anschließen?";
};

FUNC INT DIA_Guy_AdST_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdST_Info()
{
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //Warum sollte ich mich der Sekte anschließen?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //Tja, das fragst du am besten einen, der von dort kommt.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //Es sind immer einige Novizen im Lager, die können dir sicher 'ne Menge über die Sekte erzählen.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Ich war selbst nie da. Aber nach allem, was man hört, sollen sie sehr großzügig sein.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //Keines der drei Lager scheint so dringend neue Leute zu brauchen wie das der Sekte.
};

// **************************************************
// 				Welche Hütte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "Welche von den Hütten kann ich für mich nehmen?";
};

FUNC INT DIA_Guy_MyOwnHut_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_MyOwnHut_Info()
{
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Welche von den Hütten kann ich für mich nehmen?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Die Hütte da oben mit dem kleinen Vordach ist frei.
	AI_StopPointAt(self);
};	
