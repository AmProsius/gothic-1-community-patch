/* Language of the scripts */
const int G1CP_Lang    = 0; // Filled on first initialization
const int G1CP_Lang_EN = 1 << 0;
const int G1CP_Lang_DE = 1 << 1;
const int G1CP_Lang_PL = 1 << 2;
const int G1CP_Lang_RU = 1 << 3;

/* Range of G1CP symbols (filled on first initialization) */
const int G1CP_SymbStart = -1;
const int G1CP_SymbEnd   = -1;

/* Lookup table fix status */
const int G1CP_FIX_NOT_FOUND   = -2;
const int G1CP_FIX_DISABLED    = -1;
const int G1CP_FIX_NOT_APPLIED =  0;
const int G1CP_FIX_APPLIED     =  1;

/* Comma or space separated list of fix IDs for globally deactivated fixes */
const string G1CP_HotfixDisable = "";

/* Frequently re-used class definitions */
const int G1CP_oCItem_classDef         = 9284224; //0x8DAA80
const int G1CP_oCMOB_classDef          = 9285840; //0x8DB0D0
const int G1CP_oCMobBed_classDef       = 9284552; //0x8DABC8
const int G1CP_oCMobContainer_classDef = 9285504; //0x8DAF80
const int G1CP_oCMobDoor_classDef      = 9284672; //0x8DAC40
const int G1CP_oCMobFire_classDef      = 9285024; //0x8DADA0
const int G1CP_oCMobInter_classDef     = 9285728; //0x8DB060
const int G1CP_oCMobLadder_classDef    = 9285392; //0x8DAF10
const int G1CP_oCMobLockable_classDef  = 9284784; //0x8DACB0
const int G1CP_oCMobSwitch_classDef    = 9285280; //0x8DAEA0
const int G1CP_oCMobWheel_classDef     = 9284440; //0x8DAB58
const int G1CP_oCNpc_classDef          = 9286664; //0x8DB408
const int G1CP_zCDecal_classDef        = 8861528; //0x873758
const int G1CP_zCMover_classDef        = 9271400; //0x8D7868
const int G1CP_zCVobLight_classDef     = 9270800; //0x8D7610
