func int On_OCC_GATE_Trigger ()
{
	PrintDebugNpc (PD_TA_CHECK,"On_OCC_GATE_Trigger");
    		
	var C_Npc wache;
	wache = Hlp_GetNpc (Grd_213_Torwache);
    wache.aivar[AIV_TRIGGER3] = 1;
 		
    wache = Hlp_GetNpc (Grd_212_Torwache);
    wache.aivar[AIV_TRIGGER3] = 1;
};

func int On_OCR_NORTHGATE_Trigger ()
{
	PrintDebugNpc (PD_TA_CHECK,"On_OCR_NORTHGATE_Trigger");
	var C_Npc wache;
	wache = Hlp_GetNpc (Grd_216_Torwache);
	wache.aivar[AIV_Trigger3] = 1;
	
	wache = Hlp_GetNpc (Grd_217_Torwache);
	wache.aivar[AIV_Trigger3] = 1;
};

func int On_OCR_MAINGATE_Trigger ()
{
    PrintDebugNpc (PD_TA_CHECK,"On_OCR_MAINGATE_Trigger");
    	
    var C_Npc wache;
    wache = Hlp_GetNpc (Grd_215_Torwache);
    wache.aivar[AIV_Trigger3] = 1;
	
	wache = Hlp_GetNpc (Grd_214_Torwache);
    wache.aivar[AIV_Trigger3] = 1;
};

func int On_OCC_BARONSDOOR_Trigger ()
{
    PrintDebugNpc (PD_TA_CHECK,"On_OCC_BARONSDOOR_Trigger");
    	
    var C_Npc wache;
    wache = Hlp_GetNpc (Grd_218_Gardist);
    wache.aivar[AIV_Trigger3] = 1;
	
	wache = Hlp_GetNpc (Grd_245_Gardist);
    wache.aivar[AIV_Trigger3] = 1;
};

func int ON_PSI_LABDOOR_TRIGGER ()
{
    PrintDebugNpc (PD_TA_CHECK,"ON_PSI_LABDOOR_TRIGGER");
    	
    var C_Npc wache;
    wache = Hlp_GetNpc (TPL_1406_Templer);
    wache.aivar[AIV_Trigger3] = 1;
};

func int ON_PSI_TEMPLE_GATE_TRIGGER ()
{
    PrintDebugNpc (PD_TA_CHECK,"ON_PSI_TEMPLE_GATE_TRIGGER");
    	
    var C_Npc wache;
    wache = Hlp_GetNpc (TPL_1413_Templer);
    wache.aivar[AIV_Trigger3] = 1;
	
	wache = Hlp_GetNpc (TPL_1430_Templer);
    wache.aivar[AIV_Trigger3] = 1;
    
    wache = Hlp_GetNpc (TPL_1431_Templer);
    wache.aivar[AIV_Trigger3] = 1;
    
    wache = Hlp_GetNpc (TPL_1432_Templer);
    wache.aivar[AIV_Trigger3] = 1;
};

func int ON_NC_MAGERAMP_TRIGGER ()
{
    PrintDebugNpc (PD_TA_CHECK,"ON_NC_MAGERAMP_TRIGGER");

//### Wachwechsel berücksichtigen!    	
    var C_Npc wache;
    wache = Hlp_GetNpc (SLD_702_Soeldner);
    wache.aivar[AIV_Trigger3] = 1;
    
    wache = Hlp_GetNpc (SLD_731_Soeldner);
    wache.aivar[AIV_Trigger3] = 1;
};

func int ON_NC_MAGECAVE_TRIGGER ()
{
    PrintDebugNpc (PD_TA_CHECK,"ON_NC_MAGECAVE_TRIGGER");
    	
    var C_Npc wache;
    wache = Hlp_GetNpc (SLD_725_Soeldner);
    wache.aivar[AIV_Trigger3] = 1;
    
    wache = Hlp_GetNpc (SLD_726_Soeldner);
    wache.aivar[AIV_Trigger3] = 1;
};

func int ON_NC_GATE_TRIGGER ()
{
//### Tor wird bisher noch nicht bewacht
    PrintDebugNpc (PD_TA_CHECK,"ON_NC_GATE_TRIGGER");
};
