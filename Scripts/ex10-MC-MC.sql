DROP SCHEMA IF EXISTS `ex10`;
-- In MySQL, the schema is the synonym for the database
-- DROP DATABASE [IF EXISTS] database_name;

CREATE SCHEMA `ex10` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `ex10`;

CREATE TABLE ex10.person (
  `pnr` INTEGER NOT NULL,
  `name`varchar(45) DEFAULT NULL,
  `vorname` varchar(45) DEFAULT NULL,
  CONSTRAINT person_pk PRIMARY KEY (pnr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

CREATE TABLE ex10.auto (
  anr INTEGER NOT NULL,
  marke varchar(45) NOT NULL,
  typ varchar(45) DEFAULT NULL,
  baujahr INTEGER DEFAULT NULL,
  CONSTRAINT auto_pk PRIMARY KEY (anr)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

# (Zusammengesetzter ID-Schlüssel aus ANr und PNr)
CREATE TABLE ex10.fahrzeughalter (
  pnr INTEGER DEFAULT NULL,
  anr INTEGER DEFAULT NULL,
 # PRIMARY KEY (pnr, anr),
  FOREIGN KEY (pnr) REFERENCES ex10.person (pnr) on delete no action on update no action,
  FOREIGN KEY (anr) REFERENCES ex10.auto (anr) on delete no action on update no action
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex10.person (pnr,name,vorname) VALUES
(1,'Müller','Heinz'),
(2,'Meier','Hans'),
(3,'Schmid','Beat'),
(4,'Steffen','Felix');

INSERT INTO ex10.auto (anr,marke,typ,baujahr) VALUES
(1,'Audi','A6',2008),
(2,'Opel','Antara',2007),
(3,'Fiat','Punto',2002);


INSERT INTO ex10.fahrzeughalter (pnr, anr) VALUES
(1,2),
(1,1),
(2,1),
(2,2),
(4,2);


   CREATE OR REPLACE VIEW ex10.autoperson   # b) personen mit Autos 2x inner join (Fahrzeughalter-person/ Fahrzeughalter-autos)
AS select
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex10.fahrzeughalter f
inner join ex10.auto a on f.anr = a.anr
inner join ex10.person p on  f.pnr = p.pnr;

   
   CREATE OR REPLACE VIEW ex10.auto_allperson   # c) Alle personen. Fahrzeughalter-auto right join/ fahrzeughalter-person inner join
AS select
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex10.fahrzeughalter f
     right join ex10.auto a on f.anr = a.anr
     right join ex10.person p on f.pnr = p.pnr;

   
   CREATE OR REPLACE VIEW ex10.person_allauto   # d) Alle Autos. Fahrzeughalter-person inner join/ fahrzeughalter- autos right join
AS select
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex10.fahrzeughalter f
    right join ex10.person p on f.pnr = p.pnr
    right join ex10.auto a on  f.anr = a.anr;
   
   
   CREATE OR REPLACE VIEW ex10.allperson_no_car   # e) Alle personen ohne auto werden aufgelistet. wie c aber mit Filter.
AS select
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex10.fahrzeughalter f
	right join ex10.auto a on f.anr = a.anr
	right join ex10.person p on f.pnr = p.pnr
    where a.marke is null;
   
   
   CREATE OR REPLACE VIEW ex10.allcar_no_person   # f) Alle Autos ohne besitzer. wie d mit filter.
AS select
 
    p.name,
    p.vorname,
    p.pnr,
    a.anr,
    a.marke,
    a.typ,
    a.baujahr
from
    ex10.fahrzeughalter f
    right join ex10.person p on f.pnr = p.pnr
    right join ex10.auto a on  f.anr = a.anr
    where p.name is null;
   
   
     CREATE OR REPLACE VIEW ex10.allperson_allauto   # g) Alle Autos und alle Personen. Zwei Queries mit Union verbunden. 
AS select
    p.name,  p.vorname, p.pnr, a.anr, a.marke, a.typ, a.baujahr
from
    ex10.fahrzeughalter f
    right join ex10.person p on f.pnr = p.pnr
    right join ex10.auto a on  f.anr = a.anr
   
union

 select
    p.name,  p.vorname, p.pnr, a.anr, a.marke, a.typ, a.baujahr
from
    ex10.fahrzeughalter f
    right join ex10.auto a on  f.anr = a.anr
    right join ex10.person p on f.pnr = p.pnr;
    
   
   
  select * from ex10.autoperson;
  select * from ex10.auto_allperson; 
  select * from ex10.person_allauto; 
  select * from ex10.allperson_no_car; 
  select * from ex10.allcar_no_person; 
  select * from ex10.allperson_allauto;
 
