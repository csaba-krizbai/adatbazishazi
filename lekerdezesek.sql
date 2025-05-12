--Minden játékos listázása csapatonként:

SELECT 
    t.csapatnev, 
    j.nev AS jatekosnev, 
    j.pozicio 
FROM 
    Jatekosok j
JOIN 
    Csapatok t ON j.csapat_id = t.id
GROUP BY
    t.csapatnev, j.nev, j.pozicio
ORDER BY 
    t.csapatnev, j.pozicio;

--átlagstatisztikák csapatonként:

SELECT 
    t.csapatnev, 
    AVG(j.atlag_pontszam) AS atlag_pontszam, 
    AVG(j.atlag_lepattano) AS atlag_lepattano, 
    AVG(j.atlag_assziszt) AS atlag_assziszt,
    COUNT(j.id) AS jatekosok_szama
FROM 
    Csapatok t
JOIN 
    Jatekosok j ON t.id = j.csapat_id
GROUP BY 
    t.csapatnev
ORDER BY 
    atlag_pontszam DESC, atlag_lepattano DESC, atlag_assziszt DESC;

--Legjobb 5 játékos (legmagasabb átlagpontszámok):

SELECT 
    j.nev AS jatekosnev, 
    t.csapatnev, 
    j.atlag_pontszam
FROM 
    Jatekosok j
JOIN 
    Csapatok t ON j.csapat_id = t.id
ORDER BY 
    j.atlag_pontszam DESC
LIMIT 5;

--Győzelmek és vereségek hazai és vendég csapatként szétbontva(csapatonként):

SELECT 
    t.csapatnev,
    COUNT(CASE WHEN m.hazai_pontszam > m.vendeg_pontszam AND m.hazai_csapat_id = t.id THEN 1 END) AS hazai_gyozelem,
    COUNT(CASE WHEN m.vendeg_pontszam > m.hazai_pontszam AND m.vendeg_csapat_id = t.id THEN 1 END) AS vendeg_gyozelem,
    COUNT(CASE WHEN m.hazai_pontszam < m.vendeg_pontszam AND m.hazai_csapat_id = t.id THEN 1 END) AS hazai_vereseg,
    COUNT(CASE WHEN m.vendeg_pontszam < m.hazai_pontszam AND m.vendeg_csapat_id = t.id THEN 1 END) AS vendeg_vereseg
FROM 
    Csapatok t
LEFT JOIN 
    Merkozesek m ON m.hazai_csapat_id = t.id OR m.vendeg_csapat_id = t.id
GROUP BY 
    t.csapatnev
ORDER BY 
    t.csapatnev;


--Legnagyobb győzelmek (10):

SELECT 
    t1.csapatnev AS hazai_csapat, 
    t2.csapatnev AS vendeg_csapat,
    ABS(m.hazai_pontszam - m.vendeg_pontszam) AS mennyivel_nyert,
    t3.csapatnev AS gyoztes_csapat
FROM 
    Merkozesek m
JOIN 
    Csapatok t1 ON m.hazai_csapat_id = t1.id
JOIN 
    Csapatok t2 ON m.vendeg_csapat_id = t2.id
JOIN 
    Csapatok t3 ON m.gyoztes_id = t3.id
GROUP BY 
    t1.csapatnev, t2.csapatnev, t3.csapatnev
ORDER BY 
    mennyivel_nyert DESC
LIMIT 10;