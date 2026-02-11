@extends('template_init')
@section('content')
    <section class="restaurant-detailed-banner">
        <div class="text-center">
            @if ($restaurant->banner == NULL)
                <img class="img-fluid cover" src="{{ asset('files/restaurant/banner-null.png') }}">
            @else
                <img class="img-fluid cover" src="{{ asset('files/restaurant/banner/' . $restaurant->banner) }}">
            @endif
        </div>
        <div class="restaurant-detailed-header">
            <div class="container">
                <div class="row d-flex align-items-end">
                    <div class="col-md-8">
                        <div class="restaurant-detailed-header-left">
                            @if ($restaurant->logo_principal == NULL)
                            <img class="img-fluid mr-3 float-left" alt="osahan" src="{{ asset('files/restaurant/principal-null.png') }}">
                            @else
                            <img class="img-fluid mr-3 float-left" alt="osahan" src="{{ asset('files/restaurant/logo-principal/' . $restaurant->logo_principal) }}">
                            @endif
                            <h2 class="text-white">{{ $restaurant->nombre }}</h2>
                            <p class="text-white mb-1"><i class="icofont-location-pin"></i> {{ $restaurant->direccion }}
                                @if ($restaurant->estado == 1)
                                <span class="badge badge-success">ABIERTO</span>
                                @else
                                <span class="badge badge-danger">CERRADO</span>
                                @endif
                            </p>
                            <p class="text-white mb-0"><i class="icofont-food-cart"></i> Pizzería Adriana
                            </p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="restaurant-detailed-header-right text-right">
                            <button class="btn btn-success" type="button"><i class="icofont-clock-time"></i> {{ $restaurant->entrega }}
                                min
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section pt-5 pb-5 products-listing">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="filters shadow-sm rounded bg-white mb-4">
                        <div class="filters-header border-bottom pl-4 pr-4 pt-3 pb-3">
                            <h5 class="m-0">Filtrar por:</h5>
                        </div>
                        <div class="filters-body">
                            <div id="accordion">
                                <div class="filters-card border-bottom p-4">
                                    <div class="filters-card-header" id="headingTwo">
                                        <h6 class="mb-0">
                                            <a href="#" class="btn-link" data-toggle="collapse"
                                                data-target="#collapsetwo" aria-expanded="true"
                                                aria-controls="collapsetwo">
                                                Categor&iacute;as
                                            </a>
                                        </h6>
                                    </div>
                                    <div id="collapsetwo" class="collapse show" aria-labelledby="headingTwo"
                                        data-parent="#accordion">
                                        <div class="filters-card-body card-shop-filters">
                                            {{-- <form class="filters-search mb-3">
                                                <div class="form-group">
                                                    <i class="icofont-search"></i>
                                                    <input type="text" class="form-control"
                                                        placeholder="Escribe para buscar...">
                                                </div>
                                            </form> --}}

                                            <form id="form-check-category" method="POST">
                                                @csrf
                                                @foreach ($categories as $item)
                                                <div class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input check-category" id="category-{{ $item["id"] }}" name="categories[]" value="{{ $item["id"] }}">
                                                    <label class="custom-control-label" for="category-{{ $item["id"] }}">{{ $item["descripcion"] }} </label>
                                                </div>
                                                @endforeach
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="owl-carousel owl-carousel-category owl-theme list-cate-page mb-4">
                        @foreach ($products as $item)
                            @php
                                $imagen     = $item["imagen"];
                                $url_image  = ($imagen == null) ? "files/products/product-null.png" : "files/products/$imagen";
                            @endphp
                            <div class="item btn-add-product-cart-sm" data-id="{{ $item["id"] }}">
                                <div class="osahan-category-item">
                                    <a href="#">
                                        <img class="img-fluid" src="{{ $url_image }}" alt="">
                                        <h6>{{ $item["descripcion"] }}</h6>
                                        <p>{{ number_format($item["precio_venta"], 2, ".", "") }}</p>
                                    </a>
                                </div>
                            </div>
                        @endforeach
                    </div>

                    <div id="wrapper-list-products" class="row wrapper-wait">
                        @foreach ($products_list as $item)
                        <div class="col-md-4 col-sm-6 mb-4 pb-2 btn-add-product-cart" data-id="{{ $item["id"] }}">
                            <div class="list-card bg-white h-100 rounded overflow-hidden position-relative shadow-sm">
                                @php
                                    $imagen     = $item["imagen"];
                                    $url_image  = ($imagen == null) ? "files/products/product-null.png" : "files/products/$imagen";
                                @endphp
                                <div class="list-card-image" data-id="{{ $item["id"] }}">
                                    <a href="detail.html">
                                        <img src="{{ $url_image }}" class="img-fluid item-img">
                                    </a>
                                </div>
                                <div class="p-3 position-relative">
                                    <div class="list-card-body">
                                        <h6 class="mb-1"><a href="detail.html" class="text-black">{{ $item["descripcion"] }}</a></h6>
                                        <p class="text-gray mb-3">{{ $item["categoria"] }}</p>
                                        <p class="text-gray mb-0 time">
                                            <span class="text-black-50 pt-1"> {{ $country->signo }}{{ number_format($item["precio_venta"], 2, ".", "") }}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('scripts')
    @include('menu.js-home')
@endsection
