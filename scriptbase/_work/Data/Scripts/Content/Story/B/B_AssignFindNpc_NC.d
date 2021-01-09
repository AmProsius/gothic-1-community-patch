// *************************************************************************
// 									FIND NPC
// *************************************************************************

INSTANCE Info_FindNPC_NC(C_INFO)
{
	nr			= 900;
	condition	= Info_FindNPC_NC_Condition;
	information	= Info_FindNPC_NC_Info;
	permanent	= 1;
	description = "Wo finde ich...";
};                       

FUNC INT Info_FindNPC_NC_Condition()
{
	return 1;
};

FUNC VOID Info_FindNPC_NC_Info()
{
	Info_ClearChoices(Info_FindNPC_NC);
	Info_AddChoice(Info_FindNPC_NC, DIALOG_BACK, Info_FindNPC_NC_BACK);

	VAR C_NPC Cronos;		Cronos = Hlp_GetNpc(KdW_604_Cronos);
	if (Cronos.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_NC, "...einen der Magier?", Info_FindNPC_NC_Mage);
	};
	
	VAR C_NPC Gorn;		Gorn = Hlp_GetNpc(PC_Fighter);
	if (Gorn.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_NC, "...Gorn?", Info_FindNPC_NC_Gorn);
	};

	VAR C_NPC Lares;		Lares = Hlp_GetNpc(Org_801_Lares);
	if (Lares.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_NC, "...Lares?", Info_FindNPC_NC_Lares);
	};
	
	VAR C_NPC Lee;			Lee	= Hlp_GetNpc(Sld_700_Lee);
	if (Lee.aivar[AIV_FINDABLE] == TRUE)
	{
		Info_AddChoice(Info_FindNPC_NC, "...Lee?", Info_FindNPC_NC_Lee);
	};
};

FUNC VOID Info_FindNPC_NC_BACK()
{
	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 			Gorn
// **********************

FUNC VOID Info_FindNPC_NC_Gorn()
{
	AI_Output(other,self,"Info_FindNPC_NC_Gorn_15_00"); //Wo finde ich Gorn?

	VAR C_NPC Gorn;		Gorn = Hlp_GetNpc(PC_Fighter);
	
	if (Npc_GetDistToNpc(self, Gorn) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Gorn);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_06_01"); //Wenn du in die Wohnh�hle kommst, halte dich rechts. Direkt vorne sind ein paar H�tten. In einer davon wohnt er.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_07_01"); //Wenn du in die Wohnh�hle kommst, halte dich rechts. Direkt vorne sind ein paar H�tten. In einer davon wohnt er.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_13_01"); //Wenn du in die Wohnh�hle kommst, halte dich rechts. Direkt vorne sind ein paar H�tten. In einer davon wohnt er.
			};
		}
		else if (self.guild == GIL_SLD) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_08_01"); //Wenn du in die Wohnh�hle kommst, halte dich rechts. Direkt vorne sind ein paar H�tten. In einer davon wohnt er.
			}
			else if (self.voice == 11)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Gorn_11_01"); //Wenn du in die Wohnh�hle kommst, halte dich rechts. Direkt vorne sind ein paar H�tten. In einer davon wohnt er.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 			Lares
// **********************

FUNC VOID Info_FindNPC_NC_Lares()
{
	AI_Output(other,self,"Info_FindNPC_NC_Lares_15_00"); //Wo finde ich Lares?

	VAR C_NPC Lares;		Lares = Hlp_GetNpc(Org_801_Lares);
	
	if (Npc_GetDistToNpc(self, Lares) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Lares);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_06_01"); //In der Wohnh�hle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_07_01"); //In der Wohnh�hle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_13_01"); //In der Wohnh�hle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
			};
		}
		else if (self.guild == GIL_SLD) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_08_01"); //In der Wohnh�hle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
			}
			else if (self.voice == 11)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lares_11_01"); //In der Wohnh�hle ganz hinten links. Du kannst es nicht verfehlen, sobald dich seine Jungs aufhalten bist du richtig.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 		Lee
// **********************

FUNC VOID Info_FindNPC_NC_Lee()
{
	AI_Output(other,self,"Info_FindNPC_NC_Lee_15_00"); //Wo finde ich Lee?

	VAR C_NPC Lee;		Lee = Hlp_GetNpc(Sld_700_Lee);
	
	if (Npc_GetDistToNpc(self, Lee) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Lee);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_06_01"); //Wenn du die gro�e Wohnh�hle betrittst, halte dich rechts und geh ganz nach oben.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_07_01"); //Wenn du die gro�e Wohnh�hle betrittst, halte dich rechts und geh ganz nach oben.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_13_01"); //Wenn du die gro�e Wohnh�hle betrittst, halte dich rechts und geh ganz nach oben.
			};
		}
		else if (self.guild == GIL_SLD) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_08_01"); //Wenn du die gro�e Wohnh�hle betrittst, halte dich rechts und geh ganz nach oben.
			}
			else if (self.voice == 11)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Lee_11_01"); //Wenn du die gro�e Wohnh�hle betrittst, halte dich rechts und geh ganz nach oben.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};

// **********************
// 		Magier (Cronos)
// **********************

FUNC VOID Info_FindNPC_NC_Mage()
{
	AI_Output(other,self,"Info_FindNPC_NC_Cronos_15_00"); //Wo finde ich einen der Magier?

	VAR C_NPC Cronos;		Cronos = Hlp_GetNpc(KdW_604_Cronos);
	
	if (Npc_GetDistToNpc(self, Cronos) < PERC_DIST_INTERMEDIAT)
	{
		B_PointAtNpc(self,other,Cronos);
	}
	else
	{
		if (self.guild == GIL_ORG)
		{
			if (self.voice == 6)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_06_01"); //Normalerweise leben sie zur�ckgezogen im oberen Teil der H�hle. Aber am Erzhaufen, in der Mitte der H�hle, kannst du manchmal einen von ihnen treffen.
			}
			else if (self.voice == 7)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_07_01"); //Normalerweise leben sie zur�ckgezogen im oberen Teil der H�hle. Aber am Erzhaufen, in der Mitte der H�hle, kannst du manchmal einen von ihnen treffen.
			}
			else if (self.voice == 13)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_13_01"); //Normalerweise leben sie zur�ckgezogen im oberen Teil der H�hle. Aber am Erzhaufen, in der Mitte der H�hle, kannst du manchmal einen von ihnen treffen.
			};
		}
		else if (self.guild == GIL_SLD) 
		{
			if (self.voice == 8)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_08_01"); //Normalerweise leben sie zur�ckgezogen im oberen Teil der H�hle. Aber am Erzhaufen, in der Mitte der H�hle, kannst du manchmal einen von ihnen treffen.
			}
			else if (self.voice == 11)
			{
				AI_Output(self,other,"Info_FindNPC_NC_Cronos_11_01"); //Normalerweise leben sie zur�ckgezogen im oberen Teil der H�hle. Aber am Erzhaufen, in der Mitte der H�hle, kannst du manchmal einen von ihnen treffen.
			};
		};
	};

	Info_ClearChoices(Info_FindNPC_NC);
};




// *************************************************************************
// 									ZUWEISUNG
// *************************************************************************

FUNC VOID B_AssignFindNpc_NC (VAR C_NPC slf)
{
	Info_FindNPC_NC.npc = Hlp_GetInstanceID(slf);
};
