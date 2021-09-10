DROP SCHEMA IF EXISTS `ex16`;

CREATE SCHEMA `ex16` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `ex16`;

CREATE TABLE ex16.kunde(
  `kunde_id` INTEGER NOT NULL,
  `vorname` varchar(50) NOT NULL,
  `nachname` varchar(50) NOT null,
  CONSTRAINT kunde_pk PRIMARY KEY (`kunde_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex16.kunde(kunde_id,vorname,nachname) 
Values
(1, 'Max', 'Meier'),
(2, 'Steffen', 'Keller'),
(3, 'Daniel', 'Schmid'),
(4, 'Marco', 'Steiner'),
(5, 'Martin', 'Widmer');



CREATE TABLE ex16.mietvertrag(
  `mietvertrag_id` INTEGER NOT NULL,
  `abschlussdatum` date DEFAULT NULL,
  `mietbeginn` date DEFAULT NULL,
  `mietdauer` INTEGER DEFAULT NULL,
  `kunde_id` INTEGER NOT NULL,
  CONSTRAINT mietvertrag_pk PRIMARY KEY (`mietvertrag_id`),
  CONSTRAINT mietvertrag_FK FOREIGN KEY (kunde_id) REFERENCES ex16.kunde(kunde_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex16.mietvertrag(mietvertrag_id,abschlussdatum,mietbeginn,mietdauer,kunde_id) 
Values
(100, '2021-08-11','2021-08-12',3,1),
(101, '2021-08-28','2021-08-29',2,1),
(102, '2021-09-01','2021-09-01',4,2),
(103, '2021-09-03','2021-09-04',7,3),
(104, '2021-09-10','2021-09-13',1,4);



CREATE TABLE ex16.fahrradtyp(
  `ftyp_id` INTEGER NOT NULL,
  `modell` varchar(100) DEFAULT NULL,
  CONSTRAINT fahrradtyp_pk PRIMARY KEY (`ftyp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex16.fahrradtyp(ftyp_id,modell) 
Values
(1, 'Mountainbike'),
(2, 'Trekkingrad'),
(3, 'Rennrad'),
(4, 'E-Bike'),
(5, 'City-Bike'),
(6, 'Crossbike');



CREATE TABLE ex16.fahrrad(
  `f_id` INTEGER NOT NULL,
  `ftyp_id` INTEGER NOT NULL,
  `kennung` varchar(100) DEFAULT NULL,
  CONSTRAINT fahrrad_pk PRIMARY KEY (`f_id`),
  CONSTRAINT fahrrad_FK FOREIGN KEY (ftyp_id) REFERENCES ex16.fahrradtyp(ftyp_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex16.fahrrad(f_id,ftyp_id,kennung) 
Values
(500,1, 'Cross#7'),
(501,2, 'Mark#2'),
(502,3, 'Renn#8'),
(503,4, 'City#4'),
(504,4, 'City#5');



CREATE TABLE ex16.vermietete_fahrraeder(
  `f_id` INTEGER NOT NULL,
  `mietvertrag_id` INTEGER NOT null,
  CONSTRAINT vermietete_fahrraeder_pk PRIMARY KEY (f_id,mietvertrag_id),
  CONSTRAINT vermietete_fahrraeder_FK FOREIGN KEY (f_id) REFERENCES ex16.fahrrad(f_id),
  CONSTRAINT vermietete_fahrraeder_FK_1 FOREIGN KEY (mietvertrag_id) REFERENCES ex16.mietvertrag(mietvertrag_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 collate=utf8mb4_unicode_ci;

INSERT INTO ex16.vermietete_fahrraeder(f_id,mietvertrag_id) 
Values
(500,100),
(501,100),
(502,102),
(503,103),
(504,104);



CREATE OR REPLACE VIEW ex16.fahrrad_vermietungen
AS select
    k.kunde_id as Kunden_ID,
    k.vorname as Vorname,
    k.nachname as Nachname,
    m.mietvertrag_id as Vertrag_ID,
    m.abschlussdatum as Abschlussdatum,
    m.mietbeginn as Mietbeginn,
    f.kennung as Fahrrad,
    f2.modell as Fahrrad_Typ
from
    ex16.kunde k
inner join ex16.mietvertrag m on
    k.kunde_id = m.kunde_id
inner join ex16.vermietete_fahrraeder vf on
    m.mietvertrag_id = vf.mietvertrag_id
inner join ex16.fahrrad f on
    vf.f_id = f.f_id
inner join ex16.fahrradtyp f2 on
    f.ftyp_id = f2.ftyp_id;

 select * from ex16.fahrrad_vermietungen;


/*
    k.kunde_id as Kunden ID,
    k.vorname as Vorname,
    k.nachname as Nachname,
    m.mietvertrag_id as Vertrag ID,
    m.abschlussdatum as Abschlussdatum,
    m.mietbeginn as Mietbeginn,
    f.kennung as Fahrrad,
    f2.modell as Fahrrad Typ

CREATE OR REPLACE VIEW ex16.fahrrad_vermietungen
AS select
    k.kunde_id as Kunden,
    k.vorname as Vorname,
    k.nachname as Nachname,
    m.mietvertrag_id as Vertrag,
    m.abschlussdatum as Abschlussdatum,
    m.mietbeginn as Mietbeginn,
    m.mietdauer as Mietdauer,
    f.kennung as Fahrrad,
    f2.modell as Fahrrad Typ
from
    ex16.kunde k
inner join ex16.mietvertrag m on
    k.kunde_id = m.kunde_id
inner join ex16.vermietete_fahrraeder vf on
    m.mietvertrag_id = vf.mietvertrag_id
inner join ex16.fahrrad f on
    vf.f_id = f.f_id
inner join ex16.fahrradtyp f2 on
    f.ftyp_id = f2.ftyp_id;

  select * from ex16.fahrrad_vermietungen;

*/