declare idwypozyczenia INTEGER;
BEGIN
IF EXISTS(SELECT ksiazka_id from ksiazki where ksiazka_id = idksiazki)
then
	SELECT wypozyczenie_id into idwypozyczenia from wypozyczenia
			where ksiazka_id = idksiazki;
	if not found then
		raise exception 'Wypozyczenie nie istnieje';
	else
		UPDATE ksiazki set czy_pozyczona = FALSE where ksiazka_id = idksiazki;
		UPDATE wypozyczenia set data_zwrotu = now() where wypozyczenie_id = idwypozyczenia;
		return 'Ok';
		end if;
		else
		raise exception 'Ksiazka nie istnieje';
	end if;
	end;