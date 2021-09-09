# Task 12 Fahrrad Vermietung
![Kurse](/Bilder/fahrraeder2.jpg)  

Die Fahrrad Müller GmbH vermietet Fahrrad an Kunden. Im Inventar haben Sie verschiedene Fahrradtypen wie Mountainbikes, Trekkingräder, Rennräder und E-Bikes.  
Jede Vermietung wird erfasst und durch die Datenbank verwaltet. 

## Bildung von Entitätsmengen
Es gibt folgende Entitätsmengen:
- Fahrrad
- Kunde/ Mieter
- Mietvertrag  
  
## Festlegen der Beziehungen  
Die Entitätstypen werden wie folgt durch die Attribute ergänzt.  
**Kunde** (Vorname, Nachname)   
**Mietvertrag** (Abschlussdatum, Mietbeginn, Mietdauer)   
**Fahrrad** (Kennung, Fahrradtyp)  

## Entity Relationship Diagramm
![erd3](/Bilder/erd-aufgabe3.jpg) 

## Definition von Identifikationsschlüsseln
Die Entitäten werden folgendermassen mit Primärschlüsseln ergänzt:    
**Kunde** (<ins>kunde-id</ins> )   
**Mietvertrag** (<ins>mietvertrag-id</ins>)   
**Fahrrad** (<ins>f-id</ins>)  

## Globale Normalisierung  
### Ergänzung des ER-Diagramms mit den Kardinalitäten
![erd5](/Bilder/erd-kardinalitaet.jpg) 

### Modellierungsfragen
#### Ergänzung des ER-Diagramms mit der Entität Fahrradtyp
![erd-fahrradtyp](/Bilder/erd-fahrradtyp.jpg) 

## Erstellen der Relationen  
**Kunde** (<ins>kunde-id</ins>, vorname, nachname )   
**Mietvertrag** (<ins>mietvertrag-id</ins>, abschlussdatum, mietbeginn, mietdauer, ↑kunde-id)  
**Fahrradtyp** (<ins>ftyp-id</ins>, modell)     
**Fahrrad** (<ins>f-id</ins>, ↑ftyp-id, kennung)  
**Vermietete Fahrraeder** (↑ftyp-id, ↑mietvertrag-id)  

## Lokal-Attribute




  