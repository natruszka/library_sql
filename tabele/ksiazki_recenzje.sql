-- Table: public.ksiazki_recenzje

-- DROP TABLE IF EXISTS public.ksiazki_recenzje;

CREATE TABLE IF NOT EXISTS public.ksiazki_recenzje
(
    isbn character varying(16) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "ISBN_pkey" PRIMARY KEY (isbn)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ksiazki_recenzje
    OWNER to enyxipxk;