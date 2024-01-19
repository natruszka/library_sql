-- Table: public.wypozyczenia

-- DROP TABLE IF EXISTS public.wypozyczenia;

CREATE TABLE IF NOT EXISTS public.wypozyczenia
(
    ksiazka_id integer NOT NULL,
    uzytkownik_id integer NOT NULL,
    data_wypozyczenia timestamp(0) with time zone NOT NULL DEFAULT now(),
    data_zwrotu timestamp(0) with time zone,
    termin_zwrotu timestamp(0) with time zone NOT NULL DEFAULT (now() + '30 days'::interval),
    wypozyczenie_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 999999 CACHE 1 ),
    CONSTRAINT wypozyczenia_pkey PRIMARY KEY (wypozyczenie_id),
    CONSTRAINT book_id FOREIGN KEY (ksiazka_id)
        REFERENCES public.ksiazki (ksiazka_id) MATCH SIMPLE
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

ALTER TABLE IF EXISTS public.wypozyczenia
    OWNER to enyxipxk;