# language: no
@opptakspilot @opptakspilotkritisk @fsadmin @ci
Egenskap: Regelverk
Som administrator ønsker jeg å kunne opprette og endre regelverk for opptak slik at jeg kan tilpasse opptakene til de ulike utdanningstilbudene



Scenario: Opprette nytt kompetanseregelverk med eksisterende kravelementer
  Når administratoren velger å opprette et kompetanseregelverk
  Og administratoren fyller inn følgende grunnleggende informasjon i kompetanseregelverket
    | felt            | verdi                               |
    | navn            | Ingeniør elektronikk UiT            |
    | kode            | ELUIT                               |
    | beskrivelse     | Krav for opptak til elektronikk ved UiT |
    | gyldig fra dato | 01.01.2026                          |
  
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
    | kravelement | beskrivelse               | minimumskrav |
    | FORFYS      | Fysikk fra forkurs        | Bestått      |
    | FORMAT      | Matematikk fra forkurs    | Karakter C   |
  
  Og administratoren lagrer kompetanseregelverket
  Så skal administratoren kunne se kompetanseregelverket med kode "ELUIT" i listen over regelverk