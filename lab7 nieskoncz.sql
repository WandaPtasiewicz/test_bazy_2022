use ptasiewiczw;
# zad 1
CREATE TABLE ptasiewiczw.wyprawa SELECT * FROM wikingowie.wyprawa;

SELECT * FROM kreatura
LEFT JOIN uczestnicy u ON kreatura.idKreatury=u.id_uczestnika
WHERE u.id_uczestnika IS NULL;
SELECT * FROM kreatura;

SELECT wyprawa.nazwa,sum(ilosc) FROM wyprawa 
JOIN uczestnicy ON uczestnicy.id_wyprawy=wyprawa.id_wyprawy 
JOIN ekwipunek ON uczestnicy.id_uczestnika=ekwipunek.IdKreatury
GROUP BY wyprawa.nazwa;

# zad 2

SELECT wyprawa.nazwa,COUNT(id_uczestnika),GROUP_CONCAT(kreatura.nazwa)FROM wyprawa 
 JOIN uczestnicy On wyprawa.id_wyprawy=uczestnicy.id_wyprawy
JOIN kreatura ON kreatura.idKreatury=uczestnicy.id_uczestnika 
GROUP BY wyprawa.nazwa;


