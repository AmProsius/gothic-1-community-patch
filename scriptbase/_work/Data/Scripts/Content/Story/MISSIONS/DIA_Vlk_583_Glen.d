// ************************ EXIT **************************

instance  VLK_583_Glen_Exit (C_INFO)
{
	npc			=  VLK_583_Glen;
	nr			= 999;
	condition	=  VLK_583_Glen_Exit_Condition;
	information	=  VLK_583_Glen_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_583_Glen_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance   VLK_583_Glen_INFO(C_INFO)
{
	npc				= VLK_583_Glen;
	condition		= VLK_583_Glen_INFO_Condition;
	information		= VLK_583_Glen_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Worauf sollte ich in der Mine achten?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //Worauf sollte ich in der Mine achten?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Auf die Minecrawler.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Je weiter du nach unten kommst, desto näher bist den Viechern. Die Mistdinger kommen direkt aus Beliars Reich!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Man kann sie schaben und kratzen hören. Sie lauern in der Dunkelheit und warten nur auf dich. Ich habe gesehen, wie sie getötet haben.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //Gnadenlos und schnell. Wenn du am Leben hängst, solltest du dich nicht hier unten aufhalten. Geh lieber, bevor dir noch was passiert.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Bei dir gibts Dietriche?";
};                       

FUNC int  VLK_583_Glen_LOCKPICK_Condition()
{
	if ( Npc_KnowsInfo(hero, VLK_585_Aleph_GLEN) )
	{
		return 1;
	};
};

FUNC VOID  VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //Ich hab' gehört, bei dir kann ich Dietriche kaufen.
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Nun, wenn du schlau genug warst, das herauszufinden, dann kannst du welche haben. 10 Erz das Stück.
	
	
};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(Dietriche kaufen)";
	trade		= 1;
};                       

FUNC int  VLK_583_Glen_BUY_Condition()
{	
	if ( Npc_KnowsInfo (hero, VLK_583_Glen_LOCKPICK) )
	{
		return 1;
	};
};
FUNC VOID  VLK_583_Glen_BUY_Info()
{
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Ich will Dietriche kaufen.
	
	
	
};
