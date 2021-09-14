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
![task13-erd1](/Bilder/task13_erd.jpg) 

## Definition von Identifikationsschlüsseln
Die Entitäten werden folgendermassen mit Primärschlüsseln ergänzt:    
**Mitarbeiter** (<ins>mitarbeiter-id</ins> )   
**Fahrzeuge** (<ins>fahrzeug-id</ins>)   
**Reservierung** (<ins>reservierung-id</ins>)

## Globale Normalisierung  
Ergänzung des ER-Diagramms mit den Kardinalitäten und ID-Schlüsseln
![erd5](/Bilder/task13_erd2.jpg) 

### Modellierungsfragen
### Erstellen von weiteren Relationen mit Fremdschlüsseln  
**Mitarbeiter** (<ins>mitarbeiter-id</ins>, Vorname, Nachname, Pers_nr. )   
**Reservierung** (<ins>reservierung-id</ins>,Beginn, Ende, Zweck)  
**Fahrzeuge** (<ins>fahrzeug-id</ins>, Kennzeichen, Anschaffungsdatum, Anschaffungskosten, ↑fahrzeugmodell_id)     
**Fahrzeugmodell** (<ins>fahrzeugmodell-id</ins>, bezeichnung, hersteller, kraftstoff, verbrauch)  
**Instandhaltung** (<ins>instandhaltung-id</ins>, datum, km_stand, kosten, beschreibung)  
**Versicherung** (<ins>versicherungs_nr</ins>, kasko, jährliche_beitrag) 
**Versicherungsgesellschaft**(<ins>vg-id</ins>, firma, strasse, plz, ort, telefonNr) 
 
#### Ergänzung des ER-Diagramms mit weiteren Entitäten und Fremdschlüsseln

![task13_erd diagramm ](/Bilder/task13_erd3.jpg) 



## Erstellen der Datenbank mithilfe von DBeaver und Mysql


## Views


