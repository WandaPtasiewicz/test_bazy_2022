#lab 6
use ptasiewiczw;
# zfunkcje agregujace
SELECT sum(udzwig)FROM kreatura;
SELECT avg(udzwig)FROM kreatura;
SELECT min(udzwig)FROM kreatura;
SELECT max(udzwig)FROM kreatura;
# count liczy wiersze
SELECT COUNT(*) from kreatura;
#zad 1
SELECT avg(waga) FROM kreatura WHERE rodzaj='wiking';
SELECT rodzaj, avg(waga),count(*) FROM kreatura GROUP BY rodzaj;
SELECT rodzaj,AVG(2022-year(dataUr)) as 'wiek' FROM kreatura GROUP BY rodzaj;
# zad 2
SELECT rodzaj, sum(waga)  FROM zasob GROUP BY rodzaj;
SELECT nazwa, avg(waga) FROM zasob WHERE ilosc >=4 GROUP BY nazwa HAVING  sum(waga) >10 ;
SELECT rodzaj, count(*) FROM zasob WHERE ilosc >1 GROUP BY rodzaj;
# zad 3
SELECT kreatura.nazwa, epwipunek.idKreatury,sum(ilosc) FROM epwipunek JOIN kreatura ON epwipunek.idKreatury=kreatura.idKreatury GROUP BY idKreatury;
SELECT kreatura.nazwa, zasob.nazwa FROM kreatura JOIN epwipunek ON kreatura.idKreatury=epwipunek.idKreatury JOIN zasob on epwipunek.idZasobu=zasob.idZasobu;
SELECT kreatura.nazwa,epwipunek.idZasobu FROM kreatura left JOIN epwipunek ON epwipunek.idKreatury=kreatura.idKreatury  WHERE idZasobu IS NULL;
#zad 4
SELECT kreatura.nazwa,zasob.nazwa, kreatura.dataUr FROM kreatura  JOIN epwipunek ON kreatura.idKreatury=epwipunek.idKreatury JOIN zasob on epwipunek.idZasobu=zasob.idZasobu WHERE kreatura.rodzaj='wiking' AND  kreatura.dataUr >='1669-01-01' AND  kreatura.dataUr <='1679-12-31' ;
SELECT kreatura.nazwa,zasob.nazwa,dataUr FROM kreatura JOIN epwipunek ON kreatura.idKreatury=epwipunek.idKreatury JOIN zasob on epwipunek.idZasobu=zasob.idZasobu  WHERE idEkwipunku IS NOT NULL GROUP BY kreatura.dataUr ORDER BY dataUr DESC limit 5 ;
SELECT nazwa as 'nazwa1', nazwa FROM kreatura JOIN kreatura ON kreatura.idKreatury=kreatura.idKreatury WHERE idKreatury !=5;


