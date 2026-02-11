<?php

namespace App\Http\Controllers;

use App\Models\Country;
use App\Models\DetailPublicity;
use App\Models\Restaurant;
use App\Models\User;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    public function index() 
    {
        $data['restaurant']     = Restaurant::where('id', 1)->first();
        return view('admin.restaurant.home', $data);
    }

    public function load_country(Request $request)
    {
        if (!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'title'     => 'Espere',
                'type'      => 'warning'
            ]);
            return;
        }

        $countries          = Country::get();
        $restaurant         = Restaurant::where('id', 1)->first();
        echo json_encode([
            'status'        => true,
            'countries'     => $countries,
            'restaurant'    => $restaurant
        ]);
    }

    public function save_info(Request $request)
    {
        if (!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'title'     => 'Espere',
                'type'      => 'warning'
            ]);
            return;
        }

        $nombre             = trim($request->input('nombre'));
        $idpais             = $request->input('idpais');
        $direccion          = trim($request->input('direccion'));
        $entrega            = trim($request->input('entrega'));
        $telefono           = trim($request->input('telefono'));
        $logo_encabezado    = $request->file('logo_encabezado');
        $logo_principal     = $request->file('logo_principal');
        $banner             = $request->file('banner');
        $publicities        = $request->file('publicities');
        $estado             = $request->input('estado');

        if(empty($idpais)) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Debe seleccionar un país',
                'title'     => 'Espere',
                'type'      => 'warning'
            ]);
            return;
        }

        if(!empty($logo_encabezado)) {
            $name_logo_encabezado = $logo_encabezado->getClientOriginalName();
            $logo_encabezado->move(public_path('files/restaurant/logo-encabezado'), $name_logo_encabezado);
            User::where('id', 1)->update([
                'logo_encabezado'   => $name_logo_encabezado,
            ]);

            Restaurant::where('id', 1)->update([
                'nombre'            => mb_strtoupper($nombre),
                'direccion'         => mb_strtoupper($direccion),
                'entrega'           => $entrega,
                'idpais'            => $idpais,
                'telefono'          => $telefono,
                'estado'            => $estado
            ]);
        }

        if(!empty($logo_principal)) {
            $name_logo_principal = $logo_principal->getClientOriginalName();
            $logo_principal->move(public_path('files/restaurant/logo-principal'), $name_logo_principal);
            Restaurant::where('id', 1)->update([
                'nombre'            => mb_strtoupper($nombre),
                'direccion'         => mb_strtoupper($direccion),
                'entrega'           => $entrega,
                'logo_principal'    => $name_logo_principal,
                'idpais'            => $idpais,
                'telefono'          => $telefono,
                'estado'            => $estado
            ]);
        }

        if(!empty($banner)) {
            $name_banner = $banner->getClientOriginalName();
            $banner->move(public_path('files/restaurant/banner'), $name_banner);
            Restaurant::where('id', 1)->update([
                'nombre'    => mb_strtoupper($nombre),
                'direccion' => mb_strtoupper($direccion),
                'entrega'   => $entrega,
                'banner'    => $name_banner,
                'idpais'    => $idpais,
                'telefono'  => $telefono,
                'estado'    => $estado
            ]);
        }

        Restaurant::where('id', 1)->update([
            'nombre'    => mb_strtoupper($nombre),
            'direccion' => mb_strtoupper($direccion),
            'entrega'   => $entrega,
            'idpais'    => $idpais,
            'telefono'  => $telefono,
            'estado'    => $estado
        ]);

        if(!empty($publicities)) {
            $records            = DetailPublicity::get();
            if(count($records) > 0)
            {
                DetailPublicity::truncate();
            }
            foreach($publicities as $publicity) {
                $name_publicity = $publicity->getClientOriginalName();
                $publicity->move(public_path('files/restaurant/publicities'), $name_publicity);
                DetailPublicity::insert([
                    'imagen'    => $name_publicity
                ]);
            }
        }

        echo json_encode([
            'status'    => true,
            'msg'       => 'Datos actualizados correctamente',
            'type'      => 'success'
        ]);
    }
}
