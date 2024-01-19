-- Table: public.gatunki

-- DROP TABLE IF EXISTS public.gatunki;

CREATE TABLE IF NOT EXISTS public.gatunki
(
    gatunek_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 999999 CACHE 1 ),
    gatunek_nazwa character varying(30) COLLATE pg_catalog."default" NOT NULL,
    gatunek_opis character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT "Genres_pkey" PRIMARY KEY (gatunek_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.gatunki
    OWNER to enyxipxk;

-- Trigger: dodaj_gatunek

-- DROP TRIGGER IF EXISTS dodaj_gatunek ON public.gatunki;

CREATE TRIGGER dodaj_gatunek
    BEFORE INSERT
    ON public.gatunki
    FOR EACH ROW
    EXECUTE FUNCTION public.dodaj_gatunek();