# language: no
@skip @støtteprosesser
Egenskap: 08 Teknisk: Gi tilbakemelding 
  Som bruker trenger jeg å kunne gi tilbakemeldinger enkelt og raskt via brukerflatene, slik at teamene kan få innsikt i mine erfaringer, problemer og behov så tidlig som mulig, og så enkelt og greit som mulig.
  Jeg vil gjerne gi tilbakemeldinger både i en testfase, og på funksjonalitet i produksjon.

  Bakgrunn:
    Gitt at bruker er på FS-portalen eller innlogget på FS Admin eller Min Kompetanse

  Scenariomal: Bruker gir tilbakemelding
    Når bruker er på "<en side>"
    Så kan bruker gi "<tilbakemelding>"

    Eksempler:
      | en side      |tilbakemelding|
      | gruppesøk i FS Admin    | feilmelding|
      | personprofil i Min kompetanse |forbedringsønske|
      | begrepsside for student i FS Portal|forbedringsønske|

  Scenario: Bruker gir tilbakemelding med vedlegg
    Når bruker gir tilbakemelding
    Så kan bruker berike tilbakemelding ved å laste opp vedlegg

  Scenario: Bruker sender inn feilmelding (bug) 
    Når bruker sender inn feilmelding
    Så opprettes bug til vurdering

  Scenario: Bruker sender inn forbedringsønske
    Når bruker sender inn feilmelding
    Så opprettes forbedringssak til vurdering

  Scenario: Tilbakemeldingen slettes
    Når tilbakemeldingen har vært lagret i 14 dager
    Så slettes tilbakemeldingen med eventuelle vedlegg
