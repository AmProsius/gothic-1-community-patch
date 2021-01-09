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
	description 	= "Hello!";
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
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //Hello!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //Mhm? I haven't seen you before - you are new here, aren't you?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Just recently arrived...
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //Have you already decided which camp you want to join?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //No, what do you think?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Well, it depends - each camp has its advantages, I guess.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Until you've made your decision, you can stay here - a hut just became available.
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
	description 	= "What are the advantages of the Old Camp?";
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
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //What are the advantages of the Old Camp?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //If you pay protection money to the guards, you can have a laidback life here. They always interfere if one of the paying diggers is attacked.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Besides, you can only get the goods from the outside world cheap here. These things are unaffordable in the other camps.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC,"I think I've heard enough about the Old Camp.",DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC,"What goods are considered precious here?",DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC,"And what if two people fight each other who both pay protection money?",DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //I think I've heard enough about the Old Camp.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //I like it here.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //What goods are considered precious here?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Everything from the outside world. Bread, cheese, bacon and above all beer and wine - not the cheap rice schnapps from the New Camp, but really good stuff.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //You always get a good price for weapons, and armor is REALLY expensive.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //The guards took the old armor off the prison guards after they killed them.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //You can always recognize them by their armor, they only sell it to other guards. You could never get hold of one as an outsider.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //And what if two people fight each other who both pay protection money?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Then the guards just watch - until one of them kills the other: Then they do him in.
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
	description 		= "What are the advantages of the New Camp?";
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
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //What are the advantages of the New Camp?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //If you're cool about getting your throat cut for a slice of bread, you should go there.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //No - it's not that bad. But it's different from here.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Here Gomez takes care that things are sort of peaceful. In the New Camp, there is no law.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //The only ones powerful enough to have a say there are the water mages, but they're too busy studying the Barrier all day.
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
	description 		= "Why should I join the sect?";
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
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //Why should I join the sect?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //Well, you better ask somebody from the Sect Camp.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //There are always a couple of novices in the Camp, and I'm sure they can tell you a lot about the sect.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //I've never been there myself. But according to everything that's said, they must be really generous.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //None of the three camps seems to be as much in need of new people as the Sect Camp.
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
	description 		= "Which of the huts can I take for myself?";
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
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //Which of the huts can I take for myself?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //The hut over there with the little canopy is empty.
	AI_StopPointAt(self);
};	
