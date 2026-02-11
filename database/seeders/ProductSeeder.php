<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $products =
        [
            [
                'codigo_interno'        => '000001',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'CHEESE',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 2,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 12.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'hamburguesa-cheese-royal.png'
            ],
            [
                'codigo_interno'        => '000002',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'COCA COLA',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 4,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 4.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'coca-cola.png'
            ],
            [
                'codigo_interno'        => '000003',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'ROYAL',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 2,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 10.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'hamburguesa-royal.png'
            ],
            [
                'codigo_interno'        => '000004',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'AMERICANA',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 1,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 30.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'pizza-americana.png'
            ],
            /* [
                'codigo_interno'        => '000005',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'PIÑA',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 3,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 10.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'batido-pina.png'
            ], */
            [
                'codigo_interno'        => '000006',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'BBQ',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 5,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 20.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'alitas-bbq.png'
            ],
            [
                'codigo_interno'        => '000007',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'INCA KOLA',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 4,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 4.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'inka-cola.png'
            ],
            [
                'codigo_interno'        => '000008',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => '1/4 POLLO',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 5,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 18.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'pollo-1-4.png'
            ],
            [
                'codigo_interno'        => '000009',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'FRESA',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 3,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 10.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'batido-fresa.png'
            ],
            [
                'codigo_interno'        => '000010',
                'codigo_barras'         => NULL,
                'codigo_sunat'          => '00000000',
                'descripcion'           => 'CROCANTES',
                'marca'                 => NULL,
                'presentacion'          => NULL,
                'idcategoria'           => 5,
                'idunidad'              => 61,
                'idcodigo_igv'          => 10, // 1 o 10
                'igv'                   => 0, // 0 o 18
                'precio_compra'         => 0,
                'precio_venta'          => 20.00,
                'impuesto'              => 0, // 0 o 1
                'stock'                 => NULL,
                'fecha_vencimiento'     => NULL,
                'opcion'                => 1,
                'imagen'                => 'alitas-crocantes.png'
            ],
        ];

        foreach($products as $product)
        {
            $new_product = new \App\Models\Product();
            foreach($product as $key => $value)
            {
                $new_product->{$key}  = $value;
            }

            $new_product->save();
        }
    }
    
}
