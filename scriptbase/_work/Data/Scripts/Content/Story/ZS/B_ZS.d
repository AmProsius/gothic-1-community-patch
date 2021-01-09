// ZS-KONSTANTEN FÜR ITEMSTATUS
    
const int	TA_IT_NONE			    = 0;
const int	TA_IT_APPLE		    	= 1;
const int	TA_IT_LOAF 			    = 2;
const int	TA_IT_CHEESE			= 3;
const int	TA_IT_BEER			    = 4;
const int	TA_IT_MEAT 			    = 5;
const int	TA_IT_SOUP 			    = 6;
const int	TA_IT_RICE 			    = 7;
const int	TA_IT_JOINT 			= 8;
const int	TA_IT_BOOZE			    = 9;
const int	TA_IT_WINE			    = 10;
const int	TA_IT_SMALLTALK_ACTIVE	= 11;
const int	TA_IT_SMALLTALK_PASSIVE	= 12;
const int	TA_IT_SMALLTALK			= 13;
const int	TA_IT_FORCEDSMALLTALK	= 14;

// ABFRAGEN LAGERZUGEHÖRIGKEIT

//Wahrnehmungset auswählen

//Wach-Anis abspielen
func void B_InitArmor ()
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_InitArmor");

    var C_ITEM myarmor;
	myarmor = Npc_GetEquippedArmor(self);
	
	if (Hlp_IsItem (myarmor,GRD_ARMOR_L))
	{
	    AI_PlayAni (self,"T_STAND_2_LGUARD");
	}
	else if ((Hlp_IsItem (myarmor,GRD_ARMOR_H))||(Hlp_IsItem (myarmor,GRD_ARMOR_M)))
	{
	    AI_PlayAni (self,"T_STAND_2_HGUARD");
	}; 
};	

func void B_PlayArmor ()
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_PlayArmor");

	var int guardreaktion;
	guardreaktion = Hlp_Random (100);
    
    var C_ITEM myarmor;
	
	myarmor = Npc_GetEquippedArmor(self);
    
   	if (Hlp_IsItem (myarmor,GRD_ARMOR_L))
	{
    	if (guardreaktion >= 90)
    	{
    		AI_PlayAni (self,"T_LGUARD_2_STAND");
    		AI_PlayAni (self,"T_STAND_2_LGUARD");
    	}
    	else if (guardreaktion >= 80)
    	{
    		AI_PlayAni (self,"T_LGUARD_SCRATCH");
    	}
    	else if (guardreaktion >= 70)
    	{
    		AI_PlayAni (self,"T_LGUARD_STRETCH");
    	}
    	else if (guardreaktion >= 60)
    	{
    		AI_PlayAni (self,"T_LGUARD_CHANGELEG");
    	};
    }
    else if ((Hlp_IsItem (myarmor,GRD_ARMOR_H))||(Hlp_IsItem (myarmor,GRD_ARMOR_M)))
	{
	    guardreaktion = Hlp_Random (100);
	
	    if (guardreaktion >= 95)
	    {
	    	AI_PlayAni (self,"T_HGUARD_2_STAND");
	    	AI_PlayAni (self,"T_STAND_2_HGUARD");
	    }
	    else if (guardreaktion >= 90)
	    {
	    	AI_PlayAni (self,"T_HGUARD_LOOKAROUND");
	    };
	}; 
};

func void B_ExitArmor()
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ExitArmor");

    var C_ITEM myarmor;
	
	myarmor = Npc_GetEquippedArmor(self);
	
	if (Hlp_IsItem (myarmor,GRD_ARMOR_L))
	{
	    AI_PlayAni (self,"T_LGUARD_2_STAND");	
	}
	else if ((Hlp_IsItem (myarmor,GRD_ARMOR_H))||(Hlp_IsItem (myarmor,GRD_ARMOR_M)))
	{
	    AI_PlayAni (self,"T_HGUARD_2_STAND");
	}; 
};	

// ITEM-USE-ANIS ABSPIELEN

func void B_EatSmall (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_EatSmall");

	if ((Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 20))
	{
		AI_PlayAni (self,"T_FOOD_RANDOM_1"); 
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	};	
};	

func void B_EatHuge (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_EatHuge");

	if (Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni (self,"T_FOODHUGE_RANDOM_1");
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5); 
	};	
};

func void B_ThrowApple (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ThrowApple");

	if (Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni (self,"T_FOOD_RANDOM_2");
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	};
};

func void B_DrinkBottle (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_DrinkBottle");

	if ((Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 30))
	{
		AI_PlayAni (self,"T_POTION_RANDOM_1");
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	};
};

func void B_WipeMouth (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_WipeMouth");

	if ((Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ]) && (Hlp_Random(100) > 50))
	{
		AI_PlayAni (self,"T_POTION_RANDOM_2");
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	};
};

func void B_LookBottle (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_LookBottle");

	if (Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni (self,"T_POTION_RANDOM_3");
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	};
};

func void B_DrawJoint (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_DrawJoint");

	if (Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni (self,"T_JOINT_RANDOM_1");
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	};
};

func void B_EatMeat (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_EatMeat");

	if (Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ])
	{
		AI_PlayAni (self,"T_MEAT_RANDOM_1"); 
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	};	
};

func void B_EatRice (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_EatRice");

	if ((Npc_GetStateTime(self)>=self.aivar[AIV_ITEMFREQ]) && Hlp_Random(1) == 1)
	{
		AI_PlayAni (self,"T_RICE_RANDOM_1"); 
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	}
	else
	{
	    AI_PlayAni (self,"T_RICE_RANDOM_2"); 
		Npc_SetStateTime(self,0);
		
		self.aivar[AIV_ITEMFREQ]=(Hlp_Random(5)+5);
	};	
};

func void B_PlayItemRandoms (VAR C_NPC self)
{
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE)
	{
		B_EatSmall (self);	
	};
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_LOAF)
	{
		B_EatHuge (self);	
	};
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_CHEESE)
	{
		B_EatHuge (self);
	};
	if ((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER)||(self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE)||(self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE))
	{
		B_DrinkBottle (self);
	};
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_JOINT)
	{
		B_DrawJoint (self);
	};
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_MEAT)
	{
		B_EatMeat (self);
	};
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_RICE)
	{
		B_EatRice (self);
	};
	
	if (self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE)
	{
		 B_ThrowApple (self);
	};
	if ((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER)||(self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE))
	{
		B_LookBottle (self);
	};
	if ((self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER)||(self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE)||(self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE))
	{
		B_WipeMouth (self);
	};
};



// Itemauswahlfunktionen
  
func void B_ChooseApple (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseApple");
	
	self.aivar[AIV_ITEMSTATUS] = TA_IT_APPLE;
	
	if (Npc_HasItems (self,ItFoApple) == 0)
	{
		CreateInvItem (self,ItFoApple);
	};
	AI_UseItemToState	( self, ItFoApple,0);
	
	self.aivar[AIV_ITEMFREQ]=1;		
};

func void B_ChooseLoaf (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseLoaf");
	
	self.aivar[AIV_ITEMSTATUS] = TA_IT_LOAF;
	
	if (Npc_HasItems (self,ItFoLoaf) == 0)
	{
		CreateInvItem (self,ItFoLoaf);
	};
	AI_UseItemToState	( self, ItFoLoaf,0);
	
	self.aivar[AIV_ITEMFREQ]=1;		
};	

func void B_ChooseCheese (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseCheese");
	
	self.aivar[AIV_ITEMSTATUS] = TA_IT_CHEESE;
	
	if (Npc_HasItems (self,ItFoCheese) == 0)
	{
		CreateInvItem (self,ItFoCheese);
	};
	AI_UseItemToState	( self, ItFoCheese,0);
	
	self.aivar[AIV_ITEMFREQ]=1;		
};	

func void B_ChooseBeer (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseBeer");
				
	self.aivar[AIV_ITEMSTATUS] = TA_IT_BEER;
	
	if (Npc_HasItems (self,ItFoBeer) == 0)
	{
		CreateInvItem (self,ItFoBeer);
	};
	AI_UseItemToState	( self, ItFoBeer,0);
	
	self.aivar[AIV_ITEMFREQ]=1;
};

func void B_ChooseMeat (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseMeat");
				
	self.aivar[AIV_ITEMSTATUS] = TA_IT_MEAT;
	
	if (Npc_HasItems (self,ItFoMutton) == 0)
	{
		CreateInvItem (self,ItFoMutton);
	};
	AI_UseItemToState	( self, ItFoMutton,0);
	
	self.aivar[AIV_ITEMFREQ]=1;
};

func void B_ChooseSoup (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseSoup");
				
	self.aivar[AIV_ITEMSTATUS] = TA_IT_SOUP;
	
	if (Npc_HasItems (self,ItFoSoup) == 0)
	{
		CreateInvItem (self,ItFoSoup);
	};
	AI_UseItemToState	( self, ItFoSoup,0);
	
	self.aivar[AIV_ITEMFREQ]=1;
};

func void B_ChooseRice (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseRice");
				
	self.aivar[AIV_ITEMSTATUS] = TA_IT_RICE;
	
	if (Npc_HasItems (self,ItFoRice) == 0)
	{
		CreateInvItem (self,ItFoRice);
	};
	AI_UseItemToState	( self, ItFoRice,0);
	
	self.aivar[AIV_ITEMFREQ]=1;
};

func void B_ChooseJoint (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseJoint");
	
	self.aivar[AIV_ITEMSTATUS] = TA_IT_JOINT;
	
	if (Npc_HasItems (self,ItMiJoint_1) == 0)
	{
		CreateInvItem (self,ItMiJoint_1);
	};
	AI_UseItemToState	( self, ItMiJoint_1,0);
	
	self.aivar[AIV_ITEMFREQ]=1;
};	

func void B_ChooseBooze (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseBooze");
				
	self.aivar[AIV_ITEMSTATUS] = TA_IT_BOOZE;
	
	if (Npc_HasItems (self,ItFoBooze) == 0)
	{
		CreateInvItem (self,ItFoBooze);
	};
	AI_UseItemToState	( self, ItFoBooze,0);
	
	self.aivar[AIV_ITEMFREQ]=1;
};

func void B_ChooseWine (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ChooseWine");
				
	self.aivar[AIV_ITEMSTATUS] = TA_IT_WINE;
	
	if (Npc_HasItems (self,ItFoWine) == 0)
	{
		CreateInvItem (self,ItFoWine);
	};
	AI_UseItemToState	( self, ItFoWine,0);
	
	self.aivar[AIV_ITEMFREQ]=1;
};



//------------------------------------------------------------------------------------------

func void B_Pee (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_Pee");
	if (Wld_IsFPAvailable (self, "PEE"))
	{
		AI_StandUp		(self);
		AI_SetWalkmode	(self,	NPC_WALK);
		AI_GotoFP		(self,	"PEE");
		AI_PlayAni		(self,	"T_PEE");
		AI_ContinueRoutine(self);			//MH: Bugfix
	};	
};

func void B_Bored (VAR C_NPC self)
{
	PrintDebugNpc		(PD_TA_DETAIL,	"B_Bored");
	
	var int	choice;
	choice = Hlp_Random(100);
	
	if 		(choice <  20)	{	AI_PlayAni(self,"T_BORINGKICK"		);	}
	else if	(choice <  30)	{	AI_PlayAni(self,"R_SCRATCHLSHOULDER");	}
	else if	(choice <  40)	{	AI_PlayAni(self,"R_SCRATCHRSHOULDER");	}
	else if	(choice <  60)	{	AI_PlayAni(self,"R_SCRATCHEGG"		);	}
	else if	(choice <  80)	{	AI_PlayAni(self,"R_SCRATCHHEAD"		);	}
	else if	(choice < 100)	{	AI_PlayAni(self,"R_LEGSHAKE"		);	};

	AI_Wait				(self,	1);
};

func void B_ResetIterator (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ResetIterator");
	if (self.aivar[AIV_GUARDITERATOR] >= 5000)
	{
		self.aivar[AIV_GUARDITERATOR] = 0;
		self.aivar[AIV_GUARDMEMORY] = 0;
	};
	self.aivar[AIV_GUARDITERATOR] += 1;
};


func void B_ClearItem (VAR C_NPC self)
{
	PrintDebugNpc (PD_TA_DETAIL,	"B_ClearItem");

	if 		(self.aivar[AIV_ITEMSTATUS] == TA_IT_APPLE)	{	AI_UseItemToState(self,	ItFoApple,	-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_LOAF)	{	AI_UseItemToState(self,	ItFoLoaf,	-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_CHEESE){	AI_UseItemToState(self,	ItFoCheese,	-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_BEER)	{	AI_UseItemToState(self, ItFoBeer,	-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_MEAT)	{	AI_UseItemToState(self, ItFoMutton,	-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_SOUP)	{	AI_UseItemToState(self, ItFoSoup,	-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_RICE)	{	AI_UseItemToState(self, ItFoRice,	-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_JOINT)	{	AI_UseItemToState(self, ItMiJoint_1,-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_BOOZE)	{	AI_UseItemToState(self, ItFoBooze,	-1);	}
	else if (self.aivar[AIV_ITEMSTATUS] == TA_IT_WINE)	{	AI_UseItemToState(self, ItFoWine,	-1);	};
	
	self.aivar[AIV_ITEMSTATUS] = TA_IT_NONE;
};


func void B_StartUseMob (var C_NPC slf, var string mobname)
{
    PrintDebugNpc 		(PD_TA_DETAIL,	"B_StartUseMob");

	if !(C_BodyStateContains(slf,BS_MOBINTERACT))
	{
		AI_SetWalkmode 	(slf,NPC_WALK);		
		if ((Hlp_StrCmp(Npc_GetNearestWP(slf),slf.wp)== 0))
		{
			AI_GotoWP	(slf, slf.wp);
		};
		AI_UseMob 		(slf,	mobname,	1);
	};
};

func void B_StopUseMob (var C_NPC slf, var string mobname)
{
    PrintDebugNpc 		(PD_TA_DETAIL,	"B_StopUseMob");
    
   	AI_UseMob			(slf,	mobname,	-1);
};

