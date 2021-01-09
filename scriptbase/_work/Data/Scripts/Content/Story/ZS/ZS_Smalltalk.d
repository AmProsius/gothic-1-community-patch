//////////////////////////////////////////////////////////////////////////
//	ZS_Smalltalk
//	============
//
//	Der NSC bleibt auf seinem Freepoint stehen und sagt gelegentlich
//	einen zuf�llig ausgew�hlten, v�llig belanglosen Satz zu seinem
//	Gespr�chspartner.
//
//  Wenn kein Gespr�chpartner gefunden wird, geht der NSC in ZS_Stand !!!
//////////////////////////////////////////////////////////////////////////
func void ZS_Smalltalk () 
{
    PrintDebugNpc			(PD_TA_FRAME,	"ZS_Smalltalk");
    
	B_SetPerception 		(self);	
	AI_SetWalkmode			(self,	NPC_WALK);
	
    //-------- Grobpositionierung --------
	if (!Npc_IsOnFP(self,"SMALLTALK"))
	{
		PrintDebugNpc		(PD_TA_CHECK,	"...nicht auf FP!");
		AI_GotoWP			(self,	self.wp);						// Gehe zum Tagesablaufstart
	};
    //----------------------------
    AI_GotoFP (self,"SMALLTALK");
    AI_AlignToFP( self );				//Richte Dich aus
};

func void ZS_Smalltalk_Loop()
{
    PrintDebugNpc			(PD_TA_LOOP,	"ZS_Smalltalk_Loop");
	
	Npc_PerceiveAll			(self);
	Wld_DetectNpc(self,	-1, ZS_Smalltalk, -1);
	PrintGlobals(PD_TA_CHECK);
	
	if (Wld_DetectNpc(self,	-1, ZS_Smalltalk, -1) && (Npc_GetDistToNpc	(self, other)<HAI_DIST_SMALLTALK))
	{
	    AI_TurnToNpc(self,other);

// Neue Texte f�r Smalltalk (kurze, gemurmelte, Wortfetzen, die als SVMs vorliegen)

// ...wenn Du meinst...
// ...kann schon sein...
// ...war nicht besonders schlau....
// ...ich halt mich da lieber raus...
// ...das ist ein Problem, aber nicht mein Problem...
// ...war doch klar, da� das �rger gibt...
// ...aber behalt's f�r Dich, mu� nicht gleich jeder wissen...
// ...das passiert mir nicht...
// ...an der Gechichte mu� wohl doch was dran sein...
// ...man mu� eben aufpassen was man rumerz�hlt...
// ...solange ich damit nichts zu tun habe... 
// ...man darf auch nicht alles glauben, was man h�rt...
// ...in seiner Haut will ich trotzdem nicht stecken...
// ...immer wieder die selbe Leier...
// ...manche lernen eben garnichts dazu... 
// ...fr�her w�re das ganz anders gelaufen...
// ...gequatscht wird viel...
// ...ich h�r nicht mehr auf das Gefasel...
// ...verla� Dich auf jemanden und Du bist verlassen, das ist eben so...
// ...ich glaube kaum, da� sich daran was �ndern wird...
// ...wahrscheinlich hast Du recht...
// ...erstmal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird...
// ...ich dachte, das w�re schon lange gekl�rt, aber das ist wohl nicht so...
// ...la� uns �ber lieber �ber was anderes reden...

	    var int talktime;
    	talktime = Hlp_Random (200);
    	if 		(talktime <   5)
    	{
			B_Say		( self, NULL, "$SMALLTALK01");
    	} 
    	else if (talktime <  10)
    	{
			B_Say		( self, NULL, "$SMALLTALK02");
    	}
    	else if (talktime <  15)
    	{
			B_Say		( self, NULL, "$SMALLTALK03");
    	}
    	else if (talktime < 20)
    	{
			B_Say		( self, NULL, "$SMALLTALK04");
    	}
    	else if (talktime < 25)
    	{
			B_Say		( self, NULL, "$SMALLTALK05");
    	}
    	else if (talktime < 30)
    	{
			B_Say		( self, NULL, "$SMALLTALK06");
    	}
    	else if (talktime < 35)
    	{
			B_Say		( self, NULL, "$SMALLTALK07");
    	}
    	else if (talktime < 40)
    	{
			B_Say		( self, NULL, "$SMALLTALK08");
    	}
    	else if (talktime < 45)
    	{
			B_Say		( self, NULL, "$SMALLTALK09");
    	}
    	else if (talktime < 50)
    	{
			B_Say		( self, NULL, "$SMALLTALK10");
    	}
    	else if (talktime < 55)
    	{
			B_Say		( self, NULL, "$SMALLTALK11");
    	}
    	else if (talktime < 60)
    	{
			B_Say		( self, NULL, "$SMALLTALK12");
    	}
    	else if (talktime < 65)
    	{
			B_Say		( self, NULL, "$SMALLTALK13");
    	}
    	else if (talktime < 70)
    	{
			B_Say		( self, NULL, "$SMALLTALK14");
    	}
    	else if (talktime < 75)
    	{
			B_Say		( self, NULL, "$SMALLTALK15");
    	}
    	else if (talktime < 80)
    	{
			B_Say		( self, NULL, "$SMALLTALK16");
    	}
    	else if (talktime < 85)
    	{
			B_Say		( self, NULL, "$SMALLTALK17");
    	}
    	else if (talktime < 90)
    	{
			B_Say		( self, NULL, "$SMALLTALK18");
    	}
    	else if (talktime < 95)
    	{
			B_Say		( self, NULL, "$SMALLTALK19");
    	}
    	else if (talktime < 100)
    	{
			B_Say		( self, NULL, "$SMALLTALK20");
    	}
   		else if (talktime < 105)
    	{
			B_Say		( self, NULL, "$SMALLTALK21");
    	}
    	else if (talktime < 110)
    	{
			B_Say		( self, NULL, "$SMALLTALK22");
    	}
    	else if (talktime < 115)
    	{
			B_Say		( self, NULL, "$SMALLTALK23");
    	}
    	else if (talktime < 120)
    	{
			B_Say		( self, NULL, "$SMALLTALK24");
    	};

// Alte Version mit AI-Outputs
/*	    var int talktime;
    	talktime = Hlp_Random (200);
    	if 		(talktime <   5)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text01");//Und was glaubst Du, wie es war? Es war ein Trauerspiel. Erst platzt dieser Kerl rein, die Waffe gezogen. Stinksauer.
    	} 
    	else if (talktime <  10)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text02");//Und just in dem Moment stolpert er �ber eine Wurzel! Ich hab mich plattgelacht. Sein Gesicht voller Kratzer. Es war herrlich.
    	}
    	else if (talktime <  15)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text03");//Auf einmal greift er in den Topf mit dem Reis und sagt: Ist das Bier wirklich hier drin? Und verbrennt sich die Finger, da� er schreit!
    	}
    	else if (talktime < 20)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text04");//Ich wei� auch nicht, ob das stimmt. Es wird immer so viel geschw�tzt, aber keiner wei� was genaues. Und uns sagt eh keiner was.
    	}
    	else if (talktime < 25)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text05");//Warum sollte er das tun? Er w�rde es sich ganz bestimmt mit ihnen verscherzen. Das wagt er nicht. Das ist ein Feigling.
    	}
    	else if (talktime < 30)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text06");//Ach was! Du glaubst auch alles, was man Dir erz�hlt. F�r wie dumm h�lst Du mich eigentlich? Denk doch mal nach. Daf�r h�tte die Zeit nicht gereicht.
    	}
    	else if (talktime < 35)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text07");//Ist mir eigentlich auch egal. Wen interessierts? Wenn Du Deine Nase nicht reinsteckst, gibt es auch keinen �rger. Und das ist besser so.
    	}
    	else if (talktime < 40)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text08");//Und dann springt er auf einmal in meinen Weg und sagt: Der Gobbo war's! Da hab ich ihm gesagt, er soll sich verpissen. Gobbo. Dem geb ich Gobbo.
    	}
    	else if (talktime < 45)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text09");//Ich hab ihm kein Wort geglaubt. Ein Shadowbeast? Dieser Schw�chling? Im Leben nicht! Vermutlich nur eine mittelschwere Ratte.
    	}
    	else if (talktime < 50)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text10");//Da hab ich ihn gefragt, woher er das wisse. Und wei�t Du was er gesagt hat? Du err�tst es nicht... Aus einem Brief! Der kann doch weder lesen, noch kennt er jemanden, der schreiben kann!
    	}
    	else if (talktime < 55)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text11");//Verdammt noch mal nein. Ich hab's Dir schon tausendmal erkl�rt. Was soll die Fragerei? Langsam mu�t Du's doch mal kapieren. Ich war zu der Zeit in der Mine.
    	}
    	else if (talktime < 60)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text12");//Da gab's dann nur noch ein Problem bei der Sache. Der Kerl stand bei ihr im Schrank und hat alles mit angeh�rt! Der Rest des Abends war gelaufen.
    	}
    	else if (talktime < 65)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text13");//Ich glaube, das Wetter wird wieder besser. Jetzt wo wir bald wieder in die Mine m�ssen. Hervorragend. Damit geh�rt das Bier mir.
    	}
    	else if (talktime < 70)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text14");//Vor Lachen hau ich mir auf's Knie! Du und die Arena, sag ich. Du wei�t ja nicht mal, wo beim Schwert der Griff sitzt.
    	}
    	else if (talktime < 75)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text15");//Kannst Du Dir vorstellen, was da alles lagert? Kein Wunder, da� er niemanden mitnimmt. Das ist alles gut versteckt, sicher.
    	}
    	else if (talktime < 80)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text16");//Ich hab nix gesehen, aber ich hab so ein Gef�hl. Das war er. Es war zwar stockdunkel, aber ich bin sicher. Er war's. Kein Schei�. Ich wei� auch nicht, wie er das angestellt hat.
    	}
    	else if (talktime < 85)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text17");//Da sagt er mir, das sei gar keine Gefahr. Ich solle einfach vorgehen, er w�rde mir den R�cken freihalten. Klar! Ich sag ihm, vergi� es. Du gehst vor.
    	}
    	else if (talktime < 90)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text18");//Pl�tzlich f�llt ihm die Spitzhacke aus der Hand und er l�uft lila an. Ich hau ihm auf den R�cken und wei�t Du, was er verschluckt hat? Erz! Wollt er wohl rausschmuggeln.
    	}
    	else if (talktime < 95)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text19");//Nein, er doch nicht, sagt er entr�stet! Er kennt sich mit Pilzen aus, sagt er. Ich sag danke und verpi� mich. Und was war? Vier Tage lag er da, mehr tot als lebendig.
    	}
    	else if (talktime < 100)
    	{
    		AI_Output (self,NULL,"ZS_SmallTalk_Text20");//Ich frag ihn wo er hinwill. Er sagt, das geht mich einen feuchten Schei�dreck an. Der war auf dem Weg zum Versteck. Wetten? Dem kannste nicht trauen.
    	};
*/

    	AI_Wait					(self,	3);
    	Npc_SetStateTime(self, 0);
    }	
	else if (Npc_GetStateTime(self) >= 5)
	{
	    PrintDebugNpc		(PD_TA_CHECK,	"... kein Gespr�chspartner gefunden!");
	    
	    AI_StartState	(self, ZS_Stand, 1, "");
	};
	
	AI_Wait					(self,	1);
};

func void ZS_Smalltalk_End ()
{
    PrintDebugNpc			(PD_TA_FRAME,	"ZS_Smalltalk_End");
};
