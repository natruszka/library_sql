DECLARE idksiazki INTEGER;
BEGIN 
IF EXISTS(SELECT uzytkownik_id
                        FROM uzytkownicy
                        WHERE uzytkownik_id = id_uzytkownika and czy_zbanowany = false)
      THEN
            IF EXISTS(SELECT isbn FROM ksiazki WHERE
					 isbn = isbn_wypozyczenia)
				THEN
					SELECT ksiazka_id into idksiazki
					FROM ksiazki
					WHERE isbn = isbn_wypozyczenia
					and czy_pozyczona = false
					and czy_zamowiona = false;
					IF not found then
					RAISE EXCEPTION 'Ksiazka nie jest dostępna';
					ELSE
					insert into wypozyczenia (ksiazka_id, uzytkownik_id)
					values (idksiazki, id_uzytkownika);
					UPDATE ksiazki SET czy_pozyczona=true
					where ksiazka_id = idksiazki;
					RETURN 'OK';
					END IF;
					
				ELSE
					RAISE EXCEPTION 'Ksiazka nie istnieje';
			END IF;					 
      ELSE
            RAISE EXCEPTION 'Podany użykownik nie istnieje';
      END IF;
	  END;