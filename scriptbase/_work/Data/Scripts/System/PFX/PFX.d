	
//////////////////////////////////////
//	
// 	Particle-Effects 
//	Instance-Definitions 
//	
//////////////////////////////////////


// INSTANCE PartikelEffekt1 (C_ParticleFX) 
// INSTANCE PartikelEffekt1 (C_ParticleFXProto) 

// ******************************************************************************************
// Spiel PFX 
// ******************************************************************************************


INSTANCE FIREGOLEM_FIRE (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "2 1 1";
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0004 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 180 180";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "5 5";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE FIREGOLEM_DEADSMOKE (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "2 2 2 2 1 1 1 1";
     ppsfps = 0.500000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "80";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 50 0";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "30 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};


INSTANCE ICEGOLEM_GLITTER (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "2 1 1";
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.001000000;
     lsppartavg = 500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 255";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "25 25";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE ICEGOLEM_DEADSMOKE (C_PARTICLEFX)
{
     ppsvalue = 70.000000000;
     ppsscalekeys_s = "2 2 2 2 1 1 1 1";
     ppsfps = 0.500000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -100 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "220 255 255";
     vistexcolorend_s = "220 255 255";
     vissizestart_s = "25 25";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE LAVAOUTBURST (C_PARTICLEFX)
{
     ppsvalue = 15.000000000;
     ppsscalekeys_s = "1 1 1 1 20 1 1 1 1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "1 1 1 1 20 1 1 1 1 1 1 5 1 10 1 2 3 2";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.300000012;
     velvar = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 100";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


INSTANCE SNOW (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 500 0";
     shpisvolume = 1;
     shpdim_s = "300";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = -89.000000000;
     velavg = 0.050000001;
     velvar = 0.020000000;
     lsppartavg = 5000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MFX_SLEEP_STAR.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE CPFX_IAI_METAL (C_PARTICLEFX)
{
     ppsvalue = 25.;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 3.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.;
     dirangleheadvar = 10.;
     dirangleelev = 180.;
     dirangleelevvar = 10.;
     velavg = 0.200000003;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 300.;
     flygravity_s = "0 -0.0003 0";
     flycolldet_b = 1;
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "2 2";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};


//  @@@@@@@@@@@@@@@@@
//  Species-Blood 
//  @@@@@@@@@@@@@@@@@

INSTANCE BFX_PRESET1 (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 8.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     visname_s = "BPFX_SCAVENGER2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "8 8";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};

INSTANCE BFX_PRESET2 (C_PARTICLEFX)
{
     ppsvalue = 300.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 8.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     visname_s = "BPFX_SCAVENGER2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 255 50";
     vistexcolorend_s = "0 255 0";
     vissizestart_s = "12 12";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};

INSTANCE BFX_GOLEM (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.300000012;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "BPFX_GOLEM_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 180";
     vistexcolorend_s = "150 150 150";
     vissizestart_s = "10 10";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     trltexture_s = "=";
     mrktexture_s = "0";
};

INSTANCE BFX_DEMON (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 8.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};

INSTANCE BFX_SKELETON (C_PARTICLEFX)
{
     ppsvalue = 150.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.300000012;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "BPFX_SKELETON_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 200";
     vistexcolorend_s = "150 150 150";
     vissizestart_s = "8 8";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     trltexture_s = "=";
     mrktexture_s = "0";
};

INSTANCE BFX_ZOMBIE (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 8.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     flycolldet_b = 3;
     visname_s = "BPFX_ZOMBIE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "150 150 150";
     vissizestart_s = "15 15";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};



INSTANCE BFX_PRESET1_DEAD (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 0 0 0.8 0 0 0.5 0 0 0.3 0 0";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 15.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     visname_s = "BPFX_SCAVENGER.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "100 100 100";
     vissizestart_s = "5 5";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrkfadespeed = 0.100000001;
     mrktexture_s = "BQM_SCAVENGER.TGA";
     mrksize = 50.000000000;
};

INSTANCE BFX_PRESET2_DEAD (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1 0 0 0.8 0 0 0.5 0 0 0.3 0 0";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 15.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0005 0";
     visname_s = "BPFX_SCAVENGER.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "50 255 50";
     vistexcolorend_s = "50 255 50";
     vissizestart_s = "9 9";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "=";
     mrktexture_s = "=";
};

INSTANCE BFX_DEMON_DEAD (C_PARTICLEFX)
{
     ppsvalue = 30.000000000;
     ppsscalekeys_s = "5 5 5 3 3 3 3";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "100 -100 20";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpmesh_s = "Demon_Die.3ds";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 15.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 15.000000000;
     velavg = 0.000100000;
     velvar = 0.010000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.00005 0";
     visname_s = "DEMON_DIE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     trltexture_s = "=";
};

INSTANCE BFX_ZOMBIE_DEAD	(C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "2 3 2 1";
     ppsissmooth = 1;
     ppsfps = 4.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "5 5";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE DEMON_ATTACK (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "2 3 2 1";
     ppsissmooth = 1;
     ppsfps = 4.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.008000000;
     velvar = 0.029999999;
     lsppartavg = 300.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 220 220";
     vistexcolorend_s = "255 220 220";
     vissizestart_s = "5 5";
     vissizeendscale = 15.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};


//  @@@@@@@@@@@@@@@@@
//  Cutscene by KaiRo
//  @@@@@@@@@@@@@@@@@

INSTANCE FIREFLOOR (C_PARTICLEFX)
{
     ppsvalue = 800.000000000;
     ppsscalekeys_s = "1 1 1 1 0.8 0.6 0.4 0.2";
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "150";
     shpmesh_s = "COLDUMMY.3DS";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.001000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 128 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 12.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 200.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};




INSTANCE CS_FOKUS1 (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "40";
     shpscalekeys_s = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.000100000;
     lsppartavg = 1500.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 100";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
};

INSTANCE CS_FOKUS2 (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.600000024;
     velvar = 0.200000003;
     lsppartavg = 400.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WAVEOFINSANITY_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 3.000000000;
};


INSTANCE CS_FOKUS3 (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 20.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.300000012;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 255";
     vistexcolorend_s = "100 100 255";
     vissizestart_s = "1 1";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
     trlfadespeed = 0.500000000;
     trltexture_s = "LIGHTNING_BIG_A0.TGA";
     trlwidth = 10.000000000;
};

INSTANCE CS_WATERSPLASH (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1 0.3 2";
     ppsissmooth = 1;
     ppsfps = 5.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.000000000;
     dirangleheadvar = 45.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 45.000000000;
     velavg = 0.600000024;
     velvar = 0.200000003;
     lsppartavg = 1300.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0018 0";
     visname_s = "WATER_DRIPPING.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 100 200";
     vissizestart_s = "20 20";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     trlfadespeed = 0.200000003;
     trltexture_s = "WATER_BOOM_03.TGA";
     trlwidth = 5.000000000;
};

INSTANCE BARRIEREWARNING_BOX (C_PARTICLEFX)
{
     ppsvalue = 500.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "140 0 100";
     shpdistribtype_s = "RAND";
     shpdim_s = "120 120 120";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 150.000000000;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 190 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "60 60";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 150.000000000;
};

INSTANCE BARRIERE (C_PARTICLEFX)
{
     ppsvalue = 2000.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.000000000;
     shptype_s = "BOX";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "140 0 100";
     shpdistribtype_s = "RAND";
     shpdim_s = "4000 6000 1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.001000000;
     velvar = 0.000100000;
     lsppartavg = 100.000000000;
     flygravity_s = "0 0 0";
     visname_s = "LIGHTNING_BIG_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 10.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1000 1000";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 20.000000000;
     visalphaend = 20.000000000;
};


INSTANCE MAGICCOULDRON (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "DIR";
     shpdim_s = "20";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleelev = 90.000000000;
     velavg = 0.150000006;
     velvar = 0.050000001;
     lsppartavg = 18000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MAGICCOULDRON.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "100 200 255";
     vistexcolorend_s = "255 0 255";
     vissizestart_s = "40 40";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 50.000000000;
};

INSTANCE LIGHTNINGS (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 150.000000000;
     velavg = 0.300000012;
     lsppartavg = 15000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WATERSPLASH2.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "20 20";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 50.000000000;
     visalphaend = 50.000000000;
     trlfadespeed = 0.029999999;
     trltexture_s = "ELECTRIC_A0.TGA";
     trlwidth = 150.000000000;
};

INSTANCE CAULDRON_BUBBLES (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpdistribtype_s = "DIR";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleelev = 90.000000000;
     velavg = 0.001000000;
     velvar = 0.001000000;
     lsppartavg = 800.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0 0";
     visname_s = "BUBBLE.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphaend = 255.000000000;
};


INSTANCE MINE_BRICKS (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 300 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "400 0 400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     velavg = 0.001000000;
     velvar = 0.010000000;
     lsppartavg = 8000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.001 0";
     flycolldet_b = 1;
     visname_s = "MINE_BRICK.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE MINE_DUST (C_PARTICLEFX)
{
     ppsvalue = 50.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -120 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "400 0 400";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     velavg = 0.079999998;
     velvar = 0.010000000;
     lsppartavg = 5000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "1 1";
     vissizeendscale = 300.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};



//  @@@@@@@@@@@@@@
//  ItemI by KaiRo
//  @@@@@@@@@@@@@@

INSTANCE SOAPFOAM (C_PARTICLEFX)
{
     ppsvalue = 40.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalefps = 10.;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.;
     dirangleheadvar = 10.;
     dirangleelev = 150.;
     dirangleelevvar = 10.;
     velavg = 1.500000013038516e-003;
     lsppartavg = 8000.;
     flygravity_s = "0 0 0";
     visname_s = "SOAPFOAM.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "8 8";
     vissizeendscale = 1.5;
     visalphafunc_s = "BLEND";
     visalphastart = 200.;
};


//  @@@@@@@@@@@@@@
//  MobsI by KaiRo
//  @@@@@@@@@@@@@@

INSTANCE PICKORE (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 0";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.200000003;
     velvar = 0.070000000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 -0.0008 0";
     flycolldet_b = 1;
     visname_s = "OREBRICKS.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 0.300000012;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};


INSTANCE COALGLOW (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpisvolume = 1;
     shpdim_s = "25";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     lsppartavg = 2000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "COALGLOW.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "12 12";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};

INSTANCE THROWDRUGS (C_PARTICLEFX)
{
     ppsvalue = 600.;
     ppsscalekeys_s = "1";
     shptype_s = "POINT";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 20.;
     dirangleheadvar = 10.;
     dirangleelev = 150.;
     dirangleelevvar = 10.;
     velavg = 5.99999987e-002;
     velvar = 1.99999996e-002;
     lsppartavg = 5000.;
     flygravity_s = "0 -0.00007 0";
     visname_s = "DRUGPARTICLE.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 150.;
};


INSTANCE PSILAB_DROPS (C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 90.;
     dirangleelev = -90.;
     dirangleelevvar = 3.;
     velavg = 5.00000007e-002;
     velvar = 1.99999996e-002;
     lsppartavg = 750.;
     flygravity_s = "0 0 0";
     visname_s = "LABDROPS.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 140 110";
     vistexcolorend_s = "170 120 110";
     vissizestart_s = "4 4";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 70.;
     visalphaend = 70.;
};
     

INSTANCE PSILAB_GLOW (C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999978e-003;
     lsppartavg = 3000.;
     flygravity_s = "0 0 0";
     visname_s = "LABGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 150 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "1 1";
     vissizeendscale = 50.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
     visalphaend = 0.;
};


INSTANCE PSILAB_SMOKE (C_PARTICLEFX)
{
     ppsvalue = 5.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 4000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "LABSMOKE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 70.;
};

//  @@@@@@@@@@@@@@
//  Magic by KaiRo
//  @@@@@@@@@@@@@@

INSTANCE ORE_HIGHLIGHT (C_PARTICLEFX)
{
     ppsvalue = 60.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     //ppscreateem_s = "ORE_GLOW";
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpisvolume = 1;
     shpdim_s = "10";
     shpmesh_s = "NC_OREHEAP_PFX.3DS";
     shpscalefps = 10.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.000010000;
     velvar = 0.000010000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "OREHIGHLIGHT.TGA";
     visorientation_s = "WORLD";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 100.000000000;
};

INSTANCE ORE_GLOW (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "MESH";
     shpfor_s = "OBJECT";
     shpoffsetvec_s = "0 0 10";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "10";
     shpmesh_s = "NC_OREHEAP_PFX.3DS";
     shpscalefps = 10.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     diranglehead = 20.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 150.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.001500000;
     lsppartavg = 3000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "OREGLOW.TGA";
     visorientation_s = "NONE";
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 200 255";
     vissizestart_s = "5 5";
     vissizeendscale = 50.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE FLAMETHROWER (C_PARTICLEFX)
{
     ppsvalue = 120.000000000;
     ppsscalekeys_s = "1 2 3";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 180.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.0005 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 8.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 150 150";
     vissizestart_s = "1 1";
     vissizeendscale = 100.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE DEMON_FLAMETHROWER (C_PARTICLEFX)
{
     ppsvalue = 120.000000000;
     ppsscalekeys_s = "1 2 2 1";
     ppsfps = 2.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 180.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.0005 0";
     visname_s = "FIREFLARE.TGA";
     visorientation_s = "NONE";
     vistexanifps = 8.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 150 150";
     vissizestart_s = "1 1";
     vissizeendscale = 100.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE CRW_GREENSMOKE (C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsscalekeys_s = "0.1 0.2 0.3 0.4 1 0.1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 2.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = -90.;
     dirangleheadvar = 10.;
     dirangleelev = 180.;
     dirangleelevvar = 10.;
     velavg = 5.00000007e-002;
     velvar = 1.99999996e-002;
     lsppartavg = 5000.;
     lsppartvar = 200.;
     flygravity_s = "0 0.00001 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 150 0";
     vissizestart_s = "3 3";
     vissizeendscale = 10.;
     visalphafunc_s = "BLEND";
     visalphastart = 100.;
};

INSTANCE CRW_GLIBBER (C_PARTICLEFX)
{
     ppsvalue = 60.;
     ppsscalekeys_s = "1 2 3";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.;
     dirangleheadvar = 10.;
     dirangleelev = 180.;
     dirangleelevvar = 10.;
     velavg = 0.300000012;
     velvar = 0.100000001;
     lsppartavg = 500.;
     lsppartvar = 200.;
     flygravity_s = "0 0.0005 0";
     visname_s = "FIRE2_A0.TGA";
     visorientation_s = "NONE";
     vistexanifps = 8.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "180 180 255";
     vistexcolorend_s = "50 50 50";
     vissizestart_s = "1 1";
     vissizeendscale = 100.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
     visalphaend = 30.;
};


//Magische Aura
INSTANCE RESURRECTION (C_PARTICLEFX)
{
     ppsvalue = 300.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 750.;
     flygravity_s = "0 0 0";
     visname_s = "BLUEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 4.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "50 50";
     vissizeendscale = 1.00000005e-003;
     visalphafunc_s = "ADD";
     visalphaend = 100.;
};

INSTANCE TELEKINESE (C_PARTICLEFX)
{
     ppsvalue = 80.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpmesh_s = "Healbody.3DS";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 1500.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "TELSTURM.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 128 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};

/*INSTANCE MAGICGLOW (C_PARTICLEFX)
{
     ppsvalue = 80.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpmesh_s = "MIN_MOB_STONE_V2_20";
     shpmeshrender_b = 1;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 3000.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "BLUEGLOW.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 255 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "100 100";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 50.;
};
*/
INSTANCE ORGANICFOG (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "300";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "TARGET";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 0.100000001;
     velvar = 2.99999993e-002;
     lsppartavg = 2700.;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 18.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 150 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "100 100";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255.;
};


INSTANCE ELECTRIC (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 1.000000000;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "150";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 0";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     flygravity_s = "0 0 0";
     visname_s = "ELECTRIC_A0.TGA";
     visorientation_s = "NONE";
     vistexanifps = 18.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 150 255";
     vistexcolorend_s = "0 0 150";
     vissizestart_s = "50 50";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
     visalphaend = 50.000000000;
};

INSTANCE TeleSturm (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 1500.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "TelSturm.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 0;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};

  

//  @@@@@@@@@@@@@@@@@@@@
//  Environment by KaiRo
//  @@@@@@@@@@@@@@@@@@@@


INSTANCE STOMPERDUST (C_PARTICLEFX)
{
     ppsvalue = 90.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "120";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 50.;
     velavg = 7.99999982e-002;
     velvar = 9.99999978e-003;
     lsppartavg = 1000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 3.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE GOLEMDUST (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsfps = 3.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -50 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "40";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     velavg = 0.079999998;
     velvar = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 200.000000000;
};

INSTANCE SWAMPSHARKSLIME (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsfps = 3.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 -20 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     lsppartavg = 8000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 220";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "30 30";
     vissizeendscale = 0.500000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE FIRE (C_PARTICLEFX)
{
     ppsvalue = 25.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "humanburn.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "40 40";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE FIRE_MEDIUM (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "=";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.100000001;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0.0003 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE FIRE_HOT (C_PARTICLEFX)
{
     ppsvalue = 90.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpisvolume = 1;
     shpdim_s = "40";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.200000003;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 200 200";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "60 60";
     vissizeendscale = 0.500000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE FIRE_SWAMP (C_PARTICLEFX)
{
     ppsvalue = 18.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "20";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0 0 400";
     dirangleelev = 90.000000000;
     velavg = 0.010000000;
     lsppartavg = 1000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 0.0002 0";
     visname_s = "FIRE_COMPLETE_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 255 100";
     vistexcolorend_s = "100 200 0";
     vissizestart_s = "40 40";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE Fire_Sparks (C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "0.2 0.2 0.5 0.2 0.2 0.3 0.5 0.3 0.7";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 80.;
     velavg = 0.100000001;
     velvar = 0.200000003;
     lsppartavg = 300.;
     lsppartvar = 3000.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "2 2";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};

INSTANCE ANVIL_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 180.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 2000.000000000;
     lsppartvar = 300.000000000;
     flygravity_s = "0 -0.0003 0";
     flycolldet_b = 1;
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "2 2";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE SHARPSTONE_SPARKS (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1 2 3";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 3.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirmodetargetfor_s = "OBJECT";
     dirmodetargetpos_s = "0.1 -0.1 0";
     diranglehead = 180.;
     dirangleheadvar = 10.;
     dirangleelev = 180.;
     dirangleelevvar = 10.;
     velavg = 0.200000003;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 300.;
     flygravity_s = "0 -0.0003 0";
     flycolldet_b = 1;
     visname_s = "FIRETAIL.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 8.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "2 2";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};


// FIRE_SMOKE ist momentan noch identisch mit LIGHTSMOKE
// Feuerrauch: visname_s = "SMK_FIRE.TGA"
INSTANCE FIRE_SMOKE (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "25";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.039999999;
     lsppartavg = 5500.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "140 140 140";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 2.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 150.000000000;
};

INSTANCE TORCH (C_PARTICLEFX)
{
     ppsvalue = 80.000000000;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "=";
     shpdistribtype_s = "UNIFORM";
     shpdim_s = "7";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 360.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.100000001;
     lsppartavg = 350.000000000;
     flygravity_s = "0 0.0003 0";
     visname_s = "HUMANBURN.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 200 200";
     vissizestart_s = "5 5";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};



INSTANCE TORCH_SMOKE (C_PARTICLEFX)
{
     ppsvalue = 8.;
     ppsscalekeys_s = "0.2 1 0.4 2 0.6 2.4 1.2 3 0.5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 4.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 3000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "SMK_FIRE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 5.;
     visalphafunc_s = "BLEND";
     visalphastart = 80.;
};

// GREENSMOKE ist momentan noch identisch mit LIGHTSMOKE
// Grüner Rauch: visname_s = "GREENSMOKE.TGA"
INSTANCE GreenSmoke (C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsscalekeys_s = "0.1 0.2 0.1 0 0.3 0.2";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 1.99999996e-002;
     lsppartavg = 8000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 40.;
     visalphafunc_s = "BLEND";
     visalphastart = 150.;
};

INSTANCE AMBIENTFOG (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "5";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "2000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     lsppartavg = 8000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "400 400";
     vissizeendscale = 3.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 200.000000000;
};

INSTANCE LAVAFOG_NS (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100 10 300";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "60 60";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 50.000000000;
};

INSTANCE LAVAFOG_OW (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "300 10 100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "60 60";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 50.000000000;
};

INSTANCE LAVAFOG_BIG (C_PARTICLEFX)
{
     ppsvalue = 40.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100 10 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.010000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.0001 0";
     visname_s = "FIRESMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 100 100";
     vissizestart_s = "60 60";
     vissizeendscale = 4.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
     visalphaend = 50.000000000;
};


INSTANCE GROUNDFOG (C_PARTICLEFX)
{
     ppsvalue = 5.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "500";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     velvar = 0.008000000;
     lsppartavg = 15000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 -0.000005 0";
     visname_s = "GROUNDFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 30.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};



INSTANCE CS_MILTENFOG (C_PARTICLEFX)		// disabled by value
{
     ppsvalue = 2.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000 1000 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MAGICFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 100 200";
     vissizestart_s = "2 2";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 0.000000000;
};

/*   OLD

INSTANCE CS_MILTENFOG (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "1000 1000 1000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     velavg = 0.020000000;
     lsppartavg = 3000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     visname_s = "MAGICFOG.TGA";
     visorientation_s = "NONE";
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 100 200";
     vissizestart_s = "40 40";
     vissizeendscale = 25.000000000;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};  */

INSTANCE WATERVAPOUR (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     velvar = 9.99999978e-003;
     lsppartavg = 2000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 2.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE LightSmoke(C_PARTICLEFX)
{
     ppsvalue = 5.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 0.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 8000.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "groundfog.tga";
     visorientation_s = "NONE";
     vistexisquadpoly = 0;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "10 10";
     vissizeendscale = 30.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

// MAGICPOTIONSMOKE ist momentan noch identisch mit LIGHTSMOKE
// Grüner Rauch: visname_s = "GREENSMOKE.TGA"
INSTANCE MAGICPOTIONSMOKE (C_PARTICLEFX)
{
     ppsvalue = 5.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpisvolume = 1;
     shpdim_s = "15";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 3.99999991e-002;
     lsppartavg = 5500.;
     lsppartvar = 400.;
     flygravity_s = "0 0 0";
     visname_s = "SMK_16BIT_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 30.;
     visalphafunc_s = "BLEND";
     visalphastart = 150.;
};




INSTANCE Waterfall1 (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "0.2 1 0.4 2 0.6 2.4 1.2 3 0.5";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 25.;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "10 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "800";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 200.;
     dirangleheadvar = 45.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 0.239999995;
     velvar = 5.00000007e-002;
     lsppartavg = 3000.;
     lsppartvar = 1500.;
     flygravity_s = "0 -0.00015 0";
     visname_s = "WATERSPLASH2.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "15 15";
     vissizeendscale = 2.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE WaterfallComplete (C_PARTICLEFX)
{
     ppsvalue = 10.;
     ppsscalekeys_s = "1";
     shptype_s = "LINE";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "300";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleelev = -90.;
     lsppartavg = 3000.;
     flygravity_s = "0 -0.0002 0";
     visname_s = "WATERFALL_A0.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "80 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "160 160";
     vissizeendscale = 5.;
     visalphafunc_s = "BLEND";
     visalphaend = 255.;
};


INSTANCE WATERFALL2 (C_PARTICLEFX)
{
     ppsvalue = 40.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 25.;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "10 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "800 0 0";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 60.;
     dirangleelev = -90.;
     dirangleelevvar = 90.;
     velavg = 7.99999982e-002;
     velvar = 1.99999996e-002;
     lsppartavg = 5200.;
     lsppartvar = 400.;
     flygravity_s = "0 0.00007 0";
     visname_s = "WATERSPLASH3.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "150 150 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "80 80";
     vissizeendscale = 4.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};
     
INSTANCE WATERSPLASH (C_PARTICLEFX)
{
     ppsvalue = 100.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 20.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 0.200000003;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 200.;
     flygravity_s = "0 -0.0005 0";
     visname_s = "WATERSPLASH2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 8.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};


INSTANCE HUMAN_WASHSELF1 (C_PARTICLEFX)
{
     ppsvalue = 600.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 20.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.001000000;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 30.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 1000.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 -0.0005 0";
     visname_s = "WASHSELF2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 200 255";
     vissizestart_s = "2 2";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLENND";
     visalphastart = 255.000000000;
     trlfadespeed = 1.500000000;
     trltexture_s = "JUSTWHITE.TGA";
     trlwidth = 0.500000000;
};


INSTANCE HUMAN_WASHSELF2 (C_PARTICLEFX)
{
     ppsvalue = 2000.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 40.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 0.001000000;
     shpdim_s = "10";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 60.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 60.000000000;
     velavg = 0.200000003;
     velvar = 0.050000001;
     lsppartavg = 500.000000000;
     lsppartvar = 200.000000000;
     flygravity_s = "0 -0.0005 0";
     visname_s = "WASHSELF2.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "100 200 255";
     vissizestart_s = "3 3 ";
     vissizeendscale = 5.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     trlfadespeed = 1.500000000;
     trltexture_s = "JUSTWHITE.TGA";
     trlwidth = 0.400000006;
};




INSTANCE BloodWater (C_PARTICLEFX)
{
     ppsvalue = 15.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "0";
     shpscalekeys_s = "0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 40.;
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 9.99999978e-003;
     lsppartavg = 5000.;
     lsppartvar = 100.;
     flygravity_s = "0 0 0";
     visname_s = "BLOODKAI.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "160";
     vistexcolorend_s = "100 25 0";
     vissizestart_s = "0.5 0.5";
     vissizeendscale = 20.;
     visalphafunc_s = "BLEND";
     visalphastart = 200.;
};

INSTANCE CPFX_STONE (C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "0";
     shpscalekeys_s = "0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirangleheadvar = 40.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 1200.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 -0.0005 0";
     flycolldet_b = 3;
     visname_s = "CPFX_STONE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "7 7";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 200.000000000;
     visalphaend = 100.000000000;
};

INSTANCE CPFX_Wood	(C_PARTICLEFX)
{
     ppsvalue = 200.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 10.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "0";
     shpscalekeys_s = "0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "RAND";
     dirangleheadvar = 40.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 30.000000000;
     velavg = 0.100000001;
     velvar = 0.050000001;
     lsppartavg = 1200.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 -0.0005 0";
     flycolldet_b = 3;
     visname_s = "CPFX_Wood.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "7 7";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 200.000000000;
     visalphaend = 100.000000000;
};

INSTANCE WASTEOUTLET (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 0.001000000;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     diranglehead = 10.000000000;
     dirangleheadvar = 0.000000000;
     dirangleelev = -40.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.050000001;
     velvar = 0.029999999;
     lsppartavg = 4400.000000000;
     flygravity_s = "0 -0.0001 0";
     visname_s = "WATER_DRIPPING.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 3";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 20.000000000;
     visalphaend = 50.000000000;
};

INSTANCE WATEROUTLET (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 0.001000000;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     diranglehead = 10.000000000;
     dirangleheadvar = 0.000000000;
     dirangleelev = -40.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.050000001;
     velvar = 0.029999999;
     lsppartavg = 4400.000000000;
     flygravity_s = "0 -0.0001 0";
     visname_s = "WATER_DRIPPING.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 3";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 20.000000000;
     visalphaend = 50.000000000;
};


INSTANCE WASTEOUTLET_BOTTOM (C_PARTICLEFX)
{
     ppsvalue = 100.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RANDOM";
     shpisvolume = 1;
     shpdim_s = "70";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     diranglehead = 10.000000000;
     dirangleheadvar = 10.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 10.000000000;
     velavg = 0.010000000;
     lsppartavg = 500.000000000;
     flygravity_s = "0 0 0";
     visname_s = "WATER_DRIPPING_GROUND.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 255 100";
     vistexcolorend_s = "150 200 255";
     vissizestart_s = "1 1";
     vissizeendscale = 10.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
};

INSTANCE WAVERINGS  (C_PARTICLEFX)
{
     ppsvalue = 10.000000000;
     ppsscalekeys_s = "1 0.1 0.3 0.8 0.2 1 0.1";
     ppsissmooth = 1;
     ppsfps = 3.000000000;
     shpoffsetvec_s = "0 0 0";
     dirmode_s = "RAND";
     lsppartavg = 2500.000000000;
     lsppartvar = 500.000000000;
     flycolldet_b = 1;
     visname_s = "WASSERRINGE_A0.TGA";
     visorientation_s = "VOB";
     vistexisquadpoly = 1;
     vistexanifps = 25.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 200 255";
     vistexcolorend_s = "200 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 5.072220325;
     visalphafunc_s = "ADD";
     visalphastart = 100.000000000;
};

INSTANCE Bubbles (C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsscalekeys_s = "1 2 0.5 0.8 1 1.3";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalekeys_s = "0";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 60.;
     dirangleelev = 90.;
     dirangleelevvar = 40.;
     velavg = 9.99999978e-003;
     lsppartavg = 4200.;
     lsppartvar = 100.;
     flygravity_s = "0 0.00001 0";
     visname_s = "BUBBLE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 3";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 200.;
     visalphaend = 0.;
};


INSTANCE FLIES (C_PARTICLEFX)
{
     ppsvalue = 30.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     ppsfps = 10.;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirangleheadvar = 50.;
     dirangleelev = 90.;
     dirangleelevvar = 80.;
     velavg = 0.100000001;
     lsppartavg = 3000.;
     lsppartvar = 100.;
     flygravity_s = "0 0 0";
     visname_s = "BLOODKAI.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "1 1";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
};

INSTANCE BIRDFLY (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsissmooth = 1;
     ppsfps = 1.000000000;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RANDOM";
     shpdistribwalkspeed = 0.001000000;
     shpisvolume = 1;
     shpdim_s = "50";
     shpscalekeys_s = "0 1 2 0.4 1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirangleheadvar = 10.000000000;
     dirangleelev = 10.000000000;
     dirangleelevvar = 2.000000000;
     velavg = 0.500000000;
     velvar = 0.029999999;
     lsppartavg = 100000.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0.0001 0 0";
     visname_s = "BIRDFLY_A0.TGA";
     visorientation_s = "NONE";
     vistexanifps = 12.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "30 30";
     vissizeendscale = 0.010000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};


INSTANCE GLOWWORMS (C_PARTICLEFX)
{
     ppsvalue = 20.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "20000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.200000003;
     velvar = 0.100000001;
     lsppartavg = 4000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0.00005 0.00005";
     visname_s = "GLOWWORM.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 200 200";
     vistexcolorend_s = "100 200 200";
     vissizestart_s = "6 6";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphastart = 255.000000000;
};

INSTANCE GLOWWORMS_SMALL (C_PARTICLEFX)
{
     ppsvalue = 4.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "SPHERE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "200";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.000000000;
     dirangleelevvar = 180.000000000;
     velavg = 0.029999999;
     lsppartavg = 4000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "0 0 0";
     flycolldet_b = 0;
     visname_s = "GLOWWORM_AURA_4.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "70 70";
     vissizeendscale = 0.100000001;
     visalphafunc_s = "ADD";
     visalphaend = 255.000000000;
};


INSTANCE LEAVES (C_PARTICLEFX)
{
     ppsvalue = 9.000000000;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "5000";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.000000000;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 20.000000000;
     lsppartavg = 10000.000000000;
     lsppartvar = 400.000000000;
     flygravity_s = "-0.00004 -0.00009 0";
     flycolldet_b = 0;
     visname_s = "LEAF_A0.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 15.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "250 100 150";
     vistexcolorend_s = "250 100 150";
     vissizestart_s = "50 50";
     vissizeendscale = 1.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 255.000000000;
     visalphaend = 255.000000000;
};

INSTANCE GREENWASTE (C_PARTICLEFX)
{
     ppsvalue = 200.;
     ppsscalekeys_s = "1";
     shptype_s = "LINE";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "20";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 90.;
     dirangleelev = -90.;
     dirangleelevvar = 10.;
     velavg = 1.99999996e-002;
     velvar = 5.00000007e-002;
     lsppartavg = 6500.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "GREENWASTE.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 140 110";
     vistexcolorend_s = "170 120 110";
     vissizestart_s = "8 8";
     vissizeendscale = 4.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

//INSTANCE MENU_REDPLASMA (C_PARTICLEFX)
INSTANCE FIRE_MENU (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "LINE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 1500.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};

/*  INSTANCE FIRE_MAGIC (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsissmooth = 1;
     shptype_s = "MESH";
     shpfor_s = "MESH";
	 shpmesh_s = "special_sword.3ds";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpisvolume = 1;
     shpdim_s = "100";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     velavg = 9.99999975e-005;
     lsppartavg = 1500.;
     lsppartvar = 500.;
     flygravity_s = "0 0 0";
     visname_s = "GREENSMOKE.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 50 0";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "5 5";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
};  */


//  @@@@@@@@@@@@@@@@@@
//  Created by Carsten
//  @@@@@@@@@@@@@@@@@@
  
  
  
  
  
INSTANCE SPIT (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 20";
     shpdim_s = "0 0 0";
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleelevvar = 1.5;
     velavg = 0.200000003;
     velvar = 4.99999989e-003;
     lsppartavg = 5000.;
     lsppartvar = 400.;
     flygravity_s = "0 -0.001 0";
     visname_s = "WATERSPLASH3.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 100.;
};

INSTANCE PEE (C_PARTICLEFX)
{
     ppsvalue = 100.;
     ppsscalekeys_s = "1 0 1 0 2 0.4 12 16 0.3 0 1";
     shptype_s = "POINT";
     shpfor_s = "object";
     shpisvolume = 1; 
     shpdim_s = "300";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 270.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
     velavg = 0.200000003;
     velvar = 4.99999989e-003;
     lsppartavg = 700.;
     flygravity_s = "0 -0.002 0";
     visname_s = "PARTYEL1.TGA";
     visorientation_s = "VELO";     
     vistexcolorstart_s = "255 255 255";     
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "3 15";     
     vissizeendscale = 2.;     
     visalphafunc_s = "BLEND";     
     visalphastart = 30.;
};

INSTANCE FOUNTAIN (C_PARTICLEFX)
{
     ppsvalue = 50.;
     ppsscalekeys_s = "1 1.2 0.6 0.3 1.2";
     ppsIsLooping = 1;
     ppsIsSmooth = 1;
     ppsFps = 5;
     shptype_s = "sphere";
     shpfor_s = "world";
     shpisvolume = 1; 
     shpdim_s = "15";
     shpscalefps = 4.;
     dirmode_s = "DIR";
     dirfor_s = "world";
     diranglehead = 270.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
     velavg = 0.100000003;
     velvar = 4.99999989e-003;
     lsppartavg = 1000.;
     lsppartvar = 200;
     flygravity_s = "0 -0.0004 0";
     visname_s = "zDebris0_a0.TGA";
     visorientation_s = "VELO";     
     vistexcolorstart_s = "100 100 200";     
     vistexisquadpoly = 1;
     vistexanifps = 10;
     vistexaniislooping = 1;
     flycolldet_b = 1;
     vistexcolorend_s = "155 155 200";
     vissizestart_s = "10 30";     
     vissizeendscale = 2.;     
     visalphafunc_s = "BLEND";     
     visalphastart = 120.;
     visAlphaEnd = 80;
};


/*INSTANCE PFX_WATERSPLASH (C_PARTICLEFX)
{
      ppsvalue = 20.;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "1000 1000 1000";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.;
     shpdim_s = "0";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 100.;
     visname_s = "CFLAREBLUE.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "10 10";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 100.;
};

*/

INSTANCE ACID (C_PARTICLEFX)
{
     ppsvalue = 1.;
     ppsscalekeys_s = "1 2 3";
     ppsislooping = 1;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "300";
     shpscalefps = 10.;
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 270.;
     dirangleheadvar = 5.;
     dirangleelev = 20.;
     dirangleelevvar = 5.;
     velavg = 0.200000003;
     velvar = 4.99999989e-003;
     lsppartavg = 700.;
     flygravity_s = "0 0 0";
     visname_s = "WATERSPLASH3.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 180 0";
     vistexcolorend_s = "190 190 0";
     vissizestart_s = "5 15";
     vissizeendscale = 10.;
     visalphafunc_s = "BLEND";
     visalphastart = 100.;
};
// Blutspritzer bei Treffer
// Wahrscheinlich sollte dieser Effekt pro Spezies unterschiedlich sein (z.B. grünes Blut für Crawler)
// Später sollte sich die Stärke des Effekts auch der Schadenshöhe anpassen

INSTANCE PFX_BLOOD (C_PARTICLEFX)
{
     ppsvalue = 70.;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpisvolume = 1;
     shpdim_s = "1 1";
     dirmode_s = "DIR";
     dirfor_s = "object";
     diranglehead = 90.;
     dirangleheadvar = 20.;
     dirangleelev = -45.;
     dirangleelevvar = 10.;
     velavg = 0.100000001;
     velvar = 0.5;
     lsppartavg = 1300.;
     lsppartvar = 600.;
     flygravity_s = "0 -0.0005 0";
     visname_s = "BLOOD1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "200 200 200";
     vistexcolorend_s = "255 255 255 ";
     vissizestart_s = "4 8";
     vissizeendscale = 0.5;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 180.;
};


INSTANCE PFX_DUST (C_PARTICLEFX)
{
     ppsvalue = 64.000000000;
     shptype_s = "BOX";
     shpdistribtype_s = "=";
     shpdim_s = "10 5 10";
     dirmode_s = "DIR";
     dirfor_s = "object";
     dirangleheadvar = 50.000000000;
     dirangleelev = 90.000000000;
     dirangleelevvar = 50.000000000;
     velavg = 0.079999998;
     velvar = 0.010000000;
     lsppartavg = 800.000000000;
     lsppartvar = 100.000000000;
     flygravity_s = "0 0 0";
     visname_s = "STOMPERDUST.TGA";
     visorientation_s = "NONE";
     vistexisquadpoly = 1;
     vistexanifps = 5.000000000;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "5 5";
     vissizeendscale = 7.000000000;
     visalphafunc_s = "BLEND";
     visalphastart = 100.000000000;
};


INSTANCE PFX_Metalsparks (C_PARTICLEFX)
{
     ppsvalue = 40.;
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 500.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "ZSPARK1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "6 10";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};


INSTANCE PFX_MOBDESTROY (C_PARTICLEFX)
{
     ppsvalue = 75.;
     shptype_s = "POINT";
     shpmesh_s = "";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 80.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0004 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 150";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};


///////////////////////////////
// destruction PFX
///////////////////////////////

/*
// Wood
INSTANCE DS_WO (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Stone
INSTANCE DS_ST (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Metal
INSTANCE DS_ME (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Leather BEISPIEL ????????
INSTANCE DS_LE (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Clay BEISPIEL ??????????
INSTANCE DS_CL (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};

// Glass BEISPIEL ??????????
INSTANCE DS_GL (C_PARTICLEFX)
{
     ppsvalue = 100.;
     shptype_s = "MESH";
     shpmesh_s = "STOOL.3DS";
     dirmode_s = "DIR";
     dirangleelev = 90.;
     dirangleelevvar = 30.;
     velavg = 0.100000001;
     velvar = 5.00000007e-002;
     lsppartavg = 1000.;
     lsppartvar = 550.;
     flygravity_s = "0 -0.0006 0";
     visname_s = "ZDEBRIS3_A0.TGA";
     vistexisquadpoly = 1;
     vistexanifps = 12.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "20 20";
     vissizeendscale = 1.;
     visalphafunc_s = "BLEND";
     visalphastart = 255.;
     visalphaend = 255.;
};


///////////////////////////////
// Slide PFX
///////////////////////////////

// Undefined
INSTANCE SS_UD (C_PARTICLEFX)
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


///////////////////////////////
// Collision PFX
///////////////////////////////

//	Model Attacks Model (Angriff ohne Waffen)


INSTANCE GESCHOSS (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shptype_s = "POINT";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "800";
     dirmode_s = "TARGET";
     dirfor_s = "world";
     dirmodetargetfor_s = "world";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180.;
     dirangleelev = 90.;
     velavg = 1.;
     velvar = 5.00000007e-002;
     lsppartavg = 5000.;
     lsppartvar = 350.;
     flygravity_s = "0 0.00002 0";
     visname_s = "ZSPARKJ1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "80 80";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};
INSTANCE Effect01 (C_PARTICLEFX) //Kugel mit Sternen
{
     ppsvalue = 1.;
     ppsislooping = 1;
     shptype_s = "SPHERE";
     shpdistribtype_s = "RAN";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "300";
     dirangleelev = 100.;
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 2000.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "CFLARESTARJ1_A1.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "255 0 0";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "18 30";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 255.;
};	
INSTANCE Effect02 (C_PARTICLEFX) // KugelZauber
{
      ppsvalue = 1.;
     shptype_s = "POINT";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "800";
     dirmode_s = "TARGET";
     dirfor_s = "world";
     dirmodetargetfor_s = "world";
     dirmodetargetpos_s = "0 0 0";
     diranglehead = 180.;
     dirangleelev = 90.;
     velavg = 1.;
     velvar = 5.00000007e-002;
     lsppartavg = 5000.;
     lsppartvar = 350.;
     flygravity_s = "0 0.00002 0";
     visname_s = "ZSPARKJ1.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "80 80";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
};
INSTANCE Effect03 (C_PARTICLEFX)
{
     ppsvalue = 100.;
     ppsislooping = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpisvolume = 100;
     shpdim_s = "300";
     dirmode_s = "DIR";
     dirfor_s = "object";
     lsppartavg = 1000.;
     visname_s = "CFLAREBLUE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "255 255 255";
     vistexcolorend_s = "0 0 0";
     vissizestart_s = "8 8";
     vissizeendscale = 1.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 255.;
};
INSTANCE EinleitungTeleport (C_PARTICLEFX)
{
     ppsvalue = 30.;
     ppsislooping = 1;
     shptype_s = "CIRCLE";
     shpfor_s = "world";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 3.00000014e-004;
     shpdim_s = "100";
     dirmode_s = "DIR";
     dirfor_s = "world";
     lsppartavg = 100.;
     visname_s = "CFLAREBLUE.TGA";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "10 10";
     vissizeendscale = 4.;
     visalphafunc_s = "ADD";
     visalphastart = 200.;
     visalphaend = 100.;
};
INSTANCE Teleporter/teleport (C_PARTICLEFX)
{
     ppsvalue = 1.;
     shptype_s = "POINT";
     shpfor_s = "object";
     shpdistribtype_s = "RAND";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "0";
     dirmode_s = "DIR";
     dirfor_s = "0";
     dirmodetargetfor_s = "object";
     dirmodetargetpos_s = "0 0 0";
     velvar = 5.00000007e-002;
     lsppartavg = 5000.;
     lsppartvar = 350.;
     flygravity_s = "0 0 0";
     visname_s = "CFLAREBLUE.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexcolorstart_s = "0 0 255";
     vistexcolorend_s = "255 0 0";
     vissizestart_s = "300 300";
     vissizeendscale = 10.;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 255.;
};
INSTANCE PORTAL (C_PARTICLEFX)
{
     ppsvalue = 5.;
     shptype_s = "POINT";
     shpfor_s = "object";
     dirmode_s = "DIR";
     lsppartavg = 20000.;
     visname_s = "CURSOR.TGA";
     vistexisquadpoly = 1;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 0 0";
     vistexcolorend_s = "255 255 255";
     vissizestart_s = "100 100";
     vissizeendscale = 20.;
     visalphafunc_s = "ADD";
     visalphaend = 100.;
};
INSTANCE WindfistProgress (C_PARTICLEFX)
{
     ppsvalue = 500.;
     ppsislooping = 1;
     shptype_s = "LINE";
     shpdistribtype_s = "WALK";
     shpdistribwalkspeed = 1.00000005e-003;
     shpdim_s = "200";
     velavg = 0.150000006;
     velvar = 5.00000007e-002;
     lsppartavg = 500.;
     lsppartvar = 350.;
     flygravity_s = "0 -0.0001 0";
     visname_s = "TWISTERJ.TGA";
     visorientation_s = "VELO";
     vistexcolorstart_s = "100 100 255";
     vistexcolorend_s = "0 0 255";
     vissizestart_s = "12 20";
     vissizeendscale = 2.50000004e-002;
     visalphafunc_s = "ADD";
     visalphastart = 255.;
     visalphaend = 100.;
};*/


INSTANCE MENU_CURSOR (C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 5.;
     ppsIsSmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "30 30 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 360.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     lsppartavg = 300.;
     lsppartvar = 400.;
     flygravity_s = "0 0.00002 0";
     visname_s = "FLAM_A0.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "20 20";
     vissizeendscale = 0.5;
     visalphafunc_s = "ADD";
     visalphastart = 90.;
     visalphaend = 10.;
     
     
};
INSTANCE MENU_SELECT_ITEM(C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 0;
     ppsfps = 1;
     ppsIsSmooth = 1;
     shptype_s = "BOX";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "30 30 30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 360.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     lsppartavg = 200.;
     lsppartvar = 200.;
     flygravity_s = "0 0.000002 0";
     visname_s = "electricblue0000.TGA";
     visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "100 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "40 20";
     vissizeendscale = 0.5;
     visalphafunc_s = "ADD";
     visalphastart = 120.;
     visalphaend = 20.;
     
};


INSTANCE FIRE_MENU_OLD(C_PARTICLEFX)
{
     ppsvalue = 150.;
     ppsscalekeys_s = "1.0";
     ppsislooping = 1;
     ppsfps = 1.;
     shptype_s = "CIRCLE";
     shpfor_s = "object";
     shpoffsetvec_s = "0 1 0";
     shpdistribtype_s = "UNIFORM";
     shpisvolume = 1;
     shpdim_s = "30";
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "DIR";
     dirangleheadvar = 360.;
     dirangleelev = 90.;
     dirangleelevvar = 20.;
     velavg = 0.100000001;
     lsppartavg = 400.;
     lsppartvar = 600.;
     flygravity_s = "0 0.00002 0";
     visname_s = "FLAM_A0.TGA";
 //    visorientation_s = "VELO";
     vistexisquadpoly = 1;
     vistexanifps = 15.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "200 100 100";
     vistexcolorend_s = "100 100 0";
     vissizestart_s = "15 15";
     vissizeendscale = 2;
     visalphafunc_s = "ADD";
     visalphastart = 90.;
     visalphaend = 50.;
};

INSTANCE MAGICGLOW (C_PARTICLEFX)
{
     ppsvalue = 20.;
     ppsscalekeys_s = "1";
     ppsislooping = 1;
     shptype_s = "MESH";
     shpfor_s = "object";
     shpoffsetvec_s = "0 0 0";
     shpdistribtype_s = "RAND";
     shpdim_s = "100";
     shpmesh_s = "healbody.3ds";
     shpmeshrender_b = 0;
     shpscalekeys_s = "1";
     shpscaleislooping = 1;
     shpscaleissmooth = 1;
     shpscalefps = 2.;
     dirmode_s = "NONE";
     dirfor_s = "object";
     dirangleheadvar = 180.;
     dirangleelevvar = 180.;
     lsppartavg = 2000.;
     flygravity_s = "0 0 0";
     visname_s = "AURA.TGA";
     visorientation_s = "NONE";
     vistexanifps = 20.;
     vistexaniislooping = 1;
     vistexcolorstart_s = "0 200 255";
     vistexcolorend_s = "0 255 255";
     vissizestart_s = "2 2";
     vissizeendscale = 15.;
     visalphafunc_s = "ADD";
     visalphastart = 50.;
};