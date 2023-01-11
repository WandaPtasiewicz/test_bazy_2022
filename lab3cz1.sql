use __firma_zti;
#zadanie 3
SELECT dzial.nazwa, COUNT(pracownik.id_pracownika) FROM dzial 
JOIN pracownik ON dzial.id_dzialu=pracownik.dzial GROUP BY dzial.nazwa;

# zadanie 4
SELECT nazwa_kategori, SUM(ilosc) FROM kategoria
JOIN towar ON kategoria.id_kategori=towar.kategoria 
JOIN stan_magazynowy ON stan_magazynowy.towar=towar.id_towaru  GROUP BY id_kategori; 

# zadanie 5
SELECT nazwa_kategori, group_concat(nazwa_towaru)  FROM kategoria
JOIN towar ON kategoria.id_kategori=towar.kategoria GROUP BY id_kategori;

# zadanie 6
select round(avg(pensja),2) from pracownik;

# zadanie 7
select avg(pensja) from pracownik WHERE ( 2023 - year(data_zatrudnienia))>=5;

# zadanie 8
SELECT nazwa_towaru, COUNT(id_pozycji)
FROM pozycja_zamowienia
JOIN towar ON towar.id_towaru=pozycja_zamowienia.towar
GROUP BY nazwa_towaru
ORDER BY COUNT(id_pozycji) DESC LIMIT 10;

# zadanie 9
Select numer_zamowienia, (cena) AS wartosc from zamowienie 
JOIN  pozycja_zamowienia ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
WHERE month(data_zamowienia) <4 AND year(data_zamowienia) =2017;

# zadanie 10
SELECT imie, nazwisko,(cena )  as SUMA from pracownik 
JOIN zamowienie ON pracownik.id_pracownika =zamowienie.pracownik_id_pracownika
JOIN pozycja_zamowienia ON zamowienie.id_zamowienia=pozycja_zamowienia.zamowienie
GROUP BY id_pracownika ORDER BY SUMA DESC;

select * from pozycja_zamowienia;






