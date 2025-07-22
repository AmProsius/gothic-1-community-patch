# Fix Templates

The templates are collected in directories corresponding to the camel-case formatted names of the column names of the `fix templates` project board. The files will be copied to their destination as is. The content will be parsed for search and replace patterns.

| Pattern           | Replacement              |                                                   Example |
|-------------------|--------------------------|----------------------------------------------------------:|
| `{ISSUE_NUM}`     | Issue number             |                                                      `16` |
| `{ISSUE_NUM_PAD}` | Issue number zero padded |                                                     `016` |
| `{SHORTNAME}`     | Short name of the fix    |                                       `RavenWelcomDialog` |
| `{LONGNAME}`      | Description of the fix   |                           `Raven's dialog is unavailable` |
| `{LANGCHECK}`     | Code for language check  | `G1CP_Testsuite_CheckLang(G1CP_Lang_DE \| G1CP_Lang_EN);` |

New templates can be added with ease, without adjusting any code. The directory names only have to match the column names of the project board.
