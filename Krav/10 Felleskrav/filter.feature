    # language: no
    @fsadmin
    Egenskap: 10 Felleskrav: Filter
    I fsadmin åpner brukere ofte opp visninger med tabeller. Dette kan være alt fra en liste over personer i personsøk eller en liste over regelverk i opptak. Dette featuren handler om å lage et sett med krav knyttet til hvordan det skal være mulig å filtrere dataen som vises i disse tabellene.

    Bakgrunn:
    Gitt at bruker er på innlogget på FS Admin og benytter en eller annen feature som viser en tabell

    Scenario: Filtrere på alle kolonner i oversikten
            Gitt at brukeren er inne på personsøk
            Når brukeren ønsker å filtrere bort noen rader
            Så skal brukeren kunne filtrere på alle datafelter/kolonner som finnes i tabellen.

            Eksempler:
            | Navn | Fødselsnummer | Telefonnummer | Statsborgerskap |

    Scenario: Velge hvilke av kolonnene som skal synes i tabellvisningen
            Gitt at brukeren er inne på opptak og ser på oversikten over opptak
            Eksempler:
            | Navn | Opptakstype | Opprettet | Antall utdanningstilbud |
            Når brukeren velger å fjerne noen kolonner fra visningen
            Eksempler:
            | Opprettet | Antall utdanningstilbud |
            Så skal oversikten kun inneholde de kolonnene som brukere har beholdt
            Eksempler:
            | Navn | Opptakstype |

    Scenario: Velge hvilke av kolonnene/data som skal kunne filtreres på
            Gitt at brukeren er inne på oversikten over søknader på et opptak
            | Navn | Fødselsdato | Søknadsnummer | Status |
            Når brukeren velger å fjerne noen kolonner fra søkemulighetene
            | Søknadsnummer | Status |
            Så skal det kun være mulig å filtrere på de kolonnene som brukeren ikke har fjernet.
            | Navn | Fødselsdato |

    Scenario: Velge hvor mange treff per side som skal vises i oversikten
            Gitt at brukerene er inne på personsøk
            Når brukeren velger antall visninger per side fra en liste
            Eksempler:
            | Antall |
            | 50     |
            | 500    |
            | 1000   |

    Så skal brukeren kun se gitt antall visninger eller færre i oversikten per side.

    Scenario: Bruker trykker på et element i oversikten og går videre til relevant side.
        Gitt at brukeren er inne på kompetanseregelverk
        Når brukeren trykker på en rad og i hovedkolonnen i oversikten
        Så skal brukeren gå inn på siden for det relevante kompetanseregelverket

    Scenario: Sortere per kolonne? Høyeste til laveste Etc