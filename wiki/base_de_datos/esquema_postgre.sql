BEGIN;
CREATE TABLE usuarios (
 id uuid PRIMARY KEY, nombre varchar(150) NOT NULL, apellido_1 varchar(150) NOT NULL,
 apellido_2 varchar(150), email varchar(255) NOT NULL,
 contrasena_hash varchar(255) NOT NULL,
 fecha_creacion timestamptz NOT NULL DEFAULT now(),
 fecha_actualizacion timestamptz NOT NULL DEFAULT now(),
 CONSTRAINT usuarios_email_no_vacio CHECK (btrim(email) <> '')
);
IMCOMPLETO
