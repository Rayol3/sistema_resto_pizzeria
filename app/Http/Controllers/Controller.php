<?php

namespace App\Http\Controllers;

use App\Models\Department;
use App\Models\District;
use App\Models\Product;
use App\Models\Province;
use App\Models\Restaurant;
use Exception;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Http;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;
    public function verify__client($dni_ruc)
    {
        $token  = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMzMiLCJuYW1lIjoiS3Jvd2VkIiwiZW1haWwiOiJrcm93ZWQxN0BnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJjb25zdWx0b3IifQ.JIt5DAz_kQApUGphoh2Z_sggXVZBCPgxRkk_yNFSDOg';
        $data   = null;
        
        if(strlen($dni_ruc) == 8)
        {
            $curl = curl_init();
            curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.factiliza.com/pe/v1/dni/info/' . $dni_ruc,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $token
                ),
            ));

            $response   = curl_exec($curl);
            $data       = json_decode($response);
            curl_close($curl);
        }
        else
        {
            $curl = curl_init();
            curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.factiliza.com/pe/v1/ruc/info/' . $dni_ruc,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'GET',
            CURLOPT_HTTPHEADER => array(
                'Authorization: Bearer ' . $token
                ),
            ));

            $response   = curl_exec($curl);
            $data       = json_decode($response);
            curl_close($curl);
        }

        return $data;
    }
    
    public function get_ubigeo($ubigeo)
    {       
        $data                   = [];
        $distrito               = District::where('codigo', $ubigeo)->first();
        $data['distrito']       = $distrito->descripcion;
        $provincia              = Province::where('codigo', $distrito->provincia_codigo)
                                    ->where('departamento_codigo', $distrito->departamento_codigo)
                                    ->first();
        $data['provincia']      = $provincia->descripcion;
        $departamento           = Department::where('codigo', $distrito->departamento_codigo)->first();
        $data['departamento']   = $departamento->descripcion;
        return $data;
    }

    public function redondeado($numero, $decimales = 2) 
    {
        $factor = pow(10, $decimales);
        return (round($numero*$factor)/$factor); 
    }

    
    public function send_msg_wpp($telefono, $header, $mensaje)
    {
        $curl           = curl_init();
        $token          =  'EAAUkSy7HuzEBO7SyCvzH7SmVsTpXk7aCRtqQWzI9trcdMZAxMfhqu582zUYDYInIb4Y0q30KVR5OlPhqAmu3uuchFtof0or0TTMncrBZCSQ9a8huQGKS1rZAdIVGVFie7HZAYtxh0DlVQcO07V1C8QYteS8zQVEamoDv49jWZBSHS4jYUdCV304OgPmSOh8so';

        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://graph.facebook.com/v18.0/162704683603332/messages',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS =>'{
            "messaging_product": "whatsapp",
            "to": "'. $telefono .'",
            "type": "template",
            "template": {
                "name": "send_voucher",
                "language": {
                    "code": "es"
                },
                "components": [
                    {
                        "type": "header",
                        "parameters": [
                          {
                            "type": "text",
                            "text": "'. $header .'"
                          },
                        ]
                    },
                    {
                      "type": "body",
                      "parameters": [
                        {
                          "type": "text",
                          "text": "'. $mensaje .'"
                        },
                      ]
                    }
                ]
            }
        }',
        CURLOPT_HTTPHEADER => array(
            'Content-Type: application/json',
            'Authorization: Bearer ' . $token
        ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        return $response;
    }


    ## Functions to cart
    public function create_cart_order()
    {
        if (!session()->get('order') || empty(session()->get('order')['products'])) {
            $order =
                [
                    'order' =>
                    [
                        'products'     => [],
                        'igv'          => 0,
                        'exonerada'    => 0,
                        'gravada'      => 0,
                        'inafecta'     => 0,
                        'subtotal'     => 0,
                        'total'        => 0
                    ]
                ];

            session($order);
            return session()->get('order');
        }

        $exonerada  = 0;
        $gravada    = 0;
        $inafecta   = 0;
        $subtotal   = 0;
        $total      = 0;
        $igv        = 0;

        foreach (session('order')['products'] as $index => $product) {
            if ($product['impuesto'] == 1) {
                $igv        +=  number_format((((float) $product['precio_venta'] - (float) $product['precio_venta'] / 1.18) * (int) $product['cantidad']), 2, ".", "");
                $igv        = $this->redondeado($igv);
            }

            if ($product["codigo_igv"] == "10") {
                $gravada    += number_format((((float) $product['precio_venta'] / 1.18) * (int) $product['cantidad']), 2, ".", "");
                $gravada     = $this->redondeado($gravada);
            }

            if ($product["codigo_igv"] == "20") {
                $exonerada   += number_format(((float) $product['precio_venta'] * (int) $product['cantidad']), 2, ".", "");
                $exonerada   = $this->redondeado($exonerada);
            }

            if ($product["codigo_igv"] == "30") {
                $inafecta    += number_format(((float) $product['precio_venta'] * (int) $product['cantidad']), 2, ".", "");
                $inafecta     = str_replace(',', '', $inafecta);
                $inafecta     = $this->redondeado($inafecta);
            }

            $subtotal      = $exonerada + $gravada + $inafecta;
            session()->put('order.products.' . $index, $product);
        }

        $total      = $subtotal + $igv;

        $order =
            [
                'order' =>
                [
                    'products'     => session('order')['products'],
                    'igv'          => $igv,
                    'exonerada'    => $exonerada,
                    'gravada'      => $gravada,
                    'inafecta'     => $inafecta,
                    'subtotal'     => $subtotal,
                    'total'        => $total,
                ]
            ];

        session($order);
        return session()->get('order');
    }

    public function add_product_cart_order($id, $cantidad, $precio)
    {
        $product        = Product::select(
            'products.*',
            'units.codigo as unidad',
            'igv_type_affections.descripcion as tipo_afecto',
            'igv_type_affections.codigo as codigo_igv'
        )
            ->join('units', 'products.idunidad', '=', 'units.id')
            ->join('igv_type_affections', 'products.idcodigo_igv', 'igv_type_affections.id')
            ->where('products.id', $id)
            ->first();

        // Validar estado restaurant
        $restaurant      = Restaurant::where('id', 1)->first();
        if($restaurant->estado != 1)
            return false;

        if(!$product)
            return false;

        if($product->stock != NULL)
        {
            if ($product->stock < $cantidad)
            {
                return false;
            }
            elseif($product->stock == 0)
            {
                return false;
            }
        }

        $new_product    =
        [
            'id'                => $product->id,
            'codigo_sunat'      => $product->codigo_sunat,
            'descripcion'       => $product->descripcion,
            'idunidad'          => $product->idunidad,
            'unidad'            => $product->unidad,
            'idcodigo_igv'      => $product->idcodigo_igv,
            'codigo_igv'        => $product->codigo_igv,
            'igv'               => $product->igv,
            'precio_compra'     => $product->precio_compra,
            'precio_venta'      => $precio,
            'impuesto'          => $product->impuesto,
            'stock'             => $product->stock,
            'cantidad'          => $cantidad
        ];

        if (empty(session()->get('order')['products'])) {
            session()->push('order.products', $new_product);
            return true;
        }

        foreach (session()->get('order')['products'] as $index => $product) {
            if ($id == $product['id']) {
                if ($product["stock"] != NULL) {
                    if ($product["stock"] < ($product['cantidad'] + $cantidad)) {
                        return false;
                    }
                }
                $product['cantidad'] = $product['cantidad'] + $cantidad;
                session()->put('order.products.' . $index, $product);
                return true;
            }
        }

        session()->push('order.products', $new_product);
        return true;
    }

    public function delete_product_cart_order($id)
    {
        if (!session()->get('order') || empty(session()->get('order')['products'])) {
            return false;
        }

        foreach (session()->get('order')['products'] as $index => $product) {
            if ($id == $product['id']) {
                session()->forget('order.products.' . $index, $product);
                return true;
            }
        }
    }

    public function count_products_cart_order()
    {
        $quantity       = 0;
        if (!session()->get('order') || empty(session()->get('order')['products'])) {
            $quantity   = 0;
            return $quantity;
        }

        foreach (session()->get('order')['products'] as $index => $product) {
            $quantity   = $quantity + $product["cantidad"];
        }
        return $quantity;
    }

    public function update_quantity_order($id, $cantidad, $precio)
    {
        if (empty(session()->get('order')['products'])) {
            return false;
        }

        foreach (session()->get('order')['products'] as $index => $product) {
            if ($id == $product['id']) {
                if ($product["stock"] != NULL) {
                    if ($product["stock"] < $cantidad) {
                        return false;
                    } elseif ($product["stock"] == 0) {
                        return false;
                    }
                }
                $product['cantidad']           =  $cantidad;
                $product['precio_venta']       =  $precio;
                session()->put('order.products.' . $index, $product);
                return true;
            }
        }
    }

    public function destroy_cart_order()
    {
        if (!session()->get('order') || empty(session()->get('order')['products'])) {
            return false;
        }

        session()->forget('order');
        return true;
    }
}
