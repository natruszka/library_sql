-- Table: public.login

-- DROP TABLE IF EXISTS public.login;

CREATE TABLE IF NOT EXISTS public.login
(
    login character varying(30) COLLATE pg_catalog."default" NOT NULL,
    haslo character varying(30) COLLATE pg_catalog."default" NOT NULL,
    uzytkownik_id integer NOT NULL,
    CONSTRAINT login_pkey PRIMARY KEY (login)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.login
    OWNER to enyxipxk;