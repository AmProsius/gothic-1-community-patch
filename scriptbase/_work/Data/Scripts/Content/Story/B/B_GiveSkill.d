func int B_GiveSkill(var C_NPC typ, var int TAL, var int NEW_Wert, var int LP_Cost) //return 1
{
	// ---------- Umwandeln von var in const
	var int TAL_Wert; 
	if 		(TAL == NPC_TALENT_1H)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_1H		);	}
	else if (TAL == NPC_TALENT_2H)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_2H		);	}
	else if (TAL == NPC_TALENT_BOW)			{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_BOW		);	}
	else if (TAL == NPC_TALENT_CROSSBOW)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_CROSSBOW	);	}
	else if (TAL == NPC_TALENT_PICKLOCK)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKLOCK	);	}
	else if (TAL == NPC_TALENT_PICKPOCKET)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_PICKPOCKET);	}
	else if (TAL == NPC_TALENT_MAGE)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_MAGE		);	}
	else if (TAL == NPC_TALENT_SNEAK)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_SNEAK		);	}
	else if (TAL == NPC_TALENT_REGENERATE)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_REGENERATE);	}
	else if (TAL == NPC_TALENT_FIREMASTER)	{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_FIREMASTER);	}
	else if (TAL == NPC_TALENT_ACROBAT)		{	TAL_Wert = Npc_GetTalentSkill(typ, NPC_TALENT_ACROBAT	);	};

	// ----------- Bedingungen/LP checken, dann ggf. vergeben
	if ((TAL_Wert+1) == NEW_Wert)
	{	
		if (typ.lp >= LP_cost)
		{
			typ.lp = typ.lp - LP_cost;
			
			if (tal == NPC_TALENT_1H)			
			{	
				Npc_SetTalentSkill(typ, NPC_TALENT_1H, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_1H, Npc_GetTalentValue(typ, NPC_TALENT_1H)+5);
				PrintScreen	("Lerne: Kampf mit Einhandwaffen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_2H)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_2H, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_2H, Npc_GetTalentValue(typ, NPC_TALENT_2H)+5);
				PrintScreen	("Lerne: Kampf mit Zweihandwaffen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_BOW)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_BOW, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_BOW, Npc_GetTalentValue(typ, NPC_TALENT_BOW)+15);
				PrintScreen	("Lerne: Bogenschie�en", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_CROSSBOW)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_CROSSBOW, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_CROSSBOW, Npc_GetTalentValue(typ, NPC_TALENT_CROSSBOW)+20);
				PrintScreen	("Lerne: Armbrustschie�en", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_PICKLOCK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_PICKLOCK, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_PICKLOCK, Npc_GetTalentValue(typ, NPC_TALENT_PICKLOCK)-40);
				PrintScreen	("Lerne: Schl�sser knacken", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_PICKPOCKET)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_PICKPOCKET, NEW_Wert);
				Npc_SetTalentValue(typ, NPC_TALENT_PICKPOCKET, Npc_GetTalentValue(typ, NPC_TALENT_PICKPOCKET)-40);
				PrintScreen	("Lerne: Taschendiebstahl", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_MAGE)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_MAGE, NEW_Wert);
				PrintScreen	("Lerne: N�chster Kreis der Magie", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_SNEAK)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_SNEAK, NEW_Wert);
				PrintScreen	("Lerne: Schleichen", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_REGENERATE)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_REGENERATE, NEW_Wert);
				PrintScreen	("Steigere Regenerationsrate", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_FIREMASTER)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_FIREMASTER, NEW_Wert);
				PrintScreen	("Lerne: Meister des Feuers", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else if (tal == NPC_TALENT_ACROBAT)
			{
				Npc_SetTalentSkill(typ, NPC_TALENT_ACROBAT, NEW_Wert);
				PrintScreen	("Lerne: Akrobatik", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				return 1;
			}
			else
			{
				return 0;
			};
		}
		else 
		{
			PrintScreen	("Zu wenig Lernpunkte!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			B_Say (self, other, "$NOLEARNNOPOINTS");
			return 0;
		};
	}
	else // NICHT eine Stufe davor
	{	
		if (TAL_Wert >= NEW_Wert)
		{
			B_Say (self, other, "$NOLEARNYOUREBETTER"); //Du bist jetzt schon besser!
			return 0;
		}
		else if ((TAL_Wert+1) < NEW_Wert) //d.h. i.d.R. TAL_Wert=2 und NEW_Wert=0, au�er bei TALENT_MAGE
		{
			B_Say (self, other, "$NOLEARNYOUALREADYKNOW"); //Du mu�t erst Fortgeschritten sein, bevor du ein Meister werden kannst!
			return 0;
		};
	};	
};	
	
	

	
	
	


		
	
	
	

	
	
	
	
	

	
	
	

