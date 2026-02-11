@extends('template_init')
@section('content')
    <section class="pt-5 pb-5 homepage-search-block position-relative">
        <div class="banner-overlay"></div>
        <div class="container">
            <div class="row d-flex align-items-center">
                <div class="col-md-8">
                    <div class="homepage-search-title">
                        <h1 class="mb-2 font-weight-normal">Lo mejor <span class="font-weight-bold">pizzería
                                tradicional de Abancay</span></h1>
                        <h5 class="mb-5 text-secondary font-weight-normal">¡Tenemos muchas opciones para ti!</h5>
                    </div>
                    <div class="homepage-search-form">
                        <form id="form-comment" class="form-noborder">
                            @csrf
                            <div class="form-row">
                                <div class="col-lg-10 col-md-7 col-sm-12 form-group">
                                    <input type="text" placeholder="Déjanos un comentario"
                                        class="form-control form-control-lg text-uppercase" name="comment">
                                        <div class="invalid-feedback">El campo no debe estar vacío.</div>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-12 form-group">
                                    <button class="btn btn-primary btn-block btn-lg btn-gradient btn-send-comment">
                                        <span class="text-send">Enviar</span>
                                        <span class="text-sending d-none">Enviando...</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <h6 class="mt-4 text-shadow font-weight-normal">
                        @if ($categories->isEmpty())
                            No hay categor&iacute;as registradas
                        @else
                            @php
                                $contador = 1;
                            @endphp
                            @foreach ($categories as $item)
                                @php
                                    $separator = '';
                                    $contador < $categories->count() ? ($separator .= ',') : ($separator .= '...');
                                    $contador++;
                                @endphp
                                {{ $item->descripcion . $separator }}
                            @endforeach
                        @endif
                    </h6>

                    <div class="owl-carousel owl-carousel-category owl-theme">
                        @foreach ($products as $item)
                        @php
                            $imagen     = $item["imagen"];
                            $url_image  = ($imagen == null) ? "files/products/product-null.png" : "files/products/$imagen";
                        @endphp
                        <div class="item btn-add-product-cart" data-id="{{ $item["id"] }}">
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
            </div>
            <div class="col-md-4">
                <div class="osahan-slider pl-4 pt-3">
                    <div class="owl-carousel homepage-ad owl-theme">
                        @if ($publicities->isEmpty())
                            @for ($i = 0; $i < 4; $i++)
                                <div class="item">
                                    <a href="{{ url('/') }}"><img class="img-fluid rounded"
                                            src="{{ asset('files/restaurant/slider-null.png') }}"></a>
                                </div>
                            @endfor
                        @else
                            @foreach ($publicities as $item)
                                <div class="item">
                                    <a href="{{ url('/') }}"><img class="img-fluid rounded"
                                            src="{{ asset('files/restaurant/publicities/' . $item->imagen) }}"></a>
                                </div>
                            @endforeach
                        @endif
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
@endsection
@section('scripts')
    @include('init.js-home')
@endsection
