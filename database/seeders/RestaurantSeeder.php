<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class RestaurantSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $restaurants =
        [
            [
                'nombre'            => 'MYTEMS RESTOBAR',
                'direccion'         => 'PASAJE SUCRE #333',
                'entrega'           => '25-30',
                'logo_principal'    => '1.jpg',
                'banner'            => 'banner.png',
                'idpais'            => 4,
                'telefono'          => '950772205',
                'estado'            => 1
            ],
        ];

        foreach($restaurants as $restaurant)
        {
            $new_restaurant = new \App\Models\Restaurant();
            foreach($restaurant as $key => $value)
            {
                $new_restaurant->{$key}  = $value;
            }

            $new_restaurant->save();
        }
    }
}
