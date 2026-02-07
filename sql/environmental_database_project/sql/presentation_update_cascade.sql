USE GeoBase;
GO

PRINT '--- DANE PRZED UPDATE CASCADE ---';

PRINT 'GATUNEK (PK = nazwa_lacinska):';
SELECT * 
FROM Gatunki 
WHERE nazwa_lacinska = 'Canis lupus';

PRINT 'OSOBNIKI TEGO GATUNKU:';
SELECT * 
FROM Osobniki 
WHERE id_gatunku = 'Canis lupus';

PRINT 'KRAINY WYSTÊPOWANIA GATUNKU:';
SELECT * 
FROM Gatunki_Krainy 
WHERE id_gatunku = 'Canis lupus';



PRINT '--- WYKONUJEMY UPDATE KLUCZA G£ÓWNEGO (UPDATE CASCADE) ---';

UPDATE Gatunki
SET nazwa_lacinska = 'Canis lupus updated'
WHERE nazwa_lacinska = 'Canis lupus';



PRINT '--- DANE PO UPDATE CASCADE ---';

PRINT 'GATUNEK (PO ZMIANIE PK):';
SELECT * 
FROM Gatunki 
WHERE nazwa_lacinska = 'Canis lupus updated';

PRINT 'OSOBNIKI (FK ZAKTUALIZOWANE KASKADOWO):';
SELECT * 
FROM Osobniki 
WHERE id_gatunku = 'Canis lupus updated';

PRINT 'GATUNKI_KRAINY (FK ZAKTUALIZOWANE KASKADOWO):';
SELECT * 
FROM Gatunki_Krainy 
WHERE id_gatunku = 'Canis lupus updated';



PRINT '--- KONIEC DEMONSTRACJI UPDATE CASCADE ---';
GO
