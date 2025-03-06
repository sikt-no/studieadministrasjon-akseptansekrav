# language: no
@skip
Egenskap: 01 Planlegge utdanning: Opprette og tilby utdanning

  Scenariomal: Administrator oppretter ny utdanning
    Når bruker utarbeider et nytt forslag til ny "<utdanning>"
    Så skal "<utdanning>" sendes til utdanningsregisteret
    Så skal begrunnelse sendes til "<godkjenningsinstans>"
    Så skal "<utdanning>" motta en unik ID fra utdanningsregisteret
    Eksempler:
    |utdanning                             |godkjenningsinstans|
    |studieprogram HFB-ANT Antikkens kultur|Universietet i Oslo|
    |emne ANT1100 Antikkens verden         |Institutt for alt som er gøy|
    |kurs EVU1530 emne uten studiepoeng    |Fakultet for matnyttig      |
    |studieprogram MNM2 Nisseverksted      |NOKUT                       |

  Scenario: Administrator mottar beslutning om godkjenning
    Gitt at bruker har opprettet utdanningstilbud
    Når studietilbudet blir godkjent av utdanningsregisteret
    Så skal administrator motta beslutning om godkjenning
    Så skal studietilbudet blir tilgjengelig for søkere
