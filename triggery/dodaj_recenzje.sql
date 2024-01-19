BEGIN
	perform FROM uzytkownicy where uzytkownik_id = NEW.uzytkownik_id;
	if not found then
		raise exception 'Uzytkownik nie istnieje';
		end if;
	if NEW.ocena <=0 or NEW.ocena >5 then
		raise exception 'Bledna wartosc oceny';
		end if;
		return new;
		end;

 