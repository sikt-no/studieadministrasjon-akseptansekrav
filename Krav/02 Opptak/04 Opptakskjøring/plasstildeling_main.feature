# language: no

Egenskap: Plasstildeling

Plasstildeling, også kjent som opptakskjøring, omtaler prosessen hvor et sett med ferdige søknader blir kjørt med en opptaksalgoritme. Algoritmen sammenligner søkerens poengscore innenfor et sett med prioriterte kvoter for å vurdere om vedkommende skal få tilbud eller ikke.

Bakgrunn:
Gitt at følgende brukere ferdigbehandlede søknader finnes:
| navn                  | kvalifisert? | kvote 1 | kvote 2 | kvote 3 | Konkurransepoeng | Skolepoeng |
| Thomas Edison         | Ja           | Ja      | Ja      | Nei     | 5                | 5          |
| Nikola Tesla          | Ja           | Ja      | Ja      | Nei     | 6                | 5          |
| Alexander Graham Bell | Ja           | Ja      | Ja      | Nei     | 5                | 4          |
| Benjamin Franklin     | Ja           | Ja      | Ja      | Nei     | 3                | 3          |
| Albert Einstein       | Ja           | Nei     | Ja      | Nei     | NA               | 3          |
| Marie Curie           | Ja           | Nei     | Ja      | Nei     | NA               | 2          |
| Isaac Newton          | Ja           | Nei     | Ja      | Nei     | NA               | 1          |
| Steve Jobs            | Nei          | Ja      | Ja      | Nei     | 5                | 4          |
| Alan Turing           | Nei          | Ja      | Ja      | Nei     | 4                | 3          |
| Leonardo Da Vinci     | Nei          | Nei     | Ja      | Ja      | NA               | 4          |

Gitt at det finnes følgende kvoter og plasser på studier:
| kvoteprioritet | kvotenavn           | antall plasser | poengutregning   |
| 1              | Italiakvote         | 1              | Konkurransepoeng |
| 2              | Førstegangsvitnemål | 2              | Skolepoeng       |
| 3              | Andregangsvitnemål  | 1              | Konkurransepoeng |

Scenario: Hovedopptak med en runde
Når opptaksleder starter en runde
Og setter inn følgende rundekriterier
| publiseres | antall runder | kun ett tilbud om plass | kun et ja-svar | bortfall settes |
| ja         | 1             | Ja                      | Ja             | Ja              |

Så skal følgende personer få plass på følgende kvoter 
| Kvote 1           | Kvote 2       | Kvote 3               |
| Leonardo Da Vinci | Thomas Edison | Alexander Graham Bell |
| .                 | Nikola Tesla  | .                     |
Og sendes et tilbud om plass

Scenario: Etterfyllingsopptak
Når opptaksleder starter en runde på et utdanningstilbud som allerede har gitt tilbud til et sett med søkere.


