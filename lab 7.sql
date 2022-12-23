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

# drugi podpunkt
SELECT wyprawa.nazwa AS nazwa_wyprawy,etap.idEtapu,sektor.nazwa AS nazwa_sektoru,kreatura.nazwa AS kierownik
FROM wyprawa
INNER JOIN etapy_wyprawy as etap ON etap.idWyprawy = wyprawa.id_wyprawy
INNER JOIN sektor ON sektor.id_sektora = etap.sektor
INNER JOIN kreatura ON wyprawa.kierownik = kreatura.idKreatury
ORDER BY wyprawa.data_rozpoczecia,wyprawa.id_wyprawy,etap.kolejnosc;
# zad 3
SELECT sektor.nazwa,count( etapy_wyprawy.sektor) as 'ilosc odwiedzin'from sektor left JOIN  etapy_wyprawy ON sektor.id_sektora=etapy_wyprawy.sektor GROUP BY id_sektora;

SELECT kreatura.nazwa, if(count(uczestnicy.id_wyprawy)<0,'nie brał udziału','brał udział') as 'Udzial' from kreatura left join uczestnicy on kreatura.idKreatury=uczestnicy.id_uczestnika GROUP BY kreatura.nazwa;
# zad 4
select nazwa, sum(length(dziennik)) as 'ilosc znakow' from wyprawa w 
join etapy_wyprawy e on w.id_wyprawy =e.idWyprawy
 GROUP BY nazwa HAVING sum(length(dziennik))<400;
 
SELECT wyprawa.nazwa, SUM(zasob.waga*ekwipunek.ilosc)/COUNT(distinct uczestnicy.id_uczestnika) FROM uczestnicy
 INNER JOIN wyprawa ON (uczestnicy.id_wyprawy=wyprawa.id_wyprawy) 
 INNER JOIN kreatura ON (kreatura.idKreatury=uczestnicy.id_uczestnika) 
 INNER JOIN ekwipunek ON (ekwipunek.idKreatury=kreatura.idKreatury)
 INNER JOIN zasob ON (ekwipunek.idZasobu=zasob.idZasobu) 
 GROUP BY uczestnicy.id_wyprawy ORDER BY wyprawa.id_wyprawy;
 
 #zad 5
SELECT k.nazwa,
w.nazwa,
DATEDIFF(w.data_rozpoczecia, k.dataUr) as 'Wiek w dniach'
FROM kreatura k,
etapy_wyprawy ew,
wyprawa w,
sektor s,
uczestnicy u
WHERE ew.sektor = s.id_sektora
and k.idKreatury=u.id_uczestnika
and u.id_wyprawy=w.id_wyprawy
AND ew.idWyprawy = w.id_wyprawy
AND s.nazwa = "Chatka dziadka";

SELECT k.nazwa,
w.nazwa,
DATEDIFF(w.data_rozpoczecia, k.dataUr) as 'Wiek w dniach'FROM kreatura k
JOIN uczestnicy u ON  k.idKreatury=u.id_uczestnika
JOIN wyprawa w ON u.id_wyprawy=w.id_wyprawy
JOIN etapy_wyprawy ew ON ew.idWyprawy = w.id_wyprawy
JOIN sektor s ON  ew.sektor = s.id_sektora
WHERE  s.nazwa = "Chatka dziadka";


