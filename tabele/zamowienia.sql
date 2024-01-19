-- Table: public.zamowienia

-- DROP TABLE IF EXISTS public.zamowienia;

CREATE TABLE IF NOT EXISTS public.zamowienia
(
    uzytkownik_id integer NOT NULL,
    ksiazka_id integer NOT NULL,
    data_rezerwacji timestamp(0) with time zone NOT NULL DEFAULT now(),
    zamowienie_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9999999 CACHE 1 ),
    koniec_rezerwacji timestamp(0) with time zone DEFAULT (now() + '14 days'::interval),
    CONSTRAINT zamowienia_pkey PRIMARY KEY (zamowienie_id),
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

ALTER TABLE IF EXISTS public.zamowienia
    OWNER to enyxipxk;