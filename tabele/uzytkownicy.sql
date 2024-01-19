-- Table: public.uzytkownicy

-- DROP TABLE IF EXISTS public.uzytkownicy;

CREATE TABLE IF NOT EXISTS public.uzytkownicy
(
    uzytkownik_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9999999 CACHE 1 ),
    uzytkownik_imie character varying(30) COLLATE pg_catalog."default" NOT NULL,
    uzytkownik_nazwisko character varying(50) COLLATE pg_catalog."default" NOT NULL,
    czy_pracownik boolean NOT NULL,
    kara money,
    czy_zbanowany boolean NOT NULL DEFAULT false,
    CONSTRAINT "Members_pkey" PRIMARY KEY (uzytkownik_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.uzytkownicy
    OWNER to enyxipxk;