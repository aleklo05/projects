USE GeoBase;
GO

PRINT '--- DANE PRZED DELETE CASCADE ---';

PRINT 'OSOBNIK (id_osobnika = 1):';
SELECT * 
FROM Osobniki 
WHERE id_osobnika = 1;

PRINT 'OBSERWACJE TEGO OSOBNIKA:';
SELECT * 
FROM Obserwacje 
WHERE id_osobnika = 1;

PRINT 'DIAGNOZY TEGO OSOBNIKA:';
SELECT * 
FROM Diagnozy 
WHERE id_osobnika = 1;



PRINT '--- USUWAMY OSOBNIKA (DELETE CASCADE) ---';

DELETE FROM Osobniki 
WHERE id_osobnika = 1;



PRINT '--- DANE PO DELETE CASCADE ---';

PRINT 'OSOBNIK:';
SELECT * 
FROM Osobniki 
WHERE id_osobnika = 1;

PRINT 'OBSERWACJE:';
SELECT * 
FROM Obserwacje 
WHERE id_osobnika = 1;

PRINT 'DIAGNOZY:';
SELECT * 
FROM Diagnozy 
WHERE id_osobnika = 1;



PRINT '--- KONIEC DEMONSTRACJI DELETE CASCADE ---';
GO
