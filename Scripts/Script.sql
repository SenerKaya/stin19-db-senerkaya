select
    k.kunde_id as Kunden ID,
    k.vorname as Vorname,
    k.nachname as Nachname,
    m.mietvertrag_id as Vertrag ID,
    m.abschlussdatum as Abschlussdatum,
    m.mietbeginn as Mietbeginn,
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
