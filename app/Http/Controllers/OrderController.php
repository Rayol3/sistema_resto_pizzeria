<?php

namespace App\Http\Controllers;

use App\Events\NewOrderEvent;
use App\Models\ArchingCash;
use App\Models\Billing;
use App\Models\Business;
use App\Models\Client;
use App\Models\Country;
use App\Models\Currency;
use App\Models\DetailBilling;
use App\Models\DetailOrder;
use App\Models\DetailPayment;
use App\Models\DetailSaleNote;
use App\Models\IdentityDocumentType;
use App\Models\Order;
use App\Models\PayMode;
use App\Models\Product;
use App\Models\Restaurant;
use App\Models\SaleNote;
use App\Models\Serie;
use App\Models\TypeDocument;
use App\Models\User;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;
use Luecano\NumeroALetras\NumeroALetras;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function index()
    {
        $data['clients']            = Client::where('iddoc', 1)->orWhere('iddoc', 2)->get();
        $data['modo_pagos']         = PayMode::get();
        $data['type_documents']     = IdentityDocumentType::where('estado', 1)->get();
        return view('admin.orders.list', $data);
    }

    public function load_orders(Request $request)
    {
        if(!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $orders             = Order::orderBy('fecha', 'DESC')->orderBy('hora', 'DESC')->limit(100)->get();
        $restaurant         = Restaurant::where('id', 1)->first();
        $country            = Country::where('id', $restaurant->idpais)->first();
        $html               = '';
        if(count($orders) == 0) {
            $html .= '<li class="list-group-item p-3">
                        <div class="d-flex gap-2">
                            <div class="flex-grow-1">
                                <div class="row">
                                    <h6 class="me-3 text-center">
                                        <a href="javascript:void(0)" style="pointer-events: none;" class="text-body">Sin pedidos por ahora</a>
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </li>';
        } 
        else {
            

                    foreach($orders as $order) {
                        $pago           = ($order["idpago"] == 1) ? "PAGO EN EFECTIVO" : "PAGO CON TARJETA";
                        $estado         = '';
                        switch ($order["estado"]) {
                            case '0':
                                $estado .= '<span class="badge bg-warning fw-bold">Pendiente</span>';
                                break;
                            
                            case '1':
                                $estado .= '<span class="badge bg-secondary fw-bold">En cocina</span>';
                                break;
        
                            case '2':
                                $estado .= '<span class="badge bg-info fw-bold">Entregado</span>';
                                break;
                        }
                        $html          .= '<li class="list-group-item p-3">
                                        <div class="d-flex gap-2">
                                            <div class="flex-grow-1">
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <h6 class="me-3">
                                                            <a href="javascript:void(0)" class="text-body btn-get-resumen-order" data-id="'. $order["id"] .'">'. $order["nombres"] .'</a>
                                                        </h6>';
                                                        if($order["tipo_envio"] == 1)
                                                        {
                                                            $html          .= '<div class="mb-1 d-flex flex-wrap">
                                                                <span class="me-1"><i class="fa-solid fa-location-arrow"></i> '. $order["direccion"] .'</span> 
                                                            </div>';
                                                        }
                                                        
                                                        $html          .= '<div class="mb-1 d-flex flex-wrap">
                                                            <span class="me-1"><i class="fa-solid fa-clock"></i> '. date('d-m-Y', strtotime($order["fecha"])) . ' ' . $order["hora"] .'</span> 
                                                        </div>
                                                        <div class="mb-1 d-flex flex-wrap">
                                                            <span class="me-1"><i class="fa-solid fa-money-bill"></i> '. $pago .'</span> 
                                                        </div>
                                                        <div class="text-muted mb-1 d-flex flex-wrap">
                                                            <span class="me-1">Comentarios: '. $order["comentarios"] .'</span> 
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="text-md-end">
                                                            <div class="mb-md-5">
                                                                '. $estado .'
                                                            </div>
                                                            <button class="btn btn-sm btn-label-success mt-md-4 waves-effect btn-send-info-wpp" data-codigo="'. $country->codigo_telefono .'" data-nombres="'. $order["nombres"] .'" data-wpp="'. $order["telefono"] .'"> Contactar <i style="margin-left: 3px" class="fab fa-whatsapp"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>';
                    }
        }

        echo json_encode([
            'status'    => true,
            'html'      => $html
        ]);
    }

    public function load_resumen(Request $request)
    {
        if (!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $idorder            = $request->input('idorder');
        $restaurant         = Restaurant::where('id', 1)->first();
        $country            = Country::where('id', $restaurant->idpais)->first();
        $html_resumen       = '';
        $html_totales       = '';
        $html_actions       = '';
        if(empty($idorder)) {
            $html_resumen  .= '<dl class="row mb-0 bg-lighter p-2">
                                    <dt class="col-12 fw-normal text-center text-muted">Seleccione un pedido</dt>
                                </dl>';

            $html_totales   .= '<dl class="row mb-0">
                                    <dt class="col-6 fw-normal text-heading">Subotal</dt>
                                    <dd class="col-6 text-end">'. $country->signo .'0.00</dd>

                                    <dt class="col-6 fw-normal text-heading">IGV</dt>
                                    <dd class="col-6 text-end">'. $country->signo .'0.00</dd>
                                </dl>

                                <hr class="mx-n4">
                                <dl class="row mb-0">
                                    <dt class="col-6 text-heading">Total</dt>
                                    <dd class="col-6 fw-medium text-end text-heading mb-0">'. $country->signo .'0.00</dd>
                                </dl>';

            $html_actions   .= '<button class="btn btn-info btn-next waves-effect waves-light btn-print-command mb-2" disabled> <i class="fa-solid fa-print"></i> &nbsp; Imprimir comanda y derivar a cocina </button>
            <button class="btn btn-primary btn-next waves-effect waves-light" disabled>Despachar pedido </button>';
        }
        else {
            $order          = Order::where('id', $idorder)->first();
            $detalle        = DetailOrder::select(
                                'detail_orders.*',
                                'products.descripcion as producto',
                                'products.codigo_interno as codigo_interno',
                                'units.codigo as unidad'
                            )
                            ->join('products', 'detail_orders.idproducto', '=', 'products.id')
                            ->join('units', 'products.idunidad', '=', 'units.id')
                            ->where('detail_orders.idorden', $idorder)
                            ->get();

            foreach($detalle as $producto) {
                $html_resumen .= '<dl class="row mb-0 bg-lighter p-2">
                                    <dt class="col-6 fw-normal text-heading">x'. $producto["cantidad"] .' - '. $producto["producto"] .'</dt>
                                    <dd class="col-6 text-end">'. $country->signo . number_format($producto["precio_total"], 2, ".", "") .'</dd>
                                </dl>';
            }

            $html_totales      .= '<dl class="row mb-0">
                                    <dt class="col-6 fw-normal text-heading">Subotal</dt>
                                    <dd class="col-6 text-end">'. $country->signo . number_format(($order->exonerada + $order->gravada + $order->inafecta), 2, ".", "") .'</dd>

                                    <dt class="col-6 fw-normal text-heading">IGV</dt>
                                    <dd class="col-6 text-end">'. $country->signo . number_format($order->igv, 2, ".", "") .'</dd>
                                </dl>

                                <hr class="mx-n4">
                                <dl class="row mb-0">
                                    <dt class="col-6 text-heading">Total</dt>
                                    <dd class="col-6 fw-medium text-end text-heading mb-0">'. $country->signo . number_format($order->total, 2, ".", "") .'</dd>
                                </dl>';
            $disabled       = ($order->estado == 2) ? 'disabled' : '';
            $html_actions   .= '<button class="btn btn-info btn-next waves-effect waves-light btn-print-command mb-2" data-id="'. $order->id .'" '. $disabled .'> <i class="fa-solid fa-print"></i> &nbsp; Imprimir comanda y derivar a cocina </button>
            <button class="btn btn-primary btn-next waves-effect waves-light btn-process-pay" data-id="'. $order->id .'" '. $disabled .'>
                <span class="me-2 text-process">Despachar pedido</span>
                <span class="spinner-border spinner-border-sm me-1 d-none text-processing" role="status"
                    aria-hidden="true"></span>
                <span class="text-processing d-none">Espere...</span>
            </button>';
        }

        echo json_encode([
            'status'        => true,
            'html_resumen'  => $html_resumen,
            'html_totales'  => $html_totales,
            'html_actions'  => $html_actions
        ]);
    }

    public function save_billing(Request $request)
    {
        if (!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $idorder                = (int) $request->input('idorder');
        $order                  = Order::where('id', $idorder)->first();
        $iddocumento_tipo       = (int) $request->input('iddocumento_tipo');
        $type_document          = (int) $request->input('type_document');
        $serie_sale             = explode('-', $request->input('serie_sale'));
        $serie                  = $serie_sale[0];
        $correlativo            = $serie_sale[1];
        $fecha_emision          = date('Y-m-d');
        $fecha_vencimiento      = date('Y-m-d');
        $dni_ruc                = $request->input('dni_ruc');
        $id_arching             = ArchingCash::where('idcaja', Auth::user()['idcaja'])->where('idusuario', Auth::user()['id'])->latest('id')->first()['id'];
        $detalle                = DetailOrder::select(
                                    'detail_orders.*',
                                    'products.descripcion as producto',
                                    'products.codigo_interno as codigo_interno',
                                    'products.idcodigo_igv',
                                    'units.codigo as unidad'
                                )
                                ->join('products', 'detail_orders.idproducto', '=', 'products.id')
                                ->join('units', 'products.idunidad', '=', 'units.id')
                                ->join('igv_type_affections', 'products.idcodigo_igv', 'igv_type_affections.id')
                                ->where('detail_orders.idorden', $idorder)
                                ->get();


        if (empty($dni_ruc)) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Seleccione un cliente',
                'type'      => 'warning'
            ]);
            return;
        }

        if ($iddocumento_tipo == "7") // NV
        {
            SaleNote::insert([
                'idtipo_comprobante'    => $iddocumento_tipo,
                'serie'                 => $serie,
                'correlativo'           => $correlativo,
                'fecha_emision'         => $fecha_emision,
                'fecha_vencimiento'     => $fecha_vencimiento,
                'hora'                  => date('H:i:s'),
                'idcliente'             => $dni_ruc,
                'idmoneda'              => 1,
                'idpago'                => 1,
                'modo_pago'             => $order->idpago,
                'exonerada'             => $order->exonerada,
                'inafecta'              => $order->inafecta,
                'gravada'               => $order->gravada,
                'anticipo'              => "0.00",
                'igv'                   => $order->igv,
                'gratuita'              => "0.00",
                'otros_cargos'          => "0.00",
                'total'                 => $order->total,
                'estado'                => 1,
                'idusuario'             => Auth::user()['id'],
                'idcaja'                => $id_arching,
            ]);

            $idfactura                  = SaleNote::latest('id')->first()['id'];
            DetailPayment::insert([
                'idtipo_comprobante'    => $iddocumento_tipo,
                'idfactura'             => $idfactura,
                'idpago'                => $order->idpago,
                'monto'                 => $order->total,
                'idcaja'                => $id_arching
            ]);
            // Detail
            foreach ($detalle as $product) {
                DetailSaleNote::insert([
                    'idnotaventa'           => $idfactura,
                    'idproducto'            => $product['id'],
                    'cantidad'              => $product['cantidad'],
                    'descuento'             => 0.0000000000,
                    'igv'                   => $product["igv"],
                    'id_afectacion_igv'     => $product['idcodigo_igv'],
                    'precio_unitario'       => $product['precio_unitario'],
                    'precio_total'          => ($product['precio_unitario'] * $product['cantidad'])
                ]);

                if ($product["stock"] != NULL) {
                    Product::where('id', $product["idproducto"])->update([
                        "stock"  => $product["stock"] - $product["cantidad"]
                    ]);
                }
            }

            // Gen ticket data to pdf
            $factura                            = SaleNote::where('id', $idfactura)->first();
            $ruc                                = Business::where('id', 1)->first()->ruc;
            $codigo_comprobante                 = TypeDocument::where('id', $factura->idtipo_comprobante)->first()->codigo;
            $name                               = $ruc . '-' . $codigo_comprobante . '-' . $factura->serie . '-' . $factura->correlativo;
            $id_sale                            = $idfactura;
            $this->gen_ticket_sn($idfactura, $name);
            $ultima_serie                       = Serie::where('idtipo_documento', $iddocumento_tipo)->where('idcaja', Auth::user()['idcaja'])->first();
            $ultimo_correlativo                 = (int) $ultima_serie->correlativo + 1;
            $nuevo_correlativo                  = str_pad($ultimo_correlativo, 8, '0', STR_PAD_LEFT);
            Serie::where('idtipo_documento', $iddocumento_tipo)->where('idcaja', Auth::user()['idcaja'])->update([
                'correlativo'   => $nuevo_correlativo
            ]);
        } 

        else { // B/F
            $business                   = Business::where('id', 1)->first();
            $type_document              = TypeDocument::where('id', $iddocumento_tipo)->first();
            $client                     = Client::where('id', $dni_ruc)->first();
            $identity_document          = IdentityDocumentType::where('id', $client->iddoc)->first();
            $qr                         = $business->ruc . ' | ' . $type_document->codigo . ' | ' . $serie . ' | ' . $correlativo . ' | ' . number_format($order->igv, 2, ".", "") . ' | ' . number_format($order->total, 2, ".", "") . ' | ' . $fecha_emision . ' | ' . $identity_document->codigo . ' | ' . $client->dni_ruc;
            $name_qr                    = $serie . '-' . $correlativo;

            // Gen Qr
            QrCode::format('png')
                ->size(140)
                ->generate($qr, 'files/billings/qr/' . $name_qr . '.png');

            Billing::insert([
                'idtipo_comprobante'    => $iddocumento_tipo,
                'serie'                 => $serie,
                'correlativo'           => $correlativo,
                'fecha_emision'         => $fecha_emision,
                'fecha_vencimiento'     => $fecha_vencimiento,
                'hora'                  => date('H:i:s'),
                'idcliente'             => $dni_ruc,
                'idmoneda'              => 1,
                'idpago'                => 1,
                'modo_pago'             => $order->idpago,
                'exonerada'             => $order->exonerada,
                'inafecta'              => $order->inafecta,
                'gravada'               => $order->gravada,
                'anticipo'              => "0.00",
                'igv'                   => $order->igv,
                'gratuita'              => "0.00",
                'otros_cargos'          => "0.00",
                'total'                 => $order->total,
                'cdr'                   => 0,
                'anulado'               => 0,
                'id_tipo_nota_credito'  => null,
                'estado_cpe'            => 0,
                'errores'               => null,
                'nticket'               => null,
                'idusuario'             => Auth::user()['id'],
                'idcaja'                => $id_arching,
                'vuelto'                => NULL,
                'qr'                    => $name_qr . '.png'
            ]);

            $idfactura                  = Billing::latest('id')->first()['id'];
            DetailPayment::insert([
                'idtipo_comprobante'    => $iddocumento_tipo,
                'idfactura'             => $idfactura,
                'idpago'                => $order->idpago,
                'monto'                 => $order->total,
                'idcaja'                => $id_arching
            ]);

            foreach ($detalle as $product) {
                DetailBilling::insert([
                    'idfacturacion'         => $idfactura,
                    'idproducto'            => $product['id'],
                    'cantidad'              => $product['cantidad'],
                    'descuento'             => 0.0000000000,
                    'igv'                   => $product["igv"],
                    'id_afectacion_igv'     => $product['idcodigo_igv'],
                    'precio_unitario'       => $product['precio_unitario'],
                    'precio_total'          => ($product['precio_unitario'] * $product['cantidad'])
                ]);

                if ($product["stock"] != NULL) {
                    Product::where('id', $product["id"])->update([
                        "stock"  => $product["stock"] - $product["cantidad"]
                    ]);
                }
            }

            $factura                        = Billing::where('id', $idfactura)->first();
            $ruc                            = Business::where('id', 1)->first()->ruc;
            $codigo_comprobante             = TypeDocument::where('id', $factura->idtipo_comprobante)->first()->codigo;
            $name                           = $ruc . '-' . $codigo_comprobante . '-' . $factura->serie . '-' . $factura->correlativo;
            $id_sale                        = $idfactura;
            $this->gen_ticket_b($idfactura, $name);
            $ultima_serie                       = Serie::where('idtipo_documento', $iddocumento_tipo)->where('idcaja', Auth::user()['idcaja'])->first();
            $ultimo_correlativo                 = (int) $ultima_serie->correlativo + 1;
            $nuevo_correlativo                  = str_pad($ultimo_correlativo, 8, '0', STR_PAD_LEFT);
            Serie::where('idtipo_documento', $iddocumento_tipo)->where('idcaja', Auth::user()['idcaja'])->update([
                'correlativo'   => $nuevo_correlativo
            ]);
        }

        // Update
        Order::where('id', $idorder)->update([
            'estado'    => 2
        ]);

        echo json_encode([
            'status'        => true,
            'id'            => $id_sale,
            'pdf'           => $name . '.pdf',
            'type_document' => $iddocumento_tipo
        ]);
    }

    public function gen_ticket_b($id, $name)
    {
        $customPaper                = array(0, 0, 630.00, 210.00);
        $data['business']           = Business::where('id', 1)->first();
        $data['ubigeo']             = $this->get_ubigeo($data['business']->ubigeo);
        $ruc                        = $data['business']->ruc;
        $factura                    = Billing::where('id', $id)->first();
        $codigo_comprobante         = TypeDocument::where('id', $factura->idtipo_comprobante)->first()->codigo;
        $data["name"]               = $ruc . '-' . $codigo_comprobante . '-' . $factura->serie . '-' . $factura->correlativo;

        $data['factura']            = Billing::where('id', $id)->first();
        $data['cliente']            = Client::where('id', $factura->idcliente)->first();
        $data['tipo_documento']     = IdentityDocumentType::where('id', $data['cliente']->iddoc)->first();
        $data['moneda']             = Currency::where('id', $factura->idmoneda)->first();
        $data['modo_pago']          = PayMode::where('id', $factura->modo_pago)->first();
        $data['detalle']            = DetailBilling::select(
            'detail_billings.*',
            'products.descripcion as producto',
            'products.codigo_interno as codigo_interno'
        )
            ->join('products', 'detail_billings.idproducto', '=', 'products.id')
            ->where('idfacturacion', $factura->id)
            ->get();

        $formatter                  = new NumeroALetras();
        $data['numero_letras']      = $formatter->toWords($factura->total, 2);
        $data['tipo_comprobante']   = TypeDocument::where('id', $factura->idtipo_comprobante)->first();
        $data['vendedor']           = mb_strtoupper(User::where('id', $data['factura']->idusuario)->first()->user);
        $data['payment_modes']      = DetailPayment::select('detail_payments.*', 'pay_modes.descripcion as modo_pago')
            ->join('pay_modes', 'detail_payments.idpago', 'pay_modes.id')
            ->where('idfactura', $factura->id)
            ->where('idtipo_comprobante', $factura->idtipo_comprobante)
            ->get();
        $data['count_payment']      = count($data['payment_modes']);
        $pdf                        = PDF::loadView('admin.billings.ticket_b', $data)->setPaper($customPaper, 'landscape');
        return $pdf->save(public_path('files/billings/ticket/' . $name . '.pdf'));
    }

    public function gen_ticket_sn($id, $name)
    {
        $customPaper                = array(0, 0, 630.00, 210.00);
        $data['business']           = Business::where('id', 1)->first();
        $data['ubigeo']             = $this->get_ubigeo($data['business']->ubigeo);
        $ruc                        = $data['business']->ruc;
        $factura                    = SaleNote::where('id', $id)->first();
        $codigo_comprobante         = TypeDocument::where('id', $factura->idtipo_comprobante)->first()->codigo;
        $data["name"]               = $ruc . '-' . $codigo_comprobante . '-' . $factura->serie . '-' . $factura->correlativo;

        $data['factura']            = SaleNote::where('id', $id)->first();
        $data['cliente']            = Client::where('id', $factura->idcliente)->first();
        $data['tipo_documento']     = IdentityDocumentType::where('id', $data['cliente']->iddoc)->first();
        $data['moneda']             = Currency::where('id', $factura->idmoneda)->first();
        $data['modo_pago']          = PayMode::where('id', $factura->modo_pago)->first();
        $data['detalle']            = DetailSaleNote::select(
            'detail_sale_notes.*',
            'products.descripcion as producto',
            'products.codigo_interno as codigo_interno'
        )
            ->join('products', 'detail_sale_notes.idproducto', '=', 'products.id')
            ->where('idnotaventa', $factura->id)
            ->get();

        $formatter                  = new NumeroALetras();
        $data['numero_letras']      = $formatter->toWords($factura->total, 2);
        $data['tipo_comprobante']   = TypeDocument::where('id', $factura->idtipo_comprobante)->first();
        $data['vendedor']           = mb_strtoupper(User::where('id', $data['factura']->idusuario)->first()->user);
        $data['payment_modes']      = DetailPayment::select('detail_payments.*', 'pay_modes.descripcion as modo_pago')
            ->join('pay_modes', 'detail_payments.idpago', 'pay_modes.id')
            ->where('idfactura', $factura->id)
            ->where('idtipo_comprobante', $factura->idtipo_comprobante)
            ->get();
        $data['count_payment']      = count($data['payment_modes']);
        $pdf                        = PDF::loadView('admin.billings.ticket_sn', $data)->setPaper($customPaper, 'landscape');
        return $pdf->save(public_path('files/sale-notes/ticket/' . $name . '.pdf'));
    }

    public function gen_command(Request $request)
    {
        if (!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $idorder            = (int) $request->input('id');
        $name               = str_pad($idorder, 8, '0', STR_PAD_LEFT);
        $customPaper        = array(0, 0, 450.00, 210.00);
        $data['business']   = Business::where('id', 1)->first();
        $data['ubigeo']     = $this->get_ubigeo($data['business']->ubigeo);
        $idusuario          = Auth::user()['id'];
        $data['mesero']     = User::where('id', $idusuario)->first();
        $data['order']      = Order::where('id', $idorder)->first();
        $data['detalle']    = DetailOrder::select(
                                'detail_orders.*',
                                'products.descripcion as producto',
                                'products.codigo_interno as codigo_interno',
                                'units.codigo as unidad'
                            )
                            ->join('products', 'detail_orders.idproducto', '=', 'products.id')
                            ->join('units', 'products.idunidad', '=', 'units.id')
                            ->where('idorden', $idorder)
                            ->get();

        $pdf                = PDF::loadView('admin.orders.comanda', $data)->setPaper($customPaper, 'landscape');
        $pdf->save(public_path('files/orders/commands/' . $name . '.pdf'));

        Order::where('id', $idorder)->update([
            'estado'    => 1
        ]);
        echo json_encode([
            'status'        => true,
            'comanda'       => $name . '.pdf',
        ]);
    }

    public function get_order(Request $request)
    {
        if (!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $id                 = (int) $request->input('id');
        $order              = Order::where('id', $id)->first();
        echo json_encode([
            'status'        => true,
            'order'         => $order
        ]);
    }

    public function search_client(Request $request)
    {
        if (!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }
        $value              = trim($request->input('value'));
        $orders             = Order::where('nombres', 'like', "%$value%")
                            ->orWhere('telefono', 'like', "%$value%")
                            ->get();

        $restaurant         = Restaurant::where('id', 1)->first();
        $country            = Country::where('id', $restaurant->idpais)->first();
        $html               = '';
        if (count($orders) < 1) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'No se encontraron coincidencias',
                'type'      => 'warning'
            ]);
            return;
        }

        foreach($orders as $order) {
            $pago           = ($order["idpago"] == 1) ? "PAGO EN EFECTIVO" : "PAGO CON TARJETA";
            $estado         = '';
            switch ($order["estado"]) {
                case '0':
                    $estado .= '<span class="badge bg-warning fw-bold">Pendiente</span>';
                    break;
                
                case '1':
                    $estado .= '<span class="badge bg-secondary fw-bold">En cocina</span>';
                    break;

                case '2':
                    $estado .= '<span class="badge bg-info fw-bold">Entregado</span>';
                    break;
            }
            $html          .= '<li class="list-group-item p-3">
                            <div class="d-flex gap-2">
                                <div class="flex-grow-1">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <h6 class="me-3">
                                                <a href="javascript:void(0)" class="text-body btn-get-resumen-order" data-id="'. $order["id"] .'">'. $order["nombres"] .'</a>
                                            </h6>';
                                            if($order["tipo_envio"] == 1)
                                            {
                                                $html          .= '<div class="mb-1 d-flex flex-wrap">
                                                    <span class="me-1"><i class="fa-solid fa-location-arrow"></i> '. $order["direccion"] .'</span> 
                                                </div>';
                                            }
                                            
                                            $html          .= '<div class="mb-1 d-flex flex-wrap">
                                                <span class="me-1"><i class="fa-solid fa-clock"></i> '. date('d-m-Y', strtotime($order["fecha"])) . ' ' . $order["hora"] .'</span> 
                                            </div>
                                            <div class="mb-1 d-flex flex-wrap">
                                                <span class="me-1"><i class="fa-solid fa-money-bill"></i> '. $pago .'</span> 
                                            </div>
                                            <div class="text-muted mb-1 d-flex flex-wrap">
                                                <span class="me-1">Comentarios: '. $order["comentarios"] .'</span> 
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="text-md-end">
                                                <div class="mb-md-5">
                                                    '. $estado .'
                                                </div>
                                                <button class="btn btn-sm btn-label-success mt-md-4 waves-effect btn-send-info-wpp" data-codigo="'. $country->codigo_telefono .'" data-nombres="'. $order["nombres"] .'" data-wpp="'. $order["telefono"] .'"> Contactar <i style="margin-left: 3px" class="fab fa-whatsapp"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>';
        }

        echo json_encode([
            'status'    => true,
            'html'      => $html
        ]);
    }
}
