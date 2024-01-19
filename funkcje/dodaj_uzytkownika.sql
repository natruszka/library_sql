DECLARE id_uzytkownika INTEGER;
BEGIN
	IF EXISTS (SELECT login FROM login where login = nazwa_uz) THEN
		raise exception 'Uzytkownik juz istnieje';
	else
		insert into uzytkownicy(
	uzytkownik_imie, uzytkownik_nazwisko, czy_pracownik) 
	values(imie, nazwisko, czypracownik)
	returning uzytkownik_id into id_uzytkownika;
	insert into login (login, haslo, uzytkownik_id) values
	(nazwa_uz, haslo_uz, id_uzytkownika);
	return id_uzytkownika;
	end if;
		end;
        