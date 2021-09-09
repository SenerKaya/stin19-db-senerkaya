# Task 12 Fahrrad Vermietung
![Kurse](/Bilder/fahrraeder2.jpg)  

Die Fahrrad M�ller GmbH vermietet Fahrrad an Kunden. Im Inventar haben Sie verschiedene Fahrradtypen wie Mountainbikes, Trekkingr�der, Rennr�der und E-Bikes.  
Jede Vermietung wird erfasst und durch die Datenbank verwaltet. 

## Bildung von Entit�tsmengen
Es gibt folgende Entit�tsmengen:
- Fahrrad
- Kunde/ Mieter
- Mietvertrag  
  
## Festlegen der Beziehungen  
Die Entit�tstypen werden wie folgt durch die Attribute erg�nzt.
**Kunde** (Vorname, Nachname)   
**Mietvertrag** (Abschlussdatum, Mietbeginn, Mietdauer)   
**Fahrrad** (Kennung, Fahrradtyp)  

## Entity Relationship Diagramm
![erd](/Bilder/erd-aufgabe3.jpg) 

## Definition von Identifikationsschl�sseln
Die Entit�ten werden folgendermassen mit Prim�rschl�sseln erg�nzt.  
**Kunde** (<ins>kunde_id</ins> )   
**Mietvertrag** (<ins>mietvertrag_id</ins>)   
**Fahrrad** (<ins>f_id</ins>)  


  