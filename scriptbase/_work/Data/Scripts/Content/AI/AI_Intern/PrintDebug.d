//########################################################################
//##
//##		PrintDebug-System
//##
//########################################################################

//-------- PrintDebug-Kanäle --------
const int	PD_TA_FRAME 				= 1;
const int	PD_TA_LOOP 					= 2;
const int	PD_TA_CHECK 				= 3;
const int	PD_TA_DETAIL 				= 4;

const int	PD_ZS_FRAME 				= 6;
const int	PD_ZS_LOOP 					= 7;
const int	PD_ZS_CHECK 				= 8;
const int	PD_ZS_DETAIL 				= 9;

const int	PD_MST_FRAME 				= 11;
const int	PD_MST_LOOP 				= 12;
const int	PD_MST_CHECK 				= 13;
const int	PD_MST_DETAIL 				= 14;

const int	PD_ORC_FRAME 				= 16;
const int	PD_ORC_LOOP 				= 17;
const int	PD_ORC_CHECK 				= 18;
const int	PD_ORC_DETAIL 				= 19;

const int	PD_MISSION					= 21;
const int	PD_CUTSCENE					= 22;
const int	PD_SPELL					= 23;
const int	PD_ITEM_MOBSI				= 24;
const int	PD_MAGIC					= 25;

//////////////////////////////////////////////////////////////////////////
//	PrintDebugS
//	-----------
//	Dies ist die alte Print-Funktion der Menschen-AI. Fliegt in der
//	Version raus. Ab sofort nur noch PrintDebugNpc benutzen
//////////////////////////////////////////////////////////////////////////
func void PrintDebugS (var string txt)
{
	PrintDebug 	(self.name);
	PrintDebug	(txt);
};

//////////////////////////////////////////////////////////////////////////
//	PrintDebugNpc
//	-------------
//	Gibt eine Debug-Meldung im zSpy aus. Dabei muß in 'type' ein
//	Debug-Channel und in 'text' der eigentliche Meldungstext übergeben
//	werden.
//	Die Meldung erscheint im Format:
//
//		"U:Skript: ### <NSC-Name> ### -> <Meldung>
//
//	also zum Beispiel
//
//		U:Skript: ### Snapper ### -> ZS_MONSTER_AssessThreat
//
//////////////////////////////////////////////////////////////////////////
func void PrintDebugNpc (var int type, var string text)
{
	var string pipe;
	var int instance_id;
	instance_id		= self.id;
	var string	inst_id;
	inst_id	= IntToString	(instance_id);

	pipe = ConcatStrings("### ",	self.name);
	pipe = ConcatStrings(pipe, "(");
	pipe = ConcatStrings(pipe, inst_id);
	pipe = ConcatStrings(pipe, ")");
	pipe = ConcatStrings(pipe,		" ### -> ");
	pipe = ConcatStrings(pipe,		text);
	
	PrintDebugInstCh(type, pipe);
};


//////////////////////////////////////////////////////////////////////////
//	PrintGlobals
//	------------
//	Gibt die aktuellen Globals auf dem zSpy aus
//////////////////////////////////////////////////////////////////////////
func void PrintGlobals (var int channel)
{
	var string pipe;
	PrintDebugNpc	(channel, "PrintGlobals");
	//-------- global 'self' --------
	if (Hlp_IsValidNpc(self))
	{
		pipe = ConcatStrings("...self:   ",	self.name);
		PrintDebugNpc 		(channel,		pipe);
	};
	
	//-------- global 'other' --------
	if (Hlp_IsValidNpc(other))
	{
		pipe = ConcatStrings("...other:  ",	other.name);
		PrintDebugNpc 		(channel,		pipe);
	};
	
	//-------- global 'victim' --------
	if (Hlp_IsValidNpc(victim))
	{
		pipe = ConcatStrings("...victim: ",	victim.name);
		PrintDebugNpc 		(channel,		pipe);
	};
	
	//-------- global 'hero' --------
	if (Hlp_IsValidNpc(hero))
	{
		pipe = ConcatStrings("...hero:   ",	hero.name);
		PrintDebugNpc 		(channel,		pipe);
	};

	//-------- global 'item' --------
	if (Hlp_IsValidItem(item))
	{
		pipe = ConcatStrings("...item:   ",	item.name);
		PrintDebugNpc 		(channel,		pipe);
	};

};

//////////////////////////////////////////////////////////////////////////
//	PrintGuild
//	----------
//	Gibt den Namen der Angegebenen Gilde auf dem zSpy aus
//////////////////////////////////////////////////////////////////////////
func void PrintGuild (var int channel, var int guild)
{
	PrintDebugNpc	(channel, "PrintGuild");
	
	if (guild ==  GIL_NONE		) { PrintDebugNpc	( channel, "...Gilde: GIL_NONE");};
	if (guild ==  GIL_EBR	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_EBR");};
	if (guild ==  GIL_GRD	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_GRD");};
	if (guild ==  GIL_STT	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_STT");};
	if (guild ==  GIL_KDF	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_KDF");};
	if (guild ==  GIL_VLK	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_VLK");};
	if (guild ==  GIL_KDW	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_KDW");};
	if (guild ==  GIL_SLD	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_SLD");};
	if (guild ==  GIL_ORG	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_ORG");};
	if (guild ==  GIL_BAU	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_BAU");};
	if (guild ==  GIL_SFB	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_SFB");};
	   
	if (guild ==  GIL_GUR	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_GUR");};
	if (guild ==  GIL_NOV	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_NOV");};
	if (guild ==  GIL_TPL	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_TPL");};
	   
	if (guild ==  GIL_DMB	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_DMB");};
	if (guild ==  GIL_BAB	    ) { PrintDebugNpc   ( channel, "...Gilde: GIL_BAB");};
};

//////////////////////////////////////////////////////////////////////////
//	PrintAttitudes
//	--------------
//	Gibt die Attitüden von 'self' auf dem zSpy aus
//////////////////////////////////////////////////////////////////////////
func void PrintAttitudes (var int channel)
{
	PrintDebugNpc	(channel, "PrintAttitudes");

	// Initialisierung der lokalen Hilfsvariablen 
	var int temp_attitude;
	var int perm_attitude;
	
	// Zuweisung der Variablen
	temp_attitude	=	Npc_GetAttitude ( self, hero);
	perm_attitude	=	Npc_GetPermAttitude	( self, hero);
	
	// Check Block auf temporäre Attitüde des Nsc´s
	if (temp_attitude	==	ATT_HOSTILE)
	{
		PrintDebugNpc( channel, "TempAttitude == ATT_HOSTILE");			
	};	
	if (temp_attitude	==	ATT_ANGRY)
	{
		PrintDebugNpc( channel, "TempAttitude == ATT_ANGRY");			
	};
	if (temp_attitude	==	ATT_NEUTRAL)
	{
		PrintDebugNpc( channel, "TempAttitude == ATT_NEUTRAL");			
	};
	if (temp_attitude	==	ATT_FRIENDLY)
	{
		PrintDebugNpc( channel, "TempAttitude == ATT_FRIENDLY");					
	};
	if (perm_attitude == ATT_HOSTILE)
	{
		PrintDebugNpc( channel, "PermAttitude == ATT_HOSTILE");			
	};
	if (perm_attitude == ATT_ANGRY)
	{
		PrintDebugNpc( channel, "PermAttitude == ATT_ANGRY");			
	};
	if (perm_attitude == ATT_NEUTRAL)
	{
		PrintDebugNpc( channel, "PermAttitude == ATT_NEUTRAL");			
	};
	if (perm_attitude == ATT_FRIENDLY)
	{
		PrintDebugNpc( channel, "PermAttitude == ATT_FRIENDLY");			
	};
};
		
//////////////////////////////////////////////////////////////////////////
//	PrintDebugInt
//	-------------
//	Gibt eine INT-Variable 'value' und einen einleitenden Text 'preText'
//	auf dem zSpy (Kanal 'channel') aus.
//////////////////////////////////////////////////////////////////////////
func void PrintDebugInt (var int channel, var string preText, var int value)
{
	var string printText;
	printText	=	IntToString	(value);
	printText = ConcatStrings(preText, printText);
	PrintDebugNpc	(channel,	printText);
};

//////////////////////////////////////////////////////////////////////////
//	PrintDebugString
//	----------------
//	Gibt eine STRING-Variable 'text' und einen einleitenden Text 'preText'
//	auf dem zSpy (Kanal 'channel') aus.
//////////////////////////////////////////////////////////////////////////
func void PrintDebugString (var int channel, var string preText, var string text)
{
	PrintDebugNpc	(channel,	ConcatStrings(preText, text));
};



