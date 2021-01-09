//////////////////////////////////////////////////////////////////////////
//  B_InitMonsterAttitudes
//  ======================
//  Initialisiert die Attit�de aller Monsterrassen zu allen anderen
//  Wesen im Spiel. f�r Menschen und Orks werden die Sammelbezeichner
//  GIL_SEPERATOR_HUM bzw. GIL_SEPERATOR_ORC verwendet.
//
//////////////////////////////////////////////////////////////////////////

func void B_InitMonsterAttitudes ()
{
    //-------- WARAN --------
    B_SetGuildAttitude  (GIL_WARAN,         ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_FRIENDLY,   GIL_WARAN           );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_WARAN,         ATT_NEUTRAL,    GIL_LURKER          );

    //-------- GOBBO --------
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_FRIENDLY,   GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_FRIENDLY,   GIL_TROLL           );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_GOBBO,         ATT_NEUTRAL,    GIL_LURKER          );

    //-------- TROLL --------
    B_SetGuildAttitude  (GIL_TROLL,         ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_FRIENDLY,   GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_FRIENDLY,   GIL_TROLL           );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_TROLL,         ATT_NEUTRAL,    GIL_LURKER          );


    //-------- SNAPPER --------
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_FRIENDLY,   GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_SNAPPER,       ATT_NEUTRAL,    GIL_LURKER          );

    //-------- MINECRAWLER --------
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_FRIENDLY,   GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_HOSTILE,    GIL_LURKER          );

    //-------- MEATBUG --------
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_MEATBUG,       ATT_NEUTRAL,    GIL_LURKER          );

    //-------- SCAVENGER --------
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_FRIENDLY,   GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_HOSTILE,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_HOSTILE,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_SCAVENGER,     ATT_NEUTRAL,    GIL_LURKER          );

    //-------- DEMON --------
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_DEMON,         ATT_HOSTILE,    GIL_LURKER          );

    //-------- WOLF --------
    B_SetGuildAttitude  (GIL_WOLF,          ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_FRIENDLY,   GIL_WOLF            );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_WOLF,          ATT_NEUTRAL,    GIL_LURKER          );

    //-------- SHADOWBEAST --------
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_HOSTILE,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_SHADOWBEAST,   ATT_NEUTRAL,    GIL_LURKER          );

    //-------- BLOODFLY --------
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_FRIENDLY,   GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_BLOODFLY,      ATT_NEUTRAL,    GIL_LURKER          );

    //-------- SWAMPSHARK --------
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_SWAMPSHARK,    ATT_HOSTILE,    GIL_LURKER          );

    //-------- ZOMBIE --------
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_FRIENDLY,   GIL_SLF             );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_FRIENDLY,   GIL_DEMON           );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_FRIENDLY,   GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_FRIENDLY,   GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_FRIENDLY,   GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_ZOMBIE,        ATT_HOSTILE,    GIL_LURKER          );

    //-------- UNDEADORC --------
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_FRIENDLY,   GIL_SLF             );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_FRIENDLY,   GIL_DEMON           );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_FRIENDLY,   GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_FRIENDLY,   GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_FRIENDLY,   GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_UNDEADORC,     ATT_HOSTILE,    GIL_LURKER          );

    //-------- ORCDOG --------
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_FRIENDLY,   GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_LURKER          );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_ORCSCOUT        );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_ORCWARRIOR      );
    B_SetGuildAttitude  (GIL_ORCDOG,        ATT_NEUTRAL,    GIL_ORCSHAMAN       );

    //-------- MOLERAT --------
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_FRIENDLY,   GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_MOLERAT,       ATT_NEUTRAL,    GIL_LURKER          );

    //-------- GOLEM --------
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_LURKER          );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_ORCSHAMAN       );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_ORCWARRIOR      );
    B_SetGuildAttitude  (GIL_GOLEM,         ATT_HOSTILE,    GIL_ORCSCOUT        );

    //-------- LURKER --------
    B_SetGuildAttitude  (GIL_LURKER,        ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_LURKER,        ATT_NEUTRAL,    GIL_LURKER          );

    //-------- SKELETON --------
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_FRIENDLY,   GIL_SLF             );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_FRIENDLY,   GIL_DEMON           );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_FRIENDLY,   GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_FRIENDLY,   GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_FRIENDLY,   GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_LURKER          );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_ORCSHAMAN       );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_ORCWARRIOR      );
    B_SetGuildAttitude  (GIL_SKELETON,      ATT_HOSTILE,    GIL_ORCSCOUT        );

    //-------- HUMAN --------
    // SN:  alle Menschen auf ATT_HOSTILE gegen�ber allen Monstern gesetzt, um die Reaktionszeit
    //      nach dem Besiegen des einen und dem Bek�mpfen des n�chsten Monsters zu
    //      beschleunigen. (Npc_IsNextTargetAvailable springt bei ATT_ANGRY nicht an!)
    //
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_LURKER          );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_ORCSHAMAN       );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_ORCWARRIOR      );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_HOSTILE,    GIL_ORCSCOUT        );
    B_SetGuildAttitude  (GIL_SEPERATOR_HUM, ATT_FRIENDLY,   GIL_ORCSLAVE        );

    //-------- GIL_GUR wird den Gegnern im Alten Tempel verpasst --------
    B_SetGuildAttitude  (GIL_GUR,           ATT_FRIENDLY,   GIL_DEMON           );
    B_SetGuildAttitude  (GIL_GUR,           ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_GUR,           ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_GUR,           ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_GUR,           ATT_NEUTRAL,    GIL_ZOMBIE          );

    B_SetGuildAttitude  (GIL_DEMON      ,   ATT_FRIENDLY,   GIL_GUR             );
    B_SetGuildAttitude  (GIL_MINECRAWLER,   ATT_NEUTRAL,    GIL_GUR             );
    B_SetGuildAttitude  (GIL_SKELETON   ,   ATT_NEUTRAL,    GIL_GUR             );
    B_SetGuildAttitude  (GIL_UNDEADORC  ,   ATT_NEUTRAL,    GIL_GUR             );
    B_SetGuildAttitude  (GIL_ZOMBIE     ,   ATT_NEUTRAL,    GIL_GUR             );

    //-------- ORKS --------
    B_SetGuildAttitude  (GIL_ORCSHAMAN  ,   ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_ORCSHAMAN  ,   ATT_FRIENDLY,   GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_ORCWARRIOR ,   ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_ORCWARRIOR ,   ATT_FRIENDLY,   GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_ORCSCOUT   ,   ATT_HOSTILE,    GIL_SEPERATOR_HUM   );
    B_SetGuildAttitude  (GIL_ORCSCOUT   ,   ATT_FRIENDLY,   GIL_ORCDOG          );

    //-------- ORK-Sklaven --------
    B_SetGuildAttitude  (GIL_GRD        ,   ATT_FRIENDLY,   GIL_ORCSLAVE        );
    B_SetGuildAttitude  (GIL_STT        ,   ATT_FRIENDLY,   GIL_ORCSLAVE        );
    B_SetGuildAttitude  (GIL_TPL        ,   ATT_FRIENDLY,   GIL_ORCSLAVE        );

    //-------- Orks untereinander --------
    B_SetGuildAttitude  (GIL_ORCSHAMAN  ,   ATT_FRIENDLY,   GIL_ORCSHAMAN       );
    B_SetGuildAttitude  (GIL_ORCSHAMAN  ,   ATT_FRIENDLY,   GIL_ORCWARRIOR      );
    B_SetGuildAttitude  (GIL_ORCSHAMAN  ,   ATT_FRIENDLY,   GIL_ORCSCOUT        );
    B_SetGuildAttitude  (GIL_ORCSHAMAN  ,   ATT_FRIENDLY,   GIL_ORCSLAVE        );

    B_SetGuildAttitude  (GIL_ORCWARRIOR ,   ATT_FRIENDLY,   GIL_ORCSHAMAN       );
    B_SetGuildAttitude  (GIL_ORCWARRIOR ,   ATT_FRIENDLY,   GIL_ORCWARRIOR      );
    B_SetGuildAttitude  (GIL_ORCWARRIOR ,   ATT_FRIENDLY,   GIL_ORCSCOUT        );
    B_SetGuildAttitude  (GIL_ORCWARRIOR ,   ATT_FRIENDLY,   GIL_ORCSLAVE        );

    B_SetGuildAttitude  (GIL_ORCSCOUT   ,   ATT_FRIENDLY,   GIL_ORCSHAMAN       );
    B_SetGuildAttitude  (GIL_ORCSCOUT   ,   ATT_FRIENDLY,   GIL_ORCWARRIOR      );
    B_SetGuildAttitude  (GIL_ORCSCOUT   ,   ATT_FRIENDLY,   GIL_ORCSCOUT        );
    B_SetGuildAttitude  (GIL_ORCSCOUT   ,   ATT_FRIENDLY,   GIL_ORCSLAVE        );

    B_SetGuildAttitude  (GIL_ORCSLAVE   ,   ATT_FRIENDLY,   GIL_ORCSHAMAN       );
    B_SetGuildAttitude  (GIL_ORCSLAVE   ,   ATT_FRIENDLY,   GIL_ORCWARRIOR      );
    B_SetGuildAttitude  (GIL_ORCSLAVE   ,   ATT_FRIENDLY,   GIL_ORCSCOUT        );
    B_SetGuildAttitude  (GIL_ORCSLAVE   ,   ATT_FRIENDLY,   GIL_ORCSLAVE        );
};
