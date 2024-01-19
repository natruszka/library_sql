-- Table: public.wydawcy

-- DROP TABLE IF EXISTS public.wydawcy;

CREATE TABLE IF NOT EXISTS public.wydawcy
(
    wydawca_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9999999 CACHE 1 ),
    wydawca_nazwa character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Publishers_pkey" PRIMARY KEY (wydawca_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.wydawcy
    OWNER to enyxipxk;

-- Trigger: dodaj_wydawnictwo

-- DROP TRIGGER IF EXISTS dodaj_wydawnictwo ON public.wydawcy;

CREATE TRIGGER dodaj_wydawnictwo
    BEFORE INSERT
    ON public.wydawcy
    FOR EACH ROW
    EXECUTE FUNCTION public.dodaj_wydawnictwo();