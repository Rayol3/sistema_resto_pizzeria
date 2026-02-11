<?php

namespace App\Http\Controllers;

use App\Events\NewOrderEvent;
use App\Models\Country;
use App\Models\DetailOrder;
use App\Models\Order;
use App\Models\Product;
use App\Models\Restaurant;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    public function index()
    {
        $data['restaurant']     = Restaurant::where('id', 1)->first();
        $data['country']        = Country::where('id', $data['restaurant']->idpais)->first();  
        return view('checkout.home', $data);
    }

    public function load_cart_checkout(Request $request)
    {
        if(!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $cart               = $this->create_cart_order();
        $restaurant         = Restaurant::where('id', 1)->first();
        $country            = Country::where('id', $restaurant->idpais)->first();  
        $html               = '';
        $html_subtotal      = '';

        if(!empty($cart["products"])) {
            foreach($cart["products"] as $product) {
                $html .= '<div class="gold-members p-2 border-bottom">
                                <p class="mb-0 float-right ml-2 text-danger font-weight-bold btn-delete-item" style="cursor: pointer;" data-id="'. $product["id"] .'">x</p>
                                <p class="text-gray mb-0 float-right ml-2">'. $country->signo . number_format(($product["precio_venta"] * $product["cantidad"]), 2, ".", "") .'</p>
                                <span class="count-number float-right">
                                    <button class="btn btn-outline-secondary  btn-sm left dec btn-down" data-id="'. $product["id"] .'" data-cantidad="'. $product["cantidad"] .'" data-precio="'. $product["precio_venta"] .'"> <i
                                            class="icofont-minus"></i> </button>
                                    <input class="count-number-input" type="text" value="'. $product["cantidad"] .'" readonly="">
                                    <button class="btn btn-outline-secondary btn-sm right inc btn-up" data-id="'. $product["id"] .'" data-cantidad="'. $product["cantidad"] .'" data-precio="'. $product["precio_venta"] .'"> <i
                                            class="icofont-plus"></i> </button>
                                </span>
                                <div class="media">
                                    <div class="mr-2"><i class="icofont-ui-press text-success food-item"></i></div>
                                    <div class="media-body">
                                        <p class="mt-1 mb-0 text-black">'. $product["descripcion"] .'</p>
                                    </div>
                                </div>
                            </div>';
            }
        } 
        else {
            $html .= '<div class="gold-members p-2 border-bottom">
                                <div class="media">
                                    <div class="mr-2"></div>
                                    <div class="media-body">
                                        <p class="mt-1 mb-0 text-muted text-center">Sin productos en el carrito</p>
                                    </div>
                                </div>
                </div>';
        }

        $html_subtotal          .= '<div class="mb-2 bg-white rounded p-2 clearfix">
                                        <p class="mb-1">Subtotal <span class="float-right text-dark">'. $country->signo . number_format($cart["subtotal"], 2, ".", "") .'</span></p>
                                        <p class="mb-1">IGV <span class="float-right text-dark">'. $country->signo . number_format($cart["igv"], 2, ".", "") .'</span></p>
                                        <hr>
                                        <h6 class="font-weight-bold mb-0">PAGAR <span class="float-right">'. $country->signo . number_format($cart["total"], 2, ".", "") .'</span></h6>
                                    </div>
                                    <button class="btn btn-success btn-block btn-lg btn-confirm-order"><span class="span-confirm">CONFIRMAR PEDIDO</span> <span class="span-process d-none">PROCESANDO...</span> </button>';

        echo json_encode([
            'status'            => true,
            'html_cart'         => $html,
            'html_subtotal'     => $html_subtotal
        ]);
    }

    public function store_product(Request $request)
    {
        if(!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $id             = (int) $request->input('id');
        $cantidad       = (int) $request->input('cantidad');
        $precio         = number_format($request->input('precio'), 2, ".", "");

        if(!$this->update_quantity_order($id, $cantidad, $precio)) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'No se pudo actualizar la cantidad',
                'type'      => 'warning'
            ]);
            return;
        }

        echo json_encode([
            'status'    => true,
            'msg'       => 'Cantidad actualizada con éxito',
            'type'      => 'success'
        ]);
        return;
    }

    public function delete_item(Request $request)
    {
        if(!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $id                 = (int) $request->input('id');
        if(!$this->delete_product_cart_order($id)) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'No se pudo eliminar el producto',
                'type'      => 'warning'
            ]);
            return;
        }

        echo json_encode([
            'status'    => true,
            'msg'       => 'Producto eliminado con éxito',
            'type'      => 'success'
        ]);
        return;
    }

    public function confirm_order(Request $request)
    {
        if(!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }
      
        $sendtype           = (int) $request->input('sendtype');
        if($sendtype == 1) {
            $nombre                 = trim($request->input('nombre_delivery'));
            $apellidos              = trim($request->input('apellidos_delivery'));
            $direccion              = trim($request->input('direccion_delivery'));
            $telefono               = trim($request->input('telefono_delivery'));
            $idpago                 = $request->input('tipo_pago_delivery');
            $comentarios            = trim($request->input('comentarios_delivery'));

            if(empty($nombre)) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Debe completar todos los campos',
                    'type'      => 'warning'
                ]);
                return; 
            }

            if(empty($apellidos)) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Debe completar todos los campos',
                    'type'      => 'warning'
                ]);
                return; 
            }

            if(empty($direccion)) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Debe completar todos los campos',
                    'type'      => 'warning'
                ]);
                return; 
            }

            if(empty($telefono)) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Debe completar todos los campos',
                    'type'      => 'warning'
                ]);
                return; 
            }

            if(!is_numeric($telefono)) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Ingrese un número telefónico válido',
                    'type'      => 'warning'
                ]);
                return;
            }

            if(strlen($telefono) != 9) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Ingrese un número telefónico válido',
                    'type'      => 'warning'
                ]);
                return;
            }
        }
        else {
            $nombre                 = trim($request->input('nombre'));
            $apellidos              = trim($request->input('apellidos'));
            $telefono               = trim($request->input('telefono'));
            $idpago                 = trim($request->input('tipo_pago'));
            $comentarios            = trim($request->input('comentarios'));

            if(empty($nombre)) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Debe completar todos los campos',
                    'type'      => 'warning'
                ]);
                return; 
            }

            if(empty($apellidos)) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Debe completar todos los campos',
                    'type'      => 'warning'
                ]);
                return; 
            }

            if(!is_numeric($telefono)) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Ingrese un número telefónico válido',
                    'type'      => 'warning'
                ]);
                return;
            }

            if(strlen($telefono) != 9) {
                echo json_encode([
                    'status'    => false,
                    'msg'       => 'Ingrese un número telefónico válido',
                    'type'      => 'warning'
                ]);
                return;
            }
        }

        $cart                       = $this->create_cart_order();
        if(empty($cart["products"])) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Ingrese al menos 1 producto',
                'type'      => 'warning'
            ]);
            return;
        }

        Order::insert([
            'tipo_envio'        => $sendtype,
            'fecha'             => date('Y-m-d'),
            'hora'              => date('H:i:s'),
            'exonerada'         => $cart["exonerada"],
            'inafecta'          => $cart["inafecta"],
            'gravada'           => $cart["gravada"],
            'anticipo'          => "0.00",
            'igv'               => $cart["igv"],
            'gratuita'          => "0.00",
            'otros_cargos'      => "0.00",
            'total'             => $cart["total"],
            'estado'            => 0,
            'nombres'           => mb_strtoupper($nombre) . ' ' . mb_strtoupper($apellidos),
            'direccion'         => mb_strtoupper($direccion),
            'telefono'          => $telefono,
            'idpago'            => $idpago,
            'comentarios'       => mb_strtoupper($comentarios),
        ]);

        $idorden                = Order::latest('id')->first()['id'];
        foreach ($cart['products'] as $product) {
            DetailOrder::insert([
                'idorden'           => $idorden,
                'idproducto'        => $product["id"],
                'cantidad'          => $product["cantidad"],
                'descuento'         => 0.0000000000,
                'igv'               => $product["igv"],
                'id_afectacion_igv' => $product["idcodigo_igv"],
                'precio_unitario'   => $product["precio_venta"],
                'precio_total'      => ($product["precio_venta"] * $product["cantidad"])
            ]);
        }

        $restaurant                 = Restaurant::where('id', 1)->first();
        $country                    = Country::where('id', $restaurant->idpais)->first();
        $tipo_servicio              = ($sendtype == 1) ? 'A domicilio' : 'Recojo en local';
        $metodo_pago                = ($idpago == 1) ? 'Efectivo' : 'Pago con tarjeta';
        $wpp_msg                    = '¡Hola! Vengo de ' . $restaurant->nombre . "\n";
        $wpp_msg                   .= date('d/m/Y') . "\n";
        $wpp_msg                   .= date('H:i:s a') . "\n \n";
        $wpp_msg                   .= 'Tipo de servicio: ' . $tipo_servicio . "\n \n";
        $wpp_msg                   .= 'Nombre: ' . mb_strtoupper($nombre) . ' ' . mb_strtoupper($apellidos) . "\n";
        $wpp_msg                   .= 'Telefono: ' . $telefono . "\n";
        if($tipo_servicio == 1)
            $wpp_msg               .= 'Direccion: ' . mb_strtoupper($direccion) . "\n";
        $wpp_msg                   .= 'Metodo de pago solicitado: ' . $metodo_pago . "\n \n";
        $wpp_msg                   .= 'Detalle del pedido: ' . "\n";
        foreach($cart["products"] as $product) {
            $wpp_msg               .= 'x' . $product["cantidad"] . ' - ' . $product["descripcion"] . ' ' . $country->signo . number_format(($product["precio_venta"] * $product["cantidad"]), 2, ".", "") . "\n";
        }

        $wpp_msg                   .= "\n \n";
        $wpp_msg                   .= 'Envia este mensaje, te atenderemos en seguida.';
        $nro_wpp                    = $restaurant->telefono;
        $this->destroy_cart_order();

        event(new NewOrderEvent('Se registró un nuevo pedido'));
        echo json_encode([
            'status'               => true,
            'wpp_msg'              => $wpp_msg,
            'country'              => $country,
            'nro_wpp'              => $nro_wpp
        ]);
    }
}
