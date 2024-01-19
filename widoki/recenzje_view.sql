 SELECT r.recenzja_id,
    u.uzytkownik_imie,
    u.uzytkownik_nazwisko,
    k.tytul,
    r.ocena,
    r.recenzja_tekst,
    r.recenzja_data
   FROM recenzje r
     LEFT JOIN ksiazki_recenzje kr ON r.isbn::text = kr.isbn::text
     LEFT JOIN ksiazki k ON kr.isbn::text = k.isbn::text
     JOIN uzytkownicy u ON r.uzytkownik_id = u.uzytkownik_id;