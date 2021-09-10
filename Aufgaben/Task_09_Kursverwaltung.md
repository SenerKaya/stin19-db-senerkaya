# Aufgabe 09 Kursverwaltung  
![Kurse](/Bilder/kurse.png)  

## Bildung von Entitätsmengen
Es gibt folgende Entitätsmengen:
- Personen
- Kurse
- Externe Kursleiter  

## Festlegen der Beziehungen  
Die Entitätstypen werden wie folgt durch die Attribute ergänzt:  
**Personen** (Name, Vorname, Funktion, Lohnstufe)   
**Kurse** (Kursbezeichnung, Themengebiet, Kursort)   
**Kursleiter** (Status) 

Die Beziehungen zwischen den drei Entitätsmengen sehen wie folgt aus.      
Es gibt eine Rekursive Beziehung zwischen Personen und internen Kursleiter.  

![task09_erd1](/Bilder/Task09_erd_1.jpg) 


## Definition von Identifikationsschlüsseln
Die Entitäten werden folgendermassen mit Primärschlüsseln ergänzt:    
**Personen** (<ins>pnr</ins> )   
**Kurse** (<ins>knr</ins>)   
**Kursleiter** (<ins>klnr</ins>)  

## Globale Normalisierung  
Die netzwerkförmigen und rekursiven Beziehungen wie mc-mc, m-mc usw. müssen werden durch die Hilfsentitätenmengen in hierarchische Beziehungen transformiert.   
Die Entität Kursleiter wird in "Interne Kursleiter" und "Externe Kursleiter" transformiert.  
Das Attribut "Funktion" bekommt eine eigene Entitätsmenge, da es sehr wenige Werte gibt und diese einfacher mit der Tabelle Personen verbinden lässt. 
Die Globale Normalisierung sieht nach der transformation der Relationen folgendermassen aus.  
 
![task09_globale_norm.](/Bilder/task09_globale_norm.jpg) 


## Erstellen der Relationen 
In diesem Schritt werden die Relationen mit Attributen, Primären- und Fremdschlüsseln ergänzt.  
**Personen** (<ins>pnr</ins>, name, vorname,fnr,lohnstufe)   
**Funktionen** (<ins>fnr</ins>, funktion)   
**Kurse** (<ins>knr</ins>, kursbezeichnung, ↑ktnr, kursort)  
**Kursthemen** (<ins>ktnr</ins>, themengebiet)     
**Kursleiter** (<ins>klnr</ins>,status)  
**Externe Kursleiter** (<ins>klnr </ins>,ename,evorname,firma)  
**Interne Kursleiter** (<ins>klnr </ins>,↑pnr, kurserfahrung)  
**Kursbesuche** (<ins>↑pnr</ins>,<ins> ↑knr</ins>,<ins> ↑klnr</ins>, datum )  

## Konsistenzbedingungen
Damit die Datenkonsistenz erhalten bleibt, müssen für die gespeicherten Daten Bedingungen gegeben werden.   
Dadurch werden falsche Eingaben verhindert und unsere Datenbank wird weniger Fehler anfällig. 
Die Bedingungen werden wie auf der folgenden Tabelle definiert.  

![task09_konsistenz bedingungen](/Bilder/task09_kons_bed.jpg) 

## View von allen Kursen
Erstellen von einer View in Dbeaver  

![task09_view](/Bilder/task09_view.jpg) 


## Entity Relation Diagramm 
Erstellen von ER-Diagramm in Dbeaver  

![task09_erd](/Bilder/task09_erd.jpg) 




