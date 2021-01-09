// *************************************************************************
// 									FIND NPC
// *************************************************************************

INSTANCE Info_FindNPC_OC(C_INFO)
{
	nr			= 900;
	condition	= Info_FindNPC_OC_Condition;
	information	= Info_FindNPC_OC_Info;
	permanent	= 1;
	description = "Wo finde ich...";
};                       

FUNC INT Info_FindNPC_OC_Condition()
{
	return 1;
};

FUNC VOID Info_FindNPC_OC_Info()
{
	Info_ClearChoices(Info_FindNPC_OC);
	Info_AddChoice(Info_FindNPC_OC, DIALOG_BACK, Info_FindNPC_OC_BACK);

	VAR C_NPC Diego;		Diego	= Hlp_GetNpc(PC_THIEF);
	if (Diego.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_OC, "...Diego?", Info_FindNPC_OC_Diego);
	};
	
	VAR C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	if (Thorus.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_OC, "...Thorus?", Info_FindNPC_OC_Thorus);
	};
};

FUNC VOID Info_FindNPC_OC_BACK()
{
	Info_ClearChoices(Info_FindNPC_OC);
};

// **********************
// 			Diego
// **********************

FUNC VOID Info_FindNPC_OC_Diego()
{
	AI_Output(other,self,"Info_FindNPC_Diego_15_00"); //Wo finde ich Diego?

	VAR C_NPC Diego;		Diego	= Hlp_GetNpc(PC_THIEF);
	
	if (Npc_GetDistToNpc(self, Diego) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Diego);
	}
	else
	{
		if (self.guild == GIL_VLK)
		{
			if (self.voice == 1)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_01_01"); //Tags�ber steht er gew�hnlich bei Thorus am Eingang zur Burg.
			}
			else if (self.voice == 2)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_02_01"); //Tags�ber steht er f�r gew�hnlich bei Thorus am Eingang zur Burg.
			}
			else if (self.voice == 3)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_03_01"); //Tags�ber steht er f�r gew�hnlich bei Thorus am Eingang zur Burg.
			}
			else if (self.voice == 4)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_04_01"); //Tags�ber steht er f�r gew�hnlich bei Thorus am Eingang zur Burg.
			};
		}
		else if (self.guild == GIL_GRD) 
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_06_01"); //Tags�ber steht er f�r gew�hnlich bei Thorus am Eingang zur Burg.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_07_01"); //Tags�ber steht er f�r gew�hnlich bei Thorus am Eingang zur Burg.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_13_01"); //Tags�ber steht er f�r gew�hnlich bei Thorus am Eingang zur Burg.
			};
		}
		else if (self.guild == GIL_STT) 
		{
			if (self.voice == 10)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_10_01"); //Tags�ber steht er f�r gew�hnlich bei Thorus am Eingang der Burg.
			}
			else if (self.voice == 12)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Diego_12_01"); //Tags�ber steht er f�r gew�hnlich bei Thorus am Eingang zur Burg.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_OC);
};

// **********************
// 			Thorus
// **********************

FUNC VOID Info_FindNPC_OC_Thorus()
{
	AI_Output(other,self,"Info_FindNPC_OC_Thorus_15_00"); //Wo finde ich Thorus?
	
	VAR C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	
	if (Npc_GetDistToNpc(self, Thorus) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Thorus);
	}
	else
	{
		if (self.guild == GIL_VLK)
		{
			if (self.voice == 1)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_01_01"); //Er steht gew�hnlich am Eingang zur Burg.
			}
			else if (self.voice == 2)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_02_01"); //Er steht f�r gew�hnlich am Eingang zur Burg.
			}
			else if (self.voice == 3)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_03_01"); //Er steht f�r gew�hnlich am Eingang zur Burg.
			}
			else if (self.voice == 4)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_04_01"); //Er steht f�r gew�hnlich am Eingang zur Burg.
			};
		}
		else if (self.guild == GIL_GRD) 
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_06_01"); //Er steht f�r gew�hnlich am Eingang zur Burg.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_07_01"); //Er steht f�r gew�hnlich am Eingang zur Burg.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_13_01"); //Er steht f�r gew�hnlich am Eingang zur Burg.
			};
		}
		else if (self.guild == GIL_STT) 
		{
			if (self.voice == 10)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_10_01"); //Er steht f�r gew�hnlich am Eingang zur Burg.
			}
			else if (self.voice == 12)
			{
				AI_Output(self,other,"Info_FindNPC_OC_Thorus_12_01"); //Er steht f�r gew�hnlich am Eingang zur Burg.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_OC);
};

// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

FUNC VOID B_AssignFindNpc_OC (VAR C_NPC slf)
{
	Info_FindNPC_OC.npc = Hlp_GetInstanceID(slf);
};
