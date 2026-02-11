@echo off
echo ==========================================
echo       SISTEMA PIZZERIA - SETUP
echo ==========================================
echo.
echo [1/4] Installing dependencies (this may take a while)...
call composer install --no-interaction --ignore-platform-req=ext-gd --ignore-platform-req=ext-zip --prefer-dist
if %errorlevel% neq 0 (
    echo [ERROR] Composer install failed. Please check your internet connection or PHP configuration.
    echo Ensure 'extension=gd' and 'extension=zip' are enabled in php.ini.
    pause
    exit /b %errorlevel%
)

echo.
echo [2/4] Clearing application cache...
php artisan optimize:clear
if %errorlevel% neq 0 (
    echo [WARNING] Could not clear cache. Continuing...
)

echo.
echo [3/4] Migrating database...
php artisan migrate --seed --force
if %errorlevel% neq 0 (
    echo [ERROR] Database migration failed. Ensure MySQL is running and database 'food_sale' exists.
    pause
    exit /b %errorlevel%
)

echo.
echo [4/4] Starting server...
echo Access the system at: http://127.0.0.1:8000
php artisan serve
pause
