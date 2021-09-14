DROP SCHEMA IF EXISTS `ex17`;

CREATE SCHEMA `ex17` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `ex17`;



CREATE TABLE ex17.mitarbeiter(
  `mitarbeiter_id` INTEGER NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT null,
  `pers_nr` INTEGER NOT NULL,
  CONSTRAINT mitarbeiter_pk PRIMARY KEY (`mitarbeiter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex17.mitarbeiter(mitarbeiter_id,vorname,nachname,pers_nr) 
Values
(1, 'Max', 'Meier',101),
(2, 'Steffen', 'Keller',102),
(3, 'Daniel', 'Schmid',103),
(4, 'Marco', 'Steiner',104),
(5, 'Martin', 'Widmer',105),
(6, 'Reto', 'Fuchs',106);



CREATE TABLE ex17.fahrzeugmodell(
  `fahrzeugmodell_id` INTEGER NOT NULL,
   `hersteller` varchar(50) NOT null,
  `bezeichnung` varchar(50) NOT NULL,
  `kraftstoff` varchar(50) NOT null,
   `verbrauch` decimal(3,1),
  CONSTRAINT fahrzeugmodell_pk PRIMARY KEY (`fahrzeugmodell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex17.fahrzeugmodell(fahrzeugmodell_id,hersteller,bezeichnung,kraftstoff,verbrauch) 
Values
(10, 'VW', 'Golf','Benzin',8.1),
(11, 'Opel', 'Corsa','Diesel', 7.5),
(12, 'Mercedes-Benz', 'CLA','Benzin',15.1),
(13, 'Ford', 'Fiesta','Diesel',9.9 ),
(14, 'Audi', 'A5','Benzin', 12.5);



CREATE TABLE ex17.fahrzeug(
  `fahrzeug_id` INTEGER NOT NULL,
  `kennzeichen` varchar(20) NOT NULL,
  `anschaffungsdatum` date,
  `anschaffungskosten` INTEGER DEFAULT NULL,
  `fahrzeugmodell_id` INTEGER NOT NULL,
  CONSTRAINT fahrzeug_pk PRIMARY KEY (`fahrzeug_id`),
 CONSTRAINT fahrzeug_FK FOREIGN KEY (fahrzeugmodell_id) REFERENCES ex17.fahrzeugmodell(fahrzeugmodell_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex17.fahrzeug(fahrzeug_id,kennzeichen,anschaffungsdatum,anschaffungskosten,fahrzeugmodell_id) 
Values
(20, '12e45', '2019-01-02', 30000, 10),
(21, '67bs0', '2020-03-13', 50000, 11),
(22, '10zh2', '2017-05-15', 90000, 12),
(23, '12be4', '2016-07-23', 25000, 13 ),
(24, '1ge67', '2021-09-30', 70000, 14);



CREATE TABLE ex17.reservierung(
  `reservierung_id` INTEGER NOT NULL,
  `zweck` varchar(50) NOT NULL,
  `beginn` date,
  `ende` date,
  `mitarbeiter_id` INTEGER NOT NULL,
  `fahrzeug_id` INTEGER NOT NULL,
  CONSTRAINT reservierung_pk PRIMARY KEY (`reservierung_id`),
  CONSTRAINT reservierung_FK FOREIGN KEY (mitarbeiter_id) REFERENCES ex17.mitarbeiter(mitarbeiter_id),
  CONSTRAINT reservierung_FK_1 FOREIGN KEY (fahrzeug_id) REFERENCES ex17.fahrzeug(fahrzeug_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex17.reservierung(reservierung_id,zweck,beginn,ende,mitarbeiter_id,fahrzeug_id) 
Values
(30,'Berufsmässig','2021-08-13','2020-08-18',1,21 ),
(31, 'Warentransport', '2021-07-02','2020-07-03',1,22),
(32, 'Mitarbeitertransport','2021-05-14','2020-05-14',5,20),
(33, 'Privat',         '2021-08-19','2021-08-21',2,22 ),
(34, 'Warentransport', '2021-09-10','2021-09-15', 4,23);



CREATE TABLE ex17.instandhaltung(
  `instandhaltung_id` INTEGER NOT NULL,
  `datum` date,
  `km_stand` INTEGER DEFAULT NULL,
  `kosten` decimal(8,1),
  `beschreibung` varchar(50) DEFAULT NULL,
  `fahrzeug_id` INTEGER NOT NULL,
  CONSTRAINT instandhaltung_pk PRIMARY KEY (`instandhaltung_id`),
 CONSTRAINT instandhaltung_FK FOREIGN KEY (fahrzeug_id) REFERENCES ex17.fahrzeug(fahrzeug_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex17.instandhaltung(instandhaltung_id,datum,km_stand,kosten,beschreibung,fahrzeug_id) 
Values
(40,'2021-08-05',10000,1524.55,'Teil ersetzt',24 ),
(41,'2021-08-07',15000,735.50,'Allgemeine Wartungsarbeiten',22),
(42,'2021-08-09',1000,23500,'Motorschaden',20),
(43,'2021-09-15',100000,225.50,'Reifen austausch',20 ),
(44,'2021-09-23',300000, 2000,'Kratzer beseitigt',22);



CREATE TABLE ex17.versicherungsgesellschaft(
  `vg_id` INTEGER NOT NULL,
  `firma` varchar(50) DEFAULT NULL,
  `strasse` varchar(50) DEFAULT NULL,
  `plz`  INTEGER DEFAULT NULL,
  `ort` varchar(50) DEFAULT NULL,
  `telefon`  INTEGER DEFAULT null  check(telefon between 0100000000 and 9999999999),
  CONSTRAINT versicherungsgesellschaft_pk PRIMARY KEY (`vg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex17.versicherungsgesellschaft(vg_id,firma,strasse,plz,ort,telefon) 
Values
(60,'Allianz Suisse','Birsigstrasse 43',4055,'Birsfelden',0585370202),
(61, 'AXA','Binningerstrasse 94',4123,'Allschwil',0614863828),
(62,'Die Mobiliar','Bahnhofstrasse 1',4133,'Pratteln',0618272810),
(63,'Basler','Claragraben 64',4058,'Basel',0582856780),
(64,'Helvetia','Wuhrmattstrasse 19',4103,'Bottmingen',0582801000);



CREATE TABLE ex17.versicherungsantrag(
  `vers_id` INTEGER NOT NULL,
  `vers_nr` INTEGER DEFAULT NULL,
  `kasko` varchar(15) DEFAULT NULL,
  `jaehrliche_beitrag`  INTEGER DEFAULT NULL,
  `vg_id` INTEGER NOT NULL,
  CONSTRAINT versicherungsantrag_pk PRIMARY KEY (`vers_id`),
  CONSTRAINT versicherungsantrag_FK FOREIGN KEY (vg_id) REFERENCES ex17.versicherungsgesellschaft(vg_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex17.versicherungsantrag(vers_id,vers_nr,kasko,jaehrliche_beitrag,vg_id) 
Values
(50,98765,'Teilkasko',1500,61 ),
(51,43210, 'Vollkasko',2000,64),
(52,11324,'Vollkasko',2500,60),
(53,45654,'Teilkasko',1600,63 ),
(54,33423, 'Vollkasko',3000,62);



CREATE OR REPLACE VIEW ex17.reservierungsview
AS select
    r.reservierung_id,
    r.zweck,
    r.beginn,
    r.ende,
    r.mitarbeiter_id,
    m.pers_nr,
    m.vorname,
    m.nachname,
    f.fahrzeug_id,
    f.kennzeichen,
    f.anschaffungsdatum,
    f.anschaffungskosten,
    f2.fahrzeugmodell_id,
    f2.bezeichnung,
    f2.hersteller,
    f2.kraftstoff,
    f2.verbrauch
from
    ex17.reservierung r
inner join ex17.mitarbeiter m on
    r.mitarbeiter_id = m.mitarbeiter_id
inner join ex17.fahrzeug f on
    r.fahrzeug_id = f.fahrzeug_id
inner join ex17.fahrzeugmodell f2 on
    f.fahrzeugmodell_id = f2.fahrzeugmodell_id;



CREATE OR REPLACE VIEW ex17.instandshaltungview
AS select
    i.instandhaltung_id,
    i.datum,
    i.km_stand,
    i.kosten,
    i.beschreibung,
    f.fahrzeug_id,
    f.kennzeichen,
    f.anschaffungsdatum,
    f.anschaffungskosten,
    f2.fahrzeugmodell_id,
    f2.bezeichnung,
    f2.hersteller,
    f2.kraftstoff,
    f2.verbrauch
from
    ex17.instandhaltung i
inner join ex17.fahrzeug f on
    i.fahrzeug_id = f.fahrzeug_id
inner join ex17.fahrzeugmodell f2 on
    f.fahrzeugmodell_id = f2.fahrzeugmodell_id;


  
CREATE OR REPLACE VIEW ex17.versicherungsantragview
AS select
    v.vers_id,
    v.vers_nr,
    v.kasko,
    v.jaehrliche_beitrag,
    v2.vg_id,
    v2.firma,
    v2.strasse,
    v2.plz,
    v2.ort,
    v2.telefon
from
    ex17.versicherungsantrag v
inner join ex17.versicherungsgesellschaft v2 on
    v.vg_id = v2.vg_id;
   
   
   
select * from ex17.reservierungsview;  
select * from ex17.instandshaltungview;   
select * from ex17.versicherungsantragview;
   
