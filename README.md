API de Productos

Descripción
Esta API permite gestionar productos en una base de datos. Proporciona funcionalidades para crear, leer, actualizar y eliminar productos.

**Características**
- **Obtener todos los productos**: Recupera una lista de todos los productos disponibles.
- **Obtener producto por ID**: Permite obtener detalles de un producto específico.
- **Crear un nuevo producto**: Añade un nuevo producto a la base de datos.
- **Actualizar un producto existente**: Modifica la información de un producto.
- **Eliminar un producto**: Elimina un producto de la base de datos.

Requisitos
- .NET 8 o superior
- Entity Framework Core
- Base de datos (por ejemplo, SQL Server, SQLite)
- Visual Studio(2022)

Instalación

1. Clona el repositorio:
   ```bash
   git clone [https://github.com/wendy97531234/MyAppi.git]
Pruebas de la API
Swagger
Una vez que la API esté en funcionamiento, puedes acceder a la documentación interactiva de Swagger en:
https://localhost:7176/api/ProductoControllers
Aquí podrás ver todos los endpoints disponibles y probarlos directamente desde el navegador.

Postman
Abre Postman.
Para probar los diferentes endpoints, utiliza las siguientes configuraciones:
1. Obtener todos los productos
Método: GET
https://localhost:7176/api/ProductoControllers

3. Obtener producto por ID
Método: GET
URL: https://localhost:7176/api/ProductoControllers/9

5. Crear un nuevo producto
Método: POST
URL:https://localhost:7176/api/ProductoControllers
Cuerpo: (id, no es necesario porque es autoincremental)
{
    "name": "Nuevo Producto",
    "precio": 15.0,
    "Stock": 50
}
6. Actualizar un producto
Método: PUT
URL: https://localhost:7176/api/ProductoControllers/7

Cuerpo:
{
    "name": "Producto Actualizado",
    "precio": 20.0,
    "Stock": 80
}

8. Eliminar un producto
Método: DELETE
URL: https://localhost:7176/api/ProductoControllers

Contacto
Para más información, puedes contactarme [aa0722032023@unab.edu.sv]



Video del funcionamiento de la Appi:
URL: https://drive.google.com/file/d/1Bj9TTvUO_ZCSm0YHmV0J-OZqCJXjUtFb/view?usp=sharing
