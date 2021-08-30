DROP SCHEMA IF EXISTS `ex09`;
-- In MySQL, the schema is the synonym for the database
-- DROP DATABASE [IF EXISTS] database_name;

CREATE SCHEMA `ex09` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `ex09`;

CREATE TABLE ex09.person (
  `pnr` INTEGER NOT NULL,
  `name`varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  CONSTRAINT person_pk PRIMARY KEY (pnr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

CREATE TABLE ex09.auto (
  anr INTEGER NOT NULL,
  marke varchar(45) NOT NULL,
  typ varchar(45) DEFAULT NULL,
  baujahr INTEGER DEFAULT NULL,
  CONSTRAINT auto_pk PRIMARY KEY (anr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;


# (Zusammengesetzter ID-Schlüssel aus ANr und PNr)
CREATE TABLE ex09.fahrzeughalter (
  pnr INTEGER DEFAULT NULL,
  anr INTEGER NOT NULL,
  # PRIMARY KEY (pnr, anr),
  FOREIGN KEY (pnr) REFERENCES ex09.person (pnr) on delete no action on update no action,
  FOREIGN KEY (anr) REFERENCES ex09.auto (anr) on delete no action on update no action
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex09.person (pnr,name,vorname) VALUES
(1,'Müller','Heinz'),
(2,'Meier','Hans'),
(3,'Schmid','Beat'),
(4,'Steffen','Felix');

INSERT INTO ex09.auto (anr,marke,typ,baujahr) VALUES
(1,'Audi','A6',2008),
(2,'Opel','Antara',2007),
(3,'Fiat','Punto',2002);


INSERT INTO ex09.fahrzeughalter (pnr, anr) VALUES
(1,2),
(1,3),
(2,1),
(3,1),
(3,2);


   CREATE OR REPLACE VIEW ex09.autoperson   # b) personen mit Autos 2x inner join (Fahrzeughalter-person/ Fahrzeughalter-autos)
AS select
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex09.fahrzeughalter f
inner join ex09.auto a on f.anr = a.anr
inner join ex09.person p on  f.pnr = p.pnr;

   
   CREATE OR REPLACE VIEW ex09.auto_allperson   # c) Alle personen. Fahrzeughalter-auto right join/ fahrzeughalter-person inner join
AS select
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex09.fahrzeughalter f
     right join ex09.auto a on f.anr = a.anr
     right join ex09.person p on f.pnr = p.pnr;

   
   CREATE OR REPLACE VIEW ex09.person_allauto   # d) Alle Autos. Fahrzeughalter-person inner join/ fahrzeughalter- autos right join
AS select
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex09.fahrzeughalter f
    right join ex09.person p on f.pnr = p.pnr
    right join ex09.auto a on  f.anr = a.anr;
   
   
   CREATE OR REPLACE VIEW ex09.allperson_no_car   # e) Alle personen ohne auto werden aufgelistet. wie c aber mit Filter.
AS select
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex09.fahrzeughalter f
	right join ex09.auto a on f.anr = a.anr
	right join ex09.person p on f.pnr = p.pnr
    where a.marke is null;
   
   
   CREATE OR REPLACE VIEW ex09.allcar_no_person   # f) Alle Autos ohne besitzer. wie d mit filter.
AS select
 
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex09.fahrzeughalter f
    right join ex09.person p on f.pnr = p.pnr
    right join ex09.auto a on  f.anr = a.anr
    where p.name is null;
   
   
     CREATE OR REPLACE VIEW ex09.allperson_allauto   # g) Alle Autos und alle Personen. Zwei Queries mit Union verbunden. 
AS select
    p.name,  p.vorname, p.pnr, a.anr, a.marke, a.typ, a.baujahr
from
    ex09.fahrzeughalter f
    right join ex09.person p on f.pnr = p.pnr
    right join ex09.auto a on  f.anr = a.anr
   
union

 select
    p.name,  p.vorname, p.pnr, a.anr, a.marke, a.typ, a.baujahr
from
    ex09.fahrzeughalter f
    right join ex09.auto a on  f.anr = a.anr
    right join ex09.person p on f.pnr = p.pnr;
    
   
   
  select * from ex09.autoperson;
  select * from ex09.auto_allperson; 
  select * from ex09.person_allauto; 
  select * from ex09.allperson_no_car; 
  select * from ex09.allcar_no_person; 
  select * from ex09.allperson_allauto;
 
