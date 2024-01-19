BEGIN
    IF LENGTH(NEW.wydawca_nazwa) = 0 THEN
        RAISE EXCEPTION 'Gatunek nie moze byc pusty.';
    END IF;
  
    RETURN NEW;                                                          
    END;