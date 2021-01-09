
//////////////////////////////////////////
//	
// 	Particle-Effects 
//	Instance-Definitions, Engine Presets 
//	Author: Dieter Hildebrandt
//
//	** DO NOT MODIFY **
//	
//////////////////////////////////////////


INSTANCE ZBLOOD1 (C_PARTICLEFX)
{
     ppsvalue = 64.;
     ppscreateem_s = "ZBLOOD1_SPLAT";
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 30.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 750.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "BLOOD1.TGA";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "6 6";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE ZMODELLANDDUST (C_PARTICLEFX)
{
     ppsvalue = 8.;
     shptype_s = "BOX";
     shpdim_s = "20 5 20";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 2.99999993e-002;
     velvar = 9.99999978e-003;
     lsppartavg = 550.;
     lsppartvar = 350.;
     visname_s = "PUFF.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "35 35";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 80.;
};

INSTANCE ZSKYNIGHT1 (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shpdim_s = "800";
     velavg = 0.25;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 350.;
     visname_s = "ZSPARK1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "9 13";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};

INSTANCE ZUNDERWATER (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     shptype_s = "BOX";
     shpisvolume = 1;
     shpdim_s = "500 500 500";
     lsppartavg = 100000000.000000000;
     visname_s = "UNDERWATER_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 20.000000000;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE ZWATERRING (C_PARTICLEFX)
{
      ppsvalue = 1.000000000;
      ppsislooping = 0;
      dirmode_s = "RAND";
      lsppartavg = 2500.000000000;
      lsppartvar = 500.000000000;
      flycolldet_b = 0;
      visname_s = "WATERRING.TGA";
      visorientation_s = "VOB";
      vistexisquadpoly = 1;
      vistexanifps = 0.000000000;
      vistexaniislooping = 0;
      vistexcolorstart_s = "200 200 255";
      vistexcolorend_s = "200 255 255";
      vissizestart_s = "5 5";
      vissizeendscale = 5.072220325;
      visalphafunc_s = "ADD";
      visalphastart = 150.000000000;
};

INSTANCE PFX_WATERSPLASH (C_PARTICLEFX)
{
     ppsvalue = 35.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "CIRCLE";
     shpisvolume = 1;
     shpdim_s = "10 0 10";
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 30.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.200000003;
     velvar = 0.029999999;
     lsppartavg = 800.000000000;
     lsppartvar = 500.000000000;
     flygravity_s = "0 -0.0005 0";
     flycolldet_b = 3;
     visname_s = "WATERSPLASH1.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "150 200 255";
     vissizestart_s = "3 3";
     vissizeendscale = 8.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};
