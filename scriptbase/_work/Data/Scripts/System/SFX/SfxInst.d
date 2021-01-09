
// SFXINST.D
// Soundsystem related SFX-Instances


//------------------------------------------------------------------------------------------------
// Hier müssen die einzelnen Sounds eingetragen werden
//------------------------------------------------------------------------------------------------
//	 	 Logischer Name					   Dateiname		   Parameter


//////////////////////
//     TEST         //
//////////////////////
// soundtestlevel   //
//////////////////////

/* TestAMB   */	
				INSTANCE Test1		    				(C_SFX_DEF) {file= "test1.wav";						vol = 127;			};
		
/* Test3D    */	
				INSTANCE Test2		    				(C_SFX_DEF) {file= "test2.wav";						vol = 127;			};

/* Special	 */
				INSTANCE LevelUp						(C_SFX_DEF) {file= "levelup.wav";					vol = 55;			};
				INSTANCE LogEntry						(C_SFX_DEF) {file= "LogEntry.wav";					vol = 80;			};
				INSTANCE FoundRiddlersBook				(C_SFX_DEF) {file= "Info_CorKalom_BringBook_Success_15_01.wav";	vol = 80;		};//Björn
				INSTANCE FoundRiddler					(C_SFX_DEF) {file= "theriddle_tot_15_01.wav";					vol = 80;		};//Björn

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// CUTSCENES /////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/* InExtremo */
				INSTANCE CS_Inextremo	    			(C_SFX_DEF) {file= "CS_Inextremo.wav";				vol = 127;			};
				INSTANCE CS_Inextremo_wave  			(C_SFX_DEF) {file= "CS_Inextremo_wave.wav";			vol = 127;			};
 


/* Final Pr. 
				INSTANCE CS_Prayer_FokusAmbient			(C_SFX_DEF) {file= "CS_Prayer_FokusAmbient.wav";	vol = 127;			};
				INSTANCE CS_Prayer_FokusPrepare			(C_SFX_DEF) {file= "CS_Prayer_FokusPrepare.wav";	vol = 127;			};
				INSTANCE CS_Prayer_FokusFinal			(C_SFX_DEF) {file= "CS_Prayer_FokusFinal.wav";		vol = 127;			};
				INSTANCE CS_Prayer_WaveOfInsanity		(C_SFX_DEF) {file= "CS_Prayer_WaveInsanity.wav";	vol = 127;			};
				INSTANCE CS_Prayer_EarthQuake			(C_SFX_DEF) {file= "CS_Prayer_EarthQuake.wav";		vol = 127;			};
				INSTANCE CS_Prayer_BodyFall				(C_SFX_DEF) {file= "CS_Prayer_BodyFall.wav";		vol = 90;			};
				INSTANCE CS_Prayer_BodyKnee				(C_SFX_DEF) {file= "CS_Prayer_BodyKnee.wav";		vol = 90;			};
				INSTANCE CS_Prayer_OrcVision			(C_SFX_DEF) {file= "CS_Prayer_OrcVision.wav";		vol = 127;			};
				INSTANCE CS_Prayer_MineCollide1			(C_SFX_DEF) {file= "Prayer_MineCollide01.wav";		vol = 127;			};
				INSTANCE CS_Prayer_MineCollide2			(C_SFX_DEF) {file= "Prayer_MineCollide02.wav";		vol = 127;			}; */

/* Intro 
				INSTANCE INTRO_SPLASH 					(C_SFX_DEF) {file= "CS_Intro_Watersplash.wav"; 		vol = 127;		 	};  */

                                                
                                                
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// MAGIE /////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


// -----------------------------------
// - BARRIERE: -----------------------
// -----------------------------------

/* Barriere */	INSTANCE MFX_Barriere_Ambient			(C_SFX_DEF) {file= "MFX_Barriere_Ambient.wav";		vol = 127;			};

// -----------------------------------
// - SPELLS: -------------------------
// -----------------------------------

/* Berzerk */	INSTANCE MFX_Berzerk_Cast				(C_SFX_DEF) {file= "MFX_Berzerk_Cast.wav";			vol = 127;			};

/* Berzerk */	INSTANCE MFX_BreathOfDeath_Invest		(C_SFX_DEF) {file= "MFX_BreathOfDeath_Invest.wav";	vol = 127;			};
				INSTANCE MFX_BreathOfDeath_Cast			(C_SFX_DEF) {file= "MFX_BreathOfDeath_Cast.wav";	vol = 127;			};
				INSTANCE MFX_BreathOfDeath_Target		(C_SFX_DEF) {file= "MFX_BreathOfDeath_Target.wav";	vol = 127;			};

/* Charm */		INSTANCE MFX_Charm_Cast					(C_SFX_DEF) {file= "MFX_Charm_Cast.wav";			vol = 127;			};

/* Control */	INSTANCE MFX_Control_StartInvest		(C_SFX_DEF) {file= "MFX_Telekinesis_Cast.wav";		vol = 127;			};      
				INSTANCE MFX_Control_Invest				(C_SFX_DEF) {file= "MFX_Telekinesis_Bridge.wav";	vol = 127;	loop=1;	};      
				INSTANCE MFX_Control_Cast				(C_SFX_DEF) {file= "MFX_Control_Cast.wav";			vol = 127;			};      

/* Destr.UD */	INSTANCE MFX_DestroyUndead_Cast			(C_SFX_DEF) {file= "MFX_DestroyUndead_Cast.wav";	vol = 127;			};
				INSTANCE MFX_DestroyUndead_Collide		(C_SFX_DEF) {file= "MFX_DestroyUndead_Collide.wav";	vol = 127;			};

/* EarthQuake*/	INSTANCE MFX_EarthQuake					(C_SFX_DEF) {file= "EarthQuake.wav";				vol = 127;			};

/* Fear */		INSTANCE MFX_Fear_Cast					(C_SFX_DEF) {file= "MFX_Fear_Cast.wav";				vol = 127;			};

/* Fireball */	INSTANCE MFX_Fireball_Cast				(C_SFX_DEF) {file= "MFX_Fireball_Cast.wav";			vol = 80;			};  
				INSTANCE MFX_Fireball_Collide1	        (C_SFX_DEF) {file= "MFX_Fireball_Collide1.wav";		vol = 90;			};  
				INSTANCE MFX_Fireball_Collide2	        (C_SFX_DEF) {file= "MFX_Fireball_Collide2.wav";		vol = 105;			};      
				INSTANCE MFX_Fireball_Collide3	        (C_SFX_DEF) {file= "MFX_Fireball_Collide3.wav";		vol = 127;			};      
				INSTANCE MFX_Fireball_Collide4			(C_SFX_DEF) {file= "MFX_Fireball_Collide4.wav";		vol = 127;			};		
				INSTANCE MFX_Fireball_Invest1	        (C_SFX_DEF) {file= "MFX_Fireball_Invest1.wav";		vol = 60;			};  
				INSTANCE MFX_Fireball_Invest2	        (C_SFX_DEF) {file= "MFX_Fireball_Invest2.wav";		vol = 80;			};  
				INSTANCE MFX_Fireball_Invest3	        (C_SFX_DEF) {file= "MFX_Fireball_Invest3.wav";		vol = 100;			};      
				INSTANCE MFX_Fireball_Invest4	        (C_SFX_DEF) {file= "MFX_Fireball_Invest4.wav";		vol = 120;			};      
                                                                                                                                    
/* Firestorm*/	INSTANCE MFX_Firestorm_Invest	        (C_SFX_DEF) {file= "MFX_Pyrokinesis_Target.wav";	vol = 60;	loop=1;	};  
				INSTANCE MFX_Firestorm_Cast		        (C_SFX_DEF) {file= "MFX_Firestorm_Cast.wav";		vol = 127;			};      
				INSTANCE MFX_Firestorm_Collide	        (C_SFX_DEF) {file= "MFX_Firestorm_Collide.wav";		vol = 127;			};      
                                                                                                                                    
/* Firerain */	INSTANCE MFX_Firerain_Invest	        (C_SFX_DEF) {file= "MFX_Firerain_Invest.wav";		vol = 127;			};      
				INSTANCE MFX_Firerain_Rain		        (C_SFX_DEF) {file= "MFX_Firerain_Rain.wav";			vol = 127;			};      
				INSTANCE MFX_Firespell_Humanburn        (C_SFX_DEF) {file= "MFX_Firespell_Humanburn.wav";	vol = 127;			};      
                                                                                                                                    
/* Heal */		INSTANCE MFX_Heal_Cast			        (C_SFX_DEF) {file= "MFX_Heal_Cast.wav";				vol = 127;			};      
                                                                                                                                    
/* Icecube */	INSTANCE MFX_Icecube_Cast		        (C_SFX_DEF) {file= "MFX_Icecube_Cast.wav";			vol = 127;			};      
				INSTANCE MFX_Icecube_Invest				(C_SFX_DEF) {file= "MFX_Icecube_Invest.wav";		vol = 127; 	loop=1;	};      
				INSTANCE MFX_Icecube_Target		        (C_SFX_DEF) {file= "MFX_Icecube_Target.wav";		vol = 127;			};      
				INSTANCE MFX_Icecube_Collide		    (C_SFX_DEF) {file= "MFX_Icecube_Release.wav";		vol = 127;			};      
				                                                                                                                    
/* Icewave */	INSTANCE MFX_Icewave_Cast		        (C_SFX_DEF) {file= "MFX_Icewave_Cast.wav";			vol = 127;			};      
                                                                                                                                    
/* Light	*/	INSTANCE MFX_Light_Cast			        (C_SFX_DEF) {file= "MFX_Light_Cast.wav";			vol = 127;			};      
                                                                                                                                    
/* Lightning */	INSTANCE MFX_Lightning_Origin	        (C_SFX_DEF) {file= "MFX_Lightning_Origin.wav";		vol = 50;			};      
				INSTANCE MFX_Lightning_Target	        (C_SFX_DEF) {file= "MFX_Lightning_Target.wav";		vol = 127; 	loop=1; };   
                                                                                                                            	        
/* Massdeath */	INSTANCE MFX_Massdeath_Cast		        (C_SFX_DEF) {file= "MFX_Massdeath_Cast.wav";		vol = 127;			};      
				INSTANCE MFX_Massdeath_Target	        (C_SFX_DEF) {file= "MFX_Massdeath_Target.wav";		vol = 127;			};      
                                                                                                                                    
/* Pyrokinesis*/INSTANCE MFX_Pyrokinesis_Target	        (C_SFX_DEF) {file= "MFX_Pyrokinesis_Target.wav";	vol = 127; 	loop=1; };   
                                                                                                                                    
/* Shrink */	INSTANCE MFX_Shrink_Invest	        	(C_SFX_DEF) {file= "MFX_Shrink_Invest.wav";			vol = 127;	loop=1;	};      
				INSTANCE MFX_Shrink_Cast	        	(C_SFX_DEF) {file= "MFX_Shrink_Cast.wav";			vol = 127;			};      

/* Sleep */		INSTANCE MFX_Sleep_Cast			        (C_SFX_DEF) {file= "MFX_Sleep_Cast.wav";			vol = 127;			};      

/* Spawn */		INSTANCE MFX_Spawn_Cast			        (C_SFX_DEF) {file= "MFX_Spawn_Cast.wav";			vol = 127;			};      
                                                                                                                                    
/* Stormfist */	INSTANCE MFX_Stormfist_Cast		        (C_SFX_DEF) {file= "MFX_Stormfist_Cast.wav";		vol = 127;			};      
                                                                                                                                    
/* Telekinese*/	INSTANCE MFX_Telekinesis_StartInvest	(C_SFX_DEF) {file= "MFX_Telekinesis_Cast.wav";		vol = 127;			};      
				INSTANCE MFX_Telekinesis_Invest			(C_SFX_DEF) {file= "MFX_Telekinesis_Bridge.wav";	vol = 127;	loop=1;	};      

/* Teleport */	INSTANCE MFX_Teleport_Invest	        (C_SFX_DEF) {file= "MFX_Teleport_Invest.wav";		vol = 127;			};      
				INSTANCE MFX_Teleport_Cast		        (C_SFX_DEF) {file= "MFX_Teleport_Cast.wav";			vol = 127;			};      
				                                                                                                                    
/* Thunderball*/INSTANCE MFX_Thunderball_Cast	        (C_SFX_DEF) {file= "MFX_Thunderball_Cast.wav";		vol = 127;			};      
				INSTANCE MFX_Thunderball_Invest1        (C_SFX_DEF) {file= "MFX_Thunderball_Invest.wav";	vol = 60;			};      
				INSTANCE MFX_Thunderball_Invest2        (C_SFX_DEF) {file= "MFX_Thunderball_Invest.wav";	vol = 80;			};      
				INSTANCE MFX_Thunderball_Invest3        (C_SFX_DEF) {file= "MFX_Thunderball_Invest.wav";	vol = 100;			};      
				INSTANCE MFX_Thunderball_Invest4        (C_SFX_DEF) {file= "MFX_Thunderball_Invest.wav";	vol = 127;			};      
				INSTANCE MFX_Thunderball_Collide        (C_SFX_DEF) {file= "MFX_Thunderball_Collide.wav";	vol = 60;			};      
				INSTANCE MFX_Thunderball_Collide1       (C_SFX_DEF) {file= "MFX_Thunderball_Collide1.wav";	vol = 60;			};      
				INSTANCE MFX_Thunderball_Collide2       (C_SFX_DEF) {file= "MFX_Thunderball_Collide2.wav";	vol = 80;			};      
				INSTANCE MFX_Thunderball_Collide3       (C_SFX_DEF) {file= "MFX_Thunderball_Collide3.wav";	vol = 100;			};      
				INSTANCE MFX_Thunderball_Collide4       (C_SFX_DEF) {file= "MFX_Thunderball_Collide4.wav";	vol = 127;			};      

/* Thunderbolt*/INSTANCE MFX_Thunderbolt_Cast	        (C_SFX_DEF) {file= "MFX_Thunderbolt_cast.wav";		vol = 127;			};      
                                                                                                                                    
/* Transform*/	INSTANCE MFX_Transform_Invest	        (C_SFX_DEF) {file= "MFX_Transform_Invest.wav";		vol = 127;			};      
				INSTANCE MFX_Transform_Cast		        (C_SFX_DEF) {file= "MFX_Transform_Cast.wav";		vol = 127;			};      
                                                                                                                                    
/* Windfist */	INSTANCE MFX_Windfist_Cast		        (C_SFX_DEF) {file= "MFX_Windfist_Cast.wav";			vol = 127;			};      
				INSTANCE MFX_Windfist_Invest            (C_SFX_DEF) {file= "MFX_Windfist_Loop.wav";			vol = 50;	loop=1;	};
				INSTANCE MFX_Windfist_Investblast       (C_SFX_DEF) {file= "MFX_Windfist_Investblast.wav";	vol = 127;			};      


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// ITEM - INTERAKTION ////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/* Carve */	
				INSTANCE Carve 							(C_SFX_DEF) {file= "carve01.wav";					vol = 100;			};
				INSTANCE Carve_A1						(C_SFX_DEF) {file= "carve02.wav";					vol = 100;			};
		
/* Drink */
				INSTANCE DrinkBottle 					(C_SFX_DEF) {file= "drink_potion.wav";				vol = 15;			};
				INSTANCE ReleaseCork					(C_SFX_DEF) {file= "releasecork.wav";				vol = 10;			};
		
/* Eat */		
				INSTANCE Eat_Apple						(C_SFX_DEF) {file= "eat_apple.wav";					vol = 5;			};
				INSTANCE Eat_Meat						(C_SFX_DEF) {file= "eat_meat.wav";					vol = 5;			};
				INSTANCE EAT_BREAD						(C_SFX_DEF) {file= "eat_bread.wav";					vol = 5;			};
				INSTANCE EAT_SOUP						(C_SFX_DEF) {file= "eat_soup.wav";					vol = 5;			};
		
/* Instrum. */	
				INSTANCE Inst_Conga01					(C_SFX_DEF) {file= "Conga_01.wav";					vol = 65;			};
				INSTANCE Inst_Conga02					(C_SFX_DEF) {file= "conga_02.wav";					vol = 65;			};
				INSTANCE Inst_Lute						(C_SFX_DEF) {file= "lute_01.wav";					vol = 20;			};
				INSTANCE Inst_Lute_A1					(C_SFX_DEF) {file= "lute_02.wav";					vol = 25;			};
				INSTANCE Inst_Lute_A2					(C_SFX_DEF) {file= "lute_03.wav";					vol = 30;			};
				INSTANCE Inst_Lute_A3					(C_SFX_DEF) {file= "lute_04.wav";					vol = 25;			};
				INSTANCE Inst_Lute_A4					(C_SFX_DEF) {file= "lute_05.wav";					vol = 20;			};
				INSTANCE Inst_Lute_A5					(C_SFX_DEF) {file= "lute_06.wav";					vol = 25;			};
				INSTANCE Inst_Lute_A6					(C_SFX_DEF) {file= "lute_07.wav";					vol = 30;			};
				INSTANCE Inst_Alarm						(C_SFX_DEF) {file= "trumpet_01.wav";				vol = 120;			};
		
/* Paper */	
				INSTANCE Map_Unfold						(C_SFX_DEF) {file= "Paperhandle.wav";				vol = 60;			};
				INSTANCE Scroll_Unfold					(C_SFX_DEF) {file= "ScrollRoll.wav";				vol = 60;			};
		
/* Misc  */
				INSTANCE SMOKE_JOINT					(C_SFX_DEF) {file= "smoke_joint.wav";				vol = 20;			};
				INSTANCE SPIT_FIRE						(C_SFX_DEF) {file= "spit_fire.wav";					vol = 40;			};
		
 		
		
		

// Obsolete ?!? :
// INSTANCE Play_Lute		(C_SFX_DEF) {file= "Lute_1.wav"; 	vol = 127;		};
// INSTANCE Play_Lute_A1	(C_SFX_DEF) {file= "Lute_2.wav";	vol = 127;		};
// INSTANCE Play_Lute_A2	(C_SFX_DEF) {file= "Lute_3.wav";        vol = 127;		};




//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// MOB - INTERAKTION /////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

		
/* Backpack */	
				INSTANCE Backpack_Handle   				(C_SFX_DEF) {file= "Backpack_handle.wav";			vol = 70;			};
				INSTANCE BACKPACK_APPLY					(C_SFX_DEF) {file= "backpack_apply.wav";			vol = 90;			};
		
/* Bellows  */	
				INSTANCE Bellows_In   					(C_SFX_DEF) {file= "bellows_in.wav";				vol = 100;			};
				INSTANCE Bellows_Out   					(C_SFX_DEF) {file= "bellows_out.wav";				vol = 100;			};

/* Book */	
				INSTANCE Book_nextpage   				(C_SFX_DEF) {file= "Book_turnpage2.wav";			vol = 50;			};
				INSTANCE Book_previouspage   			(C_SFX_DEF) {file= "Book_turnpage1.wav";			vol = 50;			};

/* Chest */
				INSTANCE Chest_open						(C_SFX_DEF) {file= "Door_open01.wav";				vol = 50;			};
				INSTANCE Chest_close					(C_SFX_DEF) {file= "Door_close01b.wav";				vol = 40;			};
				INSTANCE Chest_unlock					(C_SFX_DEF) {file= "Door_unlock.wav";				vol = 50;			};
				INSTANCE Chest_try						(C_SFX_DEF) {file= "Door_try.wav";					vol = 50;			};

/* Column */
				INSTANCE Pillar_Move					(C_SFX_DEF) {file= "columnmove.wav";				vol = 120;			};
				INSTANCE Pillar_Crash					(C_SFX_DEF) {file= "columncrash.wav";				vol = 120;			};

/* Door */
				INSTANCE Door_open						(C_SFX_DEF) {file= "Door_open01.wav";				vol = 120;			};
//				INSTANCE Door_open_a1					(C_SFX_DEF) {file= "Door_open02.wav";				vol = 127;			};
				INSTANCE Door_close						(C_SFX_DEF) {file= "Door_close01b.wav";				vol = 120;			};
//				INSTANCE Door_close_a1					(C_SFX_DEF) {file= "Door_close02b.wav";				vol = 127;			};
				INSTANCE Door_lock						(C_SFX_DEF) {file= "Door_lock.wav";					vol = 120;			};
				INSTANCE Door_unlock					(C_SFX_DEF) {file= "Door_unlock.wav";				vol = 120;			};
				INSTANCE Door_try						(C_SFX_DEF) {file= "Door_try.wav";					vol = 120;			};

/* Forge */
				INSTANCE Forge_Anvil					(C_SFX_DEF) {file= "anvilhit01.wav";				vol = 70;			};
				INSTANCE Forge_Anvil_a1					(C_SFX_DEF) {file= "anvilhit02.wav";				vol = 70;			};
				INSTANCE Forge_Fire						(C_SFX_DEF) {file= "firehot.wav";					vol = 70;			};
				INSTANCE Forge_Water					(C_SFX_DEF) {file= "coolblade.wav";					vol = 30;			};
				INSTANCE Forge_Sharpen					(C_SFX_DEF) {file= "sharpenblade.wav";				vol = 40;			};

/* Grave */
				INSTANCE Grave_open 					(C_SFX_DEF) {file= "grave_test3.wav";				vol = 110;			};

/* Hammer */
				INSTANCE Hammer							(C_SFX_DEF) {file= "Hammer_01.wav";					vol = 70;			};
				INSTANCE Hammer_A1						(C_SFX_DEF) {file= "Hammer_02.wav";					vol = 70;			};
				INSTANCE Hammer_A2						(C_SFX_DEF) {file= "Hammer_03.wav";					vol = 70;			};

/* Herbstomp */	
				INSTANCE Herb_Stomp						(C_SFX_DEF) {file= "herb_stomp01.wav";				vol = 60;			};
				INSTANCE Herb_Stomp_A1					(C_SFX_DEF) {file= "herb_stomp02.wav";				vol = 60;			};
				INSTANCE Herb_Stomp_A2					(C_SFX_DEF) {file= "herb_stomp03.wav";				vol = 60;			};

/* Ladder */
				INSTANCE Ladder_Step					(C_SFX_DEF) {file= "Step_Wood_01.wav";				vol = 20;			};
				INSTANCE Ladder_Step_A1					(C_SFX_DEF) {file= "Step_Wood_02.wav";				vol = 20;			};
				INSTANCE Ladder_Step_A2					(C_SFX_DEF) {file= "Step_Wood_03.wav";				vol = 20;			};

/* Lever */	
				INSTANCE Lever_up						(C_SFX_DEF) {file= "Lever_02b.wav";					vol = 100;			};
				INSTANCE Lever_down						(C_SFX_DEF) {file= "Lever_02.wav";					vol = 100;			};
				INSTANCE Lever_locked					(C_SFX_DEF) {file= "Lever_locked.wav";				vol = 100;			};

/* PickOre */
				INSTANCE PickOre						(C_SFX_DEF) {file= "pickore_01.wav";				vol = 100;			};
				INSTANCE PickOre_A1						(C_SFX_DEF) {file= "pickore_02.wav";				vol = 100;			};
				INSTANCE PickOre_A2						(C_SFX_DEF) {file= "pickore_03.wav";				vol = 100;			};

/* Psi-Lab */
				INSTANCE PsiLab_DrawLiquid				(C_SFX_DEF) {file= "psilab_drawliquid.wav";			vol = 30;			};
				INSTANCE PsiLab_DrawLiquid2				(C_SFX_DEF) {file= "psilab_drawliquid.wav";			vol = 30;			};
				INSTANCE PsiLab_PourLiquid				(C_SFX_DEF) {file= "psilab_pourliquid.wav";			vol = 40;			};
				INSTANCE PsiLab_Boiling					(C_SFX_DEF) {file= "psilab_boiling.wav";			vol = 30;			};
				INSTANCE PsiLab_GetBottle				(C_SFX_DEF) {file= "psilab_getbottle.wav";			vol = 80;			};
				INSTANCE PsiLab_PlaceBottle				(C_SFX_DEF) {file= "psilab_placebottle.wav";		vol = 30;			};
				INSTANCE PsiLab_GetResult				(C_SFX_DEF) {file= "psilab_getresult.wav";			vol = 60;			};

/* Ropeway */
				INSTANCE Ropeway_Start 					(C_SFX_DEF) {file= "Ropeway_Start.wav";				vol = 127;			};
				INSTANCE Ropeway_Loop 					(C_SFX_DEF) {file= "Ropeway_Loop.wav";				vol = 127;			};
				INSTANCE Ropeway_End 					(C_SFX_DEF) {file= "Ropeway_End.wav";				vol = 127;			};
				INSTANCE Ropeway_Barrier 				(C_SFX_DEF) {file= "MFX_Lightning_Target.wav";		vol = 127;			};
	
/* Stomper */
				INSTANCE Stomper_Boom 					(C_SFX_DEF) {file= "Stomper_boom.wav";				vol = 127;			};
				INSTANCE Stomper_Wheels 				(C_SFX_DEF) {file= "Stomper_wheels.wav";			vol = 127;			};

/* Stonemill */	
				INSTANCE Stonemill 						(C_SFX_DEF) {file= "Stonemill.wav";					vol = 120;			};

/* Turnstone */ 
				INSTANCE Turnstone 						(C_SFX_DEF) {file= "Turnstone2.wav";				vol = 80;			};

/* Waterpipe */
 				INSTANCE Pipe_bubbles					(C_SFX_DEF) {file= "Smoke_bubbles.wav";				vol = 40;			};

/* VWheel */	
				INSTANCE VWheel_turn  					(C_SFX_DEF) {file= "VWheel_turn2.wav";				vol = 100;			};

/* BBQ-Grill */
				INSTANCE BBQ_SCAVENGER					(C_SFX_DEF) {file= "bbq_scavenger_02.wav";			vol = 15;			};
				INSTANCE BBQ_SCAVENGER_A1				(C_SFX_DEF) {file= "bbq_scavenger_02.wav";			vol = 20;			};

/* Bed */
				INSTANCE BED_USE						(C_SFX_DEF) {file= "bed_use.wav";					vol = 25;			};

/* Chair */
				INSTANCE CHAIR_USE						(C_SFX_DEF) {file= "chair_use.wav";					vol = 15;			};

/* Pan */
				INSTANCE PAN_FRYING						(C_SFX_DEF) {file= "pan_frying.wav";				vol = 65;			};

/* Touchplate */
				INSTANCE TOUCHPLATE_STONE_BIG			(C_SFX_DEF) {file= "touchplate_stone_big.wav";		vol = 80;			};
				INSTANCE TOUCHPLATE_STONE_SMALL			(C_SFX_DEF) {file= "touchplate_stone_small.wav";	vol = 80;			};
				INSTANCE TOUCHPLATE_STONE_PUSH			(C_SFX_DEF) {file= "touchplate_stone_push.wav";		vol = 80;			};

/* Picklock */
				INSTANCE PICKLOCK_SUCCESS 				(C_SFX_DEF) {file= "picklock_success.wav";			vol = 70;			};
				INSTANCE PICKLOCK_FAILURE 				(C_SFX_DEF) {file= "picklock_failure.wav";			vol = 70;			};
				INSTANCE PICKLOCK_UNLOCK 				(C_SFX_DEF) {file= "picklock_unlock.wav";			vol = 80;			};
				INSTANCE PICKLOCK_BROKEN 				(C_SFX_DEF) {file= "picklock_broken.wav";			vol = 50;			};




//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// VOB-SFX ///////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/* Waterout */
				INSTANCE WaterOutlet1					(C_SFX_DEF) {file= "rohr.wav";						vol = 100;			};
/* Birds: */ 
				INSTANCE OW_Bird1 		            	(C_SFX_DEF) {file= "bird_01.wav";					vol = 80;			};
				INSTANCE OW_Bird2 		            	(C_SFX_DEF) {file= "bird_02a.wav";					vol = 80;			};
				INSTANCE OW_Bird2_A1					(C_SFX_DEF) {file= "bird_02b.wav";					vol = 80;			};
				INSTANCE OW_Bird2_A2 					(C_SFX_DEF) {file= "bird_02c.wav";					vol = 80;			};
				INSTANCE OW_Bird3 		            	(C_SFX_DEF) {file= "bird_03.wav";					vol = 80;			};
				INSTANCE OW_Bird4 		            	(C_SFX_DEF) {file= "bird_04.wav";					vol = 80;			};
				INSTANCE OW_Bird5 		            	(C_SFX_DEF) {file= "bird_05.wav";					vol = 80;			};
				INSTANCE OW_Bird6 		            	(C_SFX_DEF) {file= "bird_06.wav";					vol = 80;			};
				INSTANCE OW_Bird6_A1 					(C_SFX_DEF) {file= "bird_06b.wav";					vol = 80;			};
				INSTANCE OW_Bird7 		            	(C_SFX_DEF) {file= "bird_07.wav";					vol = 80;			};
				INSTANCE OW_Bird7_A1 					(C_SFX_DEF) {file= "bird_07b.wav";					vol = 80;			};
				INSTANCE OW_Bird7_A2 					(C_SFX_DEF) {file= "bird_07c.wav";					vol = 80;			};
				INSTANCE OW_Bird7_A3 					(C_SFX_DEF) {file= "bird_07d.wav";					vol = 80;			};
				INSTANCE OW_Bird7_A4 					(C_SFX_DEF) {file= "bird_07e.wav";					vol = 80;			};
				INSTANCE OW_Bird7_A5 					(C_SFX_DEF) {file= "bird_07f.wav";					vol = 80;			};
				INSTANCE OW_Bird8 		            	(C_SFX_DEF) {file= "bird_08.wav";					vol = 80;			};
				INSTANCE OW_Bird8_A1 					(C_SFX_DEF) {file= "bird_08b.wav";					vol = 80;			};
				INSTANCE OW_Bird8_A2 					(C_SFX_DEF) {file= "bird_08c.wav";					vol = 80;			};
				INSTANCE OW_Bird8_A3					(C_SFX_DEF) {file= "bird_08d.wav";					vol = 80;			};
				INSTANCE OW_Bird8_A4 					(C_SFX_DEF) {file= "bird_08e.wav";					vol = 80;			};
				INSTANCE OW_Bird8_A5	            	(C_SFX_DEF) {file= "bird_08f.wav";					vol = 80;			};
				INSTANCE OW_Bird8_A6 					(C_SFX_DEF) {file= "bird_08g.wav";					vol = 80;			};
				INSTANCE OW_Bird9 		            	(C_SFX_DEF) {file= "bird_09.wav";					vol = 80;			};
				INSTANCE OW_Bird9_A1					(C_SFX_DEF) {file= "bird_09b.wav";					vol = 80;			};
				INSTANCE OW_Bird10 		            	(C_SFX_DEF) {file= "bird_10.wav";					vol = 80;			};
				INSTANCE OW_Bird11 		            	(C_SFX_DEF) {file= "bird_11.wav";					vol = 80;			};
				INSTANCE OW_Bird11_A1					(C_SFX_DEF) {file= "bird_11b.wav";					vol = 80;			};
				INSTANCE OW_Bird11_A2					(C_SFX_DEF) {file= "bird_11c.wav";					vol = 80;			};
				INSTANCE OW_Bird12 		            	(C_SFX_DEF) {file= "bird_12.wav";					vol = 80;			};
				INSTANCE OW_Bird12_A1					(C_SFX_DEF) {file= "bird_12b.wav";					vol = 80;			};
				INSTANCE OW_Crow 		            	(C_SFX_DEF) {file= "crow_01.wav";					vol = 80;			};
				INSTANCE OW_Crow_A1 	            	(C_SFX_DEF) {file= "crow_02.wav";					vol = 80;			};
				INSTANCE OW_Crow_A2 	             	(C_SFX_DEF) {file= "crow_03.wav";					vol = 80;			};
//				INSTANCE OW_EagleAmbient				(C_SFX_DEF) {file= "eagle_01.wav";					vol = 100;			};
//				INSTANCE OW_EagleScream					(C_SFX_DEF) {file= "eagle_02.wav";					vol = 100;			};
//				INSTANCE OW_EagleScream_A1				(C_SFX_DEF) {file= "eagle_03.wav";					vol = 100;			};
//				INSTANCE OW_EagleScream_A2				(C_SFX_DEF) {file= "eagle_04.wav";					vol = 100;			};
				INSTANCE OW_EagleAmbient				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE OW_EagleScream					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE OW_EagleScream_A1				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE OW_EagleScream_A2				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE OW_Raven						(C_SFX_DEF) {file= "raven_01.wav";					vol = 80;			};
				INSTANCE OW_Owl1 						(C_SFX_DEF) {file= "owl_01.wav";					vol = 80;			};
				INSTANCE OW_Owl1_A1 					(C_SFX_DEF) {file= "owl_02.wav";					vol = 80;			};
				INSTANCE OW_Owl2 						(C_SFX_DEF) {file= "owl_03.wav";					vol = 80;			};
/* Water */	
				INSTANCE OW_WaterHitsStone 				(C_SFX_DEF) {file= "lakeshore_stone.wav";			vol = 90;			};
				INSTANCE OW_HeavyBubbles 				(C_SFX_DEF) {file= "riverbubbles.wav";				vol = 80;			};
				INSTANCE OW_RiverRapid1	 				(C_SFX_DEF) {file= "riverrapid_01.wav";				vol = 80;			};
				INSTANCE OW_RiverRapid2	 				(C_SFX_DEF) {file= "riverrapid_02.wav";				vol = 80;			};
				INSTANCE OW_RiverTrouble 				(C_SFX_DEF) {file= "rivertrouble.wav";				vol = 80;			};
				INSTANCE OW_Waterfall1 					(C_SFX_DEF) {file= "waterfalls_01.wav";				vol = 100;			};
				INSTANCE OW_Waterfall2 					(C_SFX_DEF) {file= "waterfalls_02.wav";				vol = 100;			};
				INSTANCE OW_Waterfall3 					(C_SFX_DEF) {file= "waterfalls_03.wav";				vol = 100;			};
/* Misc */	
				INSTANCE OW_Wood_Crackle				(C_SFX_DEF) {file= "woodcrackle_01.wav";			vol = 100;			};
				INSTANCE OW_Wood_Crackle_A1				(C_SFX_DEF) {file= "woodcrackle_02.wav";			vol = 100;			};
				INSTANCE OW_Wood_Crackle_A2				(C_SFX_DEF) {file= "woodcrackle_03.wav";			vol = 100;			};
				INSTANCE OW_ShipWrekOrBridge			(C_SFX_DEF) {file= "woodcreak_shipwrek_0.wav";		vol = 100;			};
				INSTANCE OW_ShipWrekOrBridge_A1			(C_SFX_DEF) {file= "woodcreak_shipwrek_01.wav";		vol = 100;			};
				INSTANCE OW_ShipWrekOrBridge_A2			(C_SFX_DEF) {file= "woodcreak_shipwrek_02.wav";		vol = 100;			};
				INSTANCE OW_ShipWrekOrBridge_A3			(C_SFX_DEF) {file= "woodcreak_shipwrek_03.wav";		vol = 100;			};
				INSTANCE OW_Squirrel					(C_SFX_DEF) {file= "squirrel_01.wav";				vol = 100;			};
				INSTANCE OW_Squirrel_A1					(C_SFX_DEF) {file= "squirrel_02.wav";				vol = 100;			};
				INSTANCE Flies 							(C_SFX_DEF) {file= "flies1.wav";					vol = 50;			};
				INSTANCE Dog1							(C_SFX_DEF) {file= "dog1.wav";						vol = 40;			};
				INSTANCE Dog2							(C_SFX_DEF) {file= "dog2.wav";						vol = 40;			};
				INSTANCE Deepambient					(C_SFX_DEF) {file= "deepambient01.wav";				vol = 100;			};
				INSTANCE Murmur							(C_SFX_DEF) {file= "murmor_loop.wav";				vol = 30;			};
				INSTANCE Well_Slosh						(C_SFX_DEF) {file= "well_slosh_01.wav"; 			vol = 30; 			};
				INSTANCE Well_Slosh_A1					(C_SFX_DEF) {file= "well_slosh_02.wav";				vol = 15; 			};
				INSTANCE Well_Slosh_A2					(C_SFX_DEF) {file= "well_slosh_03.wav";	 			vol = 22; 			};
				INSTANCE Campfire1						(C_SFX_DEF) {file= "campfire_01.wav"; 				vol = 120;			};
				INSTANCE Campfire2						(C_SFX_DEF) {file= "campfire_02.wav"; 				vol = 120;			};
				INSTANCE Couldron_Boil					(C_SFX_DEF) {file= "Couldron.wav"; 					vol = 35;			};
				INSTANCE Ambientcrawlerscream   		(C_SFX_DEF) {file= "ambientcrawlerscream.wav"; 		vol = 80;			};
				INSTANCE Ambientscream_1        		(C_SFX_DEF) {file= "ambientscream_1.wav"; 			vol = 80;			};
				INSTANCE Ambientscream_2       			(C_SFX_DEF) {file= "ambientscream_2.wav"; 			vol = 80;			};
				INSTANCE Ambienttone_01_high   			(C_SFX_DEF) {file= "ambienttone_01_high.wav"; 		vol = 80;			};
				INSTANCE Ambienttone_02_dark_short      (C_SFX_DEF) {file= "ambienttone_02_dark_short.wav"; vol = 80;			};
				INSTANCE ambienttone_03_dark			(C_SFX_DEF) {file= "ambienttone_03_dark.wav"; 		vol = 80; 	 	 	};
				INSTANCE Ambientscream_03_dark  		(C_SFX_DEF) {file= "ambientscream_03_dark.wav"; 	vol = 100; 	 	 	};
				                                                                                                              
				INSTANCE Mystery_08						(C_SFX_DEF) {file= "Mystery_08_mono.wav"; 			vol = 40;	        };
				INSTANCE Mystery_09						(C_SFX_DEF) {file= "Mystery_09_mono.wav"; 			vol = 40; 			};
				INSTANCE Mystery_10						(C_SFX_DEF) {file= "Mystery_10_mono.wav"; 			vol = 40; 			};
		

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// AMBIENT - ZONES ///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


/* Wind */	
				INSTANCE OW_WindHurricane				(C_SFX_DEF) {file= "wind_hurricane.wav";			vol = 70;        	};
				INSTANCE OW_WindHeavy1					(C_SFX_DEF) {file= "wind_heavy01.wav";				vol = 70;        	};
				INSTANCE OW_WindHeavy2					(C_SFX_DEF) {file= "wind_heavy02.wav";				vol = 70;        	};
				INSTANCE OW_WindHigh1					(C_SFX_DEF) {file= "wind_high.wav";					vol = 70;        	};
				INSTANCE OW_WindHigh2					(C_SFX_DEF) {file= "wind_high.wav";					vol = 70;        	};
				INSTANCE OW_WindMedium					(C_SFX_DEF) {file= "wind_medium.wav";				vol = 70;        	};
				INSTANCE OW_WindLight					(C_SFX_DEF) {file= "wind_light.wav";				vol = 70;        	};
				INSTANCE OW_WindCave					(C_SFX_DEF) {file= "wind_cave.wav";					vol = 70;        	};
				INSTANCE OW_WindCave2					(C_SFX_DEF) {file= "wind_cave2.wav";				vol = 70;        	};
				INSTANCE OW_WindCave3					(C_SFX_DEF) {file= "wind_gentle_cave.wav";			vol = 70;        	};
/* Water */	
				INSTANCE OW_River						(C_SFX_DEF) {file= "river01stereo.wav";				vol = 20;        	};
				INSTANCE OW_River2						(C_SFX_DEF) {file= "river02stereo.wav";				vol = 30;        	};
				INSTANCE OW_RiverBridge					(C_SFX_DEF) {file= "river_underbridge.wav";			vol = 50;        	};
				INSTANCE OW_CoastLight					(C_SFX_DEF) {file= "coast_light.wav";				vol = 110;			};
				INSTANCE OW_CoastHeavy					(C_SFX_DEF) {file= "coast_heavy.wav";				vol = 60;        	};
				INSTANCE OW_WFallCave					(C_SFX_DEF) {file= "waterfall_cave.wav";			vol = 50;        	};
				INSTANCE UnderwaterAmbience   	 		(C_SFX_DEF) {file= "underwater_02.wav";				vol = 60;        	};
/* Wood: */	
				INSTANCE Wood_Day1						(C_SFX_DEF) {file= "wood_day.wav";  				vol = 70;        	};
				INSTANCE Wood_Day2						(C_SFX_DEF) {file= "wood_dayambience.wav";  		vol = 60;        	};
				INSTANCE Wood_Night1					(C_SFX_DEF) {file= "night_wood.wav";  				vol = 70;        	};
				INSTANCE Wood_NearWater1				(C_SFX_DEF) {file= "wood_nearwater_01.wav";  		vol = 70;        	};
				INSTANCE Wood_NearWater2				(C_SFX_DEF) {file= "wood_nearwater_02.wav";  		vol = 70;        	};
				INSTANCE Wood_BirdAmbience1				(C_SFX_DEF) {file= "wood_birdambience.wav";  		vol = 90;        	};
				INSTANCE Wood_BirdAmbience2				(C_SFX_DEF) {file= "wood_birdambience.wav";  		vol = 90;        	};
/* Misc: */	
				instance DropsInCave					(C_SFX_DEF) {file= "water_dropsincave.wav";			vol = 30;        	};
				INSTANCE InsectsFrogs_Night				(C_SFX_DEF) {file= "night_insects_frog.wav";		vol = 30;        	};
				INSTANCE InsectsFrogs_Night2			(C_SFX_DEF) {file= "frogsandinsects.wav";			vol = 20;        	};
				INSTANCE InsectsFrogs_Night3			(C_SFX_DEF) {file= "frogsandinsects2.wav";			vol = 20;        	};
				INSTANCE InsectsFrogs_Night4			(C_SFX_DEF) {file= "frogsandinsects3.wav";			vol = 20;        	};
				INSTANCE InsectsFrogs_Night5			(C_SFX_DEF) {file= "frogsandinsects4.wav";			vol = 20;        	};
				INSTANCE Owls_And_Nightingales			(C_SFX_DEF) {file= "owlsandnightingales.wav";		vol = 30;        	};
				INSTANCE Insects_And_Nightingales 		(C_SFX_DEF) {file= "smallinsectsandnightingales.wav";vol = 30;			};
				INSTANCE Insects_Only1					(C_SFX_DEF) {file= "night_insects.wav";				vol = 30;        	};
				INSTANCE Insects_Only2					(C_SFX_DEF) {file= "insects.wav";					vol = 30;        	};
				INSTANCE MysteriousAmbience				(C_SFX_DEF) {file= "mysterious_ambience.wav";		vol = 70;			};
				                                                                                                             
				INSTANCE Mystery_01						(C_SFX_DEF) {file= "Mystery_01.wav"; 				vol = 40;		 	};
				INSTANCE Mystery_02						(C_SFX_DEF) {file= "Mystery_02.wav"; 				vol = 40;		 	};
				INSTANCE Mystery_03						(C_SFX_DEF) {file= "Mystery_03.wav"; 				vol = 40;		 	};
				INSTANCE Mystery_04						(C_SFX_DEF) {file= "Mystery_04.wav"; 				vol = 40;		 	};
				INSTANCE Mystery_05						(C_SFX_DEF) {file= "Mystery_05.wav"; 				vol = 40;		 	};
				INSTANCE Mystery_06						(C_SFX_DEF) {file= "Mystery_06.wav"; 				vol = 40;		 	};
				INSTANCE Mystery_07						(C_SFX_DEF) {file= "Mystery_07.wav"; 				vol = 40;		 	};

				INSTANCE Sleepercave					(C_SFX_DEF) {file= "sleepercave_01.wav"; 			vol = 80;		 	};
				
				INSTANCE howling_01      				(C_SFX_DEF) {file= "howling_01.wav";     			vol = 40;    		};
    			INSTANCE percussion_01      			(C_SFX_DEF) {file= "percussion_01.wav";     		vol = 40;           };
    			INSTANCE percussion_02      			(C_SFX_DEF) {file= "percussion_02.wav";     		vol = 40;           };
    			INSTANCE zombie_01      				(C_SFX_DEF) {file= "zombie_01.wav";     			vol = 40;           };
    			INSTANCE rumble_01      				(C_SFX_DEF) {file= "rumble_01.wav";     			vol = 40;           };
    			INSTANCE cave_winds_01      			(C_SFX_DEF) {file= "cave_winds_01.wav";   			vol = 40;    		};

                                        			
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//  C R E A T U R E S ////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////// 
     
     
     
/* General */   
				INSTANCE SCRATCH     					(C_SFX_DEF) {file= "SCRATCH_01.wav";				vol = 110;			};
				INSTANCE SCRATCH_A1  					(C_SFX_DEF) {file= "SCRATCH_02.wav";				vol = 110;			};
				INSTANCE SCRATCH_SMALL     				(C_SFX_DEF) {file= "M_SCRATCH_SMALL01.wav";			vol = 90;			};
				INSTANCE SCRATCH_SMALL_A1  				(C_SFX_DEF) {file= "M_SCRATCH_SMALL02.wav";			vol = 90;			};
				INSTANCE M_EAT	 						(C_SFX_DEF) {file= "M_EAT01.wav";					vol = 110;			};
				INSTANCE M_FALL_HUGE 					(C_SFX_DEF) {file= "M_FALL_HUGE01.wav";				vol = 127;			};
				INSTANCE M_FALL_SMALL 					(C_SFX_DEF) {file= "M_FALL_SMALL01.wav";			vol = 110;			};
				INSTANCE M_STEP_HUGE	 				(C_SFX_DEF) {file= "M_STEP_HUGE01.wav";				vol = 127;			};
				INSTANCE M_STEP_HUGE_2 					(C_SFX_DEF) {file= "M_STEP_HUGE02.wav";				vol = 127;			};
		
/* Babe */	
				INSTANCE BAB_Ambient 					(C_SFX_DEF) {file= "BAB_Ambient01.wav";				vol = 25;			};
				INSTANCE BAB_Ambient_A1 				(C_SFX_DEF) {file= "BAB_Ambient02.wav";				vol = 30;			};
				INSTANCE BAB_Ambient_A2 				(C_SFX_DEF) {file= "BAB_Ambient03.wav";				vol = 25;			};
				INSTANCE BAB_Ambient_A3 				(C_SFX_DEF) {file= "nosound.wav";					vol = 30;			};
				INSTANCE BAB_Ambient_A4 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE BAB_Ambient_A5 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE BAB_Ambient_A6 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE BAB_Ambient_A7 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE BAB_Ambient_A8 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};		
				INSTANCE BAB_Ambient_A9 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};	
				INSTANCE BAB_Die 						(C_SFX_DEF) {file= "BAB_Die01.wav";					vol = 50;			};
				INSTANCE BAB_Die_A1 					(C_SFX_DEF) {file= "BAB_Die02.wav";					vol = 50;			};
				INSTANCE BAB_Hurt 						(C_SFX_DEF) {file= "BAB_Hurt01.wav";				vol = 50;			};
				INSTANCE BAB_Hurt_A1 					(C_SFX_DEF) {file= "BAB_Hurt02.wav";				vol = 50;			};
				INSTANCE BAB_Sigh 						(C_SFX_DEF) {file= "BAB_Ambient01.wav";				vol = 25;			};
				INSTANCE BAB_Sigh_A1 					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE BAB_Sigh_A2 					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE BAB_Sigh_A3 					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
		                                                                                                                
		                                                                                                                
/* Bloodfly */                                                                                                          
				INSTANCE BLO_Attack  					(C_SFX_DEF) {file= "BLO_Attack01.wav";				vol = 75; 			};
				INSTANCE BLO_Attack_A1 					(C_SFX_DEF) {file= "BLO_Attack02.wav";				vol = 75;			};
				INSTANCE BLO_Attack_A2  				(C_SFX_DEF) {file= "BLO_Attack03.wav";				vol = 75; 			};
				INSTANCE BLO_Die  						(C_SFX_DEF) {file= "BLO_Die01.wav";					vol = 75;  		 	};
				INSTANCE BLO_Die_A1 					(C_SFX_DEF) {file= "BLO_Die02.wav";					vol = 75;			};
				INSTANCE BLO_Hurt  						(C_SFX_DEF) {file= "BLO_Hurt01.wav";				vol = 75;  		 	};
				INSTANCE BLO_Hurt_A1 					(C_SFX_DEF) {file= "BLO_Hurt02.wav";				vol = 75;			};
				INSTANCE BLO_Hurt_A2  					(C_SFX_DEF) {file= "BLO_Hurt03.wav";				vol = 75;  		 	};
				INSTANCE BLO_Warn  						(C_SFX_DEF) {file= "BLO_Warn01.wav";				vol = 110;  	 	};
				INSTANCE BLO_Warn_A1 					(C_SFX_DEF) {file= "BLO_Warn02.wav";				vol = 110;			};
				INSTANCE BLO_Wings  					(C_SFX_DEF) {file= "BLO_Wings_01.wav";				vol = 20; 			};
				INSTANCE BLO_Wings_A1 					(C_SFX_DEF) {file= "BLO_Wings_02.wav";				vol = 20; 			};
				INSTANCE BLO_Wings_A2 					(C_SFX_DEF) {file= "BLO_Wings_03.wav";				vol = 20; 			};
				INSTANCE BLO_Wings_A3 					(C_SFX_DEF) {file= "BLO_Wings_04.wav";				vol = 20; 		  	};
				INSTANCE BLO_Wings_A4 					(C_SFX_DEF) {file= "BLO_Wings_05.wav";				vol = 20; 		  	};
		                                                                                                               		
		                                                                                                               		
/* Minecrawler */	    
				INSTANCE CRW_Ambient 					(C_SFX_DEF) {file= "CRW_Ambient01.wav";				vol = 25;			};
				INSTANCE CRW_Ambient_A1 				(C_SFX_DEF) {file= "CRW_Ambient02.wav";				vol = 25;			};
				INSTANCE CRW_Ambient_A2 				(C_SFX_DEF) {file= "CRW_Ambient03.wav";				vol = 25;			};
				INSTANCE CRW_Ambient_A3 				(C_SFX_DEF) {file= "CRW_Ambient04.wav";				vol = 25;			};
				INSTANCE CRW_Ambient_A4 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Ambient_A5 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Ambient_A6 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Ambient_A7 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Ambient_A8 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Ambient_A9 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Ambient_Short 				(C_SFX_DEF) {file= "CRW_Ambient_Short01.wav";		vol = 20;			};
				INSTANCE CRW_Ambient_Short_A1 			(C_SFX_DEF) {file= "CRW_Ambient_Short02.wav";		vol = 20;			};
				INSTANCE CRW_Ambient_Short_A2 			(C_SFX_DEF) {file= "CRW_Ambient_Short03.wav";		vol = 20;			};
				INSTANCE CRW_Ambient_Short_A3			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Ambient_Short_A4			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Ambient_Short_A5			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE CRW_Attack 					(C_SFX_DEF) {file= "CRW_Attack01.wav";				vol = 120;			};
				INSTANCE CRW_Attack_A1 					(C_SFX_DEF) {file= "CRW_Attack02.wav";				vol = 120;			};
				INSTANCE CRW_Attack_A2 					(C_SFX_DEF) {file= "CRW_Attack03.wav";				vol = 120;			};
				INSTANCE CRW_Clean 						(C_SFX_DEF) {file= "CRW_Clean01.wav";				vol = 50;			};
				INSTANCE CRW_Die 						(C_SFX_DEF) {file= "CRW_Die01.wav";					vol = 100;			};
				INSTANCE CRW_Die_A1						(C_SFX_DEF) {file= "CRW_Die02.wav";					vol = 100;			};
				INSTANCE CRW_Die_Last					(C_SFX_DEF) {file= "CRW_Die_Last01.wav";			vol = 50;			};
				INSTANCE CRW_Hurt	 					(C_SFX_DEF) {file= "CRW_Hurt01.wav";				vol = 100;			};
				INSTANCE CRW_Hurt_A1 					(C_SFX_DEF) {file= "CRW_Hurt02.wav";				vol = 100;			};
				INSTANCE CRW_Perception					(C_SFX_DEF) {file= "CRW_Perception01.wav";			vol = 90;			};
				INSTANCE CRW_Warn	 					(C_SFX_DEF) {file= "CRW_Warn01.wav";				Vol = 127;			};
				INSTANCE CRW_Warn_A1	 				(C_SFX_DEF) {file= "CRW_Warn02.wav";				vol = 127;			};
		                                                                                                              		
		                                                                                                              		
/* CrwQueen */	                                                                                                      		
				INSTANCE QUE_Ambient 					(C_SFX_DEF) {file= "QUE_Glibber01.wav";				vol = 100;			};
				INSTANCE QUE_Ambient_A1 				(C_SFX_DEF) {file= "QUE_Glibber02.wav";				vol = 100;			};
				INSTANCE QUE_Ambient_A2 				(C_SFX_DEF) {file= "QUE_Glibber03.wav";				vol = 100;			};
				INSTANCE QUE_Ambient_A3 				(C_SFX_DEF) {file= "QUE_Glibber04.wav";				vol = 100;			};
				INSTANCE QUE_Ambient_A4 				(C_SFX_DEF) {file= "QUE_Glibber05.wav";				vol = 100;			};
				INSTANCE QUE_Ambient_A5 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE QUE_Ambient_A6 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE QUE_Ambient_A7 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE QUE_Ambient_A8 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE QUE_Attack 					(C_SFX_DEF) {file= "QUE_Attack01.wav";				vol = 127;			};
				INSTANCE QUE_Attack_A1 					(C_SFX_DEF) {file= "QUE_Attack02.wav";				vol = 127;			};
				INSTANCE QUE_Attack_A2 					(C_SFX_DEF) {file= "QUE_Attack03.wav";				vol = 127;			};
				INSTANCE QUE_Attack_A3 					(C_SFX_DEF) {file= "QUE_Attack04.wav";				vol = 127;			};
				INSTANCE QUE_Breath 					(C_SFX_DEF) {file= "QUE_Breath01.wav";				vol = 50;			};
				INSTANCE QUE_Breath_A1 					(C_SFX_DEF) {file= "QUE_Breath02.wav";				vol = 50;			};
				INSTANCE QUE_Die 						(C_SFX_DEF) {file= "QUE_Die01.wav";					vol = 127;			};
					                                                                                                    		
/* Demon / Demonlord */	                                                                                                            		
				INSTANCE DEM_Ambient    				(C_SFX_DEF) {file= "DEM_Ambient01.wav";				vol = 60;			};
				INSTANCE DEM_Ambient_A1 				(C_SFX_DEF) {file= "DEM_Ambient02.wav";				vol = 60;			};
				INSTANCE DEM_Ambient_A2 				(C_SFX_DEF) {file= "DEM_Ambient03.wav";				vol = 60;			};
				INSTANCE DEM_Ambient_A3 				(C_SFX_DEF) {file= "DEM_Ambient04.wav";				vol = 60;			};
				INSTANCE DEM_Ambient_A4 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE DEM_Ambient_A5 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE DEM_Ambient_A6 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE DEM_Ambient_A7 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE DEM_Ambient_A8 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE DEM_Ambient_A9 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE DEM_Attack 					(C_SFX_DEF) {file= "DEM_Attack01.wav";				vol = 100;			};
				INSTANCE DEM_Attack_A1 					(C_SFX_DEF) {file= "DEM_Attack02.wav";				vol = 100;			};
				INSTANCE DEM_Die 						(C_SFX_DEF) {file= "DEM_Die01.wav";					vol = 110;			};
				INSTANCE DEM_Die_A1						(C_SFX_DEF) {file= "DEM_Die02.wav";					vol = 110;			};
				INSTANCE DEM_Hurt  						(C_SFX_DEF) {file= "DEM_Hurt01.wav";				vol = 90;			};
				INSTANCE DEM_Warn 						(C_SFX_DEF) {file= "DEM_Warn01.wav";				vol = 110;			};
				INSTANCE DEM_WingFlap 					(C_SFX_DEF) {file= "DEM_Wingflap01.wav";			vol = 50;			};
				INSTANCE DEM_WingFlap_A1 				(C_SFX_DEF) {file= "DEM_Wingflap02.wav";			vol = 50;			};
				INSTANCE DEM_WingFlap_A2 				(C_SFX_DEF) {file= "DEM_Wingflap03.wav";			vol = 50;			};
		                                                                                                                		
		                                                                                                                		
/* Gobbo */                                                                                                             		
				INSTANCE GOB_Ambient	 				(C_SFX_DEF) {file= "GOB_Ambient05.wav";				vol = 40;			};
				INSTANCE GOB_Ambient_A1	 				(C_SFX_DEF) {file= "GOB_Ambient04.wav";				vol = 40;			};
				INSTANCE GOB_Ambient_A2	 				(C_SFX_DEF) {file= "GOB_Ambient03.wav";				vol = 40;			};
				INSTANCE GOB_Ambient_A3	 				(C_SFX_DEF) {file= "GOB_Ambient02.wav";				vol = 40;			};
				INSTANCE GOB_Ambient_A4	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE GOB_Ambient_A5	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE GOB_Ambient_A6	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE GOB_Ambient_A7	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE GOB_Ambient_A8	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE GOB_Ambient_A9	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE GOB_Ambient_A10	 			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE GOB_Attack	 					(C_SFX_DEF) {file= "GOB_Attack01.wav";				vol = 50;			};
				INSTANCE GOB_Attack_A1	 				(C_SFX_DEF) {file= "GOB_Attack02.wav";				vol = 50;			};
				INSTANCE GOB_Die	 					(C_SFX_DEF) {file= "GOB_Die01.wav";					vol = 50;			};
				INSTANCE GOB_Happy	 					(C_SFX_DEF) {file= "GOB_Happy01.wav";				vol = 50;			};
				INSTANCE GOB_Hurt	 					(C_SFX_DEF) {file= "GOB_Hurt01.wav";				vol = 50;			};
				INSTANCE GOB_Hurt_A1	 				(C_SFX_DEF) {file= "GOB_Hurt02.wav";				vol = 50;			};
				INSTANCE GOB_Hurt_A2	 				(C_SFX_DEF) {file= "GOB_Hurt03.wav";				vol = 50;			};
				INSTANCE GOB_Hurt_A3	 				(C_SFX_DEF) {file= "GOB_Hurt04.wav";				vol = 50;			};
				INSTANCE GOB_Warn	 					(C_SFX_DEF) {file= "GOB_Warn01.wav";				vol = 95;			};
				INSTANCE GOB_Warn_A1 					(C_SFX_DEF) {file= "GOB_Warn02.wav";				vol = 95;			};
				INSTANCE GOB_Warn_A2 					(C_SFX_DEF) {file= "GOB_Warn03.wav";				vol = 95;			};
				INSTANCE GOB_Warn_A3 					(C_SFX_DEF) {file= "GOB_Warn04.wav";				vol = 95;			};
		                                                                                                             		
		                                                                                                             		
/* Golem */	
				INSTANCE GOL_Ambient 					(C_SFX_DEF) {file= "GOL_Ambient01.wav";				vol = 65;			};
				INSTANCE GOL_Ambient_A1 				(C_SFX_DEF) {file= "GOL_Ambient02.wav";				vol = 65;			};
				INSTANCE GOL_Ambient_A2 				(C_SFX_DEF) {file= "GOL_Ambient03.wav";				vol = 65;			};
				INSTANCE GOL_Attack 					(C_SFX_DEF) {file= "GOL_Attack01.wav";				vol = 127;			};
				INSTANCE GOL_Die 						(C_SFX_DEF) {file= "GOL_Die01.wav";					vol = 127;			};
				INSTANCE GOL_Falldown 					(C_SFX_DEF) {file= "GOL_Falldown01.wav";			vol = 127;			};
				INSTANCE GOL_StepBoom 					(C_SFX_DEF) {file= "GOL_StepBoom01.wav";			vol = 127;			};
				INSTANCE GOL_StepBoom_A1 				(C_SFX_DEF) {file= "GOL_StepBoom02.wav";			vol = 127;			};
				INSTANCE GOL_StepBoom_A2 				(C_SFX_DEF) {file= "GOL_StepBoom03.wav";			vol = 127;			};
				INSTANCE GOL_Warn 						(C_SFX_DEF) {file= "GOL_Warn01.wav";				vol = 127;			};
				INSTANCE FGO_Attack 					(C_SFX_DEF) {file= "FGO_Attack01.wav";				vol = 127;			};
				INSTANCE IGO_Attack 					(C_SFX_DEF) {file= "IGO_Attack01.wav";				vol = 127;			};


/* Harpie */
				INSTANCE HAR_Ambient 					(C_SFX_DEF) {file= "HAR_Ambient01.wav";				vol = 100;			};
				INSTANCE HAR_Ambient_A1					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE HAR_Ambient_A2					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE HAR_Attack 					(C_SFX_DEF) {file= "HAR_Attack01.wav";				vol = 100;			};
				INSTANCE HAR_Attack_A1 					(C_SFX_DEF) {file= "HAR_Attack02.wav";				vol = 100;			};
				INSTANCE HAR_Die						(C_SFX_DEF) {file= "HAR_Die01.wav";					vol = 100;			};		
				INSTANCE HAR_Hurt						(C_SFX_DEF) {file= "HAR_Hurt01.wav";				vol = 100;			};
				INSTANCE HAR_Warn 						(C_SFX_DEF) {file= "HAR_Warn01.wav";				vol = 100;			};


/* Lurker */
				INSTANCE LUR_Ambient 					(C_SFX_DEF) {file= "LUR_Ambient01.wav";				vol = 90;			};
				INSTANCE LUR_Ambient_A1					(C_SFX_DEF) {file= "LUR_Ambient02.wav";				vol = 90;			};
				INSTANCE LUR_Ambient_A2					(C_SFX_DEF) {file= "LUR_Ambient03.wav";				vol = 90;			};
				INSTANCE LUR_Ambient_A3					(C_SFX_DEF) {file= "LUR_Ambient04.wav";				vol = 90;			};
				INSTANCE LUR_Ambient_A4					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE LUR_Ambient_A5					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE LUR_Ambient_Short				(C_SFX_DEF) {file= "LUR_Ambient_Short01.wav";		vol = 110;			};
				INSTANCE LUR_Ambient_Short_A1			(C_SFX_DEF) {file= "LUR_Ambient_Short02.wav";		vol = 110;			};
				INSTANCE LUR_Ambient_Short_A2			(C_SFX_DEF) {file= "LUR_Ambient_Short03.wav";		vol = 110;			};
				INSTANCE LUR_Ambient_Short_A3			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE LUR_Ambient_Short_A4			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE LUR_Ambient_Short_A5			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE LUR_Attack						(C_SFX_DEF) {file= "LUR_Attack01.wav";				vol = 110;			};
				INSTANCE LUR_Attack_A1 					(C_SFX_DEF) {file= "LUR_Attack02.wav";				vol = 110;			};
				INSTANCE LUR_Die						(C_SFX_DEF) {file= "LUR_Die01.wav";					vol	= 80;			};
				INSTANCE LUR_Sniff 						(C_SFX_DEF) {file= "LUR_Sniff01.wav";				vol = 100;			};
				INSTANCE LUR_Warn 						(C_SFX_DEF) {file= "LUR_Warn01.wav";				vol = 110;			};
				INSTANCE LUR_Warn_A1 					(C_SFX_DEF) {file= "LUR_Warn02.wav";				vol = 110;			};
		                                                                                                              		
				                                                                                                      		
/* Meatbug */	                                                                                                      		
				INSTANCE MEA_Ambient 					(C_SFX_DEF) {file= "MEA_Ambient01.wav";				vol = 25;			};
				INSTANCE MEA_Ambient_A1 				(C_SFX_DEF) {file= "MEA_Ambient02.wav";				vol = 25;			};
				INSTANCE MEA_Ambient_A2 				(C_SFX_DEF) {file= "MEA_Ambient03.wav";				vol = 25;			};
				INSTANCE MEA_Ambient_A3 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MEA_Ambient_A4 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MEA_Ambient_A5 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};			                                                                                                            		
				INSTANCE MEA_Ambient_A6 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MEA_Ambient_A7 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};			                                                                                                            		

				
/* Molerat */	
				INSTANCE MOL_Ambient 					(C_SFX_DEF) {file= "MOL_Ambient01.wav";				vol = 50;			};
				INSTANCE MOL_Ambient_A1 				(C_SFX_DEF) {file= "MOL_Ambient04.wav";				vol = 60;			};
				INSTANCE MOL_Ambient_A2 				(C_SFX_DEF) {file= "MOL_Ambient01.wav";				vol = 50;			};
				INSTANCE MOL_Ambient_A3 				(C_SFX_DEF) {file= "MOL_Ambient04.wav";				vol = 60;			};
				INSTANCE MOL_Ambient_A4	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MOL_Ambient_A5	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MOL_Ambient_A6	 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MOL_Ambient_Short 				(C_SFX_DEF) {file= "MOL_Ambient_Short01.wav";		vol = 50;			};
				INSTANCE MOL_Ambient_Short_A1 			(C_SFX_DEF) {file= "MOL_Ambient_Short02.wav";		vol = 50;			};
				INSTANCE MOL_Ambient_Short_A2 			(C_SFX_DEF) {file= "MOL_Ambient_Short03.wav";		vol = 50;			};
				INSTANCE MOL_Ambient_Short_A3 			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MOL_Ambient_Short_A4	 		(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MOL_Ambient_Short_A5	 		(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MOL_Ambient_Short_A6	 		(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE MOL_Attack 					(C_SFX_DEF) {file= "MOL_Attack01.wav";				vol = 80;			};
				INSTANCE MOL_Attack_A1 					(C_SFX_DEF) {file= "MOL_Attack02.wav";				vol = 80;			};
				INSTANCE MOL_Die	   					(C_SFX_DEF) {file= "MOL_Die01.wav";					vol = 60;			};
				INSTANCE MOL_Dig 						(C_SFX_DEF) {file= "MOL_Dig01.wav";					vol = 80;			};
				INSTANCE MOL_Hurt	   					(C_SFX_DEF) {file= "MOL_Hurt01.wav";				vol = 80;			};
				INSTANCE MOL_Hurt_A1 	   				(C_SFX_DEF) {file= "MOL_Hurt02.wav";				vol = 80;			};
				INSTANCE MOL_Hurt_A2 	   				(C_SFX_DEF) {file= "MOL_Hurt03.wav";				vol = 80;			};
				INSTANCE MOL_Hurt_A3 	   				(C_SFX_DEF) {file= "MOL_Hurt04.wav";				vol = 80;			};
				INSTANCE MOL_Hurt_A4 	   				(C_SFX_DEF) {file= "MOL_Hurt05.wav";				vol = 80;			};
				INSTANCE MOL_Scratch 	   				(C_SFX_DEF) {file= "MOL_Scratch01.wav";				vol = 80;			};
				INSTANCE MOL_Sniff 	   					(C_SFX_DEF) {file= "MOL_Sniff01.wav";				vol = 80;			};
				INSTANCE MOL_Warn	   					(C_SFX_DEF) {file= "MOL_Warn01.wav";				vol = 97;			};
				INSTANCE MOL_Warn_A1 	   				(C_SFX_DEF) {file= "MOL_Warn02.wav";				vol = 97;			};
				INSTANCE MOL_Warn_A2 	   				(C_SFX_DEF) {file= "MOL_Warn03.wav";				vol = 97;			};


/* Orc */
				INSTANCE ORC_Ambient					(C_SFX_DEF) {file= "ORC_Ambient01.wav";				vol = 30;			};
				INSTANCE ORC_Ambient_A1					(C_SFX_DEF) {file= "ORC_Ambient02.wav";				vol = 30;			};
				INSTANCE ORC_Ambient_A2					(C_SFX_DEF) {file= "ORC_Ambient03.wav";				vol = 30;			};
				INSTANCE ORC_Ambient_A3					(C_SFX_DEF) {file= "ORC_Ambient04.wav";				vol = 30;			};
				INSTANCE ORC_Ambient_A4					(C_SFX_DEF) {file= "ORC_Ambient05.wav";				vol = 30;			};
				INSTANCE ORC_Ambient_A5					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ORC_Ambient_A6					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ORC_Ambient_A7					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ORC_Ambient_A8					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ORC_Ambient_A9					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ORC_Angry						(C_SFX_DEF) {file= "ORC_Angry01.wav";				vol = 127;			};
				INSTANCE ORC_Attack						(C_SFX_DEF) {file= "ORC_Attack01.wav";				vol = 100;			};
				INSTANCE ORC_Attack_A1					(C_SFX_DEF) {file= "ORC_Attack02.wav";				vol = 100;			};				
				INSTANCE ORC_Die						(C_SFX_DEF) {file= "ORC_Die01.wav";					vol = 127;			};
				INSTANCE ORC_Frightened					(C_SFX_DEF) {file= "ORC_Frightened01.wav";			vol = 100;			};
				INSTANCE ORC_Happy						(C_SFX_DEF) {file= "ORC_Happy01.wav";				vol = 100;			};
				INSTANCE ORC_Hurt						(C_SFX_DEF) {file= "ORC_Hurt01.wav";				vol = 110;			};
				INSTANCE ORC_Hurt_A1					(C_SFX_DEF) {file= "ORC_Hurt02.wav";				vol = 110;			};
				INSTANCE ORC_Warn						(C_SFX_DEF) {file= "ORC_Warn01.wav";				vol = 127;			};
				INSTANCE ORC_Ambient_Short				(C_SFX_DEF) {file= "ORC_Ambient_Short01.wav";		vol = 50;			};
				INSTANCE ORC_Ambient_Short_A1			(C_SFX_DEF) {file= "ORC_Ambient_Short02.wav";		vol = 50;			};
				INSTANCE ORC_Ambient_Short_A2			(C_SFX_DEF) {file= "ORC_Ambient_Short03.wav";		vol = 50;			};
				INSTANCE ORC_Ambient_Short_A3			(C_SFX_DEF) {file= "ORC_Ambient_Short04.wav";		vol = 50;			};
				INSTANCE ORC_Ambient_Short_A4			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ORC_Ambient_Short_A5			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ORC_Ambient_Short_A6			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ORC_Ambient_Short_A7			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
		                                                                                                                		
		                                                                                                                		
/* Scavenger / Orcbiter */
				INSTANCE SCA_Ambient_Short				(C_SFX_DEF) {file= "SCA_Ambient_Short01.wav";		vol = 50;			};
				INSTANCE SCA_Ambient_Short_A1			(C_SFX_DEF) {file= "SCA_Ambient_Short02.wav";		vol = 50;			};
				INSTANCE SCA_Ambient_Short_A2			(C_SFX_DEF) {file= "SCA_Ambient_Short03.wav";		vol = 50;			};
				INSTANCE SCA_Ambient_Short_A3			(C_SFX_DEF) {file= "SCA_Ambient_Short04.wav";		vol = 50;			};
				INSTANCE SCA_Ambient_Short_A4			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SCA_Ambient_Short_A5			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SCA_Ambient_Short_A6			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SCA_Ambient_Short_A7			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SCA_Attack						(C_SFX_DEF) {file= "SCA_Attack01.wav";				vol = 75;			};
				INSTANCE SCA_Attack_A1					(C_SFX_DEF) {file= "SCA_Attack02.wav";				vol = 75;			};				
				INSTANCE SCA_Die						(C_SFX_DEF) {file= "SCA_Die01.wav";					vol = 50;			};
				INSTANCE SCA_Die_A1						(C_SFX_DEF) {file= "SCA_Die02.wav";					vol = 50;			};
				INSTANCE SCA_Fly						(C_SFX_DEF) {file= "SCA_Fly01.wav";					vol = 35;			};
				INSTANCE SCA_Gacker						(C_SFX_DEF) {file= "SCA_Gacker01.wav";				vol = 75;			};
				INSTANCE SCA_Hurt						(C_SFX_DEF) {file= "SCA_Hurt01.wav";				vol = 75;			};
				INSTANCE SCA_Hurt_A1					(C_SFX_DEF) {file= "SCA_Hurt02.wav";				vol = 75;			};
				INSTANCE SCA_Hurt_A2					(C_SFX_DEF) {file= "SCA_Hurt03.wav";				vol = 75;			};
				INSTANCE SCA_Shakehead					(C_SFX_DEF) {file= "SCA_Shakehead01.wav";			vol = 75;			};
				INSTANCE SCA_SlurpDown					(C_SFX_DEF) {file= "SCA_Slurp01.wav";				vol = 75;			};
				INSTANCE SCA_Warn						(C_SFX_DEF) {file= "SCA_Warn01.wav";				vol = 80;			};
				                                                                                                        		
		                                                                                                                		
/* Shadowb. */	                                                                                                        		
				INSTANCE SHA_Ambient 					(C_SFX_DEF) {file= "SHA_Ambient01.wav";				vol = 50;			};
				INSTANCE SHA_Ambient_A1					(C_SFX_DEF) {file= "SHA_Ambient02.wav";				vol = 50;			};
				INSTANCE SHA_Ambient_A2					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SHA_Ambient_A3					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SHA_Ambient_Short				(C_SFX_DEF) {file= "SHA_Ambient_Short01.wav";		vol = 50;			};
				INSTANCE SHA_Ambient_Short_A1			(C_SFX_DEF) {file= "SHA_Ambient_Short02.wav";		vol = 50;			};
				INSTANCE SHA_Ambient_Short_A2			(C_SFX_DEF) {file= "SHA_Ambient_Short03.wav";		vol = 50;			};
				INSTANCE SHA_Ambient_Short_A3			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SHA_Ambient_Short_A4			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SHA_Ambient_Short_A5			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SHA_Attack 					(C_SFX_DEF) {file= "SHA_Attack01.wav";				vol = 100;			};
				INSTANCE SHA_Attack_A1 					(C_SFX_DEF) {file= "SHA_Attack02.wav";				vol = 100;			};
				INSTANCE SHA_Attack_A2 					(C_SFX_DEF) {file= "SHA_Attack03.wav";				vol = 100;			};
				INSTANCE SHA_Attack_A3 					(C_SFX_DEF) {file= "SHA_Attack04.wav";				vol = 100;			};
				INSTANCE SHA_Die 						(C_SFX_DEF) {file= "SHA_Die01.wav";					vol = 127;			};
				INSTANCE SHA_Hurt 						(C_SFX_DEF) {file= "SHA_Hurt01.wav";				vol = 100;			};
				INSTANCE SHA_Hurt_A1 					(C_SFX_DEF) {file= "SHA_Hurt02.wav";				vol = 100;			};
				INSTANCE SHA_Hurt_A2 					(C_SFX_DEF) {file= "SHA_Hurt03.wav";				vol = 100;			};
				INSTANCE SHA_SnoreIn 					(C_SFX_DEF) {file= "SHA_Snorein01.wav";				vol = 60;			};		
				INSTANCE SHA_SnoreOut					(C_SFX_DEF) {file= "SHA_Snoreout01.wav";			vol = 60;			};		
				INSTANCE SHA_Warn 						(C_SFX_DEF) {file= "SHA_Warn01.wav";				vol = 127;			};		
				INSTANCE SHA_Warn_A1 					(C_SFX_DEF) {file= "SHA_Warn02.wav";				vol = 127;			};		
		                                                                                                                		
		                                                                                                                		
/* Skeleton */                                                                                                          		
				INSTANCE SKE_Ambient	 				(C_SFX_DEF) {file= "SKE_Ambient01.wav";				vol = 50;			};
				INSTANCE SKE_Ambient_A1	 				(C_SFX_DEF) {file= "SKE_Ambient02.wav";				vol = 50;			};
				INSTANCE SKE_Ambient_A2	 				(C_SFX_DEF) {file= "SKE_Ambient03.wav";				vol = 50;			};
				INSTANCE SKE_Die	 					(C_SFX_DEF) {file= "SKE_Die01.wav";					vol = 90;			};
				INSTANCE SKE_Die_A1	 					(C_SFX_DEF) {file= "SKE_Die02.wav";					vol = 90;			};
				INSTANCE SKE_Hurt	 					(C_SFX_DEF) {file= "SKE_Hurt01.wav";				vol = 75;			};
				INSTANCE SKE_Hurt_A1	 				(C_SFX_DEF) {file= "SKE_Hurt02.wav";				vol = 75;			};
				INSTANCE SKE_Run	 					(C_SFX_DEF) {file= "SKE_Step01.wav";				vol = 15;			};
				INSTANCE SKE_Run_A1	 					(C_SFX_DEF) {file= "SKE_Step02.wav";				vol = 15;			};
				INSTANCE SKE_Run_A2	 					(C_SFX_DEF) {file= "SKE_Step03.wav";				vol = 15;			};
				INSTANCE SKE_Run_A3	 					(C_SFX_DEF) {file= "SKE_Step04.wav";				vol = 15;			};
				INSTANCE SKE_Run_A4	 					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SKE_Run_A5	 					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};

		                                                                                                                		
		                                                                                                                		
/* Sleeper */	                                                                                                        		
				INSTANCE SLE_Ambient 					(C_SFX_DEF) {file= "SLE_Ambient01.wav";				vol = 125;			};
				INSTANCE SLE_Ambient_A1 				(C_SFX_DEF) {file= "SLE_Ambient02.wav";				vol = 125;			};
				INSTANCE SLE_Snore 						(C_SFX_DEF) {file= "SLE_Snore01.wav";				vol = 125;			};
				INSTANCE SLE_Snore_A1 					(C_SFX_DEF) {file= "SLE_Snore02.wav";				vol = 125;			};
				INSTANCE SLE_Hurt	 					(C_SFX_DEF) {file= "SLE_Hurt01.wav";				vol = 125;			};
				                                                                                                        		
		
/* Snapper / Razor */	
				INSTANCE SNA_Ambient 					(C_SFX_DEF) {file= "SNA_Ambient01.wav";				vol = 50;			};
				INSTANCE SNA_Ambient_A1 				(C_SFX_DEF) {file= "SNA_Ambient02.wav";				vol = 50;			};
				INSTANCE SNA_Ambient_A2 				(C_SFX_DEF) {file= "SNA_Ambient03.wav";				vol = 50;			};
				INSTANCE SNA_Ambient_A3 				(C_SFX_DEF) {file= "SNA_Ambient02.wav";				vol = 50;			};
				INSTANCE SNA_Ambient_A4 				(C_SFX_DEF) {file= "SNA_Ambient04.wav";				vol = 50;			};
				INSTANCE SNA_Ambient_A5 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_A6 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_A7 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_A8 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_A9 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_A10 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_A11 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_Short 				(C_SFX_DEF) {file= "SNA_Ambient_Short01.wav";		vol = 30;			};
				INSTANCE SNA_Ambient_Short_A1			(C_SFX_DEF) {file= "SNA_Ambient_Short02.wav";		vol = 30;			};
				INSTANCE SNA_Ambient_Short_A2			(C_SFX_DEF) {file= "SNA_Ambient_Short03.wav";		vol = 30;			};
				INSTANCE SNA_Ambient_Short_A3			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_Short_A4			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_Short_A5			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_Short_A6			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Ambient_Short_A7			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SNA_Attack 					(C_SFX_DEF) {file= "SNA_Attack01.wav";				vol = 85;			};
				INSTANCE SNA_Attack_A1 					(C_SFX_DEF) {file= "SNA_Attack02.wav";				vol = 85;			};
				INSTANCE SNA_Clean 						(C_SFX_DEF) {file= "SNA_Clean01.wav";				vol = 100;			};
				INSTANCE SNA_Die 						(C_SFX_DEF) {file= "SNA_Die01.wav";					vol = 80;			};
				INSTANCE SNA_Happy	 					(C_SFX_DEF) {file= "SNA_Happy01.wav";				vol = 100;			};		
				INSTANCE SNA_Hurt 						(C_SFX_DEF) {file= "SNA_Hurt01.wav";				vol = 110;			};
				INSTANCE SNA_Hurt_A1 					(C_SFX_DEF) {file= "SNA_Hurt02.wav";				vol = 110;			};				
				INSTANCE SNA_Warn 						(C_SFX_DEF) {file= "SNA_Warn01.wav";				vol = 110;			};
				INSTANCE SNA_Warn_A1 					(C_SFX_DEF) {file= "SNA_Warn02.wav";				vol = 110;			};		
                                                                                                         		
		                                                                                                                		
/* Swampshark */	                                                                                                    		
				INSTANCE SWA_Ambient 					(C_SFX_DEF) {file= "SWA_Ambient01.wav";				vol = 90;			};
				INSTANCE SWA_Ambient_A1					(C_SFX_DEF) {file= "SWA_Ambient02.wav";				vol = 90;			};
				INSTANCE SWA_Ambient_A2 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SWA_Ambient_A3					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SWA_Ambient_A4 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SWA_Ambient_A5					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE SWA_Attack 					(C_SFX_DEF) {file= "SWA_Attack01.wav";				vol = 110;			};
				INSTANCE SWA_Attack_A1 					(C_SFX_DEF) {file= "SWA_Attack02.wav";				vol = 110;			};
				INSTANCE SWA_Die	 					(C_SFX_DEF) {file= "SWA_Die01.wav";					vol = 110;			};
				INSTANCE SWA_DieB	 					(C_SFX_DEF) {file= "SWA_Die02.wav";					vol = 110;			};
				INSTANCE SWA_Hurt	 					(C_SFX_DEF) {file= "SWA_Hurt01.wav";				vol = 110;			};
				INSTANCE SWA_Hurt_A1	 				(C_SFX_DEF) {file= "SWA_Hurt02.wav";				vol = 110;			};
				INSTANCE SWA_Slide 						(C_SFX_DEF) {file= "SWA_Slide01.wav";				vol = 90;			};
				INSTANCE SWA_Slide_A1 					(C_SFX_DEF) {file= "SWA_Slide02.wav";				vol = 90;			};
				INSTANCE SWA_Slide_A2 					(C_SFX_DEF) {file= "SWA_Slide03.wav";				vol = 90;			};
				INSTANCE SWA_Slide_A3 					(C_SFX_DEF) {file= "SWA_Slide04.wav";				vol = 90;			};
				INSTANCE SWA_Slide_A4 					(C_SFX_DEF) {file= "SWA_Slide05.wav";				vol = 90;			};
				INSTANCE SWA_Warn	 					(C_SFX_DEF) {file= "SWA_Warn01.wav";				vol = 127;			};
				INSTANCE SWA_Warn_A1 					(C_SFX_DEF) {file= "SWA_Warn02.wav";				vol = 127;			};
		                                                                                                                		
		                                                                                                                		
/* Troll */	                                                                                                            		
				INSTANCE TRO_Ambient					(C_SFX_DEF) {file= "TRO_Ambient01.wav";				vol = 110;			};
				INSTANCE TRO_Ambient_A1					(C_SFX_DEF) {file= "TRO_Ambient02.wav";				vol = 110;			};
				INSTANCE TRO_Ambient_A2					(C_SFX_DEF) {file= "TRO_Ambient03.wav";				vol = 110;			};
				INSTANCE TRO_Ambient_A3					(C_SFX_DEF) {file= "TRO_Ambient04.wav";				vol = 110;			};
				INSTANCE TRO_Ambient_A4					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE TRO_Ambient_A5					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE TRO_Ambient_A6					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE TRO_Ambient_A7					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE TRO_Attack						(C_SFX_DEF) {file= "TRO_Attack01.wav";				vol = 125;			};
				INSTANCE TRO_Die 						(C_SFX_DEF) {file= "TRO_Die01.wav";					vol = 125;			};
				INSTANCE TRO_Fistwoosh					(C_SFX_DEF) {file= "TRO_Fistwoosh01.wav";			vol = 125;			};
				INSTANCE TRO_Growl 						(C_SFX_DEF) {file= "TRO_Growl01.wav";				vol = 125;			};
				INSTANCE TRO_Growl_A1 					(C_SFX_DEF) {file= "TRO_Growl02.wav";				vol = 125;			};
				INSTANCE TRO_Hurt						(C_SFX_DEF) {file= "TRO_Hurt01.wav";				vol = 125;			};
				INSTANCE TRO_Perception 				(C_SFX_DEF) {file= "TRO_Perception01.wav";			vol = 125;			};				
				INSTANCE TRO_Snore 						(C_SFX_DEF) {file= "TRO_Snore01.wav";				vol = 125;			};
				INSTANCE TRO_StepBoom					(C_SFX_DEF) {file= "TRO_Stepboom01.wav";			vol = 125;			};
				INSTANCE TRO_StepLight					(C_SFX_DEF) {file= "TRO_Stepboom01.wav";			vol = 50;			};
				INSTANCE TRO_Warn						(C_SFX_DEF) {file= "TRO_Warn01.wav";				vol = 127;			};
		                                                                                                                		
				                                                                                                        		
/* Waran / Firewaran */                                                                                                             		
				INSTANCE WAR_Ambient    				(C_SFX_DEF) {file= "WAR_Ambient01.wav";				vol = 100;			};
				INSTANCE WAR_Ambient_A1    				(C_SFX_DEF) {file= "WAR_Ambient02.wav";				vol = 100;			};
				INSTANCE WAR_Ambient_A2    				(C_SFX_DEF) {file= "WAR_Ambient03.wav";				vol = 100;			};
				INSTANCE WAR_Ambient_A3    				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WAR_Ambient_A4    				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WAR_Ambient_A5    				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WAR_Ambient_Short    			(C_SFX_DEF) {file= "WAR_Ambient_Short01.wav";		vol = 100;			};
				INSTANCE WAR_Ambient_Short_A1    		(C_SFX_DEF) {file= "WAR_Ambient_Short02.wav";		vol = 100;			};
				INSTANCE WAR_Ambient_Short_A2    		(C_SFX_DEF) {file= "WAR_Ambient_Short03.wav";		vol = 100;			};
				INSTANCE WAR_Ambient_Short_A3    		(C_SFX_DEF) {file= "WAR_Ambient_Short04.wav";		vol = 100;			};
				INSTANCE WAR_Ambient_Short_A4    		(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WAR_Ambient_Short_A5    		(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WAR_Ambient_Short_A6    		(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WAR_Ambient_Short_A7    		(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WAR_Attack    					(C_SFX_DEF) {file= "WAR_Attack01.wav";				vol = 100;			};
				INSTANCE WAR_Attack_A1 					(C_SFX_DEF) {file= "WAR_Attack01.wav";				vol = 100;			};
				INSTANCE WAR_Die       					(C_SFX_DEF) {file= "WAR_Die01.wav";					vol = 100;			};
				INSTANCE WAR_Hurt      					(C_SFX_DEF) {file= "WAR_Hurt01.wav";				vol = 100;			};
				INSTANCE WAR_Hurt_A1   					(C_SFX_DEF) {file= "WAR_Hurt02.wav";				vol = 100;			};
				INSTANCE WAR_Warn      					(C_SFX_DEF) {file= "WAR_Warn01.wav";				vol = 127;			};
				INSTANCE WAR_Warn_A1   					(C_SFX_DEF) {file= "WAR_Warn02.wav";				vol = 127;			};
				INSTANCE FWA_Attack    					(C_SFX_DEF) {file= "FWA_Attack01.wav";				vol = 100;			};
				INSTANCE FWA_Attack_A1 					(C_SFX_DEF) {file= "FWA_Attack01.wav";				vol = 100;			};
		                                                                                                                		
		                                                                                                                		
/* Wolf / Orcdog */	                                                                                                            		
				INSTANCE WOL_Ambient 					(C_SFX_DEF) {file= "WOL_Ambient01.wav";				vol = 55;			};
				INSTANCE WOL_Ambient_A1 				(C_SFX_DEF) {file= "WOL_Ambient02.wav";				vol = 55;			};
				INSTANCE WOL_Ambient_A2 				(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WOL_Ambient_A3					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WOL_Ambient_A4					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WOL_Ambient_Short 				(C_SFX_DEF) {file= "WOL_Ambient_Short01.wav";		vol = 35;			};
				INSTANCE WOL_Ambient_Short_A1 			(C_SFX_DEF) {file= "WOL_Ambient_Short02.wav";		vol = 35;			};
				INSTANCE WOL_Ambient_Short_A2 			(C_SFX_DEF) {file= "WOL_Ambient_Short03.wav";		vol = 35;			};
				INSTANCE WOL_Ambient_Short_A3 			(C_SFX_DEF) {file= "WOL_Ambient_Short04.wav";		vol = 35;			};
				INSTANCE WOL_Ambient_Short_A4 			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WOL_Ambient_Short_A5 			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WOL_Ambient_Short_A6 			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WOL_Ambient_Short_A7 			(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE WOL_Attack 					(C_SFX_DEF) {file= "WOL_Attack01.wav";				vol = 112;			};
				INSTANCE WOL_Attack_A1 					(C_SFX_DEF) {file= "WOL_Attack02.wav";				vol = 112;			};
				INSTANCE WOL_Die 						(C_SFX_DEF) {file= "WOL_Die01.wav";					vol = 120;			};
				INSTANCE WOL_Growl 						(C_SFX_DEF) {file= "WOL_Growl01.wav";				vol = 95;			};
				INSTANCE WOL_Hurt 						(C_SFX_DEF) {file= "WOL_Hurt01.wav";				vol = 55;			};
				INSTANCE WOL_Hurt_A1					(C_SFX_DEF) {file= "WOL_Hurt02.wav";				vol = 55;			};
				INSTANCE WOL_Hurt_A2					(C_SFX_DEF) {file= "WOL_Hurt03.wav";				vol = 55;			};
				INSTANCE WOL_Warn		 				(C_SFX_DEF) {file= "WOL_Warn01.wav";				vol = 85;			};
				                                                                                                        		
			
/* Zombie */
				INSTANCE ZOM_Ambient					(C_SFX_DEF) {file= "ZOM_Ambient03.wav";				vol = 75;			};
				INSTANCE ZOM_Ambient_A1					(C_SFX_DEF) {file= "ZOM_Ambient04.wav";				vol = 75;			};
				INSTANCE ZOM_Ambient_A2					(C_SFX_DEF) {file= "ZOM_Ambient06.wav";				vol = 50;			};
				INSTANCE ZOM_Ambient_A3					(C_SFX_DEF) {file= "ZOM_Ambient03.wav";				vol = 75;			};
				INSTANCE ZOM_Ambient_A4					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ZOM_Ambient_A5					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ZOM_Ambient_A6					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ZOM_Ambient_A7					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ZOM_Ambient_A8					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ZOM_Ambient_A9					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;			};
				INSTANCE ZOM_Attack						(C_SFX_DEF) {file= "ZOM_Attack01.wav";				vol = 120;			};
				INSTANCE ZOM_Attack_A1					(C_SFX_DEF) {file= "ZOM_Attack02.wav";				vol = 120;			};
				INSTANCE ZOM_Die 						(C_SFX_DEF) {file= "ZOM_Die01.wav";					vol = 80;			};
				INSTANCE ZOM_Die_A1 					(C_SFX_DEF) {file= "ZOM_Die02.wav";					vol = 80;			};
				INSTANCE ZOM_Hurt						(C_SFX_DEF) {file= "ZOM_Hurt01.wav";				vol = 100;			};
				INSTANCE ZOM_Hurt_A1					(C_SFX_DEF) {file= "ZOM_Hurt02.wav";				vol = 100;			};
				INSTANCE ZOM_Hurt_A2					(C_SFX_DEF) {file= "ZOM_Hurt03.wav";				vol = 100;			};
				INSTANCE ZOM_Warn						(C_SFX_DEF) {file= "ZOM_Warn01.wav";				vol = 127;			};
				INSTANCE ZOM_Warn_A1					(C_SFX_DEF) {file= "ZOM_Warn02.wav";				vol = 127;			};		
		
		
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//  H U M A N S //////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


///////////////////////
// MDS - SFX
///////////////////////

				INSTANCE WashSelf01						(C_SFX_DEF) {file= "Wash_01.wav";					vol = 90;			};
				INSTANCE WashSelf02						(C_SFX_DEF) {file= "Wash_02.wav";					vol = 90;			};
	
				INSTANCE Couldron_Stir					(C_SFX_DEF) {file= "couldron_stir_01.wav";			vol = 60;			};
				INSTANCE Couldron_Stir_A1				(C_SFX_DEF) {file= "couldron_stir_02.wav";			vol = 40;			};

	
				INSTANCE Walk_Water						(C_SFX_DEF) {file= "Step_Water_01.wav";				vol = 80;			};  
				INSTANCE Walk_Water_A1					(C_SFX_DEF) {file= "Step_Water_02.wav";				vol = 80;			};  


///////////////////////
// Animations-SFX_Human
///////////////////////

// 				INSTANCE Jump							(C_SFX_DEF) {file= "Ignajmp.wav";					vol = 20;			};
// 				INSTANCE Hang							(C_SFX_DEF) {file= "Uaah.wav";											};
// 				INSTANCE t_Hang_2_Stand					(C_SFX_DEF) {file= "t_hang2stand.wav";									};
// 				INSTANCE ClimbUp						(C_SFX_DEF) {file= "ClimbUp.wav";					vol = 60;			};
// 				INSTANCE ClimbDown						(C_SFX_DEF) {file= "ClimbDown.wav";										};

// Added by KaiRo:
				INSTANCE Human_Spit						(C_SFX_DEF) {file= "Spit_Long.wav";					vol = 50;			};
				INSTANCE Human_Scratch					(C_SFX_DEF) {file= "Human_Scratch_01.wav";			vol = 50;			};
				INSTANCE Human_PissOff     			    (C_SFX_DEF) {file= "Special_pinkeln_02.wav";		vol = 100;			};
				INSTANCE Human_SnoreIn					(C_SFX_DEF) {file= "Snore_BreathOut_01.wav";		vol = 80;			};
				INSTANCE Human_SnoreIn_A1				(C_SFX_DEF) {file= "Snore_BreathOut_02.wav";		vol = 80;			};
				INSTANCE Human_SnoreIn_A2				(C_SFX_DEF) {file= "Snore_BreathOut_03.wav";		vol = 80;			};
				INSTANCE Human_SnoreOut					(C_SFX_DEF) {file= "Snore_BreathIn_01.wav";			vol = 80;			};
				INSTANCE Human_SnoreOut_A1				(C_SFX_DEF) {file= "Snore_BreathIn_02.wav";			vol = 80;			};
				INSTANCE Human_SnoreOut_A2				(C_SFX_DEF) {file= "Snore_BreathIn_03.wav";			vol = 80;			};


// 				INSTANCE Stumble						(C_SFX_DEF) {file= "Uaaah.wav";											};

// 				INSTANCE Fall							(C_SFX_DEF) {file= "Ooooh.wav";											};
// 				INSTANCE Fallen							(C_SFX_DEF) {file= "Uaaah.wav";											};


//////////////////////////////////////////////////



// Unterwasserblubberbasenklangeffektinstanzbeschreibung
				INSTANCE BreathBubbles 					(C_SFX_DEF) {file= "uw_breathout_bubbles_01.wav";  	vol = 40;			};
				INSTANCE BreathBubbles_A1 	 			(C_SFX_DEF) {file= "uw_breathout_bubbles_02.wav";  	vol = 50;			};
				INSTANCE BreathBubbles_A2	 			(C_SFX_DEF) {file= "uw_breathout_bubbles_03.wav";  	vol = 35;			};


// Replaced by KaiRo
				INSTANCE FallIntoWater					(C_SFX_DEF) {file= "Water_FallInto.wav";			vol = 110;			};
				INSTANCE Swim							(C_SFX_DEF) {file= "Swim_Littlewaves_01.wav";		vol = 30;			};
				INSTANCE Swim_A1						(C_SFX_DEF) {file= "Swim_Littlewaves_02.wav";		vol = 30;			};
				INSTANCE Swim_A2						(C_SFX_DEF) {file= "Swim_Littlewaves_03.wav";		vol = 30;			};
				INSTANCE Swim_A3						(C_SFX_DEF) {file= "Swim_Littlewaves_04.wav";		vol = 30;			};
				INSTANCE SwimBack						(C_SFX_DEF) {file= "Swim_Littlewaves_01.wav";		vol = 20;			};
				INSTANCE SwimBack_A1					(C_SFX_DEF) {file= "Swim_Littlewaves_02.wav";		vol = 20;			};
				INSTANCE Swim2Hang						(C_SFX_DEF) {file= "Swim_ClimbOut.wav";				vol = 40;			};
				INSTANCE Swim2Dive						(C_SFX_DEF) {file= "Swim_DiveDown.wav";				vol = 40;			};
				INSTANCE SwimWaves						(C_SFX_DEF) {file= "Swim_Little_01.wav";			vol = 40;			};
				INSTANCE SwimWaves_A1					(C_SFX_DEF) {file= "Swim_Little_02.wav";			vol = 40;			};
				INSTANCE SwimWaves_A2					(C_SFX_DEF) {file= "Swim_Little_03.wav";			vol = 40;			};
				INSTANCE Dive							(C_SFX_DEF) {file= "Swim_Underwater.wav";			vol = 60;			};
				INSTANCE DiveWaves						(C_SFX_DEF) {file= "Swim_Littlew_U_01.wav";			vol = 30;			};
				INSTANCE DiveWaves_A1					(C_SFX_DEF) {file= "Swim_Littlew_u_02.wav";			vol = 30;			};
				INSTANCE Drown							(C_SFX_DEF) {file= "Swim_Drown.wav";				vol = 60;			};

// 				INSTANCE Slide							(C_SFX_DEF) {file= "slide.wav";								   loop=1;	};
// 				INSTANCE Push							(C_SFX_DEF) {file= "Pushst.wav";										};
// 				INSTANCE Pull							(C_SFX_DEF) {file= "Pullst.wav";										};
// 				INSTANCE TorchToggle					(C_SFX_DEF) {file= "Wouf.wav";											};
// 				INSTANCE TorchThrow						(C_SFX_DEF) {file= "TorchThrow.wav";									};




///////////////////////
// Untergrund-SFX_Human
///////////////////////

// -------RUN:

/* Earth */	
				INSTANCE Run_Earth		                (C_SFX_DEF) {file= "Step_Earth_01.wav";				vol = 20;	    	};
				INSTANCE Run_Earth_A1					(C_SFX_DEF) {file= "Step_Earth_02.wav";				vol = 20;			};
				INSTANCE Run_Earth_A2					(C_SFX_DEF) {file= "Step_Earth_03.wav";				vol = 20;			};
				INSTANCE Run_Earth_A3		            (C_SFX_DEF) {file= "Step_Earth_04.wav";				vol = 20;	    	};
				INSTANCE Run_Earth_A4					(C_SFX_DEF) {file= "Step_Earth_05.wav";				vol = 20;			};
				INSTANCE Run_Earth_A5					(C_SFX_DEF) {file= "Step_Earth_06.wav";				vol = 20;			};
				INSTANCE Run_Earth_A6					(C_SFX_DEF) {file= "Step_Earth_07.wav";				vol = 20;			};
				INSTANCE Run_Earth_A7					(C_SFX_DEF) {file= "Step_Earth_08.wav";				vol = 20;			};

/* Sand */	                                                                                                                
				INSTANCE Run_Sand		                (C_SFX_DEF) {file= "Step_Sand_01.wav";				vol = 40;	    	};
				INSTANCE Run_Sand_A1	                (C_SFX_DEF) {file= "Step_Sand_02.wav";				vol = 40;	    	};
				INSTANCE Run_Sand_A2	                (C_SFX_DEF) {file= "Step_Sand_03.wav";				vol = 40;	    	};
				INSTANCE Run_Sand_A3	                (C_SFX_DEF) {file= "Step_Sand_04.wav";				vol = 40;	    	};
				INSTANCE Run_Sand_A4	                (C_SFX_DEF) {file= "Step_Sand_05.wav";				vol = 40;	    	};

/* Metal */	                                                                                                                
				INSTANCE Run_Metal		                (C_SFX_DEF) {file= "Step_Metal_01.wav";				vol = 45;	    	};	
				INSTANCE Run_Metal_A1					(C_SFX_DEF) {file= "Step_Metal_02.wav";				vol = 45;			};	
				INSTANCE Run_Metal_A2					(C_SFX_DEF) {file= "Step_Metal_03.wav";				vol = 45;			};	
				INSTANCE Run_Metal_A3					(C_SFX_DEF) {file= "Step_Metal_04.wav";				vol = 45;			};	
				INSTANCE Run_Metal_A4					(C_SFX_DEF) {file= "Step_Metal_05.wav";				vol = 45;			};	

/* Stone */	                                                                                                                
				INSTANCE Run_Stone		                (C_SFX_DEF) {file= "Step_Stone_01.wav";				vol = 35;	    	};
				INSTANCE Run_Stone_A1					(C_SFX_DEF) {file= "Step_Stone_02.wav";				vol = 35;			};
				INSTANCE Run_Stone_A2					(C_SFX_DEF) {file= "Step_Stone_03.wav";				vol = 35;			};
				INSTANCE Run_Stone_A3					(C_SFX_DEF) {file= "Step_Stone_04.wav";				vol = 35;			};
				INSTANCE Run_Stone_A4					(C_SFX_DEF) {file= "Step_Stone_05.wav";				vol = 35;			};

/* Water */	                                                                                                                
				INSTANCE Run_Water						(C_SFX_DEF) {file= "Step_Water_01.wav";				vol = 55;			};
				INSTANCE Run_Water_A1		            (C_SFX_DEF) {file= "Step_Water_02.wav";				vol = 55;  	    	};
				INSTANCE Run_Water_A2					(C_SFX_DEF) {file= "Step_Water_03.wav";				vol = 55;			};
				INSTANCE Run_Water_A3		            (C_SFX_DEF) {file= "Step_Water_04.wav";				vol = 55;  	    	};
				INSTANCE Run_Water_A4		            (C_SFX_DEF) {file= "Step_Water_05.wav";				vol = 55;  	    	};

/* Wood */	                                                                                                                
				INSTANCE Run_Wood		                (C_SFX_DEF) {file= "Step_Wood_01.wav";				vol = 40;	    	};
				INSTANCE Run_Wood_A1	                (C_SFX_DEF) {file= "Step_Wood_02.wav";				vol = 40;	    	};
				INSTANCE Run_Wood_A2	                (C_SFX_DEF) {file= "Step_Wood_03.wav";				vol = 40;	    	};
				INSTANCE Run_Wood_A3	                (C_SFX_DEF) {file= "Step_Wood_04.wav";				vol = 40;	    	};
				INSTANCE Run_Wood_A4	                (C_SFX_DEF) {file= "Step_Wood_05.wav";				vol = 40;	    	};

/* Undef */	                                                                                                                
				INSTANCE Run_Undef		                (C_SFX_DEF) {file= "Step_Stone_01.wav";				vol = 35;		    };    
				INSTANCE Run_Undef_A1					(C_SFX_DEF) {file= "Step_Stone_02.wav";				vol = 35;			};          	
				INSTANCE Run_Undef_A2					(C_SFX_DEF) {file= "Step_Stone_03.wav";				vol = 35;			};          	
				INSTANCE Run_Undef_A3					(C_SFX_DEF) {file= "Step_Stone_04.wav";				vol = 35;		    };          	
				INSTANCE Run_Undef_A4					(C_SFX_DEF) {file= "Step_Stone_05.wav";				vol = 35;		    };          	
		        
                                                                                                         	
// -------SNEAK:                                                                                      
        
/* Earth */	
				INSTANCE Sneak_Earth					(C_SFX_DEF) {file= "Step_Earth_01.wav";				vol = 10;			};      	
				INSTANCE Sneak_Earth_A1					(C_SFX_DEF) {file= "Step_Earth_02.wav";				vol = 10;			};      	
				INSTANCE Sneak_Earth_A2					(C_SFX_DEF) {file= "Step_Earth_03.wav";				vol = 10;			};          

/* Sand */	
				INSTANCE Sneak_Sand						(C_SFX_DEF) {file= "Step_Sand_01.wav";				vol = 15;			};    
				INSTANCE Sneak_Sand_A1					(C_SFX_DEF) {file= "Step_Sand_02.wav";				vol = 15;			};      	
				INSTANCE Sneak_Sand_A2					(C_SFX_DEF) {file= "Step_Sand_03.wav";				vol = 15;			};          

/* Metal */
				INSTANCE Sneak_Metal					(C_SFX_DEF) {file= "Step_Metal_01.wav";				vol = 15;			};	    
				INSTANCE Sneak_Metal_A1					(C_SFX_DEF) {file= "Step_Metal_02.wav";				vol = 15;			};	    
				INSTANCE Sneak_Metal_A2					(C_SFX_DEF) {file= "Step_Metal_03.wav";				vol = 15;			};	    

/* Stone */	
				INSTANCE Sneak_Stone					(C_SFX_DEF) {file= "Step_Stone_01.wav";				vol = 15;			};      
				INSTANCE Sneak_Stone_A1					(C_SFX_DEF) {file= "Step_Stone_02.wav";				vol = 15;			};    
				INSTANCE Sneak_Stone_A2					(C_SFX_DEF) {file= "Step_Stone_03.wav";				vol = 15;			};  	

/* Water */	
				INSTANCE Sneak_Water					(C_SFX_DEF) {file= "Step_Water_01.wav";				vol = 15; 			};          	
				INSTANCE Sneak_Water_A1					(C_SFX_DEF) {file= "Step_Water_02.wav";				vol = 15;			};      	
				INSTANCE Sneak_Water_A2					(C_SFX_DEF) {file= "Step_Water_03.wav";				vol = 15;			};

/* Wood */	
				INSTANCE Sneak_Wood						(C_SFX_DEF) {file= "Step_Wood_01.wav";				vol = 20;			};      	
				INSTANCE Sneak_Wood_A1					(C_SFX_DEF) {file= "Step_Wood_02.wav";				vol = 20;			};  	
				INSTANCE Sneak_Wood_A2					(C_SFX_DEF) {file= "Step_Wood_03.wav";				vol = 20;			};  	

/* Undef */	
				INSTANCE Sneak_Undef					(C_SFX_DEF) {file= "Step_Earth_01.wav";				vol = 15;			};               	
				INSTANCE Sneak_Undef_A1					(C_SFX_DEF) {file= "Step_Earth_02.wav";				vol = 15;			};
				INSTANCE Sneak_Undef_A2					(C_SFX_DEF) {file= "Step_Earth_03.wav";				vol = 15;			};
				INSTANCE Sneak_Undef_A3					(C_SFX_DEF) {file= "Step_Earth_04.wav";				vol = 15;			};
				INSTANCE Sneak_Undef_A4					(C_SFX_DEF) {file= "Step_Earth_05.wav";				vol = 15;			};
		

// -------TURN:       

/* Earth */	
				INSTANCE Turn_Earth						(C_SFX_DEF) {file= "Step_Earth_01.wav";				vol = 15;			};
				INSTANCE Turn_Earth_A1					(C_SFX_DEF) {file= "Step_Earth_02.wav";				vol = 15;			};
				INSTANCE Turn_Earth_A2					(C_SFX_DEF) {file= "Step_Earth_03.wav";				vol = 15;			};

/* Sand */	
				INSTANCE Turn_Sand						(C_SFX_DEF) {file= "Step_Sand_01.wav";				vol = 20;			};
				INSTANCE Turn_Sand_A1					(C_SFX_DEF) {file= "Step_Sand_02.wav";				vol = 20;			};
				INSTANCE Turn_Sand_A2					(C_SFX_DEF) {file= "Step_Sand_03.wav";				vol = 20;			};

/* Metal */	
				INSTANCE Turn_Metal						(C_SFX_DEF) {file= "Step_Metal_01.wav";				vol = 20;			};	
				INSTANCE Turn_Metal_A1					(C_SFX_DEF) {file= "Step_Metal_02.wav";				vol = 20;			};	
				INSTANCE Turn_Metal_A2					(C_SFX_DEF) {file= "Step_Metal_03.wav";				vol = 20;			};	

/* Stone */	
				INSTANCE Turn_Stone						(C_SFX_DEF) {file= "Step_Stone_01.wav";				vol = 20;			};
				INSTANCE Turn_Stone_A1					(C_SFX_DEF) {file= "Step_Stone_02.wav";				vol = 20;			};
				INSTANCE Turn_Stone_A2					(C_SFX_DEF) {file= "Step_Stone_03.wav";				vol = 20;			};

/* Water */	
				INSTANCE Turn_Water						(C_SFX_DEF) {file= "Step_Water_01.wav";				vol = 20; 	 		};
				INSTANCE Turn_Water_A1					(C_SFX_DEF) {file= "Step_Water_02.wav";				vol = 20;			};
				INSTANCE Turn_Water_A2					(C_SFX_DEF) {file= "Step_Water_03.wav";				vol = 20;			};

/* Wood */	
				INSTANCE Turn_Wood						(C_SFX_DEF) {file= "Step_Wood_01.wav";				vol = 25;			};
				INSTANCE Turn_Wood_A1					(C_SFX_DEF) {file= "Step_Wood_02.wav";				vol = 25;			};
				INSTANCE Turn_Wood_A2					(C_SFX_DEF) {file= "Step_Wood_03.wav";				vol = 25;			};

/* Undef */	
				INSTANCE Turn_Undef						(C_SFX_DEF) {file= "Step_Earth_01.wav";				vol = 20;			};
				INSTANCE Turn_Undef_A1					(C_SFX_DEF) {file= "Step_Earth_02.wav";				vol = 20;			};
				INSTANCE Turn_Undef_A2					(C_SFX_DEF) {file= "Step_Earth_03.wav";				vol = 20;			};
	        	INSTANCE Turn_Undef_A3					(C_SFX_DEF) {file= "Step_Earth_04.wav";				vol = 20;			};
	        	INSTANCE Turn_Undef_A4					(C_SFX_DEF) {file= "Step_Earth_05.wav";				vol = 20;			};


// Replaced by KaiRo
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//  H U M A N S           F I G H T //////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/* whoosh */	
				INSTANCE Whoosh							(C_SFX_DEF) {file= "woosh_01.wav";					vol = 80;			}; 
				INSTANCE Whoosh_A1						(C_SFX_DEF) {file= "woosh_02.wav";					vol = 90;			}; 
				INSTANCE Whoosh_A2						(C_SFX_DEF) {file= "woosh_03.wav";					vol = 80;			}; 
				INSTANCE Whoosh_A3						(C_SFX_DEF) {file= "woosh_04.wav";					vol = 90;			}; 
				INSTANCE Whoosh_A4						(C_SFX_DEF) {file= "woosh_05.wav";					vol = 80;			}; 
				INSTANCE Whoosh_A5						(C_SFX_DEF) {file= "woosh_06.wav";					vol = 90;			}; 
                                                                                                                                
/* whoosh_after */	                                                                                                            
				INSTANCE Back							(C_SFX_DEF) {file= "Woosh_After_01.wav";			vol = 90;			}; 
				INSTANCE Back_A1						(C_SFX_DEF) {file= "Woosh_After_02.wav";			vol = 90;			}; 
                                                                                                                               
/* ready */	                                                                                                                    
				INSTANCE Drawsound_ME					(C_SFX_DEF) {file= "Sword_Draw_01.wav";				vol = 25;			}; 
				INSTANCE Drawsound_ME_A1				(C_SFX_DEF) {file= "Sword_Draw_01.wav";				vol = 25;			}; 
				INSTANCE Drawsound_WO					(C_SFX_DEF) {file= "Sword_Draw_01.wav";				vol = 25;			}; 
				INSTANCE Drawsound_Bow					(C_SFX_DEF) {file= "Woosh_After_01.wav";			vol = 60;			}; 
                                                                                                                           
/* parade */	                        		                                                                         
				INSTANCE D_Parade		        		(C_SFX_DEF) {file= "Woosh_After_01.wav";			vol = 80;      		};
				INSTANCE D_Parade_A1	        		(C_SFX_DEF) {file= "Woosh_After_01.wav";			vol = 80;      		};
				INSTANCE D_Parade_A2					(C_SFX_DEF) {file= "Woosh_After_02.wav";			vol = 80;      		};
				INSTANCE D_Parade_A3					(C_SFX_DEF) {file= "nosound.wav";	                vol = 0;      		};
				                                                                                                         
/* breath */	                                                                                                         
				INSTANCE D_Breath						(C_SFX_DEF) {file= "Breath01.wav";					vol = 30;    	  	};
				INSTANCE D_Breath_A1					(C_SFX_DEF) {file= "Breath02.wav";					vol = 30;    	  	};
				INSTANCE D_Breath_A2					(C_SFX_DEF) {file= "Breath03.wav";					vol = 30;    	  	};
				INSTANCE D_Breath_A3					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;    	  	};
				INSTANCE D_Breath_A4					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;    	  	};
				INSTANCE D_Breath_A5					(C_SFX_DEF) {file= "nosound.wav";					vol = 0;    	  	};
                                        		                                          
                                        		                                          
// -------------  Damage ---------------		                                          
// sollte über das Kollisionssoundsystem         geregelt werden. IAM_ME_FL   etc.        
                                                                                          
                                        		                                          
                                        		                                          
/* flesh */	                                                                              
//				INSTANCE FIG_HitFlesh					(C_SFX_DEF) {file= "CS_IAM_UD_FL_01.wav";			vol = 90;			}; 
//				INSTANCE FIG_HitFlesh_A1				(C_SFX_DEF) {file= "CS_IAM_UD_FL_02.wav";			vol = 90;			}; 
                                            		                                      
/* final */	    //   nicht löschen !!!                            		                                      
				INSTANCE FIG_SwordFinal					(C_SFX_DEF) {file= "Sword_Finalhit.wav";			vol = 45;			}; 
                                            		                                      
/* dummydie */                                                                            
				INSTANCE FIG_DummyDie		        	(C_SFX_DEF) {file= "Dummy_arghdead.wav";			vol = 127;			}; 
                                            		                                      
/* wounded  */                              		                                      
				INSTANCE FIG_DummyWound					(C_SFX_DEF) {file= "Dummy_argh.wav";				vol = 127;			}; 
                                                                                          




//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

				INSTANCE FistAttack						(C_SFX_DEF) {file= "woosh_02.wav";					vol = 80;			};
				INSTANCE ReadyBow						(C_SFX_DEF) {file= "Flap1.wav";											};
		                                			
				INSTANCE BowShoot						(C_SFX_DEF) {file= "Bow_Fire_01.wav";				vol = 30;			};
				INSTANCE BowReload						(C_SFX_DEF) {file= "Woosh_After_01.wav";			vol = 40;			};
				INSTANCE CrossbowShoot					(C_SFX_DEF) {file= "Bow_Fire_01.wav";				vol = 40;			};
				INSTANCE CrossbowReload	            	(C_SFX_DEF) {file= "Woosh_After_02.wav";			vol = 40;			};
                                                    
                                        			
// Weapons                              			
// INSTANCE ReadyMag		(C_SFX_DEF) {file= "kampfschrei.wav";							};
// INSTANCE ReadyPsi		(C_SFX_DEF) {file= "kampfschrei.wav";							};
// INSTANCE ReadyFist		(C_SFX_DEF) {file= "kampfschrei.wav";							};

// INSTANCE Ready1hS		(C_SFX_DEF) {file= "Sword_Activate_03.wav";		vol = 80;	}; // Replaced by KaiRo
// INSTANCE Ready1hS_A1		(C_SFX_DEF) {file= "Sword_Activate_05.wav";		vol = 80;	}; // Replaced by KaiRo

// INSTANCE Ready1hA		(C_SFX_DEF) {file= "Ready1hs.wav";					};

// INSTANCE Ready2hS		(C_SFX_DEF) {file= "Sword_Activate_03.wav";		vol = 80;	}; // Replaced by KaiRo
// INSTANCE Ready2hS_A1		(C_SFX_DEF) {file= "Sword_Activate_05.wav";		vol = 80;	}; // Replaced by KaiRo

// INSTANCE Ready2hA		(C_SFX_DEF) {file= "Ready1hs.wav";					};

// INSTANCE ReadyCrossbow	(C_SFX_DEF) {file= "ReadyCrossbow.wav";					};

// Idea by KaiRo:
// INSTANCE ActivateWeaponname   ... (e.g. Schwert aus Scheide ziehen)
// INSTANCE DeactivateWeaponname ... (e.g. Schwert in Scheide schieben)

/*

// Replaced by KaiRo
INSTANCE 1hAttack		(C_SFX_DEF) {file= "Woosh_01.wav";	 		vol = 60; 	};
INSTANCE 1hAttack_A1		(C_SFX_DEF) {file= "Woosh_02.wav";	 		vol = 60; 	};
INSTANCE 1hAttackT		(C_SFX_DEF) {file= "woosh_02.wav";	 		vol = 70;	};
INSTANCE 1hAttackT_A1		(C_SFX_DEF) {file= "woosh_03.wav";	 		vol = 70; 	};
INSTANCE 1hAttackTurn		(C_SFX_DEF) {file= "woosh_04.wav";			vol = 85;	};
INSTANCE 1hParade		(C_SFX_DEF) {file= "woosh_02.wav";			vol = 85;	};

// Replaced by KaiRo
INSTANCE 2hAttack		(C_SFX_DEF) {file= "Woosh_04.wav";	 		vol = 70; pitchOff=0; pitchVar=2; loop=0; };
INSTANCE 2hAttackT		(C_SFX_DEF) {file= "Woosh_01.wav";	 		vol = 80; pitchOff=4; pitchVar=0; loop=0; };
INSTANCE 2hAttackTurn		(C_SFX_DEF) {file= "Woosh_02.wav";			vol = 85;	};
INSTANCE 2hParade		(C_SFX_DEF) {file= "Woosh_03.wav";			vol = 90;	};

*/

/*

// Magie-SFX_Human
// INSTANCE LIGHT_LOGO    	(C_SFX_DEF) {};
INSTANCE LIGHT_SELECTED		(C_SFX_DEF) {file= "Magic_2.wav";					};
INSTANCE LIGHT_CASTED  		(C_SFX_DEF) {file= "Magic_10.wav";					};
// INSTANCE LIGHT_SPHERE  	(C_SFX_DEF) {};
INSTANCE LIGHT_FADES   		(C_SFX_DEF) {file= "Magic_5.wav";					};
INSTANCE LIGHT_CANCELED		(C_SFX_DEF) {file= "Magic_3.wav";					};
// INSTANCE FIREBALL_LOGO  	(C_SFX_DEF) {};
// INSTANCE FIREBALL_SELECTED  	(C_SFX_DEF) {};
// INSTANCE FIREBALL_GROWS     	(C_SFX_DEF) {};
INSTANCE FIREBALL_SHOT      	(C_SFX_DEF) {file= "Magic_15.wav";					};
INSTANCE FIREBALL_FLIES     	(C_SFX_DEF) {file= "Magic_13.wav";					};
INSTANCE FIREBALL_EXPLODES  	(C_SFX_DEF) {file= "Magic_11.wav";					};
INSTANCE FIREBALL_CANCELED  	(C_SFX_DEF) {file= "Magic_12.wav";					};
// INSTANCE CONTROL_LOGO        (C_SFX_DEF) {};
INSTANCE CONTROL_SELECTED   	(C_SFX_DEF) {file= "Magic_8.wav" ;					};
// INSTANCE CONTROL_STRUGGLE    (C_SFX_DEF) {};
INSTANCE CONTROL_FAILED     	(C_SFX_DEF) {file= "Magic_9.wav" ;					};
INSTANCE CONTROL_SUCCESS    	(C_SFX_DEF) {file= "Magic_5.wav" ;					};
// INSTANCE CONTROL_CONTROL    	(C_SFX_DEF) {};
INSTANCE CONTROL_RETURN     	(C_SFX_DEF) {file= "Magic_6.wav" ;					};
// INSTANCE SHAPESHIFT_LOGO    	(C_SFX_DEF) {};
// INSTANCE SHAPESHIFT_SELECTED	(C_SFX_DEF) {};
// INSTANCE SHAPESHIFT_TOGGLE  	(C_SFX_DEF) {};
// INSTANCE SHAPESHIFT_SHIFT   	(C_SFX_DEF) {};
// INSTANCE SHAPESHIFT_RETURN  	(C_SFX_DEF) {};

*/

// Untergrund-SFX_Gobbo
// !NOTE by KaiRo
// In der GOBBO.MDS habe ich für den Gobbo die gleichen Untergrund-Sounds genommen, wie für den Human.



// Kollisions-, Zerstoerungs-, Slide- SFX
// WICHTIG: Die Praefixe 'CS_', 'DS_', 'SS_' muessen eingehalten werden !

// Konzept-Tabellle, Ac_Technik.doc, 2.2.4, Tabelle 2
// Die Abkuerzungen stehen fuer die jeweiligen Materialien, Trefferarten, nat. Waffenarten, etc.
// Die Reihenfolge der Aufzaehlungen ist WICHTIG und muss mit der Festlegung dieser Attribute durch Ulf
// an anderer Stelle uebereinstimmen (z.B. hat Ulf die moeglichen 'Objekt-Materialien' an anderer Stelle
// definiert).

				CONST STRING CS_MH = "FL LE ME";			// Flesh, Leather, Metal
				CONST STRING CS_MA = "FI JA TA";			// Fist, Jaw, Tail
				CONST STRING CS_IH = "WO ST ME LE CL GL";	// Wood, Stone, Metal, Leather, Clay, Glas
				CONST STRING CS_IA = "WO ME ME ME";			// Dagger, 1hSword, 2hSword, 2hAxe
				CONST STRING CS_OH = "WO ST ME LE CL GL";
				
				CONST STRING CS_HM = "FL LE ME";
				CONST STRING CS_AM = "DM BL BM";			// Damage, BL = Bounces from Leather (Kein Schaden), BM = Bounces from Metal
				CONST STRING CS_HI = "WO ST ME LE CL GL";
				CONST STRING CS_AI = "WO BW ME LE CL GL";
				CONST STRING CS_HO = "WO ST ME LE CL GL";
				CONST STRING CS_AO = "WO ST ME LE CL GL";
				CONST STRING CS_HL = "UD ME ST WO EA WA";
				CONST STRING CS_AL = "UD ME ST WO EA WA";



///////////////////////
// destruction sounds
///////////////////////

// "DS_<OBJ_MATERIAL>" (WO ST ME LE CL GL - Wood, Stone, Metal, Leather, Clay, Glass)
/*
				INSTANCE DS_WO							(C_SFX_DEF) {file= "Crash;Wood_2.wav";									};
				INSTANCE DS_ST							(C_SFX_DEF) {file= "Crash;Wood_2.wav";									};
				INSTANCE DS_ME							(C_SFX_DEF) {file= "Crash;Wood_2.wav";									};
				INSTANCE DS_LE							(C_SFX_DEF) {file= "Crash;Item.wav";									};
				INSTANCE DS_CL							(C_SFX_DEF) {file= "CRASH;CLAY.wav";									};
				INSTANCE DS_GL							(C_SFX_DEF) {file= "Crash;Wood_2.wav";									};
*/


//////////////////////
// slide sounds 
//////////////////////

// (loop=1!), "SS_<LEVEL_MATERIAL>"

				INSTANCE SS_UD							(C_SFX_DEF) {file= "slide.wav";									loop=1;	};
//..



//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// COLLISION SOUNDS //////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

// Defaults (CS_MHL, CS_MHM ...) werden benutzt, wenn der im Game auftauchenden Collisions-Situation
// kein Script-Sound zugeordnet wurde, bei dem die Materialien (o.ä.) passen.

//////////////////////////////////////////////////////

// Materialkürzel:
// ---------------
// WO - Wood
// ME - Metal
// ST - Stone
// FL - Flesh
// WA - Water
// EA - Earth
// SA - Sand
// UD - Undefined

// Event-Kategorien:
// -----------------

// IAI - Item Attacks Item, überwiegend Parade beim Schertkampf
// IAM - Item Attacks Model, Spieler drescht mit der Waffe auf einen NPC ein
// IAL - Item Attacks Level, Spieler haut mit der Waffe vor eine Wand
// IAO - Item Attacks Object, Spieler haut mit der Waffe auf ein Objekt, meistens die gleichen Waves wie bei IAL

// IHL - Item Hits Level, ein Gegenstand fällt auf den Boden
// IHO - Item Hits Object, ein Gegenstand fällt auf ein Objekt, meistens Brücken etc.

// MAM - Model Attacks Model, Spieler brät seinem Gegenüber im Faustkampf eins über

// MAL - ?!?!?!? - Model Attacks Level, Spieler trifft mit dem Fausthieb eine Wand
// MAO - ?!?!?!? - Model Attacks Object, Spieler boxt vor einen Tisch. Naja...


 

/* IAI */	//											schwert trifft auf schwert
				INSTANCE CS_IAI							(C_SFX_DEF) {file= "CS_IAI_ME_ME_01.wav";			vol = 80;			};
				                                                                                         
				INSTANCE CS_IAI_ME_ME					(C_SFX_DEF) {file= "CS_IAI_ME_ME_01.wav";			vol = 80;			};
				INSTANCE CS_IAI_ME_ME_A1				(C_SFX_DEF) {file= "CS_IAI_ME_ME_02.wav";			vol = 80;			};
				INSTANCE CS_IAI_ME_ME_A2				(C_SFX_DEF) {file= "CS_IAI_ME_ME_03.wav";			vol = 80;			};
				INSTANCE CS_IAI_ME_ME_A3				(C_SFX_DEF) {file= "CS_IAI_ME_ME_04.wav";			vol = 80;			};
				INSTANCE CS_IAI_ME_ME_A4				(C_SFX_DEF) {file= "CS_IAI_ME_ME_05.wav";			vol = 80;			};
				INSTANCE CS_IAI_ME_ME_A5				(C_SFX_DEF) {file= "CS_IAI_ME_ME_06.wav";			vol = 80;			};
				INSTANCE CS_IAI_ME_ME_A6				(C_SFX_DEF) {file= "CS_IAI_ME_ME_07.wav";			vol = 80;			};
				INSTANCE CS_IAI_ME_ME_A7				(C_SFX_DEF) {file= "CS_IAI_ME_ME_08.wav";			vol = 80;			};
                                                                                                         
                                                                                                         
/* IAM */	//											schwert trifft auf monster/human                 
				INSTANCE CS_IAM							(C_SFX_DEF) {file= "CS_IAM_UD_FL_01.wav";			vol = 80;			};
				                                                                                         
				INSTANCE CS_IAM_ME_FL					(C_SFX_DEF) {file= "CS_IAM_UD_FL_01.wav";			vol = 80;			};
				INSTANCE CS_IAM_ME_FL_A1				(C_SFX_DEF) {file= "CS_IAM_UD_FL_02.wav";			vol = 80;			};
				INSTANCE CS_IAM_ME_FL_A2				(C_SFX_DEF) {file= "CS_IAM_UD_FL_03.wav";			vol = 80;			};		
				INSTANCE CS_IAM_ME_FL_A3				(C_SFX_DEF) {file= "CS_IAM_UD_FL_04.wav";			vol = 80;			};		
				INSTANCE CS_IAM_ME_FL_A4				(C_SFX_DEF) {file= "CS_IAM_UD_FL_05.wav";			vol = 80;			};		
				INSTANCE CS_IAM_WO_FL					(C_SFX_DEF) {file= "CS_IAM_UD_FL_01.wav";			vol = 80;			};
				INSTANCE CS_IAM_WO_FL_A1				(C_SFX_DEF) {file= "CS_IAM_UD_FL_02.wav";			vol = 80;			};
				INSTANCE CS_IAM_WO_FL_A2				(C_SFX_DEF) {file= "CS_IAM_UD_FL_03.wav";			vol = 80;			};		
				INSTANCE CS_IAM_WO_FL_A3				(C_SFX_DEF) {file= "CS_IAM_UD_FL_04.wav";			vol = 80;			};		
				INSTANCE CS_IAM_WO_FL_A4				(C_SFX_DEF) {file= "CS_IAM_UD_FL_05.wav";			vol = 80;			};		
				INSTANCE CS_IAM_UD_FL					(C_SFX_DEF) {file= "CS_IAM_UD_FL_01.wav";			vol = 80;			};
				INSTANCE CS_IAM_UD_FL_A1				(C_SFX_DEF) {file= "CS_IAM_UD_FL_02.wav";			vol = 80;			};
				INSTANCE CS_IAM_UD_FL_A2				(C_SFX_DEF) {file= "CS_IAM_UD_FL_03.wav";			vol = 80;			};		
				INSTANCE CS_IAM_UD_FL_A3				(C_SFX_DEF) {file= "CS_IAM_UD_FL_04.wav";			vol = 80;			};		
				INSTANCE CS_IAM_UD_FL_A4				(C_SFX_DEF) {file= "CS_IAM_UD_FL_05.wav";			vol = 80;			};		
				                            		
					
/* IAO */	//											schwert trifft auf objekt
				INSTANCE CS_IAO							(C_SFX_DEF) {file= "CS_IAL_UD_WO_01.wav";			vol = 80; pfxname="CPFX_Wood";	};
		                                                                                                 
				                                                                                 		
/* s. IAL*/	//											schwert trifft auf level                 		
				INSTANCE CS_IAO_ME_ME					(C_SFX_DEF) {file= "CS_IAL_UD_ME_01.wav";			vol = 80;			};
				INSTANCE CS_IAO_ME_WO					(C_SFX_DEF) {file= "CS_IAL_UD_WO_01.wav";			vol = 80; pfxname="CPFX_Wood";	};
				INSTANCE CS_IAO_ME_ST					(C_SFX_DEF) {file= "CS_IAL_ME_ST_01.wav";			vol = 80; pfxname="CPFX_Stone";	};
				INSTANCE CS_IAO_ME_WA					(C_SFX_DEF) {file= "CS_IAL_UD_WA_01.wav";			vol = 80;			};
				INSTANCE CS_IAO_WO_ME					(C_SFX_DEF) {file= "CS_IAL_ME_WO_01.wav";			vol = 80;			};
				INSTANCE CS_IAO_WO_WO					(C_SFX_DEF) {file= "CS_IAL_UD_WO_01.wav";			vol = 80;			};
				INSTANCE CS_IAO_WO_ST					(C_SFX_DEF) {file= "CS_IAL_UD_UD_01.wav";        	vol = 80;			};
				INSTANCE CS_IAO_WO_WA					(C_SFX_DEF) {file= "CS_IAL_UD_WA_01.wav";        	vol = 80;			};
		                                                                                                             		
		                                                                                         		             		
/* IHL */	//											gegenstand trifft auf level                      
				INSTANCE CS_IHL							(C_SFX_DEF) {file= "CS_IHL_ST_EA.wav";				vol = 80;			};
					                                                                             		             		
				INSTANCE CS_IHL_ME_ME					(C_SFX_DEF) {file= "CS_IHL_ME_ME.wav";				vol = 80;			};
				INSTANCE CS_IHL_ME_WO					(C_SFX_DEF) {file= "CS_IHL_ME_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_ME_ST					(C_SFX_DEF) {file= "CS_IHL_ME_ST.wav";				vol = 80;			};
				INSTANCE CS_IHL_ME_WA					(C_SFX_DEF) {file= "CS_IHL_ME_WA.wav";				vol = 80;			};
				INSTANCE CS_IHL_ME_EA					(C_SFX_DEF) {file= "CS_IHL_ME_EA.wav";				vol = 80;			};
				INSTANCE CS_IHL_ME_SA					(C_SFX_DEF) {file= "CS_IHL_ME_SA.wav";				vol = 80;			};
					                    		                                                 		             		
				INSTANCE CS_IHL_WO_ME					(C_SFX_DEF) {file= "CS_IHL_WO_ME.wav";				vol = 80;			};
				INSTANCE CS_IHL_WO_WO					(C_SFX_DEF) {file= "CS_IHL_WO_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_WO_ST					(C_SFX_DEF) {file= "CS_IHL_WO_ST.wav";				vol = 80;			};
				INSTANCE CS_IHL_WO_WA					(C_SFX_DEF) {file= "CS_IHL_WO_WA.wav";				vol = 80;			};
				INSTANCE CS_IHL_WO_EA					(C_SFX_DEF) {file= "CS_IHL_WO_EA.wav";				vol = 80;			};
				INSTANCE CS_IHL_WO_SA					(C_SFX_DEF) {file= "CS_IHL_WO_SA.wav";				vol = 80;			};
			                            		                                                                        		
				INSTANCE CS_IHL_ST_ME					(C_SFX_DEF) {file= "CS_IHL_ST_ME.wav";				vol = 80;			};
				INSTANCE CS_IHL_ST_WO					(C_SFX_DEF) {file= "CS_IHL_ST_WO.wav";	        	vol = 80;			};
				INSTANCE CS_IHL_ST_ST					(C_SFX_DEF) {file= "CS_IHL_ST_ST.wav";				vol = 80;			};
				INSTANCE CS_IHL_ST_WA					(C_SFX_DEF) {file= "CS_IHL_ST_WA.wav";				vol = 80;			};
				INSTANCE CS_IHL_ST_EA					(C_SFX_DEF) {file= "CS_IHL_ST_EA.wav";				vol = 80;			};
				INSTANCE CS_IHL_ST_SA					(C_SFX_DEF) {file= "CS_IHL_ST_SA.wav";				vol = 80;			};
					                    		                                                		             		
		                                		                                                		             		
				/*                      		                                                		             		
				INSTANCE CS_IHL_LE_ME					(C_SFX_DEF) {file= "CS_IHL_ST_ME.wav";				vol = 80;			};
				INSTANCE CS_IHL_LE_WO					(C_SFX_DEF) {file= "CS_IHL_ST_WO.wav";	        	vol = 80;			};
				INSTANCE CS_IHL_LE_ST					(C_SFX_DEF) {file= "CS_IHL_ST_ST.wav";	        	vol = 80;			};
				INSTANCE CS_IHL_LE_WA					(C_SFX_DEF) {file= "CS_IHL_ST_WA.wav";	        	vol = 80;			};
				INSTANCE CS_IHL_LE_EA					(C_SFX_DEF) {file= "CS_IHL_ST_EA.wav";				vol = 80;			};
				INSTANCE CS_IHL_LE_SA					(C_SFX_DEF) {file= "CS_IHL_ST_SA.wav";	        	vol = 80;			};
				*/                                                                              		             		
				                                                                                		             		
				// wenn die folgenden 3 blöcke einkommentiert werden, stürzt der parser ab.     		             		
				// lösung: bei programmieren im debug-mode durchlaufen lassen und im parser     		             		
				// direkt überprüfen, was er für mucken macht.                                  		
				// hinweis: die materialkürzel CL und GL tauchen oben in dem string auf, FL hingegen nicht
				                                                                                		
				/*                                                                              		
				INSTANCE CS_IHL_GL_ME					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_GL_WO					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_GL_ST					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_GL_WA					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_GL_EA					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_GL_SA					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				*/                          		                                            		             		
		                                    		
				/*INSTANCE CS_IHL_CL_ME					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_CL_WO					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";	        	vol = 80;			};
				INSTANCE CS_IHL_CL_ST					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_CL_WA					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_CL_EA					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				INSTANCE CS_IHL_CL_SA					(C_SFX_DEF) {file= "CS_IHL_GL_WO.wav";				vol = 80;			};
				*/                          		                                            		             		
				                            				                                    		
				/*                          		                                            		
				INSTANCE CS_IHL_FL_ME					(C_SFX_DEF) {file= "CS_IHL_FL_UD.wav";				vol = 80;			};
				INSTANCE CS_IHL_FL_WO					(C_SFX_DEF) {file= "CS_IHL_FL_UD.wav";	        	vol = 80;			};
				INSTANCE CS_IHL_FL_ST					(C_SFX_DEF) {file= "CS_IHL_FL_UD.wav";	        	vol = 80;			};
				INSTANCE CS_IHL_FL_WA					(C_SFX_DEF) {file= "CS_IHL_FL_UD.wav";	        	vol = 80;			};
				INSTANCE CS_IHL_FL_EA					(C_SFX_DEF) {file= "CS_IHL_FL_UD.wav";				vol = 80;			};
				INSTANCE CS_IHL_FL_SA					(C_SFX_DEF) {file= "CS_IHL_FL_UD.wav";	        	vol = 80;			};
				*/                                                                              		             		
		                                                                                        		
/* IHO */	// 											work in progress                        		
				INSTANCE CS_IHO							(C_SFX_DEF)	{file= "CS_IHO_ST_EA.wav";				vol = 80;			};
				INSTANCE CS_IHO_ME_ME					(C_SFX_DEF)	{file= "CS_IHO_ME_ME.wav";	    		vol = 80;			};
				INSTANCE CS_IHO_ME_WO					(C_SFX_DEF)	{file= "CS_IHO_ME_WO.wav";				vol = 80;			};
				INSTANCE CS_IHO_ME_ST					(C_SFX_DEF)	{file= "CS_IHO_ME_ST.wav";				vol = 80;			};
				INSTANCE CS_IHO_ME_WA					(C_SFX_DEF)	{file= "CS_IHO_ME_WA.wav";				vol = 80;			};
				INSTANCE CS_IHO_ME_EA					(C_SFX_DEF)	{file= "CS_IHO_ME_EA.wav";				vol = 80;			};
				INSTANCE CS_IHO_ME_SA					(C_SFX_DEF)	{file= "CS_IHO_ME_SA.wav";				vol = 80;			};
				INSTANCE CS_IHO_WO_ME					(C_SFX_DEF)	{file= "CS_IHO_WO_ME.wav";				vol = 80;			};
				INSTANCE CS_IHO_WO_WO					(C_SFX_DEF)	{file= "CS_IHO_WO_WO.wav";				vol = 80;			};
				INSTANCE CS_IHO_WO_ST					(C_SFX_DEF)	{file= "CS_IHO_WO_ST.wav";				vol = 80;			};
				INSTANCE CS_IHO_WO_WA					(C_SFX_DEF)	{file= "CS_IHO_WO_WA.wav";	    		vol = 80;			};
				INSTANCE CS_IHO_WO_EA					(C_SFX_DEF)	{file= "CS_IHO_WO_EA.wav";	    		vol = 80;			};
				INSTANCE CS_IHO_WO_SA					(C_SFX_DEF)	{file= "CS_IHO_WO_SA.wav";	    		vol = 80;			};			
				INSTANCE CS_IHO_ST_ME					(C_SFX_DEF)	{file= "CS_IHO_ST_ME.wav";		       	vol = 80;			};
				INSTANCE CS_IHO_ST_WO					(C_SFX_DEF)	{file= "CS_IHO_ST_WO.wav";	    		vol = 80;			};
				INSTANCE CS_IHO_ST_ST					(C_SFX_DEF)	{file= "CS_IHO_ST_ST.wav";				vol = 80;			};
				INSTANCE CS_IHO_ST_WA					(C_SFX_DEF)	{file= "CS_IHO_ST_WA.wav";				vol = 80;			};
				INSTANCE CS_IHO_ST_EA					(C_SFX_DEF)	{file= "CS_IHO_ST_EA.wav";				vol = 80;			};
				INSTANCE CS_IHO_ST_SA					(C_SFX_DEF)	{file= "CS_IHO_ST_SA.wav";				vol = 80;			};
		                                                                                        		                		
/* MAM */	//											faust trifft auf monster/human	        		                		
				INSTANCE CS_MAM							(C_SFX_DEF)	{file= "CS_IAM_UD_FL_01.wav";			vol = 50;			};
				INSTANCE CS_MAM_A1						(C_SFX_DEF)	{file= "CS_IAM_UD_FL_02.wav";			vol = 50;			};
				INSTANCE CS_MAM_A2						(C_SFX_DEF)	{file= "CS_IAM_UD_FL_03.wav";			vol = 50;			};

//				++++++++++++++++++++++++++++++++++++++++test statt CS_MAM_UD_FL_01
				                    			                                                	                 		
/* IHI */	                        			                                                		             		
				INSTANCE CS_IHI							(C_SFX_DEF)	{file= "CS_IAI_ME_ME_01.wav";			vol = 80;			};
		                            			                                                		             		
		                            			                                                		
		                                                                                        		
////////////////////                                                                             
// Aktions-SFX                                                                                   
////////////////////                                                                             
                                                                                                 
				INSTANCE INV_OPEN     					(C_SFX_DEF) {file="inv_open.wav"; 					vol = 100;			};
				INSTANCE INV_CLOSE    					(C_SFX_DEF) {file="inv_close.wav"; 		            vol = 100;			};
				INSTANCE INV_CHANGE   					(C_SFX_DEF) {file="inv_change.wav"; 				vol = 127;			};
				INSTANCE TRADE_OPEN   					(C_SFX_DEF) {file="inv_open.wav"; 					vol = 100;			};
				INSTANCE TRADE_CLOSE  					(C_SFX_DEF) {file="inv_close.wav";					vol = 100;			};
				INSTANCE PROFILE_OPEN 					(C_SFX_DEF) {file="inv_open.wav";					vol = 100;			};
				INSTANCE PROFILE_CLOSE					(C_SFX_DEF) {file="inv_close.wav";					vol = 100;			};
				INSTANCE ASK_YES      					(C_SFX_DEF) {file="nosound.wav";					vol = 0;			};
				INSTANCE ASK_NO       					(C_SFX_DEF) {file="nosound.wav";					vol = 0;			};
				INSTANCE HELP_ON      					(C_SFX_DEF) {file="nosound.wav";					vol = 0;			};
				INSTANCE HELP_OFF     					(C_SFX_DEF) {file="nosound.wav";		            vol = 0;			};
		                                    		                                                                    		
		                                    		                                                                    		
		                                    		                                            			            		
////////////////////                        		                                                        
// VOB-SFX                                  		                                            			
////////////////////                                                                            			
	                                                                                        			
				INSTANCE TORCH_ENLIGHT  				(C_SFX_DEF) {file= "torch_enlight.wav";									};
				INSTANCE TORCH_BURN   					(C_SFX_DEF) {file= "torch_burning.wav";									};
				INSTANCE CAMPFIRE_BURN					(C_SFX_DEF) {file= "campfire_02.wav";						   loop=1;	};
				INSTANCE BOILING_POT					(C_SFX_DEF) {file= "boiling_pot.wav";						   loop=1;	};
				INSTANCE FIRE_LARGE						(C_SFX_DEF) {file= "fire_large01.wav";				vol = 100;			};
				INSTANCE FIRE_MEDIUM					(C_SFX_DEF) {file= "fire_medium01.wav";				vol = 100;			};
				INSTANCE FIRE_SMALL						(C_SFX_DEF) {file= "fire_small01.wav";				vol = 100;			};
		// 		INSTANCE WATERFALL    					(C_SFX_DEF) {file= "WATERFALL.wav";						       loop=1;	};
		// 		INSTANCE FOUNTAIN     					(C_SFX_DEF) {file= "FOUNTAIN.wav"; 							   loop=1;	};
		                                    		                                            			
		                                    		                                            			
////////////////////                        		                                            			
// Ambient-SFX                              		
////////////////////                        		
		                                    		
		// 		INSTANCE AMBIENT_WINDYCAVE  			(C_SFX_DEF) {file= "AMBIENT;WINDYCAVE.wav";					   loop=1;	};
		// 		INSTANCE AMBIENT_UNDERWATER 			(C_SFX_DEF) {file= "AMBIENT;UNDERWATER.wav"; 				   loop=1;	};
		// 		INSTANCE AMBIENT_NIGHTMEADOW			(C_SFX_DEF) {};
		// 		INSTANCE AMBIENT_DARKNIGHT  			(C_SFX_DEF) {};
		// 		INSTANCE AMBIENT_SUNRISE    			(C_SFX_DEF) {file= "AMBIENT;SUNRISE.wav"; 					   loop=1;	};
		// 		INSTANCE AMBIENT_RAIN       			(C_SFX_DEF) {file= "AMBIENT;RAIN.wav"; 						   loop=1;	};
		// 		INSTANCE AMBIENT_MINE	    			(C_SFX_DEF) {file= "AMB;MINE.wav"; 							   loop=1;	};
                                                	
                                                	

////////////////////
// Skript-SFX
////////////////////
		
		// 		INSTANCE CHEST_OPEN    					(C_SFX_DEF) {file= "CHEST;OPEN.wav";									};
		// 		INSTANCE CHEST_CLOSE   					(C_SFX_DEF) {file= "CHEST;CLOSE.wav";		                			};
		// 		INSTANCE BIGCHEST_OPEN 					(C_SFX_DEF) {file= "BIGCHEST;OPEN.wav";									};
		// 		INSTANCE BIGCHEST_CLOSE					(C_SFX_DEF) {file= "BIGCHEST;CLOSE.wav";								};
		// 		INSTANCE LEVEL_USE     					(C_SFX_DEF) {};                             				
		// 		INSTANCE PORTCULLI_UP  					(C_SFX_DEF) {file= "PORTCULLI;UP.wav";									};
		// 		INSTANCE PORTCULLI_DOWN					(C_SFX_DEF) {file= "PORTCULLI;DOWN.wav";								};
		// 		INSTANCE PORTCULLI_FALL					(C_SFX_DEF) {file= "PORTCULLI;FALL.wav";								};
		// 		INSTANCE STONEHEAP_USE 					(C_SFX_DEF) {file= "STONEHEAP;USE.wav";									};
		// 		INSTANCE KEY_OPEN      					(C_SFX_DEF) {file= "KEY;OPEN.wav";										};
		// 		INSTANCE KEY_CLOSE     					(C_SFX_DEF) {file= "KEY;CLOSE.wav";			                			};
		                                    		                                                                
		                                    		                                                                
		                                    		                                                				
////////////////////                        		                                                                
// Sprachsamples                            		                                                				
////////////////////                                                                                				
                                                                                                    				
// Human_Deutsch                                                                                    				
                                                                                                    				
                                                                                                    				
                                                                                                    				
// ***********************                                                                          				
// Carsten - Magiesounds                                                                            				
// ***********************                                                                          				
				INSTANCE TMAG_TEST						(C_SFX_DEF) {file= "magic_1.wav";							   loop=1;	};          				
				INSTANCE TMAG_OPEN						(C_SFX_DEF) {file= "magic_2.wav";							   loop=1;	};          				
				INSTANCE TMAG_INIT						(C_SFX_DEF) {file= "magic_3.wav";										};              				
				INSTANCE TMAG_INVESTNEXT				(C_SFX_DEF) {file= "magic_4.wav";										};          				
				INSTANCE TMAG_CAST						(C_SFX_DEF) {file= "magic_15.wav";					vol = 50;			};          				
				INSTANCE TMAG_COLLIDE					(C_SFX_DEF) {file= "magic_11.wav";										};
				INSTANCE TMAG_STOP						(C_SFX_DEF) {file= "magic_7.wav";										};
		
				INSTANCE FB_INV1						(C_SFX_DEF) {file= "key01.wav";											};
				INSTANCE FB_INV2						(C_SFX_DEF) {file= "key02.wav";											};
				INSTANCE FB_CAST						(C_SFX_DEF) {file= "flyloop.wav";							   loop=1;	};
				INSTANCE FB_COLLIDE						(C_SFX_DEF) {file= "explosion.wav";										};

				INSTANCE SPELL_LIGHTNING_CAST			(C_SFX_DEF) {file= "lightning_spell_cast.wav"; 				   loop=1;	};
	
// ***********************
// Carsten - Menusounds
// ***********************
				INSTANCE MENU_BROWSE					(C_SFX_DEF) {file= "inv_change.wav";				vol = 127; 			};
				INSTANCE MENU_SELECT					(C_SFX_DEF) {file= "inv_open.wav";					vol = 127; 			};
				INSTANCE MENU_ESC						(C_SFX_DEF) {file= "inv_close.wav";					vol = 127; 			};

// ***********************
// Bert - Menusounds
// ***********************


// menu: multiplayer
				INSTANCE MENU_NET_GAME_FOUND			(C_SFX_DEF) {file= "eat_apple_bite_2.wav";			vol = 127; 			};
				INSTANCE MENU_NET_GAME_NOTFOUND			(C_SFX_DEF) {file= "spit_short.wav";				vol = 127; 			};

// menu: chatroom 
				INSTANCE MENU_NET_INFO_REQUEST			(C_SFX_DEF) {file= "doorknob01.wav";				vol = 127; 			};
				INSTANCE MENU_NET_PLAYER_ENTER			(C_SFX_DEF) {file= "doorknob03.wav";				vol = 127; 			};
				INSTANCE MENU_NET_PLAYER_LEAVE			(C_SFX_DEF) {file= "doorclose01.wav";				vol = 127; 			};
				INSTANCE MENU_NET_PLAYER_TIMEOUT		(C_SFX_DEF) {file= "pickore_1.wav";					vol = 127; 			};
				INSTANCE MENU_NET_PLAYER_CRCERROR		(C_SFX_DEF) {file= "pickore_1.wav";					vol = 127; 			};
				INSTANCE MENU_NET_PLAYER_CHANGE			(C_SFX_DEF) {file= "eat_apple_bite_2.wav";			vol = 127; 			};
				INSTANCE MENU_NET_GAME_START			(C_SFX_DEF) {file= "various_cast1.wav";				vol = 127; 			};

// ***** Ende von Carstens Part *****
				INSTANCE BLA23							(C_SFX_DEF) {file= "campfire_mono.wav";				vol = 127;  loop=1;	};



//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// EVENTS ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


//	Gates, Stonewalls, Traps
				INSTANCE GATE_START						(C_SFX_DEF) {file= "gate_start.wav";				vol = 127;			};
				INSTANCE GATE_LOOP						(C_SFX_DEF) {file= "gate_loop.wav";					vol = 127; 			};
				INSTANCE GATE_STOP						(C_SFX_DEF) {file= "gate_stop.wav";					vol = 127; 			};
				INSTANCE STONE_SMALL_START				(C_SFX_DEF) {file= "stone_small_start.wav";			vol = 105; 			};
				INSTANCE STONE_SMALL_LOOP				(C_SFX_DEF) {file= "stone_small_loop.wav";			vol = 105;			};
				INSTANCE STONE_SMALL_STOP				(C_SFX_DEF) {file= "stone_small_stop.wav";			vol = 105; 			};
				INSTANCE STONE_START					(C_SFX_DEF) {file= "stone_start.wav";				vol = 105;			};
				INSTANCE STONE_LOOP						(C_SFX_DEF) {file= "stone_loop.wav";				vol = 105;			};
				INSTANCE STONE_STOP						(C_SFX_DEF) {file= "stone_stop.wav";				vol = 105;			};
				INSTANCE SPEAR_START					(C_SFX_DEF) {file= "spear_start.wav";				vol = 110; 			};
				INSTANCE SPEAR_START_01					(C_SFX_DEF) {file= "spear_start_01.wav";			vol = 110; 			};
				INSTANCE SPEAR_STOP						(C_SFX_DEF) {file= "spear_stop.wav";				vol = 110; 			};


//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
// SVM    ////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


// AARGH
				INSTANCE SVM_1_AARGH					(C_SFX_DEF) {file= "svm_1_aargh_1.wav";				vol = 107;			};
				INSTANCE SVM_1_AARGH_1					(C_SFX_DEF) {file= "svm_1_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_1_AARGH_2					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_1_AARGH_3					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_1_AARGH_4					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_2_AARGH					(C_SFX_DEF) {file= "svm_2_aargh_1.wav";				vol = 107;			};				
				INSTANCE SVM_2_AARGH_1					(C_SFX_DEF) {file= "svm_2_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_2_AARGH_2					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_2_AARGH_3					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_2_AARGH_4					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_3_AARGH					(C_SFX_DEF) {file= "svm_3_aargh_1.wav";				vol = 107;			};				
				INSTANCE SVM_3_AARGH_1					(C_SFX_DEF) {file= "svm_3_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_3_AARGH_2					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 107;			};
				INSTANCE SVM_3_AARGH_3					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_3_AARGH_4					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_4_AARGH					(C_SFX_DEF) {file= "svm_4_aargh_1.wav";				vol = 107;			};
				INSTANCE SVM_4_AARGH_1					(C_SFX_DEF) {file= "svm_4_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_4_AARGH_2					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_4_AARGH_3					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_4_AARGH_4					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_5_AARGH					(C_SFX_DEF) {file= "svm_1_aargh_1.wav";				vol = 110;			};				
				INSTANCE SVM_5_AARGH_1					(C_SFX_DEF) {file= "svm_1_aargh_2.wav";				vol = 110;			};				
				INSTANCE SVM_5_AARGH_2					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 110;			};				
				INSTANCE SVM_5_AARGH_3					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 110;			};				
				INSTANCE SVM_5_AARGH_4					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 110;			};				

				INSTANCE SVM_6_AARGH					(C_SFX_DEF) {file= "svm_2_aargh_1.wav";				vol = 110;			};				
				INSTANCE SVM_6_AARGH_1					(C_SFX_DEF) {file= "svm_2_aargh_2.wav";				vol = 110;			};				
				INSTANCE SVM_6_AARGH_2					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 110;			};
				INSTANCE SVM_6_AARGH_3					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 110;			};				
				INSTANCE SVM_6_AARGH_4					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 110;			};				

				INSTANCE SVM_7_AARGH					(C_SFX_DEF) {file= "svm_3_aargh_1.wav";				vol = 110;			};
				INSTANCE SVM_7_AARGH_1					(C_SFX_DEF) {file= "svm_3_aargh_2.wav";				vol = 110;			};				
				INSTANCE SVM_7_AARGH_2					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 110;			};				
				INSTANCE SVM_7_AARGH_3					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 110;			};				
				INSTANCE SVM_7_AARGH_4					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 110;			};				

				INSTANCE SVM_8_AARGH					(C_SFX_DEF) {file= "svm_4_aargh_1.wav";				vol = 110;			};				
				INSTANCE SVM_8_AARGH_1					(C_SFX_DEF) {file= "svm_4_aargh_2.wav";				vol = 110;			};				
				INSTANCE SVM_8_AARGH_2					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 110;			};				
				INSTANCE SVM_8_AARGH_3					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 110;			};				
				INSTANCE SVM_8_AARGH_4					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 110;			};				

				INSTANCE SVM_9_AARGH					(C_SFX_DEF) {file= "svm_1_aargh_1.wav";				vol = 107;			};				
				INSTANCE SVM_9_AARGH_1					(C_SFX_DEF) {file= "svm_1_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_9_AARGH_2					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};
				INSTANCE SVM_9_AARGH_3					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_9_AARGH_4					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_10_AARGH					(C_SFX_DEF) {file= "svm_2_aargh_1.wav";				vol = 107;			};
				INSTANCE SVM_10_AARGH_1					(C_SFX_DEF) {file= "svm_2_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_10_AARGH_2					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_10_AARGH_3					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_10_AARGH_4					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_11_AARGH					(C_SFX_DEF) {file= "svm_3_aargh_1.wav";				vol = 107;			};				
				INSTANCE SVM_11_AARGH_1					(C_SFX_DEF) {file= "svm_3_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_11_AARGH_2					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_11_AARGH_3					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_11_AARGH_4					(C_SFX_DEF) {file= "svm_3_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_12_AARGH					(C_SFX_DEF) {file= "svm_4_aargh_1.wav";				vol = 107;			};				
				INSTANCE SVM_12_AARGH_1					(C_SFX_DEF) {file= "svm_4_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_12_AARGH_2					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 107;			};
				INSTANCE SVM_12_AARGH_3					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_12_AARGH_4					(C_SFX_DEF) {file= "svm_4_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_13_AARGH					(C_SFX_DEF) {file= "svm_1_aargh_1.wav";				vol = 107;			};
				INSTANCE SVM_13_AARGH_1					(C_SFX_DEF) {file= "svm_1_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_13_AARGH_2					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_13_AARGH_3					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_13_AARGH_4					(C_SFX_DEF) {file= "svm_1_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_14_AARGH					(C_SFX_DEF) {file= "svm_2_aargh_1.wav";				vol = 107;			};				
				INSTANCE SVM_14_AARGH_1					(C_SFX_DEF) {file= "svm_2_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_14_AARGH_2					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_14_AARGH_3					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_14_AARGH_4					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				

				INSTANCE SVM_15_AARGH					(C_SFX_DEF) {file= "svm_2_aargh_1.wav";				vol = 107;			};				
				INSTANCE SVM_15_AARGH_1					(C_SFX_DEF) {file= "svm_2_aargh_2.wav";				vol = 107;			};				
				INSTANCE SVM_15_AARGH_2					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_15_AARGH_3					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				
				INSTANCE SVM_15_AARGH_4					(C_SFX_DEF) {file= "svm_2_aargh_3.wav";				vol = 107;			};				


//	DEAD
				INSTANCE SVM_1_DEAD						(C_SFX_DEF) {file= "svm_1_dead.wav";				vol = 120;			};				
				INSTANCE SVM_2_DEAD						(C_SFX_DEF) {file= "svm_2_dead.wav";				vol = 120;			};				
				INSTANCE SVM_3_DEAD						(C_SFX_DEF) {file= "svm_3_dead.wav";				vol = 120;			};				
				INSTANCE SVM_4_DEAD						(C_SFX_DEF) {file= "svm_1_dead.wav";				vol = 120;			};				
				INSTANCE SVM_5_DEAD						(C_SFX_DEF) {file= "svm_2_dead.wav";				vol = 120;			};				
				INSTANCE SVM_6_DEAD						(C_SFX_DEF) {file= "svm_3_dead.wav";				vol = 120;			};				
				INSTANCE SVM_7_DEAD						(C_SFX_DEF) {file= "svm_1_dead.wav";				vol = 120;			};				
				INSTANCE SVM_8_DEAD						(C_SFX_DEF) {file= "svm_2_dead.wav";				vol = 120;			};				
				INSTANCE SVM_9_DEAD						(C_SFX_DEF) {file= "svm_3_dead.wav";				vol = 120;			};				
				INSTANCE SVM_10_DEAD					(C_SFX_DEF) {file= "svm_1_dead.wav";				vol = 120;			};				
				INSTANCE SVM_11_DEAD					(C_SFX_DEF) {file= "svm_2_dead.wav";				vol = 120;			};				
				INSTANCE SVM_12_DEAD					(C_SFX_DEF) {file= "svm_3_dead.wav";				vol = 120;			};				
				INSTANCE SVM_13_DEAD					(C_SFX_DEF) {file= "svm_1_dead.wav";				vol = 120;			};				
				INSTANCE SVM_14_DEAD					(C_SFX_DEF) {file= "svm_2_dead.wav";				vol = 120;			};				
				INSTANCE SVM_15_DEAD					(C_SFX_DEF) {file= "svm_2_dead.wav";				vol = 120;			};				

//	BERZERK
				INSTANCE SVM_1_BERZERK					(C_SFX_DEF) {file= "svm_1_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_2_BERZERK					(C_SFX_DEF) {file= "svm_2_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_3_BERZERK					(C_SFX_DEF) {file= "svm_3_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_4_BERZERK					(C_SFX_DEF) {file= "svm_1_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_5_BERZERK					(C_SFX_DEF) {file= "svm_2_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_6_BERZERK					(C_SFX_DEF) {file= "svm_3_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_7_BERZERK					(C_SFX_DEF) {file= "svm_1_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_8_BERZERK					(C_SFX_DEF) {file= "svm_2_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_9_BERZERK					(C_SFX_DEF) {file= "svm_3_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_10_BERZERK					(C_SFX_DEF) {file= "svm_1_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_11_BERZERK					(C_SFX_DEF) {file= "svm_2_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_12_BERZERK					(C_SFX_DEF) {file= "svm_3_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_13_BERZERK					(C_SFX_DEF) {file= "svm_1_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_14_BERZERK					(C_SFX_DEF) {file= "svm_2_berzerk.wav";				vol = 110;			};				
				INSTANCE SVM_15_BERZERK					(C_SFX_DEF) {file= "svm_3_berzerk.wav";				vol = 110;			};				


