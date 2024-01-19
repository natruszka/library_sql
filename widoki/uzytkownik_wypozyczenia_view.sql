 SELECT u.uzytkownik_id,
    u.uzytkownik_imie,
    u.uzytkownik_nazwisko,
    u.czy_pracownik,
    u.czy_zbanowany,
    k.ksiazka_id,
    k.tytul,
    a.autor_imie,
    a.autor_nazwisko,
    w.data_wypozyczenia,
    w.data_zwrotu,
    w.termin_zwrotu
   FROM wypozyczenia w
     JOIN uzytkownicy u ON w.uzytkownik_id = u.uzytkownik_id
     JOIN ksiazki k ON w.ksiazka_id = k.ksiazka_id
     JOIN autorzy a ON k.autor_id = a.autor_id;