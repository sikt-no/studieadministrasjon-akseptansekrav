# language: no
@skip @støtteprosesser 
Egenskap: 07 Støtteprosesser: 03 Gruppesøk
Som administrator trenger jeg å kunne søke opp en gruppe personer som deler samme kriterier, for å kunne behandle disse samlet videre, jeg trenger noen lett tilgjengelige søkefiltre
som hjelper meg å finne grupper av personer jeg ofte jobber med. Mulig behov for å inkludere informasjon om filternes boleaanske algebra. 

  Bakgrunn:
    Gitt administrator er inne på gruppesøket

@opplysning
  Scenario: Administrator er ansatt ved institusjon ved gjennomføring av gruppesøk
  Så ser administrator "Borghild Aga"
  Så ser administrator "Gruppeoppslag"

@opplysning
  Scenario: Søk og filtrering på studieprogram
    Når administrator søker og filtrerer på studieprogram "Bachelor i musikkteori"
    Så ser administrator "Johannes Brahms"

@opplysning
  Scenario: Søk og filtrering på startermin
    Når administrator søker og filtrerer på starttermin "2024 Høst"
    Så ser administrator "Harald Eggen"

  Scenario: Søk og filtrering på kulltermin

  Scenario: Søk og filtrering på emne

@opplysning
  Scenario: Filtrering på betaling
    Når administrator filtrerer på betalt betaling
    Så ser administrator "Hermione Granger"

@opplysning
  Scenario: Filtrering på aktiv studierettsstatus
    Når administrator filtrerer på aktiv studierettstatus
    Så ser administrator "Fredrik Aalbakk"
    
@opplysning
  Scenario: Filtrering på avsluttet studierettsstatus
    Når administrator filtrerer på avsluttet studierettstatus
    Så ser administrator "Jo Aa"
@opplysning
  Scenario: Filtrering på norsk statsborgerskap
    Når administrator filtrerer på norsk statsborgerskap
    Så ser administrator "Vagar Aabrek"
@opplysning
  Scenario: Filtrering på statsborgerskap EU
    Når administrator filtrerer på statsborgerskap EU
    Så ser administrator "Anne Kjersti Aamlid"
@opplysning
  Scenario: Filtrering på statsborgerskap resten av verden
    Når administrator filtrerer på statsborgerskap EU
    Så ser administrator "Anne Kjersti Aamlid"
@opplysning
  Scenario: Filtrering på studiegjennomføring er semesterregistert
    Når administrator filtrerer på er semesterregistert
    Så ser administrator "Astrid Oline Aga"

@opplysning
  Scenario: Administrator gjennomfører et gruppesøk som gir ingen resultater
    Når administrator filtrerer på starttermin "2023 Høst"
    Når administrator filtrerer på studieprogram "Ø program 2"
    
    Så får administrator ingen resultater og blir informert om at det ikke finnes noen resultater

  Scenario: Gruppesøk med flere valg innenfor samme filter viser svar fra begge filter. Dette vises med "eller" funskjonalitet, dvs at person må treffe på minst 1 av filterene, ikke nødvendigvis flere.
    Når administrator filtrerer på starttermin "2023 Høst"
    Og administrator filtrerer på starttermin "2024 Høst"
    Når administrator trykker Søk etter gruppe av personer
    Så ser administrator "Åge Aleksandersen"
    Så ser administrator "Harald Eggen"

  Scenariomal: Gruppesøk med flere valg innenfor mellom filter viser svar på personer som treffer begge. Det vises med "og" funskjonalitet, dvs at personen må treffe på alle filtere for å være med i lista.
    Når administrator søker på "<startterminer>"
    Og administrator søker på "<studieprogram>"
    Og administrator søker på "<har betalt semesteravgift>"
    Så vises resultatliste med personer tilknyttet "<terminer>" og "<studieprogram>" som "<har betalt semesteravgift>"

    Eksempler:
      | startterminer | studieprogram | har betalt semesteravgift |
      |     2024 HØST | MASTER        | ja                        |
      |      2023 VÅR | JORDMOR       | ja                        |

  Scenario: Administrator får autocomplete støtte ved søk på studieprogram
    Når administrator begynner å skrive  "jor" i studieprogramfeltet
    Så skal saksbehandler få opp autocomplete forslag "JORDMOR Jordmor"

  @skip
  Scenario: Særskilte filtre: Vise døde personer
    Når administrator haker av for "inkluder avdøde"
    Så kommer avdøde med i resultatet

  Scenariomal: Personinformasjon i resultatlista
    Når administrator får en resultatliste over "<personer>"
    Så får administrator opplysninger om "<navn>"
    Så får administrator opplysninger om "<fødselsdato>"
    Så får administrator opplysninger om "<studentnummer>"
    Så får administrator opplysninger om "<feidebruker>"
    Så får administrator opplysninger om "<aktive studieretter>"
    Så får administrator opplysninger om "<betalingsopplysninger>"
    Så får administrator opplysninger om "<permisjon>"
    Så får administrator opplysninger om "<aktive søknader>"
    Så får administrator opplysninger om "<merknad på studierett>"

    Eksempler:
      | personer               | navn                   | fødselsdato | studentnummer | feidebruker            | aktive studieretter       | betalingsopplysninger | permisjon     | aktive søknader | merknad på studierett        |
      | Misfornøyd Ambassade   | Misfornøyd Ambassade   |  03.09.2010 |            10 | no310236284_elev_2_8a  | BACHELOR Bachelor         | betalt                |               |                 |                              |
      | Kranglete Artisjokk    | Kranglete Artisjokk    |  28.01.2014 |            11 | no310480428_elev_1_7b  | INGENIØR Ingeniør         | betalt                |               |                 |                              |
      | Økologisk badering     | Økologisk Badering     |  22.02.2009 |            12 | no310236284_elev_4_10a | Flere aktive studieretter | betalt                | 50% Permisjon |                 |                              |
      | Familiær Bane          | Familiær Bane          |  13.06.2012 |            13 | no310480428_elev_1_5b  | SYKEPLEIE Sykepleie       | ikke betalt           |               |                 | Startsamtale V26 1. des 2025 |
      | Oppjaget Bas           | Oppjaget Bas           |  08.12.2013 |            14 | no310236284_elev_3_6b  | BACHELOR Bachelor         | betalt                |               |                 |                              |
      | Uemosjonell Betaling   | Uemosjonell Betaling   |  07.02.2013 |            15 | no310236284_elev_3_6a  | JORDMOR Jordmor           | betalt                |               |                 |                              |
      | Eksemplarisk bevegelse | Eksemplarisk Bevegelse |  15.08.2009 |            16 | no310480428_elev_1_8b  | Ingen aktiv studierett    | ikke betalt           |               |                 |                              |
      | Uvitende Bjrønunge     | Uvitende Bjørnunge     |  25.08.2013 |            17 | no310236284_elev_4_5b  | Ingen aktiv studierett    | ikke betalt           |               |                 |                              |
      | Fiolett Bokhylle       | Fiolett Bokhylle       |  10.10.2010 |            18 | no310236284_elev_3_9b  | Enkeltemnestudierett      | betalt                |               | FSnr            |                              |
      | Vertikal Branngate     | Vertikal Branngate     |  05.03.2010 |            19 | no310236284_elev_3_8a  | Ingen aktiv studierett    | ikke betalt           |               | Admissionr      |                              |

  Scenario: Standardsortering alfabetisk etter etternavn
    Når administrator ikke har foretatt noen aktiv sorteringsvalg
    Så vises resultatlisten alfabetisk etter etternavn
     #helgjenbruk fra personsøket (trenger vi den her også?)

  Scenario: Resultat gir mer enn 1000 treff
    Når administrator søker på "A"
    Så skal det vises som "flere enn 1000 personer"
