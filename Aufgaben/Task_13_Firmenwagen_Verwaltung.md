# Task 13 Fuhrpark Verwaltung  
![tast13_fuhrpark](/Bilder/fuhrpark.jpg)  

Es soll eine Datenbank für Firmenwagen Vermietung erstellt werden.  
In der Fuhrparkverwaltung gibt es folgende Aufgaben.
- Die Mitarbeiter die einen Firmenwagen reservieren, sollen erfasst werden.
- Falls ein neuer Wagen angeschafft wird, wird er in die Datenbank aufgenommen.
- Instandhaltung/ Reparaturen werden erfasst.
- Versicherungsarbeiten werden erfasst.  

## Bildung von Entitätsmengen  
Es gibt folgende Kernentitäten:  
**Mitarbeiter**   
**Fahrzeuge**   
**Reservierung**    

## Festlegen der Beziehungen  
Die Entitätstypen werden wie folgt durch die Attribute ergänzt.  
**Mitarbeiter** (Vorname, Nachname, Personennr.)   
**Fahrzeuge** (Kennzeichen, Anschaffungsdatum, Anschaffungskosten, Fahrzeugmodell)   
**Reservierung** (Beginn, Ende, Zweck)  

### Entity Relationship Diagramm
Mit unseren Entitätsmengen lässt sich folgendes Entitätenblockdiagramm zeichnen:  
![task13-erd1](/Bilder/task13_erd1.jpg) 