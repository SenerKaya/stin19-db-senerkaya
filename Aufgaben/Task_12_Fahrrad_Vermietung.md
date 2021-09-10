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
#### Ergänzung des ER-Diagramms mit den Kardinalitäten und ID-Schlüsseln
![erd5](/Bilder/erd-kardinalitaet.jpg) 

### Modellierungsfragen
#### Ergänzung des ER-Diagramms mit der Entität Fahrradtyp und Fremdschlüsseln
![erd-fahrradtyp](/Bilder/erd-fahrradtyp.jpg) 

## Erstellen der Relationen  
**Kunde** (<ins>kunde-id</ins>, vorname, nachname )   
**Mietvertrag** (<ins>mietvertrag-id</ins>, abschlussdatum, mietbeginn, mietdauer, ↑kunde-id)  
**Fahrradtyp** (<ins>ftyp-id</ins>, modell)     
**Fahrrad** (<ins>f-id</ins>, ↑ftyp-id, kennung)  
**Vermietete Fahrraeder** (<ins>↑ftyp-id </ins>,<ins> ↑mietvertrag-id</ins>)  

## Lokal-Attribute
**Definieren der Lokal-Attribute und erstellen der Tabellen mit Musterdaten:**  

**Kunde**
| kunde-id      |    vorname    |     nachname  |
| ------------- | ------------- | ------------- |
| 1             | Max           | Meier         |
| 2             | Steffen       | Keller        |  

**Mietvertrag**
| mietvertrag-id | abschlussdatum | mietbeginn | mietdauer| kunde-id |
| -------------- | -------------- | ---------- |--------- | ---------|
| 100            | 11.08.2021     | 12.08.2021 |   3      |     1    | 
| 101            | 28.08.2021     | 29.08.2021 |   2      |     2    |  

**Fahrradtyp**
| ftyp-id       |    modell     |
| ------------- | ------------- | 
| 1             | Mountainbike  | 
| 2             | Trekkingrad   |  

**Fahrrad**
| f-id      |    ftyp-id    |     kennung  |
| ------------- | --------- | ------------ |
| 500           | 1         | Cross#7       |
| 501           | 2         | Mark#2      | 

**Vermietete Fahrraeder**
| ftyp-id       | mietvertrag-id  |
| ------------- | --------------- | 
| 1             | 100               | 
| 2             | 100               |  


## Erstellen der Datenbank mithilfe von DBeaver und Mysql

###Die SQL-Datei ist unter dem folgenden Link verfügbar:    
[Task 12 Fahrrad Vermietung SQL-Datei](/Scripts/Task-12-Fahrrad-Vermietung.sql)

### Das Er-Diagramm sieht folgendermassen aus.
![erd diagramm ](/Bilder/erd12.jpg) 

### Erstellen der View Abfrage
![view12](/Bilder/view_12.jpg) 








  