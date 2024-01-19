-- Table: public.ksiazki

-- DROP TABLE IF EXISTS public.ksiazki;

CREATE TABLE IF NOT EXISTS public.ksiazki
(
    ksiazka_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9999999 CACHE 1 ),
    autor_id integer NOT NULL,
    tytul character varying(50) COLLATE pg_catalog."default" NOT NULL,
    gatunek_id integer NOT NULL,
    wydawca_id integer NOT NULL,
    edycja integer NOT NULL,
    czy_pozyczona boolean NOT NULL DEFAULT false,
    czy_zamowiona boolean NOT NULL DEFAULT false,
    isbn character varying(16) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Books_pkey" PRIMARY KEY (ksiazka_id),
    CONSTRAINT "ISBN" FOREIGN KEY (isbn)
        REFERENCES public.ksiazki_recenzje (isbn) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT autor_id FOREIGN KEY (autor_id)
        REFERENCES public.autorzy (autor_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT gatunek_id FOREIGN KEY (gatunek_id)
        REFERENCES public.gatunki (gatunek_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT wydawca_id FOREIGN KEY (wydawca_id)
        REFERENCES public.wydawcy (wydawca_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ksiazki
    OWNER to enyxipxk;