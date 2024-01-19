 SELECT k.ksiazka_id,
    k.tytul,
    a.autor_imie,
    a.autor_nazwisko,
    g.gatunek_nazwa,
    p.wydawca_nazwa,
    k.edycja,
    k.czy_pozyczona,
    k.czy_zamowiona,
    k.isbn
   FROM ksiazki k
     JOIN autorzy a ON k.autor_id = a.autor_id
     JOIN gatunki g ON k.gatunek_id = g.gatunek_id
     JOIN wydawcy p ON k.wydawca_id = p.wydawca_id;