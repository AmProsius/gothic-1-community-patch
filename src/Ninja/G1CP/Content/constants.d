/* Language of the scripts */
const int G1CP_Lang    = 0; // Filled on first initialization
const int G1CP_Lang_EN = 0;
const int G1CP_Lang_DE = 1;
const int G1CP_Lang_PL = 2;
const int G1CP_Lang_RU = 3;

/* Range of G1CP symbols (filled on first initialization) */
const int G1CP_SymbStart = -1;
const int G1CP_SymbEnd   = -1;

/* Lookup table fix status */
const int G1CP_FIX_NOT_FOUND   = -2;
const int G1CP_FIX_DISABLED    = -1;
const int G1CP_FIX_NOT_APPLIED =  0;
const int G1CP_FIX_APPLIED     =  1;
