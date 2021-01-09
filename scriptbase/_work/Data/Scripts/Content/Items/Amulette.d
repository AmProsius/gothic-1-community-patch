//Amulette +Ringe//

INSTANCE ItMi_Amulet_Psi_01(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	5;

	visual 			=	"ItMi_Amulet_Psi_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;

	description		= "Sign of the Brotherhood";
	//TEXT[0]			= "";
	//TEXT[2]			= "";
	////COUNT[2]		= ;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;

};
/******************************************************************************************/
INSTANCE  Schutzamulett_Feuer(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Feuer;
	on_unequip		=	UnEquip_Schutzamulett_Feuer;

	description		= "Amulet of Flames";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Feuer()
	{
	 	self.protection [PROT_FIRE] += 10;
	};


	FUNC VOID UnEquip_Schutzamulett_Feuer()
	{
		self.protection [PROT_FIRE] -= 10;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Waffen(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Waffen;
	on_unequip		=	UnEquip_Schutzamulett_Waffen;

	description		= "Armor Amulet";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 15;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Waffen()
	{
		self.protection [PROT_EDGE] += 15;
		self.protection [PROT_BLUNT] += 15;
	};


	FUNC VOID UnEquip_Schutzamulett_Waffen()
	{
		self.protection [PROT_EDGE] -= 15;
		self.protection [PROT_BLUNT] -= 15;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Geschosse(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Geschosse;
	on_unequip		=	UnEquip_Schutzamulett_Geschosse;

	description		= "Amulet of Oak Skin";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Point;
	COUNT[2]		= 15;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Geschosse()
	{
		self.protection [PROT_POINT] += 15;
	};


	FUNC VOID UnEquip_Schutzamulett_Geschosse()
	{
		self.protection [PROT_POINT] -= 15;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Magie(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Magie;
	on_unequip		=	UnEquip_Schutzamulett_Magie;

	description		= "Amulet of Spiritual Power";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 8;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Magie()
	{
		self.protection [PROT_MAGIC] += 8;
	};

	FUNC VOID UnEquip_Schutzamulett_Magie()
	{
		self.protection [PROT_MAGIC] -= 8;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Magie_Feuer(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=    1000;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Magie_Feuer;
	on_unequip		=	UnEquip_Schutzamulett_Magie_Feuer;

	description		= "Amulet of Purification";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Fire;
	COUNT[2]		= 10;
	TEXT[3] 		= NAME_Prot_Magic;
	COUNT[3]		= 8;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Magie_Feuer()
	{
		self.protection [PROT_MAGIC] += 8;
		self.protection [PROT_FIRE]  += 10;
	};


	FUNC VOID UnEquip_Schutzamulett_Magie_Feuer()
	{
	self.protection [PROT_MAGIC] -= 8;
	self.protection [PROT_FIRE]  -= 10;

	};

/******************************************************************************************/
		INSTANCE  Schutzamulett_Waffen_Geschosse(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 	=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Waffen_Geschosse;
	on_unequip		=	UnEquip_Schutzamulett_Waffen_Geschosse;

	description		= "Amulet of Stone Skin";
	//TEXT[0]			= "";
	TEXT[2]			= NAME_Prot_Edge;
	COUNT[2]		= 15;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 15;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Waffen_Geschosse()
	{
		self.protection [PROT_EDGE]   += 15;
		self.protection [PROT_BLUNT]  += 15;
		self.protection [PROT_POINT]  += 15;
	};

	FUNC VOID UnEquip_Schutzamulett_Waffen_Geschosse()
	{
		self.protection [PROT_EDGE]   -= 15;
		self.protection [PROT_BLUNT]  -= 15;
		self.protection [PROT_POINT]  -= 15;
	};

/******************************************************************************************/
	INSTANCE  Schutzamulett_Total(C_ITEM)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1600;

	visual 			=	"ItMi_Amulet_03.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Schutzamulett_Total;
	on_unequip		=	UnEquip_Schutzamulett_Total;

	description		= "Amulet of Ore Skin";
	//TEXT[0]			= "";
	TEXT[1]			= NAME_Prot_Fire;
	COUNT[1]		= 10;
	TEXT[2]			= NAME_Prot_Magic;
	COUNT[2]		= 8;
	TEXT[3] 		= NAME_Prot_Point;
	COUNT[3]		= 15;
	TEXT[4]			= NAME_Prot_Edge;
	COUNT[4]		= 15;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Schutzamulett_Total()
	{
		self.protection [PROT_EDGE]   += 15;
		self.protection [PROT_BLUNT]  += 15;
		self.protection [PROT_POINT]  += 15;
		self.protection [PROT_FIRE]   += 10;
		self.protection [PROT_MAGIC]  +=  8;

	};

	FUNC VOID UnEquip_Schutzamulett_Total()
	{
		self.protection [PROT_EDGE]   -= 15;
		self.protection [PROT_BLUNT]  -= 15;
		self.protection [PROT_POINT]  -= 15;
		self.protection [PROT_FIRE]   -= 10;
		self.protection [PROT_MAGIC]  -=  8;
	};

/******************************************************************************************/
	INSTANCE  Gewandtheitsamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	320;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Gewandtheitsamulett;
	on_unequip		=	UnEquip_Gewandtheitsamulett;

	description		= "Amulet of Agility";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Gewandtheitsamulett()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,10);
	};


	FUNC VOID UnEquip_Gewandtheitsamulett()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-10);
	};

/******************************************************************************************/
	INSTANCE  Gewandtheitsamulett2(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	480;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Gewandtheitsamulett2;
	on_unequip		=	UnEquip_Gewandtheitsamulett2;

	description		= "Amulet of Dexterity";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 20;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Gewandtheitsamulett2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,20);
	};

	FUNC VOID UnEquip_Gewandtheitsamulett2()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-20);
	};

/******************************************************************************************/
	INSTANCE  Staerkeamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	320;

	visual 			=	"ItMi_Amulet_01.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Staerkeamulett;
	on_unequip		=	UnEquip_Staerkeamulett;

	description		= "Amulet of Power";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkeamulett()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,10);
	};

	FUNC VOID UnEquip_Staerkeamulett()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-10);
	};

/******************************************************************************************/
	INSTANCE  Staerkeamulett2(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	480;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Staerkeamulett2;
	on_unequip		=	UnEquip_Staerkeamulett2;

	description		= "Amulet of Strength";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Str;
	COUNT[2]		= 20;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Staerkeamulett2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,20);
	};


	FUNC VOID UnEquip_Staerkeamulett2()
	{
		Npc_ChangeAttribute(self,ATR_STRENGTH,-20);
	};

/******************************************************************************************/
	INSTANCE  Lebensamulett(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	720;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Lebensamulett;
	on_unequip		=	UnEquip_Lebensamulett;

	description		= "Amulet of Life Force";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 30;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Lebensamulett()
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 30;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 30;
		
	};


	FUNC VOID UnEquip_Lebensamulett()
	{
		self.attribute [ATR_HITPOINTS_MAX] = self.attribute [ATR_HITPOINTS_MAX] -30;
		if (self.attribute[ATR_HITPOINTS] > 31)
		{
		self.attribute [ATR_HITPOINTS] = self.attribute [ATR_HITPOINTS] -30;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};

/******************************************************************************************/
	INSTANCE  Amulett_der_Magie(C_Item)
{
	name 			=	NAME_Amulett;

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	400;

	visual 			=	"ItMi_Amulet_02.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Magie;
	on_unequip		=	UnEquip_Amulett_der_Magie;

	description		= "Amulet of Magic";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Mana;
	COUNT[2]		= 10;
	//TEXT[3] 		= "";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Magie()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 10;
	};

	FUNC VOID UnEquip_Amulett_der_Magie ()
	{
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 10;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 10;
	};

/******************************************************************************************/
	INSTANCE  Amulett_der_Macht(C_Item)
{
	name 			=	"Amulet of Might";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	600;

	visual 			=	"ItMi_Amulet_03.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Macht;
	on_unequip		=	UnEquip_Amulett_der_Macht;

	description		= "Amulet of Might";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_Dex;
	COUNT[2]		= 7;
	TEXT[3] 		= NAME_Bonus_Str;
	COUNT[3]		= 7;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Macht()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,7 );
		Npc_ChangeAttribute(self,ATR_STRENGTH,7 );
	};


	FUNC VOID UnEquip_Amulett_der_Macht ()
	{
		Npc_ChangeAttribute(self,ATR_DEXTERITY,-7 );
		Npc_ChangeAttribute(self,ATR_STRENGTH,-7 );
	};

/******************************************************************************************/
	INSTANCE  Amulett_der_Erleuchtung(C_Item)
{
	name 			=	"Amulet of Enlightenment";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	1000;

	visual 			=	"ItMi_Amulet_03.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Amulett_der_Erleuchtung;
	on_unequip		=	UnEquip_Amulett_der_Erleuchtung;

	description		= "Amulet of Enlightenment";
	//TEXT[0]			= "";
	//TEXT[1]			= "";
	////COUNT[1]		= ;
	TEXT[2]			= NAME_Bonus_HP;
	COUNT[2]		= 25;
	TEXT[3] 		= NAME_Bonus_Mana;
	COUNT[3]		= 25;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Amulett_der_Erleuchtung()
	{
		self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] + 25;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] + 25;
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] + 25;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] + 25;
		
	};


	FUNC VOID UnEquip_Amulett_der_Erleuchtung ()
	{
		
		self.attribute[ATR_MANA] = self.attribute[ATR_MANA] - 25;
		self.attribute[ATR_MANA_MAX] = self.attribute[ATR_MANA_MAX] - 25;
		self.attribute[ATR_HITPOINTS_MAX] = self.attribute[ATR_HITPOINTS_MAX] - 25;
		
		if (self.attribute[ATR_HITPOINTS] > 26)
		{
			self.attribute[ATR_HITPOINTS] = self.attribute[ATR_HITPOINTS] - 25;
		}
		else
		{
			self.attribute [ATR_HITPOINTS] = 2;
		};
	};

/******************************************************************************************/
/*
// FIXME: was soll das machen? Dämon beschwören???
	INSTANCE  Beschwörungsamulett(C_Item)
{
	name 			=	"Amulett der Erleuchtung";

	mainflag 		=	ITEM_KAT_MAGIC;
	flags 			=	ITEM_AMULET;

	value 			=	300;

	visual 			=	"ItMi_Amulet_03.3ds";

	visual_skin 		=	0;
	material 		=	MAT_METAL;
	on_equip		=	Equip_Beschwörungsamulett;
	on_unequip		=	UnEquip_Beschwörungsamulett;
	description		= "Dämonenbeschwörung";
	TEXT[0]			= "Schwarz wie die Seele";
	TEXT[1]			= "Schwarz wie die Nacht";
	////COUNT[1]		= ;
	TEXT[2]			= "Schwarz wie das Böse";
	////COUNT[2]		= ;
	TEXT[3] 		= "Schwarz verheisst Macht";
	////COUNT[3]		= ;
	//TEXT[4]			= "";
	////COUNT[4]		= ;
	TEXT[5]			= NAME_Value;
	COUNT[5]		= value;
};

	FUNC VOID Equip_Beschwörungsamulett()
	{


	};


	FUNC VOID UnEquip_Beschwörungsamulett ()
	{


	};
	
*/
	
