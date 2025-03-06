# language: no
@opptakspilot @opptakspilotkritisk @fsadmin @ci
Egenskap: 02 Opptak: 21 Regelverk
Som administrator ønsker jeg å kunne opprette og endre regelverk for opptak slik at jeg kan tilpasse opptakene til de ulike utdanningstilbudene

  Scenario: 
    Gitt administratoren er en saksbehandler for opptak
    Og administratoren går til regelverksiden

   Scenario: Opprette Kompetanseregelverk uten alternative kompetansekrav
     Når administratoren velger å opprette et kompetanseregelverk
    Og administratoren fyller inn grunnleggende informasjon i kompetanseregelverket
     Og administratoren lagrer kompetanseregelverket
     Så skal administratoren kunne se kompetanseregelverket i listen over regelverk

  Scenario: Opprette Kompetanseregelverk med alternative kompetansekrav
    Når administratoren velger å opprette et kompetanseregelverk
    Og administratoren fyller inn grunnleggende informasjon i kompetanseregelverket
    Og administratoren fyller inn nødvendig informasjon for alternative kompetansekrav
    Og administratoren lagrer kompetanseregelverket
    Så skal administratoren kunne se kompetanseregelverket i listen over regelverk

  Scenario: Endre Kompetanseregelverk
    Når administratoren velger å endre et kompetanseregelverk
    Og administratoren endrer informasjon i kompetanseregelverket og lagrer
    Så skal administratoren kunne se regelverket i listen over regelverk
  # Scenario: Opprette Rangeringsregelverk
  #   Når administratoren velger å opprette et rangeringsregelverk
  #   Og administratoren fyller inn nødvendig informasjon for rangeringsregelverket og lagrer
  #   Så skal administratoren kunne se regelverket i listen over regelverk
  # Scenario: Endre Rangeringsregelverk
  #   Når administratoren velger å endre et rangeringsregelverk
  #   Og administratoren fyller inn nødvendig informasjon og lagrer
  #   Så skal administratoren kunne se regelverket i listen over regelverk
