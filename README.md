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
-- Table 1: public.admins
CREATE TABLE IF NOT EXISTS public.admins
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email text COLLATE pg_catalog."default" NOT NULL,
    password text COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    issuperuser boolean NOT NULL,
    CONSTRAINT admins_pkey PRIMARY KEY (id)
)
...

-- Table 2: public.categories
...
-- Table 3: public.settings
...
-- Table 4: public.tracker
...
-- Table 5: public.words
...
