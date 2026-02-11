<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $categories =
        [
            [
                'descripcion'         => 'PIZZAS'
            ],
            [
                'descripcion'         => 'HAMBURGUESAS'
            ],
            [
                'descripcion'         => 'BATIDOS'
            ],
            [
                'descripcion'         => 'BEBIDAS'
            ],
            [
                'descripcion'         => 'POLLOS'
            ],
        ];

        foreach($categories as $category)
        {
            $new_category     = new \App\Models\Category();
            foreach($category as $k => $value)
            {
                $new_category->{$k} = $value;
            }

            $new_category->save();
        }
    }
}
