# language: no

Egenskap: Opprette og tilgjengeliggjøre utdanning
Som administrator ved lærested som tilbyr utdanning i Norge trenger jeg å opprette og tilgjengeliggjøre utdanning med informasjon som gjør at både vi og andre aktører i utdannings-Norge vet at vi tilbyr utdanning. 
Både vi og andre aktører i det offentlige og private, trenger å vite om utdanningen er akkreditert og aktiv, eller historisk. 
Søkere og studenter må vite at utdanning finnes og om den passer for dem der de er nå.  

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
