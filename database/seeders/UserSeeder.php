<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */

    // Ahi puedes administrar tus usuarios, si haces algun cambio
    // Vuelves a ejecutar las migraciones
    public function run()
    {
        User::create([
            'nombres'           => 'Administrador',
            'user'              => 'admin',
            'password'          => bcrypt('admin123.'),
            'estado'            => 1,
            'idcaja'            => 1,
            'logo_encabezado'   => 'logo.png'
        ])->assignRole('SUPERADMIN');

        User::create([
            'nombres'           => 'Caja 1',
            'user'              => 'caja1',
            'password'          => bcrypt('caja123.'),
            'estado'            => 1,
            'idcaja'            => 1,
            'logo_encabezado'   => NULL
        ])->assignRole('ADMIN');

        User::create([
            'nombres'           => 'Vendedor',
            'user'              => 'vendedor',
            'password'          => bcrypt('vendedor123.'),
            'estado'            => 1,
            'idcaja'            => 1,
            'logo_encabezado'   => NULL
        ])->assignRole('VENDEDOR');
    }
}
