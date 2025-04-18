    # language: no
    @opptakspilot @opptakspilotkritisk @fsadmin @ci
    Egenskap: Regelverk
    Som administrator ønsker jeg å kunne opprette og endre regelverk for opptak slik at jeg kan tilpasse opptakene til de ulike utdanningstilbudene



    Scenario: Opprette nytt kompetanseregelverk med eksisterende kravelementer
            Når administratoren velger å opprette et kompetanseregelverk
            Og administratoren fyller inn følgende grunnleggende informasjon i kompetanseregelverket
            | felt            | verdi                                   |
            | navn            | Ingeniør elektronikk UiT                |
            | kode            | ELUIT                                   |
            | beskrivelse     | Krav for opptak til elektronikk ved UiT |
            | gyldig fra dato | 01.01.2026                              |
            # Gruppe 1: Standard vitnemål (VES) og førstegangsvitnemål (VOV)
            Og administratoren velger grunnlag "VES, VOV"
            Og administratoren legger til følgende eksisterende kravelementer for disse grunnlagene
            | kravelement | beskrivelse               | minimumskrav |
            | GENS        | Generell studiekompetanse | Ja           |
            | FFMAT       | Matematikk R1             | Karakter 4   |
            | FFYS1       | Fysikk 1                  | Karakter 3   |
            # Gruppe 2: Forkurs for ingeniørutdanning (FOR)
            Og administratoren velger grunnlag "FOR"
            Og administratoren legger til følgende eksisterende kravelementer for dette grunnlaget
            | kravelement | beskrivelse            | minimumskrav |
            | FORFYS      | Fysikk fra forkurs     | Bestått      |
            | FORMAT      | Matematikk fra forkurs | Karakter C   |
            Og administratoren lagrer kompetanseregelverket
            Så skal administratoren kunne se kompetanseregelverket med kode "ELUIT" i listen over regelverk

Scenario: Opprette kompetanseregelverk med alternative krav innen ett grunnlag
  Når administratoren velger å opprette et kompetanseregelverk
  Og administratoren fyller inn følgende grunnleggende informasjon i kompetanseregelverket
    | felt            | verdi                                        |
    | navn            | Ingeniørutdanning generelle krav             |
    | kode            | HING                                         |
    | beskrivelse     | Generelle krav for opptak til ingeniørstudier|
    | gyldig fra dato | 01.01.2026                                   |
  # Ett grunnlag: Standard vitnemål (VES)
  Og administratoren velger grunnlag "VES" 
  Og administratoren legger til kravelementet "GENS" (Generell studiekompetanse)
  # Første alternativ: Matematikk R1 og Fysikk 1
  Og administratoren legger til en kravgruppe "Alternativ 1" med følgende kravelementer
    | kravelement | beskrivelse      | minimumskrav |
    | FFMAT       | Matematikk R1    | Karakter 3   |
    | FFYS1       | Fysikk 1         | Karakter 3   |
  # Andre alternativ: Matematikk R2
  Og administratoren legger til en kravgruppe "Alternativ 2" med følgende kravelementer
    | kravelement | beskrivelse      | minimumskrav |
    | FFMAR       | Matematikk R2    | Karakter 4   |
  # Tredje alternativ: Matematikk S1+S2 og Fysikk 1
  Og administratoren legger til en kravgruppe "Alternativ 3" med følgende kravelementer
    | kravelement | beskrivelse      | minimumskrav |
    | FMAS1       | Matematikk S1    | Karakter 4   |
    | FMAS2       | Matematikk S2    | Karakter 4   |
    | FFYS1       | Fysikk 1         | Karakter 3   |
ZA
  Og administratoren definerer at søkeren må oppfylle ett av de tre alternativene (ELLER-logikk)
  Og administratoren lagrer kompetanseregelverket
  Så skal administratoren kunne se kompetanseregelverket med kode "HING" i listen over regelverk