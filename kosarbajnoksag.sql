CREATE DATABASE kosarlabda_bajnoksag;
USE kosarlabda_bajnoksag;

CREATE TABLE Csapatok (
    id INT PRIMARY KEY,
    csapatnev VARCHAR(100),
    varos VARCHAR(100),
    csarnok VARCHAR(100));

CREATE TABLE Jatekosok (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    pozicio INT,
    szuletesi_datum DATE,
    csapat_id INT,
    atlag_pontszam float,
    atlag_lepattano float,
    atlag_assziszt float,
    FOREIGN KEY (csapat_id) REFERENCES Csapatok(id));

CREATE TABLE Edzok (
    id INT PRIMARY KEY,
    nev VARCHAR(100),
    szuletesi_datum DATE,
    csapat_id INT,
    tapasztalat INT,
    FOREIGN KEY (csapat_id) REFERENCES Csapatok(id)
);

CREATE TABLE Merkozesek (
    id INT PRIMARY KEY,
    datum DATE,
    hazai_csapat_id INT,
    vendeg_csapat_id INT,
    hazai_pontszam INT,
    vendeg_pontszam INT,
    gyoztes_id INT,
    FOREIGN KEY (hazai_csapat_id) REFERENCES Csapatok(id),
    FOREIGN KEY (vendeg_csapat_id) REFERENCES  Csapatok(id)
);

CREATE TABLE Bajnoki_szezonok (
    szezon VARCHAR(20) PRIMARY KEY,
    ev INT,
    gyoztes_csapat_id INT,
    FOREIGN KEY (gyoztes_csapat_id) REFERENCES Csapatok(id)
);

INSERT INTO Csapatok (id, csapatnev, varos, csarnok)
VALUES 
(1, 'Vörös Oroszlánok', 'Budapest', 'Piros Aréna'),
(2, 'Fekete Párducok', 'Debrecen', 'Fekete Csarnok'),
(3, 'Kék Sólymok', 'Pécs', 'Kék Tér'),
(4, 'Arany Sasok', 'Szeged', 'Sasok Csarnoka'),
(5, 'Zöld Tigrisek', 'Miskolc', 'Tigris Aréna'),
(6, 'Sárga Lávák', 'Szolnok', 'Láva Templom'),
(7, 'Barna Medvék', 'Kecskemét', 'Medve Pálya'),
(8, 'Fehér Farkasok', 'Veszprém', 'Farkas Fészek'),
(9, 'Kék Delfinek', 'Eger', 'Delfin Stadion'),
(10, 'Vörös Bikák', 'Nyíregyháza', 'Bikás Pálya');

INSERT INTO Jatekosok (id, nev, pozicio, szuletesi_datum, csapat_id, atlag_pontszam, atlag_lepattano, atlag_assziszt)
VALUES
(1, 'Nagy Zoltán', 1, '1995-04-20', 1, 22.5, 8.4, 5.2),
(2, 'Kovács Péter', 2, '1996-02-10', 1, 18.2, 7.1, 6.3),
(3, 'Szabó Ádám', 3, '1994-09-15', 1, 14.3, 5.9, 4.4),
(4, 'Kiss András', 4, '1993-07-12', 1, 19.1, 6.5, 3.9),
(5, 'Varga László', 5, '1997-06-23', 1, 15.2, 7.3, 2.9),
(6, 'Tóth Gábor', 1, '1995-08-30', 2, 17.6, 6.7, 5),
(7, 'Horváth Dávid', 2, '1996-01-11', 2, 20.4, 5.6, 4.5),
(8, 'Molnár Balázs', 3, '1994-12-18', 2, 18.7, 8, 3.8),
(9, 'Bognár Márk', 4, '1998-05-01', 2, 16.5, 6.2, 4.1),
(10, 'Vincze Máté', 5, '1993-11-02', 2, 12.8, 4.4, 3.5),
(11, 'Bánfi Tamás', 1, '1995-09-25', 3, 21.1, 7.9, 5.7),
(12, 'Szekeres Zoltán', 2, '1997-03-19', 3, 19.5, 6.1, 5.3),
(13, 'Gáspár Levente', 3, '1996-12-04', 3, 17.9, 7.2, 4.8),
(14, 'Pál Viktor', 4, '1998-02-10', 3, 14.6, 5.5, 3.7),
(15, 'Takács Ákos', 5, '1995-01-22', 3, 16.3, 5.8, 4),
(16, 'Fekete Zsolt', 1, '1996-04-10', 4, 20.2, 7.5, 6),
(17, 'Király János', 2, '1997-08-25', 4, 18.8, 6, 5.5),
(18, 'Tóth János', 3, '1994-07-17', 4, 15.4, 6.1, 3.6),
(19, 'Lukács Ferenc', 4, '1995-11-09', 4, 17.1, 5.7, 4.3),
(20, 'Sárközi Dávid', 5, '1996-05-05', 4, 14.2, 4.8, 3.8),
(21, 'Hegedűs Gábor', 1, '1997-12-13', 5, 22.1, 9.2, 5.4),
(22, 'Balla László', 2, '1995-06-02', 5, 20.8, 8.1, 4.9),
(23, 'Rácz Zoltán', 3, '1996-02-18', 5, 17.2, 6, 5),
(24, 'Varga Péter', 4, '1997-09-01', 5, 15.3, 6.5, 4.1),
(25, 'Kovács Zsombor', 5, '1994-01-22', 5, 14.1, 5.2, 3.6),
(26, 'Kocsis Ádám', 1, '1998-12-05', 6, 18.7, 6.5, 5.2),
(27, 'Fodor Norbert', 2, '1996-04-19', 6, 20.3, 7.8, 4.7),
(28, 'Szilágyi Ádám', 3, '1997-11-17', 6, 17.9, 6.2, 5.1),
(29, 'Kis László', 4, '1994-10-12', 6, 16.8, 5.9, 4.4),
(30, 'Csernyik Máté', 5, '1995-03-07', 6, 15.4, 6.1, 3.9),
(31, 'Erdős Zoltán', 1, '1996-08-14', 7, 19.3, 6.9, 4.5),
(32, 'Major Levente', 2, '1995-07-26', 7, 18.2, 7, 5.2),
(33, 'Fodor Gábor', 3, '1994-11-05', 7, 17.6, 6.5, 4.8),
(34, 'Pál Ákos', 4, '1996-03-21', 7, 16.4, 5.9, 3.8),
(35, 'Szendrei Róbert', 5, '1995-01-18', 7, 14.7, 5.4, 3.6),
(36, 'Németh Zoltán', 1, '1996-10-09', 8, 21.2, 8, 5.6),
(37, 'Kocsis Tamás', 2, '1997-06-14', 8, 19.8, 7.2, 5.1),
(38, 'Puskás Péter', 3, '1994-08-27', 8, 18.5, 6.8, 4.9),
(39, 'Varga Dániel', 4, '1995-12-01', 8, 16.3, 5.9, 4.2),
(40, 'Fülöp László', 5, '1996-05-14', 8, 15.7, 6.1, 3.9),
(41, 'Balázs Ádám', 1, '1997-02-03', 9, 23.5, 8.7, 5),
(42, 'Pásztor Levente', 2, '1994-09-21', 9, 20.1, 7.4, 4.8),
(43, 'Nagy Tamás', 3, '1995-04-10', 9, 18.4, 6.2, 4.4),
(44, 'Kiss László', 4, '1996-11-02', 9, 17.9, 6.5, 4.2),
(45, 'Kósa Dávid', 5, '1997-07-14', 9, 16.8, 5.8, 3.9),
(46, 'Juhász Viktor', 1, '1995-12-08', 10, 20.6, 7.8, 5.2),
(47, 'Szőke János', 2, '1994-06-22', 10, 18, 6.2, 4.5),
(48, 'Tóth Gábor', 3, '1997-03-29', 10, 17.5, 6.8, 4.1),
(49, 'Kiss Viktor', 4, '1996-01-19', 10, 16.1, 5.9, 3.6),
(50, 'Németh Gábor', 5, '1995-02-10', 10, 14.8, 5.4, 3.8);


INSERT INTO Edzok (id, nev, szuletesi_datum, csapat_id, tapasztalat)
VALUES
(1, 'Kovács István', '1980-04-10', 1, 10),
(2, 'Szabó Péter', '1978-06-15', 2, 12), 
(3, 'Tóth Gábor', '1979-08-20', 3, 15), 
(4, 'Kiss Zoltán', '1985-02-10', 4, 8), 
(5, 'Horváth Tamás', '1982-11-25', 5, 9), 
(6, 'Bognár Ádám', '1984-03-15', 6, 6), 
(7, 'Varga László', '1980-07-08', 7, 13), 
(8, 'Pál Gábor', '1987-09-05', 8, 5), 
(9, 'Major Zoltán', '1983-05-17', 9, 7), 
(10, 'Németh Tamás', '1976-12-01', 10, 18);

INSERT INTO Merkozesek (id, datum, hazai_csapat_id, vendeg_csapat_id, hazai_pontszam, vendeg_pontszam, gyoztes_id)
VALUES
(1, '2025-09-10', 1, 2, 102, 95, 1),
(2, '2025-09-12', 3, 4, 98, 100, 4),
(3, '2025-09-15', 5, 6, 104, 99, 5),
(4, '2025-09-17', 7, 8, 110, 107, 7),
(5, '2025-09-20', 9, 10, 92, 93, 10),
(6, '2025-09-22', 1, 3, 95, 85, 1),
(7, '2025-09-24', 2, 4, 106, 98, 2),
(8, '2025-09-26', 5, 7, 102, 96, 5),
(9, '2025-09-28', 3, 9, 100, 110, 9),
(10, '2025-09-30', 1, 8, 108, 101, 1),
(11, '2025-10-02', 4, 6, 92, 95, 6),
(12, '2025-10-05', 2, 10, 99, 98, 2),
(13, '2025-10-07', 3, 5, 98, 104, 5),
(14, '2025-10-09', 4, 7, 112, 110, 4),
(15, '2025-10-12', 1, 2, 105, 98, 1),
(16, '2025-10-14', 6, 8, 90, 91, 8),
(17, '2025-10-16', 9, 10, 108, 105, 9),
(18, '2025-10-18', 1, 5, 115, 112, 1),
(19, '2025-10-20', 2, 3, 102, 94, 2),
(20, '2025-10-22', 7, 10, 113, 107, 7),
(21, '2025-10-24', 6, 4, 106, 98, 6),
(22, '2025-10-26', 5, 8, 112, 107, 5),
(23, '2025-10-28', 3, 2, 103, 99, 3),
(24, '2025-10-30', 1, 4, 108, 105, 1),
(25, '2025-11-02', 9, 6, 100, 93, 9),
(26, '2025-11-04', 10, 2, 98, 95, 2),
(27, '2025-11-06', 5, 9, 107, 104, 5),
(28, '2025-11-08', 7, 3, 105, 99, 7),
(29, '2025-11-10', 6, 1, 94, 103, 1),
(30, '2025-11-12', 4, 10, 112, 109, 4);

INSERT INTO Bajnoki_szezonok (szezon, ev, gyoztes_csapat_id)
VALUES
('2023/2024', 5, 2024),
('2022/2023', 6, 2023),
('2021/2022', 9, 2022),
('2020/2021', 2, 2021),
('2019/2020', 7, 2020),
('2018/2019', 5, 2019),
('2017/2018', 2, 2018),
('2016/2017', 2, 2017),
('2015/2016', 4, 2016),
('2014/2015', 1, 2015);
