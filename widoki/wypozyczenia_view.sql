 SELECT w.wypozyczenie_id,
    k.tytul,
    u.uzytkownik_imie,
    u.uzytkownik_nazwisko,
    w.data_wypozyczenia,
    w.data_zwrotu,
    w.termin_zwrotu
   FROM wypozyczenia w
     JOIN uzytkownicy u ON w.uzytkownik_id = u.uzytkownik_id
     JOIN ksiazki k ON w.ksiazka_id = k.ksiazka_id;