<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class BusineSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $businesses =
        [
            [
                'ruc'               => '20610316884',
                'razon_social'      => 'PIZZERIA ADRIANA',
                'direccion'         => 'Av. Nuñez 113',
                'codigo_pais'       => 'PE',
                'ubigeo'            => '220501',
                'telefono'          => '083-000000',
                'url_api'           => '',
                'email_accounting'  => '',
                'urbanizacion'      => '',
                'local'             => '',
                'nombre_comercial'  => 'PIZZERIA ADRIANA',
                'usuario_sunat'     => '',
                'clave_sunat'       => '',
                'clave_certificado' => '',
                'certificado'       => '',
                'servidor_sunat'    => 3,
                'pago'              => 1
            ]
        ];

        foreach($businesses as $business)
        {
            $new_business = new \App\Models\Business();
            foreach($business as $k => $value)
            {
                $new_business->{$k} = $value;
            }

            $new_business->save();
        }
    }
}
