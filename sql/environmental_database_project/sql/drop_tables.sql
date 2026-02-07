IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'GeoBase')
BEGIN
    CREATE DATABASE GeoBase;
END
GO

USE GeoBase;
GO

BEGIN TRY
    PRINT 'Czyszczenie bazy danych...';

    DROP TABLE IF EXISTS Pobyt_Osobnika;
    DROP TABLE IF EXISTS Diagnozy;
    DROP TABLE IF EXISTS Obserwacje;
    DROP TABLE IF EXISTS Zadania;
    DROP TABLE IF EXISTS Gatunki_Krainy;
    DROP TABLE IF EXISTS Osobniki;
    DROP TABLE IF EXISTS Dzialania;
    DROP TABLE IF EXISTS Choroby;
    DROP TABLE IF EXISTS Krainy_Geograficzne;
    DROP TABLE IF EXISTS Gatunki;
    DROP TABLE IF EXISTS Uzytkownicy;
    DROP TABLE IF EXISTS Organizacje;

    PRINT 'Baza danych zosta³a pomyœlnie wyczyszczona!';
END TRY
BEGIN CATCH
    PRINT 'B³¹d podczas czyszczenia bazy danych!';
    PRINT ERROR_MESSAGE();
END CATCH;
GO
