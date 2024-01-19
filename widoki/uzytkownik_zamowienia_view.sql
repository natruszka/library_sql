 SELECT u.uzytkownik_id,
    u.uzytkownik_imie,
    u.uzytkownik_nazwisko,
    u.czy_pracownik,
    u.czy_zbanowany,
    k.ksiazka_id,
    k.tytul,
    a.autor_imie,
    a.autor_nazwisko,
    z.data_rezerwacji,
    z.koniec_rezerwacji
   FROM zamowienia z
     JOIN uzytkownicy u ON z.uzytkownik_id = u.uzytkownik_id
     JOIN ksiazki k ON z.ksiazka_id = k.ksiazka_id
     JOIN autorzy a ON k.autor_id = a.autor_id;