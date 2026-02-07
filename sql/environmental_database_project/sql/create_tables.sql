USE GeoBase;
GO

PRINT 'Tworzenie tabel...';


CREATE TABLE Organizacje (
	NIP VARCHAR(10) UNIQUE NOT NULL,
	nazwa_organizacji NVARCHAR(255) NOT NULL,
	typ_organizacji NVARCHAR(50) NOT NULL,
	adres NVARCHAR(255) NOT NULL,
	

	CHECK (nazwa_organizacji NOT LIKE '%[0-9]%'),
	CHECK (LEN(adres) >= 5),
	CHECK (LEN(NIP) = 10 AND NIP NOT LIKE '%[^0-9]%'),

	PRIMARY KEY (NIP)
);



CREATE TABLE Uzytkownicy (
	id_uzytkownika INT IDENTITY(1,1) NOT NULL,
	imie NVARCHAR(50) NOT NULL,
	nazwisko NVARCHAR(100) NOT NULL,
	zawod NVARCHAR(50) NOT NULL,
	email	NVARCHAR(255) UNIQUE NOT NULL,
	nr_kadrowy INT UNIQUE,
	czy_aktywny BIT NOT NULL DEFAULT 1,
	
	id_organizacji VARCHAR(10) NOT NULL,

	CHECK (LEN(imie) >= 2),
	CHECK (LEN(nazwisko) >= 2),
	CHECK (imie NOT LIKE '%[^A-Za-zÀ-ž ]%' ),
	CHECK (nazwisko NOT LIKE '%[^A-Za-zÀ-ž -]%' ),
	CHECK (zawod NOT LIKE '%[^A-Za-zÀ-ž ]%' ),
	CHECK (email LIKE '%_@_%._%'),
	CHECK (nr_kadrowy IS NULL OR nr_kadrowy > 0),
	CHECK (czy_aktywny IN (0,1)),


	PRIMARY KEY(id_uzytkownika),

	FOREIGN KEY(id_organizacji) REFERENCES Organizacje(NIP)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);



CREATE TABLE Krainy_Geograficzne (
	id_krainy INT IDENTITY(1,1) NOT NULL,
	nazwa_krainy NVARCHAR(255) UNIQUE NOT NULL,
	typ_krainy NVARCHAR(50) NOT NULL,
	powierzchnia_km2 DECIMAL(10,2) NOT NULL,

	CHECK (LEN(nazwa_krainy) >= 3),
	CHECK (powierzchnia_km2 > 0.01 AND powierzchnia_km2 <= 99999999.99),

	PRIMARY KEY(id_krainy)

);



CREATE TABLE Dzialania (
	id_dzialania INT IDENTITY(1,1) NOT NULL,
	nazwa_dzialania NVARCHAR(255) NOT NULL,
	typ_dzialania NVARCHAR(50) NOT NULL,
	status_dzialania NVARCHAR(50) NOT NULL,
	data_rozpoczecia DATE NOT NULL,
	data_zakonczenia DATE NOT NULL,

	id_kierownika INT NOT NULL,
	id_krainy INT NOT NULL,


	CHECK (nazwa_dzialania NOT LIKE '%[^A-Za-z0-9 .,-ąĄćĆęĘłŁńŃóÓśŚżŻźŹ]%'),
	CHECK (LEN(nazwa_dzialania) >= 3),
	CHECK (status_dzialania IN ('Zaplanowane', 'W toku', 'Zakończone')),
	CHECK (data_zakonczenia >= data_rozpoczecia),
	

	PRIMARY KEY(id_dzialania),
	FOREIGN KEY(id_kierownika) REFERENCES Uzytkownicy(id_uzytkownika),

	FOREIGN KEY(id_krainy) REFERENCES Krainy_Geograficzne(id_krainy)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);



CREATE TABLE Gatunki (
	nazwa_lacinska NVARCHAR(255) NOT NULL,
	nazwa_polska NVARCHAR(255) UNIQUE NOT NULL,
	typ_gatunku NVARCHAR(50) NOT NULL,
	status_ochrony NVARCHAR(100) NOT NULL,


	CHECK (nazwa_polska NOT LIKE '%[^A-Za-zĄąĆćĘęŁłŃńÓóŚśŹźŻż -]%'),
	CHECK (nazwa_lacinska NOT LIKE '%[^A-Za-zÀ-ž -]%'),
	CHECK (nazwa_lacinska LIKE '[A-Z]% %'),
	CHECK (LEN(nazwa_polska) >= 2),
	CHECK (LEN(nazwa_lacinska) >= 3),
	CHECK (typ_gatunku IN ('Fauna', 'Flora')),
	CHECK (status_ochrony IN ('Wymarły', 'Zagrożony', 'Narażony', 'Najmniejszej troski', 'Nieoszacowany')),
	

	PRIMARY KEY(nazwa_lacinska)
);




CREATE TABLE Zadania (
	id_zadania INT IDENTITY(1,1) NOT NULL,
	nazwa_zadania NVARCHAR(255) NOT NULL,
	status_zadania NVARCHAR(50) NOT NULL,
	termin_wykonania DATE NOT NULL,

	id_dzialania INT NOT NULL,
	id_wykonawcy INT NOT NULL,

	CHECK (LEN(nazwa_zadania) >= 3),
	CHECK (status_zadania IN ('Zaplanowane', 'W toku', 'Zakończone')),

	UNIQUE (id_dzialania, nazwa_zadania),


	PRIMARY KEY(id_zadania),
	FOREIGN KEY(id_dzialania) REFERENCES Dzialania(id_dzialania)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(id_wykonawcy) REFERENCES Uzytkownicy(id_uzytkownika)
);





CREATE TABLE Choroby (
	id_choroby INT IDENTITY(1,1) NOT NULL,
	nazwa_choroby NVARCHAR(255) UNIQUE NOT NULL,

	PRIMARY KEY(id_choroby)
);



CREATE TABLE Osobniki (
	id_osobnika INT IDENTITY(1,1) NOT NULL,
	nazwa_wlasna NVARCHAR(100) NOT NULL,
	plec NVARCHAR(20) NOT NULL,

	id_gatunku NVARCHAR(255) NOT NULL,
	id_krainy INT NOT NULL,

	UNIQUE (nazwa_wlasna, id_gatunku),

	CHECK (plec IN ('Samiec', 'Samica', 'Nieznana')),

	PRIMARY KEY(id_osobnika),

	FOREIGN KEY(id_gatunku) REFERENCES Gatunki(nazwa_lacinska)
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY(id_krainy) REFERENCES Krainy_Geograficzne(id_krainy)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);




CREATE TABLE Obserwacje (
	id_obserwacji INT IDENTITY(1,1) NOT NULL,
	data_obserwacji DATE NOT NULL,
	id_uzytkownika INT NOT NULL,
	id_dzialania INT NOT NULL,
	id_osobnika INT NOT NULL, 

	PRIMARY KEY(id_obserwacji),

	UNIQUE (data_obserwacji, id_uzytkownika, id_osobnika, id_dzialania),

	FOREIGN KEY(id_uzytkownika) REFERENCES Uzytkownicy(id_uzytkownika),
	FOREIGN KEY(id_osobnika) REFERENCES Osobniki(id_osobnika)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(id_dzialania) REFERENCES Dzialania(id_dzialania)
		ON UPDATE NO ACTION
		ON DELETE NO ACTION
);


CREATE TABLE Diagnozy (
	id_diagnozy INT IDENTITY(1,1) NOT NULL,
	data_diagnozy DATETIME NOT NULL,
	status_zdrowia NVARCHAR(50) NOT NULL DEFAULT 'Nieznany',

	id_obserwacji INT NOT NULL,
	id_osobnika INT NOT NULL,
	id_choroby INT,

	CHECK (status_zdrowia IN ('Zdrowy', 'Chory', 'Nieznany')),

	PRIMARY KEY(id_diagnozy),

	FOREIGN KEY(id_obserwacji) REFERENCES Obserwacje(id_obserwacji)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(id_osobnika) REFERENCES Osobniki(id_osobnika),
	FOREIGN KEY(id_choroby) REFERENCES Choroby(id_choroby)
		ON UPDATE CASCADE
		ON DELETE SET NULL

);



CREATE TABLE Gatunki_Krainy (
	id_gatunku NVARCHAR(255) NOT NULL,
	id_krainy INT NOT NULL,

	PRIMARY KEY (id_gatunku, id_krainy),

	FOREIGN KEY(id_gatunku) REFERENCES Gatunki(nazwa_lacinska)
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	FOREIGN KEY(id_krainy) REFERENCES Krainy_Geograficzne(id_krainy)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Pobyt_Osobnika (
    id_osobnika INT NOT NULL,
    id_krainy INT NOT NULL,

    PRIMARY KEY (id_osobnika, id_krainy),

    FOREIGN KEY (id_osobnika) REFERENCES Osobniki(id_osobnika)
	ON DELETE CASCADE,
    FOREIGN KEY (id_krainy) REFERENCES Krainy_Geograficzne(id_krainy)
);


PRINT 'Stworzono tabele!';