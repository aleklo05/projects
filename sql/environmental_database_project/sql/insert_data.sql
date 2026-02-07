USE GeoBase;
GO

PRINT 'Uzupełnianie danymi...';




-- 1. ORGANIZACJE

PRINT 'ORGANIZACJE..';
INSERT INTO Organizacje (NIP, nazwa_organizacji, typ_organizacji, adres) VALUES
('1234567890', 'Dyrekcja Lasow Panstwowych Bieszczady', 'Administracja lesna', 'ul. Lesna 12, Ustrzyki Dolne'),
('2345678901', 'Nadlesnictwo Cisna', 'Nadlesnictwo', 'Cisna 20, 38-607 Cisna'),
('3456789012', 'Nadlesnictwo Baligrod', 'Nadlesnictwo', 'Baligrod 5, 38-606 Baligrod'),
('4567890123', 'Park Krajobrazowy Doliny Sanu', 'Park Krajobrazowy', 'Sanok 3, 38-500 Sanok'),
('5678901234', 'Fundacja Dziedzictwa Przyrody', 'NGO', 'ul. Zielona 8, Rzeszow'),
('6789012345', 'Instytut Ekologii PAN', 'Instytut badawczy', 'ul. Akademicka 15, Krakow'),
('7890123456', 'Uniwersytet Rzeszowski Biologia', 'Uczelnia', 'ul. Rejtana 12, Rzeszow'),
('8901234567', 'Osrodek Edukacji Przyrodniczej Solina', 'Edukacja', 'ul. Jeziorna 2, Solina'),
('9012345678', 'Regionalna Dyrekcja Ochrony Srodowiska', 'Administracja', 'ul. Kopernika 4, Rzeszow'),
('1122334455', 'Fundacja Ochrony Fauny Karpat', 'NGO', 'ul. Gorska 1, Krosno'),
('1414142222', 'Fundacja WWF Polska', 'NGO', 'ul. Usypiskowa 11, Warszawa');






-- 2. UŻYTKOWNICY

PRINT 'UZYTKOWNICY...';
INSERT INTO Uzytkownicy (imie, nazwisko, zawod, email, nr_kadrowy, id_organizacji) VALUES
('Marek', 'Kowalski', 'Lesniczy', 'marek.kowalski@dlp.pl', 101, '1414142222'),
('Anna', 'Nowak', 'Biolog', 'anna.nowak@cisna.pl', 102, '1414142222'),
('Piotr', 'Lesny', 'Technik', 'piotr.lesny@baligrod.pl', 103, '3456789012'),
('Karolina', 'Zieba', 'Ekolog', 'karolina.zieba@pksan.pl', 104, '4567890123'),
('Tomasz', 'Wrona', 'Naukowiec', 'tomasz.wrona@fdp.pl', 105, '5678901234'),
('Ewa', 'Mazur', 'Badacz', 'ewa.mazur@pan.pl', 106, '6789012345'),
('Lukasz', 'Kruk', 'Naukowiec', 'lukasz.kruk@ur.edu.pl', 107, '7890123456'),
('Natalia', 'Cicha', 'Edukator', 'natalia.cicha@oep.pl', 108, '8901234567'),
('Pawel', 'Lis', 'Administrator', 'pawel.lis@rdos.gov.pl', 109, '9012345678'),
('Magdalena', 'Sarna', 'Ekolog', 'magdalena.sarna@fofk.pl', 110, '1122334455'),
('Jan', 'Bednarski', 'Lesniczy', 'jan.bednarski@cisna.pl', 111, '2345678901'),
('Agnieszka', 'Kaczmarczyk', 'Biolog', 'agnieszka.kaczmarczyk@pan.pl', 112, '6789012345'),
('Michal', 'Stepien', 'Technik', 'michal.stepien@baligrod.pl', 113, '3456789012'),
('Katarzyna', 'Duda', 'Ekolog', 'katarzyna.duda@pksan.pl', 114, '4567890123'),
('Rafal', 'Zielinski', 'Badacz', 'rafal.zielinski@ur.edu.pl', 115, '7890123456'),
('Robert', 'Kania', 'Biolog', 'robert.kania@pan.pl', 116, '6789012345'),
('Monika', 'Sikora', 'Ekolog', 'monika.sikora@fofk.pl', 117, '1122334455'),
('Damian', 'Pluta', 'Technik', 'damian.pluta@baligrod.pl', 118, '3456789012'),
('Iwona', 'Pajak', 'Edukator', 'iwona.pajak@oep.pl', 119, '1414142222'),
('Sebastian', 'Goral', 'Inspektor', 'sebastian.goral@rdos.gov.pl', 120, '1414142222'),
('Patrycja', 'Lewandowska', 'Badacz', 'patrycja.lewandowska@ur.edu.pl', 121, '1414142222');




-- 3. KRAINY GEOGRAFICZNE

PRINT 'KRAINY GEOGRAFICZNE...';
INSERT INTO Krainy_Geograficzne (nazwa_krainy, typ_krainy, powierzchnia_km2) VALUES
('Polonina Wetlinska', 'Pasmo gorskie', 32.50),
('Polonina Carynska', 'Pasmo gorskie', 28.40),
('Dolina Gornego Sanu', 'Dolina rzeczna', 41.20),
('Rezerwat Tarnica', 'Rezerwat', 12.80),
('Jezioro Solinskie Strefa Centralna', 'Jezioro', 15.60),
('Wielka Rawka', 'Pasmo gorskie', 39.70),
('Rezerwat Bukowe Berdo', 'Rezerwat', 9.30),
('Uroczysko Stary Las', 'Obszar lesny', 18.20),
('Ostoja Karpacka Zachod', 'Ostoja', 26.90),
('Dolina Wetlinki', 'Dolina rzeczna', 14.10),
('Nadlesnictwo Cisna Oddzial 7', 'Nadlesnictwo', 121.00),
('Przelecz Wyzna', 'Formacja terenowa', 3.40),
('Rezerwat Zrodla Sanu', 'Rezerwat', 6.50),
('Obszar Chroniony Ustrzycki', 'Obszar chroniony', 22.40),
('Kotlina Ustrzycka', 'Kotlina', 19.90),
('Lasy Legowe Sanu', 'Obszar lesny', 11.80),
('Brzegi Jeziora Myczkowskiego', 'Strefa nadjeziorna', 7.30),
('Laki Dzwiniackie', 'Laki', 5.60),
('Pasmo Otrytu', 'Pasmo gorskie', 48.20),
('Skalki Hnatowe', 'Formacja skalna', 2.90),
('Bieszczadzki Park Narodowy', 'Park narodowy', 292.00),
('Białowieski Park Narodowy', 'Park narodowy', 105.20);




-- 4. GATUNKI

PRINT 'GATUNKI...';
INSERT INTO Gatunki (nazwa_lacinska, nazwa_polska, typ_gatunku, status_ochrony) VALUES
('Bison bonasus', 'Zubr europejski', 'Fauna', 'Zagrożony'),
('Cervus elaphus', 'Jelen szlachetny', 'Fauna', 'Najmniejszej troski'),
('Lynx lynx', 'Rys euroazjatycki', 'Fauna', 'Zagrożony'),
('Canis lupus', 'Wilk szary', 'Fauna', 'Zagrożony'),
('Ciconia nigra', 'Bocian czarny', 'Fauna', 'Zagrożony'),
('Aquila chrysaetos', 'Orzel przedni', 'Fauna', 'Zagrożony'),
('Asio otus', 'Sowa uszata', 'Fauna', 'Najmniejszej troski'),
('Salamandra salamandra', 'Salamandra plamista', 'Fauna', 'Najmniejszej troski'),
('Vipera berus', 'Zmija zygzakowata', 'Fauna', 'Najmniejszej troski'),
('Ursus arctos', 'Niedzwiedz brunatny', 'Fauna', 'Zagrożony'),
('Pinus sylvestris', 'Sosna zwyczajna', 'Flora', 'Najmniejszej troski'),
('Picea abies', 'Swierk pospolity', 'Flora', 'Najmniejszej troski'),
('Betula pendula', 'Brzoza brodawkowata', 'Flora', 'Najmniejszej troski'),
('Quercus robur', 'Dab szypulkowy', 'Flora', 'Najmniejszej troski'),
('Larix decidua', 'Modrzew europejski', 'Flora', 'Najmniejszej troski'),
('Sorbus aucuparia', 'Jarzab pospolity', 'Flora', 'Najmniejszej troski'),
('Corylus avellana', 'Leszczyna pospolita', 'Flora', 'Najmniejszej troski'),
('Alnus glutinosa', 'Olsza czarna', 'Flora', 'Najmniejszej troski'),
('Tilia cordata', 'Lipa drobnolistna', 'Flora', 'Najmniejszej troski'),
('Populus alba', 'Topola biala', 'Flora', 'Najmniejszej troski'),
('Tetrastes bonasia', 'Jarzabek', 'Fauna', 'Najmniejszej troski'),
('Heracleum sosnowskyi', 'Barszcz sosnowskiego', 'Flora', 'Najmniejszej troski');




-- 5. CHOROBY

PRINT 'CHOROBY...';
INSERT INTO Choroby (nazwa_choroby) VALUES
('Wscieklizna'),
('Afrykanski pomor swin'),
('Borelioza'),
('Maczniak prawdziwy trzciny'),
('Choroba grzybowa debu'),
('Grzyb z rodzaju Phytophthora'),
('Kleszczowe zapalenie mozgu'),
('Choroba bakteryjna lisci'),
('Swierzb zwierzat'),
('Parazytarne zakazenie wewnetrzne'),
('Choroba wirusowa ptakow'),
('Kokcydioza'),
('Zgnilizna korzeni drzew'),
('Choroba lisci sosny'),
('Grzybnica korowa debu'),
('Pasozytnica swierzbowa ssakow lesnych'),
('Choroba wirusowa ssakow'),
('Neuroinfekcja mchowa'),
('Lesna hemopatia weglowa'),
('Syndrom zanikajacego tropu'),
('Krzemienica skorna'),
('Goraczka nocnych echow'),
('Maczniak prawdziwy debu'),
('Gruźlica'),
('Nosówka'),
('Pasożyty wewnętrzne'),
('Zatrucie metalami ciężkimi');




-- 6. DZIALANIA

PRINT 'DZIALANIA...';
INSERT INTO Dzialania
(nazwa_dzialania, typ_dzialania, status_dzialania, data_rozpoczecia, data_zakonczenia, id_kierownika, id_krainy)
SELECT 'Monitoring populacji zubra', 'Monitoring', 'W toku', '2025-01-10', '2025-12-10', u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE u.email = 'marek.kowalski@dlp.pl';

INSERT INTO Dzialania
SELECT 'Inwentaryzacja duzych drapieznikow', 'Badania', 'Zakończone', '2025-03-01', '2025-09-30', u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Carynska'
WHERE u.email = 'anna.nowak@cisna.pl';

INSERT INTO Dzialania
SELECT 'Kontrola siedlisk wilka','Inspekcja','W toku','2025-02-15','2025-11-20',u.id_uzytkownika,k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Dolina Gornego Sanu'
WHERE u.email = 'piotr.lesny@baligrod.pl';

INSERT INTO Dzialania
SELECT 'Ochrona rzadkich ptakow','Ochrona czynna','Zaplanowane','2025-04-01', '2025-10-30', u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Tarnica'
WHERE u.email = 'karolina.zieba@pksan.pl';

INSERT INTO Dzialania
SELECT 'Monitoring rysia', 'Monitoring', 'W toku', '2025-01-20', '2025-11-30',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Wielka Rawka'
WHERE u.email = 'ewa.mazur@pan.pl';

INSERT INTO Dzialania
SELECT 'Liczenie jeleni', 'Monitoring', 'Zakończone', '2024-04-01', '2024-10-01',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Carynska'
WHERE u.email = 'jan.bednarski@cisna.pl';

INSERT INTO Dzialania
SELECT 'Ochrona siedlisk niedzwiedzia', 'Ochrona czynna', 'W toku', '2025-02-01', '2025-12-15',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Dolina Gornego Sanu'
WHERE u.email = 'lukasz.kruk@ur.edu.pl';

INSERT INTO Dzialania
SELECT 'Kontrola zdrowia drzewostanu', 'Inspekcja', 'Zaplanowane', '2025-05-01', '2025-09-01',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Uroczysko Stary Las'
WHERE u.email = 'magdalena.sarna@fofk.pl';

INSERT INTO Dzialania
SELECT 'Monitoring ptakow drapieznych', 'Monitoring', 'W toku', '2025-03-01', '2025-10-31',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Bukowe Berdo'
WHERE u.email = 'rafal.zielinski@ur.edu.pl';

INSERT INTO Dzialania
SELECT 'Badanie jakosci wody', 'Badania', 'Zaplanowane', '2025-06-01', '2025-08-31',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Jezioro Solinskie Strefa Centralna'
WHERE u.email = 'tomasz.wrona@fdp.pl';

INSERT INTO Dzialania
SELECT 'Edukacja ekologiczna mlodziezy', 'Edukacja', 'W toku', '2025-03-15', '2025-06-30',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Jezioro Solinskie Strefa Centralna'
WHERE u.email = 'natalia.cicha@oep.pl';

INSERT INTO Dzialania
SELECT 'Kontrola korytarzy migracyjnych', 'Inspekcja', 'Zaplanowane', '2025-07-01', '2025-10-15',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Ostoja Karpacka Zachod'
WHERE u.email = 'pawel.lis@rdos.gov.pl';

INSERT INTO Dzialania
SELECT 'Odtwarzanie lak naturalnych', 'Ochrona czynna', 'W toku', '2025-04-01', '2025-09-30',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Laki Dzwiniackie'
WHERE u.email = 'karolina.zieba@pksan.pl';

INSERT INTO Dzialania
SELECT 'Monitoring populacji wilka', 'Monitoring', 'W toku', '2025-01-05', '2025-12-05',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Pasmo Otrytu'
WHERE u.email = 'piotr.lesny@baligrod.pl';

INSERT INTO Dzialania
SELECT 'Kontrola erozji gleby', 'Inspekcja', 'Zaplanowane', '2025-08-01', '2025-10-01',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Skalki Hnatowe'
WHERE u.email = 'ewa.mazur@pan.pl';

INSERT INTO Dzialania
SELECT 'Monitoring zmij', 'Monitoring', 'Zakończone', '2024-03-01', '2024-09-01',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE u.email = 'agnieszka.kaczmarczyk@pan.pl';

INSERT INTO Dzialania
SELECT 'Ochrona zrodel wodnych', 'Ochrona czynna', 'W toku', '2025-02-15', '2025-11-15',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Zrodla Sanu'
WHERE u.email = 'lukasz.kruk@ur.edu.pl';

INSERT INTO Dzialania
SELECT 'Monitoring owadow zapylajacych', 'Monitoring', 'Zaplanowane', '2025-05-15', '2025-08-15',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Lasy Legowe Sanu'
WHERE u.email = 'magdalena.sarna@fofk.pl';

INSERT INTO Dzialania
SELECT 'Badanie bioroznorodnosci', 'Badania', 'W toku', '2025-03-01', '2025-12-01',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Kotlina Ustrzycka'
WHERE u.email = 'rafal.zielinski@ur.edu.pl';

INSERT INTO Dzialania
SELECT 'Kontrola gatunkow inwazyjnych', 'Inspekcja', 'Zaplanowane', '2025-06-01', '2025-09-30',
       u.id_uzytkownika, k.id_krainy
FROM Uzytkownicy u
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Brzegi Jeziora Myczkowskiego'
WHERE u.email = 'pawel.lis@rdos.gov.pl';




-- 7. ZADANIA

PRINT 'ZADANIA...';
INSERT INTO Zadania
SELECT 'Rozstawienie fotopulapek', 'Zakończone', '2025-11-10', d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'marek.kowalski@dlp.pl'
WHERE d.nazwa_dzialania = 'Monitoring populacji zubra';

INSERT INTO Zadania
SELECT 'Analiza sladow zubra', 'Zakończone', '2025-09-20', d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'anna.nowak@cisna.pl'
WHERE d.nazwa_dzialania = 'Monitoring populacji zubra';

INSERT INTO Zadania
SELECT 'Mapowanie tras drapieznikow', 'Zaplanowane', '2025-06-01', d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'piotr.lesny@baligrod.pl'
WHERE d.nazwa_dzialania = 'Inwentaryzacja duzych drapieznikow';

INSERT INTO Zadania
SELECT 'Oznaczenie gniazd ptakow', 'W toku', '2025-04-25', d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'karolina.zieba@pksan.pl'
WHERE d.nazwa_dzialania = 'Ochrona rzadkich ptakow';

INSERT INTO Zadania
SELECT 'Przygotowanie planu monitoringu', 'Zakończone', '2025-12-15',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'patrycja.lewandowska@ur.edu.pl'
WHERE d.nazwa_dzialania = 'Monitoring populacji zubra';

INSERT INTO Zadania
SELECT 'Obserwacje terenowe', 'Zakończone', '2025-12-02',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'patrycja.lewandowska@ur.edu.pl'
WHERE d.nazwa_dzialania = 'Monitoring rysia';


INSERT INTO Zadania
SELECT 'Obserwacje terenowe', 'W toku', '2025-06-30',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'piotr.lesny@baligrod.pl'
WHERE d.nazwa_dzialania = 'Monitoring populacji zubra';

INSERT INTO Zadania
SELECT 'Analiza danych', 'Zakończone', '2025-10-30',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'sebastian.goral@rdos.gov.pl'
WHERE d.nazwa_dzialania = 'Monitoring populacji zubra';


INSERT INTO Zadania
SELECT 'Analiza danych', 'Zakończone', '2025-09-29',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'sebastian.goral@rdos.gov.pl'
WHERE d.nazwa_dzialania = 'Monitoring rysia';


INSERT INTO Zadania
SELECT 'Zbieranie danych GPS', 'W toku', '2025-05-15',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'rafal.zielinski@ur.edu.pl'
WHERE d.nazwa_dzialania = 'Monitoring rysia';

INSERT INTO Zadania
SELECT 'Raport okresowy', 'Zaplanowane', '2025-10-31',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'ewa.mazur@pan.pl'
WHERE d.nazwa_dzialania = 'Monitoring rysia';

INSERT INTO Zadania
SELECT 'Liczenie osobnikow', 'Zakończone', '2025-12-01',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'jan.bednarski@cisna.pl'
WHERE d.nazwa_dzialania = 'Liczenie jeleni';

INSERT INTO Zadania
SELECT 'Weryfikacja danych', 'Zakończone', '2025-12-15',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'patrycja.lewandowska@ur.edu.pl'
WHERE d.nazwa_dzialania = 'Liczenie jeleni';

INSERT INTO Zadania
SELECT 'Obchody rewiru', 'W toku', '2025-07-01',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'lukasz.kruk@ur.edu.pl'
WHERE d.nazwa_dzialania = 'Ochrona siedlisk niedzwiedzia';

INSERT INTO Zadania
SELECT 'Dokumentacja fotograficzna', 'Zaplanowane', '2026-01-01',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'karolina.zieba@pksan.pl'
WHERE d.nazwa_dzialania = 'Ochrona siedlisk niedzwiedzia';

INSERT INTO Zadania
SELECT 'Ocena stanu drzew', 'W toku', '2025-12-12',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'magdalena.sarna@fofk.pl'
WHERE d.nazwa_dzialania = 'Kontrola zdrowia drzewostanu';

INSERT INTO Zadania
SELECT 'Sporzadzenie protokolu', 'Zaplanowane', '2025-12-03',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'rafal.zielinski@ur.edu.pl'
WHERE d.nazwa_dzialania = 'Kontrola zdrowia drzewostanu';

INSERT INTO Zadania
SELECT 'Obserwacja gniazd', 'W toku', '2025-06-30',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'tomasz.wrona@fdp.pl'
WHERE d.nazwa_dzialania = 'Monitoring ptakow drapieznych';

INSERT INTO Zadania
SELECT 'Raport koncowy', 'Zaplanowane', '2025-10-31',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'ewa.mazur@pan.pl'
WHERE d.nazwa_dzialania = 'Monitoring ptakow drapieznych';

INSERT INTO Zadania
SELECT 'Pobor probek', 'Zakończone', '2025-07-15',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'tomasz.wrona@fdp.pl'
WHERE d.nazwa_dzialania = 'Badanie jakosci wody';

INSERT INTO Zadania
SELECT 'Analiza laboratoryjna', 'Zakończone', '2025-12-20',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'rafal.zielinski@ur.edu.pl'
WHERE d.nazwa_dzialania = 'Badanie jakosci wody';

INSERT INTO Zadania
SELECT 'Przygotowanie materialow', 'Zakończone', '2025-04-01',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'natalia.cicha@oep.pl'
WHERE d.nazwa_dzialania = 'Edukacja ekologiczna mlodziezy';

INSERT INTO Zadania
SELECT 'Prowadzenie warsztatow', 'Zakończone', '2025-06-15',
       d.id_dzialania, u.id_uzytkownika
FROM Dzialania d
JOIN Uzytkownicy u ON u.email = 'pawel.lis@rdos.gov.pl'
WHERE d.nazwa_dzialania = 'Edukacja ekologiczna mlodziezy';





-- 8. OSOBNIKI

PRINT 'OSOBNIKI...';
INSERT INTO Osobniki
SELECT 'Blysk', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Pasmo Otrytu'
WHERE g.nazwa_lacinska = 'Canis lupus';

INSERT INTO Osobniki
SELECT 'Mgiełka', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Lasy Legowe Sanu'
WHERE g.nazwa_lacinska = 'Cervus elaphus';

INSERT INTO Osobniki
SELECT 'Kora', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Uroczysko Stary Las'
WHERE g.nazwa_lacinska = 'Salamandra salamandra';

INSERT INTO Osobniki
(nazwa_wlasna, plec, id_gatunku, id_krainy)
SELECT 'Bazyl', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE g.nazwa_lacinska = 'Bison bonasus';

INSERT INTO Osobniki
SELECT 'Bazia', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Carynska'
WHERE g.nazwa_lacinska = 'Bison bonasus';

INSERT INTO Osobniki
SELECT 'Kres', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Dolina Gornego Sanu'
WHERE g.nazwa_lacinska = 'Lynx lynx';

INSERT INTO Osobniki
SELECT 'Lunara', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Tarnica'
WHERE g.nazwa_lacinska = 'Canis lupus';

INSERT INTO Osobniki
SELECT 'Orlik', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Bukowe Berdo'
WHERE g.nazwa_lacinska = 'Aquila chrysaetos';

INSERT INTO Osobniki
SELECT 'Boruta', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE g.nazwa_lacinska = 'Bison bonasus';

INSERT INTO Osobniki
SELECT 'Ruda', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Carynska'
WHERE g.nazwa_lacinska = 'Cervus elaphus';

INSERT INTO Osobniki
SELECT 'Gryf', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Wielka Rawka'
WHERE g.nazwa_lacinska = 'Aquila chrysaetos';

INSERT INTO Osobniki
SELECT 'Czarny', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Dolina Gornego Sanu'
WHERE g.nazwa_lacinska = 'Canis lupus';

INSERT INTO Osobniki
SELECT 'Luna', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Tarnica'
WHERE g.nazwa_lacinska = 'Canis lupus';

INSERT INTO Osobniki
SELECT 'Cichy', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Bukowe Berdo'
WHERE g.nazwa_lacinska = 'Tetrastes bonasia';

INSERT INTO Osobniki
SELECT 'Plamka', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Białowieski Park Narodowy'
WHERE g.nazwa_lacinska = 'Salamandra salamandra';

INSERT INTO Osobniki
SELECT 'Zygzak', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE g.nazwa_lacinska = 'Vipera berus';

INSERT INTO Osobniki
SELECT 'Cien', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Białowieski Park Narodowy'
WHERE g.nazwa_lacinska = 'Lynx lynx';


INSERT INTO Osobniki
SELECT 'Cienik', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Białowieski Park Narodowy'
WHERE g.nazwa_lacinska = 'Lynx lynx';

INSERT INTO Osobniki
SELECT 'Wąs', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Białowieski Park Narodowy'
WHERE g.nazwa_lacinska = 'Lynx lynx';

INSERT INTO Osobniki
SELECT 'Iskra', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Ostoja Karpacka Zachod'
WHERE g.nazwa_lacinska = 'Lynx lynx';

INSERT INTO Osobniki
SELECT 'Bartek', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Pasmo Otrytu'
WHERE g.nazwa_lacinska = 'Ursus arctos';

INSERT INTO Osobniki
SELECT 'Misia', 'Samica', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Kotlina Ustrzycka'
WHERE g.nazwa_lacinska = 'Ursus arctos';


INSERT INTO Osobniki
SELECT 'Lluna', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Bieszczadzki Park Narodowy'
WHERE g.nazwa_lacinska = 'Canis lupus';


INSERT INTO Osobniki
SELECT 'Lynnx', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Bieszczadzki Park Narodowy'
WHERE g.nazwa_lacinska = 'Canis lupus';



INSERT INTO Osobniki
SELECT 'Awers', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Bieszczadzki Park Narodowy'
WHERE g.nazwa_lacinska = 'Canis lupus';

INSERT INTO Osobniki
SELECT 'Okieł', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Bieszczadzki Park Narodowy'
WHERE g.nazwa_lacinska = 'Canis lupus';

INSERT INTO Osobniki
SELECT 'Lato', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Bieszczadzki Park Narodowy'
WHERE g.nazwa_lacinska = 'Canis lupus';

INSERT INTO Osobniki
SELECT 'Liuno', 'Samiec', g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Bieszczadzki Park Narodowy'
WHERE g.nazwa_lacinska = 'Canis lupus';




-- 9. OBSERWACJE

PRINT 'OBSERWACJE...';
INSERT INTO Obserwacje
(data_obserwacji, id_uzytkownika, id_dzialania, id_osobnika)
SELECT
'2025-03-01',
u.id_uzytkownika,
d.id_dzialania,
o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji zubra'
JOIN Osobniki o ON o.nazwa_wlasna = 'Bazyl'
WHERE u.email = 'marek.kowalski@dlp.pl';

INSERT INTO Obserwacje
SELECT
'2025-03-03',
u.id_uzytkownika,
d.id_dzialania,
o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji zubra'
JOIN Osobniki o ON o.nazwa_wlasna = 'Bazia'
WHERE u.email = 'anna.nowak@cisna.pl';

INSERT INTO Obserwacje
SELECT
'2025-03-08',
u.id_uzytkownika,
d.id_dzialania,
o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Inwentaryzacja duzych drapieznikow'
JOIN Osobniki o ON o.nazwa_wlasna = 'Kres'
WHERE u.email = 'piotr.lesny@baligrod.pl';

INSERT INTO Obserwacje
SELECT
'2025-03-15',
u.id_uzytkownika,
d.id_dzialania,
o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Ochrona rzadkich ptakow'
JOIN Osobniki o ON o.nazwa_wlasna = 'Orlik'
WHERE u.email = 'karolina.zieba@pksan.pl';

INSERT INTO Obserwacje
SELECT '2025-01-15', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji zubra'
JOIN Osobniki o ON o.nazwa_wlasna = 'Boruta'
WHERE u.email = 'marek.kowalski@dlp.pl';

INSERT INTO Obserwacje
SELECT '2025-01-20', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji zubra'
JOIN Osobniki o ON o.nazwa_wlasna = 'Bazyl'
WHERE u.email = 'marek.kowalski@dlp.pl';

INSERT INTO Obserwacje
SELECT '2025-02-18', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Kontrola siedlisk wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Czarny'
WHERE u.email = 'piotr.lesny@baligrod.pl';

INSERT INTO Obserwacje
SELECT '2025-02-22', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Kontrola siedlisk wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Luna'
WHERE u.email = 'piotr.lesny@baligrod.pl';

INSERT INTO Obserwacje
SELECT '2025-03-05', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Inwentaryzacja duzych drapieznikow'
JOIN Osobniki o ON o.nazwa_wlasna = 'Cien'
WHERE u.email = 'anna.nowak@cisna.pl';


INSERT INTO Obserwacje
SELECT '2025-04-05', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Inwentaryzacja duzych drapieznikow'
JOIN Osobniki o ON o.nazwa_wlasna = 'Cienik'
WHERE u.email = 'anna.nowak@cisna.pl';


INSERT INTO Obserwacje
SELECT '2025-10-05', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Inwentaryzacja duzych drapieznikow'
JOIN Osobniki o ON o.nazwa_wlasna = 'Wąs'
WHERE u.email = 'anna.nowak@cisna.pl';


INSERT INTO Obserwacje
SELECT '2025-03-08', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Inwentaryzacja duzych drapieznikow'
JOIN Osobniki o ON o.nazwa_wlasna = 'Iskra'
WHERE u.email = 'anna.nowak@cisna.pl';

INSERT INTO Obserwacje
SELECT '2025-04-10', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Ochrona rzadkich ptakow'
JOIN Osobniki o ON o.nazwa_wlasna = 'Gryf'
WHERE u.email = 'karolina.zieba@pksan.pl';

INSERT INTO Obserwacje
SELECT '2025-05-02', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji zubra'
JOIN Osobniki o ON o.nazwa_wlasna = 'Boruta'
WHERE u.email = 'marek.kowalski@dlp.pl';

INSERT INTO Obserwacje
SELECT '2025-05-10', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Inwentaryzacja duzych drapieznikow'
JOIN Osobniki o ON o.nazwa_wlasna = 'Bartek'
WHERE u.email = 'anna.nowak@cisna.pl';

INSERT INTO Obserwacje
SELECT '2025-06-01', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Blysk'
WHERE u.email = 'piotr.lesny@baligrod.pl';

INSERT INTO Obserwacje
SELECT '2025-06-03', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Liczenie jeleni'
JOIN Osobniki o ON o.nazwa_wlasna = 'Ruda'
WHERE u.email = 'jan.bednarski@cisna.pl';

INSERT INTO Obserwacje
SELECT '2025-06-05', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Kontrola zdrowia drzewostanu'
JOIN Osobniki o ON o.nazwa_wlasna = 'Plamka'
WHERE u.email = 'magdalena.sarna@fofk.pl';

INSERT INTO Obserwacje
SELECT '2025-06-07', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring ptakow drapieznych'
JOIN Osobniki o ON o.nazwa_wlasna = 'Gryf'
WHERE u.email = 'rafal.zielinski@ur.edu.pl';

INSERT INTO Obserwacje
SELECT '2025-06-10', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Badanie bioroznorodnosci'
JOIN Osobniki o ON o.nazwa_wlasna = 'Misia'
WHERE u.email = 'patrycja.lewandowska@ur.edu.pl';

INSERT INTO Obserwacje
SELECT '2025-06-12', u.id_uzytkownika, d.id_dzialania, o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Ochrona zrodel wodnych'
JOIN Osobniki o ON o.nazwa_wlasna = 'Kora'
WHERE u.email = 'lukasz.kruk@ur.edu.pl';

INSERT INTO Obserwacje (data_obserwacji, id_uzytkownika, id_dzialania, id_osobnika)
SELECT 
    '2025-07-12',
    u.id_uzytkownika,
    d.id_dzialania,
    o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Lluna'
WHERE u.email = 'marek.kowalski@dlp.pl';


INSERT INTO Obserwacje (data_obserwacji, id_uzytkownika, id_dzialania, id_osobnika)
SELECT 
    '2025-07-13', 
    u.id_uzytkownika,
    d.id_dzialania,
    o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Lluna'
WHERE u.email = 'marek.kowalski@dlp.pl';



INSERT INTO Obserwacje (data_obserwacji, id_uzytkownika, id_dzialania, id_osobnika)
SELECT 
    '2025-08-10', 
    u.id_uzytkownika,
    d.id_dzialania,
    o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Lynnx'
WHERE u.email = 'marek.kowalski@dlp.pl';




INSERT INTO Obserwacje (data_obserwacji, id_uzytkownika, id_dzialania, id_osobnika)
SELECT 
    '2025-10-10', 
    u.id_uzytkownika,
    d.id_dzialania,
    o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Awers'
WHERE u.email = 'marek.kowalski@dlp.pl';

INSERT INTO Obserwacje (data_obserwacji, id_uzytkownika, id_dzialania, id_osobnika)
SELECT 
    '2025-10-10', 
    u.id_uzytkownika,
    d.id_dzialania,
    o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Okieł'
WHERE u.email = 'patrycja.lewandowska@ur.edu.pl';


INSERT INTO Obserwacje (data_obserwacji, id_uzytkownika, id_dzialania, id_osobnika)
SELECT 
    '2025-10-10', 
    u.id_uzytkownika,
    d.id_dzialania,
    o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Lato'
WHERE u.email = 'patrycja.lewandowska@ur.edu.pl';


INSERT INTO Obserwacje (data_obserwacji, id_uzytkownika, id_dzialania, id_osobnika)
SELECT 
    '2025-10-10', 
    u.id_uzytkownika,
    d.id_dzialania,
    o.id_osobnika
FROM Uzytkownicy u
JOIN Dzialania d ON d.nazwa_dzialania = 'Monitoring populacji wilka'
JOIN Osobniki o ON o.nazwa_wlasna = 'Liuno'
WHERE u.email = 'patrycja.lewandowska@ur.edu.pl';



-- 10. DIAGNOZY

PRINT 'DIAGNOZY...';

INSERT INTO Diagnozy
SELECT '2025-03-04 11:30:00', 'Chory', o.id_obserwacji, o.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.id_osobnika = o.id_osobnika
JOIN Choroby c ON c.nazwa_choroby = 'Borelioza'
WHERE os.nazwa_wlasna = 'Bazia';

INSERT INTO Diagnozy
SELECT '2025-03-09 09:15:00', 'Zdrowy', o.id_obserwacji, o.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.id_osobnika = o.id_osobnika
WHERE os.nazwa_wlasna = 'Kres';

INSERT INTO Diagnozy
SELECT '2026-01-07 14:45:00', 'Chory', o.id_obserwacji, o.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.id_osobnika = o.id_osobnika
JOIN Choroby c ON c.nazwa_choroby = 'Wscieklizna'
WHERE os.nazwa_wlasna = 'Orlik';

INSERT INTO Diagnozy
SELECT '2025-01-16 10:30', 'Zdrowy', o.id_obserwacji, os.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Boruta'
WHERE o.data_obserwacji = '2025-01-15';

INSERT INTO Diagnozy
SELECT '2026-01-06 11:15', 'Chory', o.id_obserwacji, os.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Bazyl'
JOIN Choroby c ON c.nazwa_choroby = 'Gruźlica'
WHERE o.data_obserwacji = '2025-01-20';

INSERT INTO Diagnozy
SELECT '2025-02-19 09:45', 'Zdrowy', o.id_obserwacji, os.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Czarny'
WHERE o.data_obserwacji = '2025-02-18';

INSERT INTO Diagnozy
SELECT '2025-02-23 14:20', 'Chory', o.id_obserwacji, os.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Luna'
JOIN Choroby c ON c.nazwa_choroby = 'Nosówka'
WHERE o.data_obserwacji = '2025-02-22';

INSERT INTO Diagnozy
SELECT '2025-03-06 12:00', 'Zdrowy', o.id_obserwacji, os.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Cien'
WHERE o.data_obserwacji = '2025-03-05';

INSERT INTO Diagnozy
SELECT '2025-04-11 09:10', 'Zdrowy', o.id_obserwacji, os.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Gryf'
WHERE o.data_obserwacji = '2025-04-10';

INSERT INTO Diagnozy
SELECT '2025-05-03 11:30', 'Zdrowy', o.id_obserwacji, os.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Boruta'
WHERE o.data_obserwacji = '2025-05-02';

INSERT INTO Diagnozy
SELECT '2026-01-01 15:00', 'Nieznany', o.id_obserwacji, os.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Bartek'
WHERE o.data_obserwacji = '2025-05-10';

INSERT INTO Diagnozy
SELECT '2025-06-02 10:00', 'Zdrowy', o.id_obserwacji, o.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Blysk'
WHERE o.data_obserwacji = '2025-06-01';

INSERT INTO Diagnozy
SELECT '2026-01-02 11:20', 'Chory', o.id_obserwacji, o.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Ruda'
JOIN Choroby c ON c.nazwa_choroby = 'Pasożyty wewnętrzne'
WHERE o.data_obserwacji = '2025-06-03';

INSERT INTO Diagnozy
SELECT '2025-06-06 09:10', 'Zdrowy', o.id_obserwacji, o.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Plamka'
WHERE o.data_obserwacji = '2025-06-05';

INSERT INTO Diagnozy
SELECT '2026-01-16 14:00', 'Zdrowy', o.id_obserwacji, o.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Gryf'
WHERE o.data_obserwacji = '2025-06-07';

INSERT INTO Diagnozy
SELECT '2026-01-06 10:30', 'Chory', o.id_obserwacji, o.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Misia'
JOIN Choroby c ON c.nazwa_choroby = 'Zatrucie metalami ciężkimi'
WHERE o.data_obserwacji = '2025-06-10';

INSERT INTO Diagnozy
SELECT '2025-06-13 09:50', 'Zdrowy', o.id_obserwacji, o.id_osobnika, NULL
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Kora'
WHERE o.data_obserwacji = '2025-06-12';

INSERT INTO Diagnozy
SELECT DATEADD(day, 1, o.data_obserwacji), 'Zdrowy', o.id_obserwacji, o.id_osobnika, NULL
FROM Obserwacje o
WHERE o.id_obserwacji IN (SELECT TOP 4 id_obserwacji FROM Obserwacje ORDER BY id_obserwacji DESC);

INSERT INTO Diagnozy
SELECT '2025-07-13 09:20', 'Chory', o.id_obserwacji, o.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Lluna'
JOIN Choroby c ON c.nazwa_choroby = 'Nosówka'
WHERE o.data_obserwacji = '2025-07-12';

INSERT INTO Diagnozy
SELECT '2025-07-14 09:30', 'Chory', o.id_obserwacji, o.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Lluna'
JOIN Choroby c ON c.nazwa_choroby = 'Wscieklizna'
WHERE o.data_obserwacji = '2025-07-13';


INSERT INTO Diagnozy
SELECT '2025-08-11 09:30', 'Chory', o.id_obserwacji, o.id_osobnika, c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON os.nazwa_wlasna = 'Lynnx'
JOIN Choroby c ON c.nazwa_choroby = 'Wscieklizna'
WHERE o.data_obserwacji = '2025-08-10';



INSERT INTO Diagnozy (data_diagnozy, status_zdrowia, id_obserwacji, id_osobnika, id_choroby)
SELECT 
    '2025-10-11 09:30',
    'Chory', 
    o.id_obserwacji, 
    o.id_osobnika, 
    c.id_choroby
FROM Obserwacje o
JOIN Osobniki os ON o.id_osobnika = os.id_osobnika
JOIN Choroby c ON c.nazwa_choroby = 'Pasożyty wewnętrzne'
WHERE o.data_obserwacji = '2025-10-10'
AND os.nazwa_wlasna IN ('Awers', 'Okieł', 'Lato', 'Liuno');




-- 11. GATUNKI_KRAINY

PRINT 'GATUNKI_KRAINY...';
INSERT INTO Gatunki_Krainy (id_gatunku, id_krainy)
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy IN ('Polonina Wetlinska', 'Dolina Gornego Sanu', 'Rezerwat Tarnica')
WHERE g.nazwa_lacinska = 'Bison bonasus';


INSERT INTO Gatunki_Krainy (id_gatunku, id_krainy)
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy IN ('Polonina Wetlinska', 'Dolina Gornego Sanu')
WHERE g.nazwa_lacinska = 'Heracleum sosnowskyi';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy IN ('Polonina Carynska', 'Rezerwat Tarnica')
WHERE g.nazwa_lacinska = 'Cervus elaphus';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy IN ('Dolina Gornego Sanu', 'Jezioro Solinskie Strefa Centralna', 'Wielka Rawka')
WHERE g.nazwa_lacinska = 'Lynx lynx';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy IN ('Polonina Wetlinska', 'Polonina Carynska', 'Rezerwat Tarnica')
WHERE g.nazwa_lacinska = 'Canis lupus';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy IN ('Polonina Wetlinska', 'Rezerwat Bukowe Berdo', 'Polonina Carynska', 'Wielka Rawka')
WHERE g.nazwa_lacinska = 'Aquila chrysaetos';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy IN ('Dolina Gornego Sanu', 'Jezioro Solinskie Strefa Centralna', 'Wielka Rawka')
WHERE g.nazwa_lacinska = 'Ursus arctos';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE g.nazwa_lacinska = 'Vipera berus';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Bukowe Berdo'
WHERE g.nazwa_lacinska = 'Tetrastes bonasia';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Carynska'
WHERE g.nazwa_lacinska = 'Pinus sylvestris';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Wielka Rawka'
WHERE g.nazwa_lacinska = 'Picea abies';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Brzegi Jeziora Myczkowskiego'
WHERE g.nazwa_lacinska = 'Populus alba';

INSERT INTO Gatunki_Krainy
SELECT g.nazwa_lacinska, k.id_krainy
FROM Gatunki g
JOIN Krainy_Geograficzne k ON k.nazwa_krainy IN ('Uroczysko Stary Las', 'Lasy Legowe Sanu', 'Kotlina Ustrzycka', 'Dolina Wetlinki', 'Pasmo Otrytu')
WHERE g.nazwa_lacinska IN ('Salamandra salamandra', 'Cervus elaphus', 'Canis lupus');




-- 12. POBYT_OSOBNIKA

PRINT 'POBYT_OSOBNIKA...';
INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Pasmo Otrytu'
WHERE o.nazwa_wlasna = 'Blysk';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Lasy Legowe Sanu'
WHERE o.nazwa_wlasna = 'Mgiełka';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Uroczysko Stary Las'
WHERE o.nazwa_wlasna = 'Kora';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE o.nazwa_wlasna = 'Bazyl';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Carynska'
WHERE o.nazwa_wlasna = 'Bazia';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Dolina Gornego Sanu'
WHERE o.nazwa_wlasna = 'Kres';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Tarnica'
WHERE o.nazwa_wlasna = 'Lunara';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Bukowe Berdo'
WHERE o.nazwa_wlasna = 'Orlik';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE o.nazwa_wlasna = 'Boruta';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Carynska'
WHERE o.nazwa_wlasna = 'Ruda';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Wielka Rawka'
WHERE o.nazwa_wlasna = 'Gryf';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Dolina Gornego Sanu'
WHERE o.nazwa_wlasna = 'Czarny';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Tarnica'
WHERE o.nazwa_wlasna = 'Luna';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Rezerwat Bukowe Berdo'
WHERE o.nazwa_wlasna = 'Cichy';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Uroczysko Stary Las'
WHERE o.nazwa_wlasna = 'Plamka';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Polonina Wetlinska'
WHERE o.nazwa_wlasna = 'Zygzak';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Dolina Wetlinki'
WHERE o.nazwa_wlasna = 'Cien';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Ostoja Karpacka Zachod'
WHERE o.nazwa_wlasna = 'Iskra';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Pasmo Otrytu'
WHERE o.nazwa_wlasna = 'Bartek';

INSERT INTO Pobyt_Osobnika
SELECT o.id_osobnika, k.id_krainy
FROM Osobniki o
JOIN Krainy_Geograficzne k ON k.nazwa_krainy = 'Kotlina Ustrzycka'
WHERE o.nazwa_wlasna = 'Misia';




PRINT 'Baza danych została pomyślnie wypełniona!';