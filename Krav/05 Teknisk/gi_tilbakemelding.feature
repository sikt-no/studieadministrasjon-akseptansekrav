# language: no
@skip @støtteprosesser
Egenskap: 07 Støtteprosesser: Gi tilbakemelding på FSadmin
  Som bruker trenger jeg å kunne gi tilbakemeldinger enkelt og raskt via brukerflatene, slik at teamene kan få innsikt i mine erfaringer, problemer og behov så tidlig som mulig, og så enkelt og greit som mulig.
  Jeg vil gjerne gi tilbakemeldinger både i en testfase, og på funksjonalitet i produksjon.

  Bakgrunn:
    Gitt at bruker er innlogget på FS Admin
    Gitt at bruker er administrator

  Scenariomal: Tilbakemeldingsmulighet for bruker
    Når administrator er på "<en side>"
    Så kan administrator trykke på "<en knapp>" for å gi tilbakemelding

    Eksempler:
      | en side      | en knapp          |
      | gruppesøk    | rapport           |
      | personprofil | gi tilbakemelding |

  Scenario: Administrator gir tilbakemelding
    Når administrator trykker på "gi tilbakemelding"
    Så kan administrator gi oss tilbakemelding
