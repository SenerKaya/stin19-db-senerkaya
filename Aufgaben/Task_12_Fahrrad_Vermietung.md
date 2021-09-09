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
![erd](/Bilder/erd-aufgabe3.jpg) 

## Definition von Identifikationsschlüsseln
Die Entitäten werden folgendermassen mit Primärschlüsseln ergänzt.  
**Kunde** (<ins>kunde_id</ins> )   
**Mietvertrag** (<ins>mietvertrag_id</ins>)   
**Fahrrad** (<ins>f_id</ins>)  


  