<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Country;
use App\Models\Product;
use App\Models\Restaurant;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MenuController extends Controller
{
    public function index()
    {
        $data['restaurant']         = Restaurant::where('id', 1)->first();
        $data['categories']         = Category::get();
        $data['products']           = Product::inRandomOrder()->get();
        $data['products_list']      = Product::select('products.*', 'categories.descripcion as categoria')
                                    ->join('categories', 'products.idcategoria', 'categories.id')
                                    ->inRandomOrder()
                                    ->get();
        $data['country']            = Country::where('id', $data['restaurant']->idpais)->first();              
        return view('menu.home', $data);
    }

    public function search_category(Request $request)
    {
        if(!$request->ajax()) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'Intente de nuevo',
                'type'      => 'warning'
            ]);
            return;
        }

        $categories         = $request->input('categories');
        $html               = '';
        $restaurant         = Restaurant::where('id', 1)->first();
        $country            = Country::where('id', $restaurant->idpais)->first();   
        if(empty($categories)) {
            $products_list  = Product::select('products.*', 'categories.descripcion as categoria')
                            ->join('categories', 'products.idcategoria', 'categories.id')
                            ->inRandomOrder()
                            ->get();

                  
            foreach($products_list as $item) {
                $html .= '<div class="col-md-4 col-sm-6 mb-4 pb-2 btn-add-product-cart" data-id="'.$item["id"].'">
                        <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">';
                                $imagen     = $item["imagen"];
                                $url_image  = ($imagen == null) ? "files/products/product-null.png" : "files/products/$imagen";
                    $html .= '<div class="list-card-image" data-id="'. $item["id"] .'">
                                <a href="detail.html">
                                    <img src="'. $url_image .'" class="img-fluid item-img">
                                </a>
                            </div>
                            <div class="p-3 position-relative">
                                <div class="list-card-body">
                                    <h6 class="mb-1"><a href="detail.html" class="text-black">'. $item["descripcion"] .'</a></h6>
                                    <p class="text-gray mb-3">'. $item["categoria"] .'</p>
                                    <p class="text-gray mb-0 time">
                                        <span class="text-black-50 pt-1"> '. $country->signo . number_format($item["precio_venta"], 2, ".", "") .'</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>';
            }
        }

        else {
            $products           = [];
            foreach($categories as $category) {
                $products[]     = Product::select('products.*', 'categories.descripcion as categoria')
                                        ->join('categories', 'products.idcategoria', 'categories.id')
                                        ->where('products.idcategoria', $category)
                                        ->get();
            }

            foreach($products as $product) {
                foreach($product as $p) {
                    $html .= '<div class="col-md-4 col-sm-6 mb-4 pb-2 btn-add-product-cart" data-id="'. $p["id"] .'">
                            <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">';
                                    $imagen     = $p["imagen"];
                                    $url_image  = ($imagen == null) ? "files/products/product-null.png" : "files/products/$imagen";
                        $html .= '<div class="list-card-image" data-id="'. $p["id"] .'">
                                    <a href="">
                                        <img src="'. $url_image .'" class="img-fluid item-img">
                                    </a>
                                </div>
                                <div class="p-3 position-relative">
                                    <div class="list-card-body">
                                        <h6 class="mb-1"><a href="" class="text-black">'. $p["descripcion"] .'</a></h6>
                                        <p class="text-gray mb-3">'. $p["categoria"] .'</p>
                                        <p class="text-gray mb-0 time">
                                            <span class="text-black-50 pt-1"> '. $country->signo . number_format($p["precio_venta"], 2, ".", "") .'</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>';
                }
            }
        }

        echo json_encode([
            'status'    => true,
            'html'      => $html
        ]);
    }

    public function load_cart_order(Request $request)
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
        $logo_principal     = ($restaurant->logo_principal == null) ? asset('files/restaurant/principal-null.png') : asset('files/restaurant/logo-principal/' . $restaurant->logo_principal);
        $html               = '<div class="dropdown-cart-top-header p-4">
                                    <img class="img-fluid mr-3" alt="osahan" src="'. $logo_principal .'">
                                    <h6 class="mb-0">'. $restaurant->nombre .'</h6>
                                    <p class="text-secondary mb-0">'. $restaurant->direccion .'</p>
                                    <small><a class="text-primary font-weight-bold" href="'. route('menu') .'">Ver men&uacute; completo</a></small>
                                </div>';
        $html            .= '<div class="dropdown-cart-top-body border-top p-4">';
        if(!empty($cart["products"])) {
            foreach($cart["products"] as $product) {
                $html .= '<p class="mb-2"><i class="icofont-ui-press text-success food-item"></i> '. $product["descripcion"] .' x '. $product["cantidad"] .'<span class="float-right text-secondary">'. $country->signo . number_format(($product["precio_venta"] * $product["cantidad"]), 2, ".", "") .'</span></p>';
            }
        } 
        else {
            $html .= '<p class="mb-2 text-center">Sin productos en el carrito</p>';
        }
        $html            .= '</div>';
        $html            .= '<div class="dropdown-cart-top-footer border-top p-4">
                                <p class="mb-0 font-weight-bold text-secondary">Subtotal <span
                                        class="float-right text-dark">'. $country->signo . number_format($cart["subtotal"], 2, ".", "") .'</span></p>
                            </div>
                            <div class="dropdown-cart-top-footer border-top p-2">
                                <a class="btn btn-success btn-block btn-lg" href="'. route('checkout') .'"> Ir a Pagar</a>
                            </div>';
        $quantity       = $this->count_products_cart_order();
        echo json_encode([
            'status'    => true,
            'html'      => $html,
            'quantity'  => $quantity
        ]);
    }

    public function add_product(Request $request)
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
        $cantidad           = 1;
        $producto           = Product::where('id', $id)->first();
        if(!$this->add_product_cart_order($id, $cantidad, $producto->precio_venta)) {
            echo json_encode([
                'status'    => false,
                'msg'       => 'No se pudo agregar el producto',
                'type'      => 'warning'
            ]);
            return;
        }

        echo json_encode([
            'status'    => true,
            'msg'       => 'Producto agregado con éxito',
            'type'      => 'success'
        ]);
        return;
    }
}
