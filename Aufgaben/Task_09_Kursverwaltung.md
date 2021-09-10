# Aufgabe 09 Kursverwaltung  
![Kurse](/Bilder/kurse.png)  
[Script Kursverwaltung.sql](/Scripts/Task-09-Kursbesuche.sql)

## Bildung von Entit�tsmengen
Es gibt folgende Entit�tsmengen:
- Personen
- Kurse
- Externe Kursleiter  

## Festlegen der Beziehungen  
Die Entit�tstypen werden wie folgt durch die Attribute erg�nzt.  
**Personen** (Name, Vorname, Funktion, Lohnstufe)   
**Kurse** (Kursbezeichnung, Themengebiet, Kursort)   
**Kursleiter** (Status) 

Es gibt eine Rekursive Beziehung zwischen Personen und Kursleiter. 
![task09_erd1](/Bilder/Task09_erd_1.jpg) 


## Definition von Identifikationsschl�sseln
Die Entit�ten werden folgendermassen mit Prim�rschl�sseln erg�nzt:    
**Personen** (<ins>pnr</ins> )   
**Kurse** (<ins>knr</ins>)   
**Kursleiter** (<ins>klnr</ins>)  

## Globale Normalisierung  