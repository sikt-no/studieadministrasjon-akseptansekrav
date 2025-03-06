# language: no
@skip @personopplysninger
Egenskap: 07 Støtteprosesser: 05 Se og endre egne samtykker
  Som person har jeg behov for å kunne se og endre mine egne samtykker i Min kompetanse, så jeg vet hvilke data
  jeg deler med hvem. 
  Som administrator har jeg behov for å se hva en person har samtykket til

  Bakgrunn:
    Gitt at person er logget på Min kompetanse
    Gitt at person har en personprofil

  Scenariomal: Se mine egne samtykker
    Når "<person>" ser på sin profil
    Så ser personen "<samtykker>"

    Eksempler:
      | person | samtykker |

  Scenariomal: Endre egne samtykker
    Når "<person>" ednrer sine <samtykker>
    Så ser personen endrede "<samtykker>"
    Så ser <administrator> endrede "<samtykker>"

    Eksempler:
      | person | Administrator | Samtykker                         |
      |      1 |             1 | Bruk av bilde                     |
      |      2 |             2 | Lånekassen                        |
      |      3 |             3 | Bruk av elektronisk dokumentasjon |
