<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\DetailPublicity;
use App\Models\Product;
use App\Models\Restaurant;
use App\Models\User;
use Illuminate\Http\Request;

class InitController extends Controller
{
    public function index()
    {
        $logo_encabezado        = User::where('id', 1)->first()->logo_encabezado;
        $restaurante            =
        [
            'restaurante'           => [
                'logo_encabezado'   => $logo_encabezado
            ]
        ];
        session($restaurante);
        $data['publicities']    = DetailPublicity::inRandomOrder()->get();
        $data['categories']     = Category::inRandomOrder()->limit(3)->get();
        $data['products']       = Product::inRandomOrder()->get();
        return view('init.home', $data);
    }
}
