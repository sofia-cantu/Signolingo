# Signolingo
Diccionario de lengua de señas/signos.

## Stack General
- Base de datos: Postgres
- Frontend del sitio web: React
- Frontend de la Aplicación: SwiftUI

## Configuración de la Base de Datos
Para comenzar con el proyecto, primero necesitas configurar la base de datos. Asegúrate de tener instalados los siguientes componentes:
- Postgres
- Java 1.8 o superior
- pgAdmin 4

Luego, dentro de pgAdmin, crea las tablas de la base de datos utilizando los siguientes queries SQL:

```sql
-- Tabla 1: admins
CREATE TABLE IF NOT EXISTS public.admins
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email text COLLATE pg_catalog."default" NOT NULL,
    password text COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    issuperuser boolean NOT NULL,
    CONSTRAINT admins_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.admins
    OWNER to postgres;

-- Tabla 2: categories
CREATE TABLE IF NOT EXISTS public.categories
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name text COLLATE pg_catalog."default" NOT NULL,
    color text COLLATE pg_catalog."default" NOT NULL,
    icon text COLLATE pg_catalog."default" NOT NULL,
    idsettings integer NOT NULL,
    isscannable boolean NOT NULL,
    CONSTRAINT categories_pkey PRIMARY KEY (id),
    CONSTRAINT idsettings FOREIGN KEY (idsettings)
        REFERENCES public.settings (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.categories
    OWNER to postgres;

-- Tabla 3: settings
CREATE TABLE IF NOT EXISTS public.settings
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    language text COLLATE pg_catalog."default" NOT NULL,
    location text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT settings_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.settings
    OWNER to postgres;

-- Tabla 4: tracker
CREATE TABLE IF NOT EXISTS public.tracker
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    word text COLLATE pg_catalog."default" NOT NULL,
    counter integer NOT NULL,
    islisted boolean NOT NULL,
    idsettings integer NOT NULL,
    CONSTRAINT tracker_pkey PRIMARY KEY (id),
    CONSTRAINT idsettings FOREIGN KEY (idsettings)
        REFERENCES public.settings (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tracker
    OWNER to postgres;

-- Tabla 5: words
CREATE TABLE IF NOT EXISTS public.words
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    categoryid integer NOT NULL,
    word text COLLATE pg_catalog."default" NOT NULL,
    definition text COLLATE pg_catalog."default" NOT NULL,
    image text COLLATE pg_catalog."default" NOT NULL,
    suggested1 text COLLATE pg_catalog."default" NOT NULL,
    suggested2 text COLLATE pg_catalog."default" NOT NULL,
    video text COLLATE pg_catalog."default" NOT NULL,
    idsettings integer NOT NULL,
    isscannable boolean NOT NULL,
    audio text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT id PRIMARY KEY (id),
    CONSTRAINT categoryid FOREIGN KEY (categoryid)
        REFERENCES public.categories (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT idsettings FOREIGN KEY (idsettings)
        REFERENCES public.settings (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.words
    OWNER to postgres;

-- Configuraciones adicionales
ALTER TABLE admins
ALTER COLUMN id
ADD GENERATED ALWAYS AS IDENTITY
```
## Configuración del Entorno de Desarrollo
Después de haber configurado la base de datos, es necesario preparar tu entorno de desarrollo. Asegúrate de tener instalados los siguientes componentes:

- Visual Studio Code
- Node.js
- npm

Dentro de la carpeta "backend", ejecuta el siguiente comando en la terminal para instalar las dependencias de Express:
```bash
npm install express
```

Cada vez que se quiera correr la API, dentro de la carpeta de backend, ejecutar el siguiente comendo:
```bash
node api.js.
```





