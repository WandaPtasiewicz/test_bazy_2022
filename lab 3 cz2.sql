# zadanie 1
use __firma_zti;
SELECT dzial.nazwa, max(pensja),min(pensja),avg(pensja)from dzial 
JOIN pracownik ON pracownik.dzial=dzial.id_dzialu group by nazwa;

# zadanie 2
SELECT klient.pelna_nazwa, SUM(p.ilosc*p.cena) AS sum FROM klient 
 JOIN zamowienie ON klient.id_klienta=zamowienie.klient 
 JOIN pozycja_zamowienia p ON p.zamowienie=zamowienie.status_zamowienia GROUP BY id_klienta ORDER BY
sum DESC LIMIT 10;

# zadanie 3
SELECT SUM(p.ilosc*p.cena) AS sum, year(data_zamowienia) as rok FROM zamowienie
JOIN pozycja_zamowienia p ON p.zamowienie=zamowienie.status_zamowienia
 JOIN status_zamowienia ON zamowienie.status_zamowienia=status_zamowienia.id_statusu_zamowienia 
 where id_statusu_zamowienia =5 group by rok order  by  sum desc;
 
 # zadanie 4
 SELECT SUM(p.ilosc*p.cena) AS sum from zamowienie 
 JOIN pozycja_zamowienia p ON p.zamowienie=zamowienie.status_zamowienia
 JOIN status_zamowienia ON zamowienie.status_zamowienia=status_zamowienia.id_statusu_zamowienia
 WHERE id_statusu_zamowienia = 6;
 
 # zadanie 5

SELECT adres_klienta.miejscowosc,count(*),SUM(pozycja_zamowienia.ilosc*pozycja_zamowienia.cena) FROM zamowienie 
INNER JOIN pozycja_zamowienia ON pozycja_zamowienia.zamowienie=zamowienie.id_zamowienia
INNER JOIN klient ON zamowienie.klient=klient.id_klienta
INNER JOIN adres_klienta ON klient.id_klienta=adres_klienta.klient 
INNER JOIN typ_adresu ON adres_klienta.typ_adresu=typ_adresu.id_typu
WHERE typ_adresu.nazwa="podstawowy"
GROUP BY adres_klienta.miejscowosc;

#zadanie 6
SELECT SUM(p.ilosc*p.cena) - SUM(p.ilosc*t.cena_zakupu) AS dochod
FROM zamowienie AS z
 JOIN pozycja_zamowienia AS p ON p.zamowienie = z.id_zamowienia
JOIN  towar as t ON t.id_towaru = p.towar
WHERE z.status_zamowienia = 5;

# zadanie 7
SELECT SUM(p.ilosc*p.cena) - SUM(p.ilosc*t.cena_zakupu) AS dochod , year(data_zamowienia) as rok
FROM zamowienie AS z
 JOIN pozycja_zamowienia AS p ON p.zamowienie = z.id_zamowienia
JOIN  towar as t ON t.id_towaru = p.towar
WHERE z.status_zamowienia = 5 group by rok;

# zadanie 8
select nazwa_kategori,sum(cena_zakupu * stan_magazynowy.ilosc) as wartosc from stan_magazynowy 
JOIN towar ON towar.id_towaru=stan_magazynowy.towar
JOIN kategoria ON towar.kategoria =kategoria.id_kategori group by nazwa_kategori;

# zadanie 9
select monthname(data_urodzenia)as miesiac , count(*) as" liczba pracownikow "from pracownik 
group by miesiac order by month(data_urodzenia) asc;

# zadanie 10

SELECT p.imie,p.nazwisko, 
TIMESTAMPDIFF(MONTH,data_zatrudnienia,CURDATE()) * p.pensja AS koszt
FROM pracownik AS p;