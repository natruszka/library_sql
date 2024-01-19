BEGIN
  IF NEW.autor_imie IS NOT NULL THEN
     NEW.autor_imie := lower(NEW.autor_imie);
     NEW.autor_imie := initcap(NEW.autor_imie);
  END IF;
  IF NEW.autor_nazwisko IS NOT NULL THEN
     NEW.autor_nazwisko := lower(NEW.autor_nazwisko);
     NEW.autor_nazwisko := initcap(NEW.autor_nazwisko);
  END IF;
  RETURN NEW;
END;