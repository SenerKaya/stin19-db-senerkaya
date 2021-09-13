DROP SCHEMA IF EXISTS `ex15`;

CREATE SCHEMA `ex15` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `ex15`;


/* Tabellen erstellen und befüllen. */
/* Es gab bei foreign key hinzufügen error: "Cannot add or update a child row: a foreign key
   constraint fails..." falls zuerst alle Tabellen erstellt wurden ohne diese befüllt waren . 
   und die Reihenfolge der Tabellen mussten auch stimmen. */

CREATE TABLE ex15.funktionen(
  `fnr` INTEGER NOT NULL,
  `funktion` varchar(100) NOT NULL,
  CONSTRAINT funktionen_fk PRIMARY KEY (fnr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex15.funktionen (fnr,funktion)
VALUES
(1, 'Vorarbeiter'),
(2, 'Meister'),
(3, 'Chemiker'),
(4, 'Bereichsleiter'),
(5, 'Informatiker'); 


CREATE TABLE ex15.personen(
  `pnr`       INTEGER NOT NULL    check(pnr between 100000 and 999999),
  `name`      varchar(20)  NOT NULL,
  `vorname`   varchar(15)  NOT NULL,
  `fnr`       INTEGER NOT NULL,
  `lohnstufe` INTEGER  DEFAULT null   check(lohnstufe between 1 and 9),
  CONSTRAINT personen_pk PRIMARY KEY (pnr),
  CONSTRAINT personen_FK FOREIGN KEY (fnr) REFERENCES ex15.funktionen(fnr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci; 

INSERT INTO ex15.personen (pnr,name,vorname,fnr,lohnstufe)
VALUES
(100001, 'Steffen', 'Felix',  3, 5),
(232452, 'Müller',  'Hugo',   1, 1),
(334643, 'Meier',   'Hans',   2, 5),
(567231, 'Schmid',  'Beat',   3, 4),
(345727, 'Steiner', 'René',   5, 5),
(233456, 'Müller',  'Franz',  4, 7),
(132442, 'Osswald', 'Kurt',   1, 2),
(345678, 'Metzger', 'Paul',   1, 1),
(344556, 'Scherrer','Daniel', 2, 4),
(845622, 'Huber',   'Walter', 4, 8),
(625342, 'Gerber',  'Roland', 3, 4);


CREATE TABLE ex15.kursthemen(
  `tnr` INTEGER NOT NULL,
  `themengebiet` varchar(100)  NOT NULL,
  CONSTRAINT kursthemen_pk PRIMARY KEY (tnr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex15.kursthemen(tnr,themengebiet) VALUES
(1, 'Sicherheit und Umweltschutz'),
(2, 'Führung und Zusammenarbeit'), 
(3, 'PC-Kurse'), 
(4, 'Arbeitstechnik'),
(5, 'Projekte'),
(6, 'Schulung') ;


CREATE TABLE ex15.kurse(
  `knr` INTEGER NOT NULL,
  `kursbezeichnung` varchar(100)  NOT NULL,
  `kursort` varchar(100)  NOT NULL,
  `tnr` INTEGER   NOT NULL,
  CONSTRAINT kurse_pk PRIMARY KEY (knr),
  CONSTRAINT kurse_FK FOREIGN KEY (tnr) REFERENCES ex15.kursthemen(tnr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex15.kurse(knr,kursbezeichnung ,kursort,tnr) VALUES
(123 , 'Arbeitshygiene', '2510.EG.25',1),
(562, 'Führen einer Gruppe', '1010.4.08',2), 
(234, 'Präsentationstechnik', '1010.4.08',4), 
(341, 'Textverarbeitung', '2015.1.10',3),
(245 , 'Kostenschätzung', '1010.2.05',5),
(412 , 'Tabellenkalkulation', '2015.1.10',3),
(454 , 'Elektrostatische Aufladung', '4001.EG.20',1),
(255 , 'Datenbanken', '2510.2.05',3),
(455 , 'Terminplanung', '1010.4.08',5),
(345 , 'Schwierige Gespräche führen', '1010.2.05',2),
(283 , 'Abfallentsorgung', '4001.EG.20',1),
(776 , 'Wartung von Anlagen', '1010.2.05',4); 


CREATE TABLE ex15.kursleiter(
  `klnr`    INTEGER NOT NULL,
  `s` 	    varchar(1)  NOT NULL,
  `pnr`     INTEGER  DEFAULT NULL,
  `name`    varchar(20)  NOT NULL,
  `vorname` varchar(15) DEFAULT NULL,
  `firma`   varchar(100)   DEFAULT NULL,
  `KErf`    INTEGER  DEFAULT NULL,
  CONSTRAINT kursleiter_pk PRIMARY KEY (klnr),
  CONSTRAINT kursleiter_FK FOREIGN KEY (pnr) REFERENCES ex15.personen(pnr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO  ex15.kursleiter(klnr,s,pnr,name,vorname,firma,KErf) VALUES
(1,'I',345727,'Steiner','Rene', null,3),
(3,'I',232452,'Müller','Hugo', null,1),
(4,'I',233456,'Müller','Franz', null,4),
(2,'E',null,'Suter','Rolf', 'GigaSoft',null),
(5,'E',null,'Vogt','Peter', 'Quasar',null),
(6,'I',845622,'Huber','Walter', null,3),
(7,'E',null,'Krieg','Stefan', 'Funkenflug',null),
(8,'E',null,'Freundlich','Andreas','Harmonie',null);


CREATE TABLE ex15.kursbesuche(
  `pnr` INTEGER NOT NULL,
  `knr` INTEGER NOT NULL,
  `klnr` INTEGER NOT NULL,
  `datum` date DEFAULT null,
  CONSTRAINT kursbesuche_pk PRIMARY KEY (pnr,knr,klnr),
  CONSTRAINT kursbesuche_FK_person FOREIGN KEY (pnr) REFERENCES ex15.personen(pnr),
  CONSTRAINT kursbesuche_FK_kurse FOREIGN KEY (knr) REFERENCES ex15.kurse(knr),
  CONSTRAINT kursbesuche_FK_kursleiter FOREIGN KEY (klnr) REFERENCES ex15.kursleiter(klnr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO  ex15.kursbesuche(pnr,knr,klnr,datum) VALUES
(100001,245,4,'2008-06-23'),
(100001,412,2,'2006-08-07'),
(100001,454,7,'2007-01-12'),
(345678,123,6,'2007-02-03'),
(345678,776,3,'2008-04-15'),
(344556,412,2,'2007-06-10'),
(334643,412,2,'2006-08-07'),
(625342,255,1,'2008-07-21'),
(845622,345,8,'2007-11-11'),
(100001,255,1,'2008-07-21'),
(232452,454,7,'2007-09-17'),
(132442,454,7,'2007-09-17'),
(345678,454,7,'2007-09-17'),
(345678,123,4,'2008-08-25');


CREATE TABLE ex15.kurskontrolle(
  `fnr` INTEGER NOT NULL,
  `knr` INTEGER NOT NULL,
   CONSTRAINT kurskontrolle_pk PRIMARY KEY (fnr,knr),
   CONSTRAINT kurskontrolle_FK_funktionen FOREIGN KEY (fnr) REFERENCES ex15.funktionen(fnr),
   CONSTRAINT kurskontrolle_FK_kurse FOREIGN KEY (knr) REFERENCES ex15.kurse(knr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO  ex15.kurskontrolle(fnr,knr) VALUES
(1,123),
(2,123),
(3,123),
(4,123),
(2,562),
(3,562),
(4,562),
(3,234),
(5,234),
(3,341),
(3,245),
(4,245),
(2,412),
(3,412),
(1,454),
(2,454),
(3,454),
(4,454),
(3,255),
(3,455),
(4,455),
(4,345),
(1,283),
(2,283),
(3,283),
(1,776),
(2,776),
(5,245);



/* View erstellen */
CREATE OR REPLACE VIEW ex15.all_courses
AS select
    k.knr,
    k.kursbezeichnung,
    k2.datum,
    k2.pnr,
    k3.name,
    k3.firma
from
    ex15.kurse k
inner join ex15.kursbesuche k2 on
    k.knr = k2.knr
inner join ex15.kursleiter k3 on
    k3.klnr = k2.klnr;


select * from ex15.all_courses;



