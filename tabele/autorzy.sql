-- Table: public.autorzy

-- DROP TABLE IF EXISTS public.autorzy;

CREATE TABLE IF NOT EXISTS public.autorzy
(
    autor_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 999999 CACHE 1 ),
    autor_imie character varying(30) COLLATE pg_catalog."default" NOT NULL,
    autor_nazwisko character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Authors_pkey" PRIMARY KEY (autor_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.autorzy
    OWNER to enyxipxk;

-- Trigger: dodaj_autora

-- DROP TRIGGER IF EXISTS dodaj_autora ON public.autorzy;

CREATE TRIGGER dodaj_autora
    BEFORE INSERT
    ON public.autorzy
    FOR EACH ROW
    EXECUTE FUNCTION public.dodaj_autora();