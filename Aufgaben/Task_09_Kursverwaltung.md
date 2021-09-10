# Aufgabe 09 Kursverwaltung  
![Kurse](/Bilder/kurse.png)  
[Script Kursverwaltung.sql](/Scripts/Task-09-Kursbesuche.sql)

## Bildung von Entitätsmengen
Es gibt folgende Entitätsmengen:
- Personen
- Kurse
- Externe Kursleiter  

## Festlegen der Beziehungen  
Die Entitätstypen werden wie folgt durch die Attribute ergänzt.  
**Personen** (Name, Vorname, Funktion, Lohnstufe)   
**Kurse** (Kursbezeichnung, Themengebiet, Kursort)   
**Kursleiter** (Status) 

Es gibt eine Rekursive Beziehung zwischen Personen und Kursleiter. 
![task09_erd1](/Bilder/Task09_erd_1.jpg) 


## Definition von Identifikationsschlüsseln
Die Entitäten werden folgendermassen mit Primärschlüsseln ergänzt:    
**Personen** (<ins>pnr</ins> )   
**Kurse** (<ins>knr</ins>)   
**Kursleiter** (<ins>klnr</ins>)  

## Globale Normalisierung  