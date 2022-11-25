CREATE TABLE ptasiewiczw.kreatura SELECT * FROM wikingowie.kreatura;
CREATE TABLE ptasiewiczw.zasob SELECT * FROM wikingowie.zasob;
CREATE TABLE ptasiewiczw.epwipunek SELECT * FROM wikingowie.ekwipunek;
SELECT * FROM zasob;
SELECT * FROM zasob WHERE rodzaj='jedzenie';
SELECT idZasobu,ilosc FROM epwipunek WHERE idKreatury IN (1,3,5);
# zadanie 2
SELECT * FROM kreatura WHERE rodzaj != 'wiedzma' AND udzwig >= 50;
SELECT * FROM zasob  WHERE waga BETWEEN 2 AND 5;
SELECT * FROM kreatura WHERE nazwa LIKE '%or%' AND udzwig between 30 AND 70;
# zadanie 3
SELECT* FROM zasob WHERE MONTH(dataPozyskania) IN (7, 8);
SELECT * FROM zasob WHERE rodzaj IS NOT NULL order by waga ASC;
SELECT * FROM kreatura ORDER BY dataUr ASC  LIMIT 5 ;
# zadanie 4
SELECT distinct rodzaj FROM zasob;
SELECT CONCAT(nazwa,' ',rodzaj)FROM kreatura WHERE rodzaj LIKE 'wi%';
SELECT idZasobu,nazwa, ilosc*waga AS rzeczywistwawaga,dataPozyskania FROM zasob WHERE year(dataPozyskania) between 2000 AND 2007;
# zadanie 5
SELECT nazwa, waga, (waga *0.70) AS wagabezsmieci,(waga*0.3) AS wagasmieci  FROM zasob WHERE rodzaj='jedzenie';
SELECT * FROM zasob WHERE rodzaj IS  NULL;
SELECT distinct rodzaj FROM zasob WHERE nazwa LIKE 'ba%' OR nazwa LIKE '%os' ORDER BY nazwa ASC;
