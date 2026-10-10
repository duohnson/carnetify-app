El uso del workbench era para usar diagrama, y ver o entender yo el flujo para crear la base,
ahora, ya creada, voy a escribir la base postgreSQL.

Para ver el .sql de la base ir a -->: [https://github.com/duohnson/credid-app/wiki/base_de_datos/esquema_postgre.sql](https://github.com/duohnson/credid-app/wiki/base_de_datos/esquema_postgre.sql)

BEGIN;

  - Begin lo que hace es iniciar un tipo de estado al crear la base, asi, si la base genera error en medio script, no crea medio esquema y deja lo demás sin finalizar, si que no con rollback; me permite deshacer todo, asi a la hora de usar el script se completa una vez corregido.

```
CREATE TABLE usuarios (
 id uuid PRIMARY KEY, nombre varchar(150) NOT NULL, apellido_1 varchar(150) NOT NULL,
 apellido_2 varchar(150), email varchar(255) NOT NULL,
 contrasena_hash varchar(255) NOT NULL,
 fecha_creacion timestamptz NOT NULL DEFAULT now(),
 fecha_actualizacion timestamptz NOT NULL DEFAULT now(),
 CONSTRAINT usuarios_email_no_vacio CHECK (btrim(email) <> '')
);
```

  - La tabla de usuarios permite a ñla persona estar asociado a un trabajo, universidad y gimnasio pero su identidad global solo es una, la del id; CONSTRAINT --> obliga a declarar restriccion, entonces, se traduce de esta forma, usuarios_email_no_vacio es regla que usa CHECK --> <VACIO> ... OBLIGA a que no posea espacios, ni que este vacio, lo hace obligatorio el email.
