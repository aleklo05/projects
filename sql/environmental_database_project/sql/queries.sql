USE GeoBase;
GO


-- Wyświetl listę krain geograficznych oraz liczbę zaobserwowanych w nich osobników
-- gatunku „Żubr europejski” w roku 2025, posortowaną malejąco względem liczby
-- zaobserwowanych osobników, w celu identyfikacji obszarów o największym
-- zagęszczeniu tego gatunku i lepszego planowania działań ochronnych.

SELECT
    K.nazwa_krainy,
    COUNT(DISTINCT O.id_osobnika) AS liczba_osobnikow
FROM Krainy_Geograficzne K
JOIN Osobniki O ON K.id_krainy = O.id_krainy
JOIN Gatunki G ON O.id_gatunku = G.nazwa_lacinska
JOIN Obserwacje OB ON O.id_osobnika = OB.id_osobnika
WHERE G.nazwa_polska = 'Zubr europejski'
  AND OB.data_obserwacji BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY K.nazwa_krainy
ORDER BY liczba_osobnikow DESC;
GO
