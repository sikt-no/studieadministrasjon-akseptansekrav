# language: no

Egenskap: Plasstildeling

Plasstildeling, også kjent som opptakskjøring, omtaler prosessen hvor et sett med ferdige søknader blir kjørt med en opptaksalgoritme. Algoritmen sammenligner søkerens poengscore innenfor et sett med prioriterte kvoter for å vurdere om vedkommende skal få tilbud eller ikke.

Bakgrunn:
Gitt at følgende brukere ferdigbehandlede søknader finnes:
| navn                  | kvalifisert? | kvote 1 | kvote 2 | kvote 3 | kvote 1 score | kvote 2 score | kvote 3 score |
| Thomas Edison         | Ja           | Ja      | Ja      | Nei     | 5             | 5             | NA            |
| Nikola Tesla          | Ja           | Ja      | Ja      | Nei     | 6             | 5             | NA            |
| Alexander Graham Bell | Ja           | Ja      | Ja      | Nei     | 5             | 4             | NA            |
| Benjamin Franklin     | Ja           | Ja      | Ja      | Nei     | 3             | 3             | NA            |
| Albert Einstein       | Ja           | Nei     | Ja      | Nei     | NA            | 3             | NA            |
| Marie Curie           | Ja           | Nei     | Ja      | Nei     | NA            | 2             | NA            |
| Isaac Newton          | Ja           | Nei     | Ja      | Nei     | NA            | 1             | NA            |
| Steve Jobs            | Nei          | Ja      | Ja      | Nei     | 5             | 4             | NA            |
| Alan Turing           | Nei          | Ja      | Ja      | Nei     | 4             | 3             | NA            |
| Leonardo Da Vinci     | Nei          | Nei     | Ja      | Ja      | NA            | 4             | 4             |

Gitt at det finnes følgende kvoter og plasser på studier:
| kvote | kvotenavn           | antall plasser |
| 1     | Andregangsvitnemål  | 1              |
| 2     | Førstegangsvitnemål | 2              |
| 3     | Italiakvote         | 1              |

Scenario: Hovedopptak med en runde
Når opptaksleder starter en runde
Og setter inn følgende rundekriterier
| publiseres | antall runder | kun ett tilbud om plass | kun et ja-svar | bortfall settes |
| ja         | 1             | Ja                      | Ja             | Ja              |
Og følgende kvoteprioritering
| Prioritering | Navn                |
| 3            | Italiakvote         |
| 2            | Førstegangsvitnemål |
| 1            | Andregangsvitnemål  |

Så skal følgende personer få plass på følgende kvoter
| Kvote 3           | Kvote 2       | Kvote 1               |
| Leonardo Da Vinci | Thomas Edison | Alexander Graham Bell |
| .                 | Nikola Tesla  | .                     |

