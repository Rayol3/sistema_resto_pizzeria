# Sistema de Pizzería (Food Sale)

Este es un sistema web completo para la gestión de ventas de una pizzería, desarrollado con el framework Laravel (PHP). Incluye gestión de inventario, ventas, usuarios y reportes.

## Requisitos del Sistema

Para ejecutar este proyecto localmente, necesitas tener instalado:

*   **PHP**: Versión 8.2 o superior.
*   **Composer**: Gestor de dependencias de PHP.
*   **MySQL**: Base de datos (puede ser XAMPP, Laragon, o MySQL Server independiente).
*   **Node.js & NPM**: Para compilar los assets del frontend.

## Instalación y Configuración

Sigue estos pasos para instalar y ejecutar el proyecto en tu máquina local:

### 1. Clonar el Repositorio

```bash
git clone https://github.com/TU_USUARIO/TU_REPOSITORIO.git
cd sistema-pizzeria
```

### 2. Instalar Dependencias de PHP

```bash
composer install
```
*Si encuentras errores de extensiones (ej. GD), asegúrate de habilitarlas en tu php.ini.*

### 3. Instalar Dependencias de Frontend

```bash
npm install && npm run dev
```

### 4. Configurar el Entorno

Copia el archivo de ejemplo `.env.example` a `.env`:

```bash
cp .env.example .env
```
*(En Windows puedes usar `copy .env.example .env`)*

Genera la clave de aplicación:

```bash
php artisan key:generate
```

### 5. Configurar la Base de Datos

1.  Crea una base de datos vacía en MySQL llamada `food_sale` (o el nombre que prefieras).
2.  Abre el archivo `.env` y configura tus credenciales de base de datos:

```ini
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=food_sale
DB_USERNAME=root
DB_PASSWORD=
```

### 6. Migraciones y Datos de Prueba (Seeds)

Ejecuta las migraciones para crear las tablas e insertar los usuarios por defecto:

```bash
php artisan migrate --seed
```

### 7. Iniciar el Servidor

```bash
php artisan serve
```

El sistema estará disponible en: [http://127.0.0.1:8000](http://127.0.0.1:8000)

## Credenciales de Acceso

El sistema viene pre-configurado con los siguientes usuarios (según `DatabaseSeeder`):

### Administrador
*   **Usuario**: `admin`
*   **Contraseña**: `admin123.`

### Caja 1
*   **Usuario**: `caja1`
*   **Contraseña**: `caja123.`

---

## Tecnologías Utilizadas

*   **Backend**: Laravel 8
*   **Frontend**: Blade, Bootstrap, jQuery (AdminLTE template probable)
*   **Base de Datos**: MySQL
*   **Otros**: DomPDF (Reportes PDF), Excel Exports

## Licencia

Este proyecto es de código abierto.
