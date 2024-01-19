declare
id_wydawnictwa INTEGER;
id_gatunku INTEGER;
id_autora INTEGER;
BEGIN
select wydawca_id into id_wydawnictwa from wydawcy
		  where wydawca_nazwa = _wydawca;
	if not found then
	insert into wydawcy (wydawca_nazwa) values (_wydawca)
	returning wydawca_id into id_wydawnictwa;
	end if;
select gatunek_id into id_gatunku from gatunki
	where gatunek_nazwa = _gatrunek;
	if not found then
	insert into gatunki (gatunek_nazwa) values (_gatrunek) 
	returning gatunek_id into id_gatunku;
	end if;
select autor_id into id_autora from autorzy
	where autor_imie = _imie_aut and autor_nazwisko = _nazwisko_aut;
	if not found then
	insert into autorzy (autor_imie, autor_nazwisko)
	values (_imie_aut, _nazwisko_aut) returning autor_id into id_autora;
	end if;
if not exists(select isbn from ksiazki_recenzje where isbn = _isbn) then
	insert into ksiazki_recenzje (isbn) values (_isbn);
	end if;
if _edycja <= 0 then
	raise exception 'Edcja nie moze byc mniejsza od 1';
	end if;
insert into ksiazki (autor_id, tytul, gatunek_id, wydawca_id, edycja, isbn)
values (id_autora, _tytul, id_gatunku, id_wydawnictwa, _edycja, _isbn);
return 'Ok';
end;