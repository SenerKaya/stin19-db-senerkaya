select
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
;
