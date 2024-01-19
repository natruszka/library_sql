 SELECT z.zamowienie_id,
    k.tytul,
    u.uzytkownik_imie,
    u.uzytkownik_nazwisko,
    z.data_rezerwacji,
    z.koniec_rezerwacji
   FROM zamowienia z
     JOIN uzytkownicy u ON z.uzytkownik_id = u.uzytkownik_id
     JOIN ksiazki k ON z.ksiazka_id = k.ksiazka_id;