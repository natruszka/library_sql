-- Table: public.recenzje

-- DROP TABLE IF EXISTS public.recenzje;

CREATE TABLE IF NOT EXISTS public.recenzje
(
    recenzja_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9999999 CACHE 1 ),
    uzytkownik_id integer NOT NULL,
    ocena integer NOT NULL,
    recenzja_tekst character varying(100) COLLATE pg_catalog."default",
    recenzja_data timestamp(0) with time zone NOT NULL DEFAULT now(),
    isbn character varying(16) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Reviews_pkey" PRIMARY KEY (recenzja_id),
    CONSTRAINT "ISBN" FOREIGN KEY (isbn)
        REFERENCES public.ksiazki_recenzje (isbn) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT member_id FOREIGN KEY (uzytkownik_id)
        REFERENCES public.uzytkownicy (uzytkownik_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.recenzje
    OWNER to enyxipxk;

-- Trigger: dodaj_recenzje

-- DROP TRIGGER IF EXISTS dodaj_recenzje ON public.recenzje;

CREATE TRIGGER dodaj_recenzje
    BEFORE INSERT
    ON public.recenzje
    FOR EACH ROW
    EXECUTE FUNCTION public.dodaj_recenzje();