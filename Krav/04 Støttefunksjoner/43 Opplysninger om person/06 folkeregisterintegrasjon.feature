# language: no
@skip @personopplysning
Egenskap: 07 Støtteprosesser: 06 Integrasjon mot folkeregisteret for å oppdatere personopplysninger for læresteder
Som person som bruker Min kompetanse (søker, student eller resultateier) som er registert i folkeregisteret skal jeg slippe å oppdatere
  mine personopplysninger flere steder, slik at læresteder har korrekt person- og kontaktinformasjon om meg, tiltaler meg ved riktig navn og
  kontakter meg på riktig adresse og kan behandle meg korrekt mht mine personopplysninger når det er aktuelt.

  Hjemmelsgrunnlag aktive studenter: GDPR art. 6 nr. 1 bokstav e) fordi behandlingen er nødvendig for å kunne utføre en oppgave i allmennhetens interesse eller
  utøve offentlig myndighet som behandlingsansvarlig er pålagt. I tillegg kan læresteder innhente og behandle personopplysninger i hht universitets- og høyskoleloven § 4-15.

  #Merk at det stilles strengere krav til private læresteder fra folkeregisterets side. De må spørre med både fødselsnummer og navn, slik at løsningsarkitekturen er litt annerledes
  #for å kunne gi samme funksjon som for offentlige læresteder.

  Bakgrunn:
    Gitt at lærestedet har søkt og fått tilgang til Folkeregisteret
    Gitt at lærestedet har delegert tilgang til Folkeregisteret videre til FS/Sikt
    Gitt at person har minst én søknad eller studierett (studentnr???)
    #Gitt at person har minst ett resultat - kan utvides
    #Gitt at person har minst én aktiv søknad - kan utvides

  @offentlig_larested
  Scenariomal: Offentlig lærested kan spørre med fødselsnummer
    Gitt at lærested er offentlig
    Når "<fødselsnummer>" for "<endringshendelse>" matcher person ved lærested
    Så utføres oppdatering av "<personopplysning>"

    Eksempler:
      |fødselsnummer|endringshendelse|personopplysning|

  @privat_larested @skip
    #blir ikke levert i første iterasjon (denne må antagelig gjennomgås mer når oppgaven skal løses)
  Scenariomal: Privat lærested må spørre med fødselsnummer og navn
    Gitt at lærested er privat
    Når "<fødselsnummer>" og "<navn"> for "<endringshendelse>" matcher person ved lærested
    Så utføres oppdatering av "<personopplysning>"

    Eksempler:
      |fødselsnummer|endringshendelse|personopplysning|

  Scenariomal: Oppdatere navn
    Når "<person>" endrer fra "<gammelt navn>" til "<nytt navn>" i folkeregisteret
    Så oppdateres personens navn FS
    Så lagres navneendringen i historikk

    Eksempler:
      | person |gammelt navn |nytt navn|

  Scenariomal: Trunkere som pr. dags dato er for lange for FS (over 200 tegn)
    Gitt at "<nytt navn>" i folkeregisteret er på over 200 tegn
    Når "<person>" endrer fra "<gammelt navn>" til "<nytt navn>" i folkeregisteret
    Så trunkeres "<nytt navn>" før oppdateringen
    # midlertidig løsning inntil vi kan utvide antall tillatte tegn i databasen

    Eksempler:
     |person |nytt navn| gammelt navn |

  Scenariomal: Systemadministrator få varsel om oppdatering av fødselsnummer (eller D-nummer)
    #midlertidig mellomløsning fordi vi fortsatt har FS-klienten og må gjøre flere endringer i databasen for at dette skal kunne gå automatisk
    #pr dags dato i Vask folkeregisteret - avviksbehandling i FS-klienten + rutinen FS200.001 med hake Folkeregister (automatisere og flytte endringsansvaret til person etterhvert)
    Når "<person>" blir oppdatert fra "<gammelt fødselsnummer>" til "<nytt fødselsnummer>" i folkeregisteret
    Så mottar "<systemadministrator>" varsel om avvikssak til behandling

    Eksempler:
      | person | gammelt fødselsnummer |nytt fødselsnummer|systemadministrator|

  Scenariomal: Oppdatering av fødselsnummer
    #midlertidig mellomløsning fordi vi fortsatt har FS-klienten og må gjøre flere endringer i databasen for at dette skal kunne gå automatisk
    Når "<systemadministrator>" har behandlet avvikssak om fødselsnummerendring
    Så oppdaterer vi til "<nytt fødselsnummer>" i FS
    Så lagres fødselsnummerendring i historikk

    Eksempler:
      |nytt fødselsnummer|systemadministrator|

  Scenariomal: Informere person om oppdatering fra folkeregisteret
    Gitt at "<person>" endrer "<personopplysning>" i folkeregisteret
    Når "<personopplysning>" oppdateres i FS
    Så ser person hvor vi har oppdatert opplysningene fra og når vi gjorde oppdateringen (sist oppdatert fra freg dato)

    Eksempler:
      |person|personopplysning|

  Scenariomal: Registrere dødsfall
    Når en "<persons>" dødsfall blir registrert i folkeregisteret
    Så registrerer vi at "<person>" er død i FS
    Så mottar "<systemadministrator>" varsel om avvikssak til behandling

    Eksempler:
      |persons| person |

  Scenariomal: Systemadministrator får varsel om dødsfall
    #pr dags dato i Vask folkeregisteret - avviksbehandling i FS-klienten + rutinen FS200.001 med hake Folkeregister (må flyttes til FS Admin etterhvert)
    Gitt at en "<persons>" dødsfall blir registrert i folkeregisteret
    Når "<dødsfall>" registreres i FS
    Så mottar "<systemadministrator>" varsel om avvikssak til behandling

    Eksempler:
      |persons|dødsfall|systemadministrator|

  Scenariomal: Oppdatere statsborgerskap
    Gitt at "<person>" har søkt utdanning eller er aktiv student
    Når en "<person>" endrer "<statsborgerskap>" i folkeregisteret
    Så oppdaterer vi "<statsborgerskap>" i FS

    Eksempler:
      |person| statsborgerskap |

    Scenario: Logging av endringer i personopplysninger fra folkeregisteret
      #usikker på om denne skal her eller hører hjemme et annet sted (vesensforskjell fra endringer som bevares i historikk)
      Gitt at en person har endret personopplysninger i folkeregisteret som er relevante for FS
      Når endringer registreres i FS
      Så logger vi endringene i 3 månder
      #hva slags logg, tilgjengelig for hvem?


       #Scenariene under løser vi ikke i første runde - hjemmelsgrunnlaget er ikke like klart, og behovet for kjønn som egen kategori ikke inntruffet ennå. .
 @skip
  Scenariomal: Oppdatere folkeregistert bostedsadresse
    Gitt at "<person>" har søkt utdanning eller er aktiv student
    Når "<person>" endrer "<folkeregistrert bostedsadresse>" i folkeregisteret
    Så oppdateres "<folkeregistrert adresse>" i FS

    Eksempler:
      | person | folkeregistrert adresse |
@skip
  Scenariomal: Oppdatere folkeregistert postadresse - kontaktadresse???
    Gitt at "<person>" har søkt utdanning eller er aktiv student
    Når "<person>" endrer "<folkeregistrert postadresse>" i folkeregisteret
    Så oppdateres "<kontaktadresse>" i FS

    Eksempler:
      | person | kontaktadresse |

  @skip
    #ikke aktuell før vi ikke kan utlede kjønn fra fødselsnummer mer, det blir aktuelt fra 2030
  Scenariomal: Oppdatere kjønn
    Når "<person>" endrer "<kjønn>" i folkeregisteret
    Så oppdateres "<kjønn>" i FS

    Eksempler:
      | person | kjønn |
