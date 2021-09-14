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
**Reservierung** (<ins>reservierung-id</ins>,Beginn, Ende, Zweck, ↑mitarbeiter_id, ↑fahrzeugmodell_id)  
**Fahrzeuge** (<ins>fahrzeug_id</ins>, Kennzeichen, Anschaffungsdatum, Anschaffungskosten, ↑fahrzeugmodell_id)     
**Fahrzeugmodell** (<ins>fahrzeugmodell-id</ins>, bezeichnung, hersteller, kraftstoff, verbrauch)  
**Instandhaltung** (<ins>instandhaltung-id</ins>, datum, km_stand, kosten, beschreibung, ↑fahrzeug_id)  
**Versicherungsantrag** (<ins>versicherungs_nr</ins>, kasko, jaehrliche_beitrag, ↑vg-id) 
**Versicherungsgesellschaft**(<ins>vg-id</ins>, firma, strasse, plz, ort, telefon) 
 
#### Ergänzung des ER-Diagramms mit weiteren Entitäten und Fremdschlüsseln

![task13_erd diagramm ](/Bilder/task13_erd3.jpg) 



## Erstellen der Datenbank mithilfe von DBeaver und Mysql
### Die SQL-Datei ist unter dem folgenden Link verfügbar:    
[Task 12 Fahrrad Vermietung SQL-Datei](/Scripts/Task-12-Fahrrad-Vermietung.sql)

## Views


