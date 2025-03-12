# language: no

Egenskap: Opprette utdanning
Som administrator ved lærested som tilbyr utdanning i Norge trenger jeg å opprette og tilgjengeliggjøre utdanning med informasjon som gjør at både vi og andre aktører i utdannings-Norge vet at vi tilbyr utdanning. 
Både vi og andre aktører i det offentlige og private, trenger å vite om utdanningen er akkreditert og aktiv, eller historisk. 
Søkere og studenter må vite at utdanning finnes og om den passer for dem der de er nå.

  Scenariomal: Administrator oppretter ny utdanning ved FS-lærested som er selvakkreditterende
    Gitt at lærested er selvakkreditterende
    Gitt at lærested har FS som studieadministrativt system
    Når administrator registrerer "<utdanning>"
    Så lagres "<utdanning>" i utdanningsregisteret
    Så tildeles "<utdanning>" én entydig ID fra utdanningsregisteret
    
    Eksempler:
    |utdanning                             |
    |studieprogram HFB-ANT Antikkens kultur|
    |emne ANT1100 Antikkens verden         |
    |kurs EVU1530 emne uten studiepoeng    |
    |studieprogram MNM2 Nisseverksted      |

  Scenariomal: Administrator oppretter ny utdanning ved FS-lærested som er områdeakkreditert
    Gitt at lærested er områdeakkreditert
    Gitt at lærested har FS som studieadministrativt system
    Når administrator registrerer "<utdanning>" innenfor "<fagområde>" de er akkredittert for
    Så lagres "<utdanning>" i utdanningsregisteret
    Så tildeles "<utdanning>" én entydig ID fra utdanningsregisteret
    
    Eksempler:
    |utdanning                             |fagområde|
    |studieprogram HFB-ANT Antikkens kultur|antikkene studier|

  Scenariomal: Administrator oppretter ny utdanning i annet SIS enn FS som kan integrere
    Gitt at lærested er områdeakkreditert
    Gitt at lærested IKKE har FS som studieadministrativt system
    Når administrator registrerer "<utdanning>" innenfor "<fagområde>" de er akkredittert for
    Så lagres "<utdanning>" i utdanningsregisteret
    Så tildeles "<utdanning>" én entydig ID fra utdanningsregisteret
    
    Eksempler:
    |utdanning                             |fagområde|
    |studieprogram HFB-ANT Antikkens kultur|antikkene studier|

  Scenariomal: Administrator oppretter ny utdanning i annet SIS enn FS som IKKE kan integrere (hente fra NOKUT???)
    Gitt at lærested IKKE har FS som studieadministrativt system
    Når administrator registrerer "<utdanning>" innenfor "<fagområde>" de er akkredittert for
    Så lagres "<utdanning>" i utdanningsregisteret
    Så tildeles "<utdanning>" én entydig ID fra utdanningsregisteret
    
    Eksempler:
    |utdanning                             |fagområde|
    |studieprogram HFB-ANT Antikkens kultur|antikkene studier|

@skip egen feature for akkreditteringsinfo? høyere utdanning og selvakkredittering først? 
  Scenariomal: Administrator oppretter ny utdanning ved FS-lærested som er områdeakkreditert
    Gitt at lærested IKKE er områdeakkreditert
    Gitt at NOKUT sier ja
    Gitt at lærested har FS som studieadministrativt system
    Når administrator registrerer "<utdanning>" innenfor "<fagområde>" de er akkredittert for i FS
    Så tildeles "<utdanning>" én entydig ID 
    Så lagres "<utdanning>" i utdanningsregisteret 
    
    Eksempler:
    |utdanning                             |fagområde|
    |studieprogram HFB-ANT Antikkens kultur|antikkene studier|

Scenariomal: Utdanning med entydig ID tilgjengeliggjøres
Gitt at "<utdanning>" er lagret med entydig ID
Gitt at "<utdanning>" er tilknyttet minst ett "<lærested>" 
Når administrator registrerer "<periode start>" 
Så blir utdanning tilbudt fra "<periode start>" 

Eksempler: 
|utdanning|lærested|periode start|
|mnm2-his|UiB|høst 2026|
|kurs|USN|02.03.2026|
