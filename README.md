

# Base de Datos

Este repositorio incluye la base de datos que es utilizada por el backend de la aplicación. La base de datos fue configurada utilizando un **dump** migrado, por lo que no es necesario realizar migraciones adicionales.

## Requisitos

1. **PostgreSQL**: La base de datos está configurada para usarse con PostgreSQL. Asegúrate de tener PostgreSQL instalado y configurado en tu máquina.

   Puedes descargar PostgreSQL desde su sitio oficial:  
   [Descargar PostgreSQL](https://www.postgresql.org/download/)

2. **DBeaver (opcional)**: Si deseas gestionar la base de datos de manera visual, puedes usar DBeaver. Es una herramienta fácil de usar para conectar y manejar bases de datos, incluidas las de PostgreSQL.

   Puedes descargar DBeaver desde su sitio oficial:  
   [Descargar DBeaver](https://dbeaver.io/download/)

## Instrucciones

1. **Importar el Dump**:
   - Si tienes DBeaver, abre la aplicación y conecta a tu base de datos de PostgreSQL.
   - Crea una nueva base de datos o selecciona una existente.
   - Importa el archivo del dump en la base de datos seleccionada.
   
   **O, si prefieres usar la terminal**:
   - Asegúrate de tener PostgreSQL instalado y funcionando en tu máquina.
   - Desde la terminal, ejecuta el siguiente comando para importar el dump:
     ```bash
     psql -U tu_usuario -d nombre_de_base_de_datos -f ruta_al_dump.sql
     ```

2. **Verifica las Tablas**:
   - Después de importar el dump, puedes verificar que las tablas y los datos se hayan cargado correctamente.
   - Si usas DBeaver, simplemente navega por las tablas en la interfaz.
   
   **O, usando la terminal**:
   - Ejecuta el siguiente comando para listar las tablas en PostgreSQL:
     ```bash
     \dt
     ```

3. **Configuración del Backend**:
   - Asegúrate de que el backend esté configurado para usar esta base de datos, y revisa el archivo `.env` para verificar la configuración de la conexión a la base de datos.
   
   Ejemplo de configuración en el `.env`:
   ```
   DB_CONNECTION=pgsql
   DB_HOST=127.0.0.1
   DB_PORT=5432
   DB_DATABASE=nombre_de_base_de_datos
   DB_USERNAME=tu_usuario
   DB_PASSWORD=tu_contraseña
   ```

4. **Probando la Conexión**:
   - Una vez configurada la base de datos, puedes probar la conexión desde el backend ejecutando las peticiones API.

