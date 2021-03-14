USANDO EL POSTMAN
Si es necesario restaurar paquetes 
-Abrir la consola Package Manager Console.
-Correr comando dotnet restore o dotnet build

1-Crear una base de datos con el nombre producto.
2-Configurar la conexión con la base de datos.
  "ConnectionStrings": {
    //"DefaultConnection": "user id=root;data source=127.0.0.1;database=producto;",
    "DefaultConnection": "user id=root;password=root;data source=127.0.0.1;database=producto;"
  }
3-Importar o restaurar la base datos el producto.sql y listo.

Si no hacer lo siguiente:
3-Borrar todo lo que está dentro de la carpeta Migrations o puede importar o restaurar producto.sql y listo.
4-Abrir la consola Package Manager Console.
5-Correr comando add-migration initial y luego Update-Database


FUNCIONALIDADES A REALIZAR SOBRE LOS USUARIOS
LOGIN: Iniciar sesión con el usuario con rol administrador
1- POST https://localhost:44316/api/authmanagement/logintest

2-Seleccione Body -raw JSON y poner el siguiente JSON
{
  "email": "frank@gmail.com",
  "password": "Admin123!"
}
Rol vendedor: {
  "email": "jhon@gmail.com",
  "password": "Vendedor123!"
}

Rol cliente: {
  "email": "shaw@gmail.com",
  "password": "Clente123!"
}



FUNCIONALIDADES A REALIZAR SOBRE EL PRODUCTO
-----------------------------------------
GET https://localhost:44316/api/producto
-----------------------------------------
PUT https://localhost:44316/api/producto/1
-Seleccione Body -raw JSON
{ 
  "id": 1,
  "nombre": "Atun",
  "descripcion": "Pescado rico en omega 3",
  "cantidad": 1000,
  "slug": "Url atun",
  "precio": 100
}
----------------------------------------

GET https://localhost:44316/api/producto/2
Seleccione Authoritation TYPE Bearer Token y pegue el token del usuario logueado en el campo Token.
----------------------------------------
POST https://localhost:44316/api/producto
1-Seleccione Body -raw JSON y poner el siguiente JSON
{ 
  "id": 1,
  "nombre": "Atun",
  "descripcion": "Pescado rico en omega 3",
  "cantidad": 1000,
  "slug": "Url atun",
  "precio": 100
}
2-Seleccione Authoritation TYPE Bearer Token y pegue el token del usuario logueado en el campo Token.
----------------------------------------
DELETE https://localhost:44316/api/producto/1
2-Seleccione Authoritation TYPE Bearer Token y pegue el token del usuario logueado en el campo Token.
----------------------------------------
----------------------------------------
POST https://localhost:44316/api/producto/comprarproducto
1-Seleccione Body -raw JSON y poner el siguiente JSON
{
  "productoId": 1,
  "usuarioId": "3183cc93-3310-488b-98fe-b19ebe2681aa",
  "fecha": "2021-03-12T17:29:09.167Z",
  "estado": "confirmed",
  "cantidad": 2
}
2-Seleccione Authoritation TYPE Bearer Token y pegue el token del usuario logueado en el campo Token.
---------------------------------------


FUNCIONALIDADES A REALIZAR SOBRE LAS ÓRDENES

1-Editar orden si el estado esta en: created, confirmed, canceled
PUT https://localhost:44316/api/orden/8?estado=confirmed
-Seleccione Authoritation TYPE Bearer Token y pegue el token del usuario logueado en el campo Token.
----------
2-Eliminar una orden solo si no está en confirmed 
DELETE https://localhost:44316/api/orden/8
-Seleccione Authoritation TYPE Bearer Token y pegue el token del usuario logueado en el campo Token.
