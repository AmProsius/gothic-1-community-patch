//////////////////////////////////////////////////////////////////////////
//  B_InitOrcAttitudes
//  ==================
//  Initialisiert die Attit�de aller Ork-Rassen zu allen anderen
//  Wesen im Spiel. f�r Menschen und Orks k�nnen die Sammelbezeichner
//  GIL_SEPERATOR_HUM bzw. GIL_SEPERATOR_ORC verwendet werden.
//  -   'OrcsvsHuman' gibt das Attit�den der Orks gegen�ber den Menschenan
//      1 = friendly
//      2 = neutral
//      3 = angry
//      4 = hostile
//////////////////////////////////////////////////////////////////////////
func void B_InitOrcAttitudes (var int OrcsvsHuman)
{
    if (OrcsvsHuman == 1)
    {
        //-------- Orks gegen�ber Menschen --------
        B_SETGUILDATTITUDE  ( GIL_ORCSHAMAN ,   ATT_FRIENDLY,       GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCWARRIOR,   ATT_FRIENDLY,       GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCSCOUT  ,   ATT_FRIENDLY,       GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCSLAVE  ,   ATT_FRIENDLY,       GIL_SEPERATOR_HUM   );


        //-------- Orks gegen�ber Monster --------
    }
    else if (OrcsvsHuman == 2)
    {
        // dito
        B_SETGUILDATTITUDE  ( GIL_ORCSHAMAN ,   ATT_NEUTRAL,        GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCWARRIOR,   ATT_NEUTRAL,        GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCSCOUT  ,   ATT_NEUTRAL,        GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCSLAVE  ,   ATT_NEUTRAL,        GIL_SEPERATOR_HUM   );
    }
    else if (OrcsvsHuman == 3)
    {
        // DITO
        B_SETGUILDATTITUDE  ( GIL_ORCSHAMAN ,   ATT_ANGRY,      GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCWARRIOR,   ATT_ANGRY,      GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCSCOUT  ,   ATT_ANGRY,      GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCSLAVE  ,   ATT_ANGRY,      GIL_SEPERATOR_HUM   );

    }

    else if (OrcsvsHuman == 4)
    {
        // dito
        B_SETGUILDATTITUDE  ( GIL_ORCSHAMAN ,   ATT_HOSTILE,        GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCWARRIOR,   ATT_HOSTILE,        GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCSCOUT  ,   ATT_HOSTILE,        GIL_SEPERATOR_HUM   );
        B_SETGUILDATTITUDE  ( GIL_ORCSLAVE  ,   ATT_HOSTILE,        GIL_SEPERATOR_HUM   );

    };
/*
    else if (chapter == 5)
    {
        // dito
        B_SetGuildAttitude  ( GIL_ORCSHAMAN ,   ATT_NEUTRAL,        GIL_SEPERATOR_HUM   );
        B_SetGuildAttitude  ( GIL_ORCWARRIOR,   ATT_NEUTRAL,        GIL_SEPERATOR_HUM   );
        B_SetGuildAttitude  ( GIL_ORCSCOUT  ,   ATT_NEUTRAL,        GIL_SEPERATOR_HUM   );
        B_SetGuildAttitude  ( GIL_ORCSLAVE  ,   ATT_NEUTRAL,        GIL_SEPERATOR_HUM   );
    }
    else if (chapter == 6)
    {
        // dito
        B_SetGuildAttitude  ( GIL_ORCSHAMAN ,   ATT_HOSTILE,        GIL_SEPERATOR_HUM   );
        B_SetGuildAttitude  ( GIL_ORCWARRIOR,   ATT_HOSTILE,        GIL_SEPERATOR_HUM   );
        B_SetGuildAttitude  ( GIL_ORCSCOUT  ,   ATT_HOSTILE,        GIL_SEPERATOR_HUM   );
        B_SetGuildAttitude  ( GIL_ORCSLAVE  ,   ATT_HOSTILE,        GIL_SEPERATOR_HUM   );

    };
    */
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_WARAN           );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_SLF             );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_GOBBO           );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_TROLL           );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_SNAPPER         );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_MINECRAWLER     );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_MEATBUG         );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_SCAVENGER       );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_DEMON           );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_WOLF            );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_SHADOWBEAST     );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_BLOODFLY        );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_SWAMPSHARK      );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_ZOMBIE          );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_UNDEADORC       );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_SKELETON        );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_ORCDOG          );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_MOLERAT         );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_GOLEM           );
    B_SetGuildAttitude  (GIL_SEPERATOR_ORC, ATT_NEUTRAL,    GIL_LURKER          );

    //-------- Orks untereinander --------
    B_SetGuildAttitude  (GIL_ORCSHAMAN  ,   ATT_FRIENDLY,   GIL_ORCSHAMAN       );
    B_SetGuildAttitude  (GIL_ORCSHAMAN ,    ATT_FRIENDLY,   GIL_ORCWARRIOR      );
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
