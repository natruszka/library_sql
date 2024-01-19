 SELECT k.tytul,
    a.autor_imie,
    a.autor_nazwisko,
    g.gatunek_nazwa,
    p.wydawca_nazwa,
    k.edycja,
    avg(r.ocena) AS srednia_ocena,
    count(r.recenzja_id) AS suma_ocen,
    k.isbn
   FROM ksiazki k
     JOIN autorzy a ON k.autor_id = a.autor_id
     JOIN gatunki g ON k.gatunek_id = g.gatunek_id
     JOIN wydawcy p ON k.wydawca_id = p.wydawca_id
     LEFT JOIN ksiazki_recenzje kr ON k.isbn::text = kr.isbn::text
     LEFT JOIN recenzje r ON kr.isbn::text = r.isbn::text
  GROUP BY k.isbn, k.tytul, a.autor_imie, a.autor_nazwisko, g.gatunek_nazwa, p.wydawca_nazwa, k.edycja;