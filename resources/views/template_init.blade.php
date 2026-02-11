<!doctype html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Askbootstrap">
    <meta name="author" content="Askbootstrap">
    <title>ADRIANA</title>
    <link rel="icon" type="image/png" href="img/favicon.png">
    <link href="{{ asset('vendor/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('vendor/fontawesome/css/all.min.css') }}" rel="stylesheet">
    <link href="{{ asset('vendor/icofont/icofont.min.css') }}" rel="stylesheet">
    <link href="{{ asset('vendor/select2/css/select2.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/pnotify/pnotify.custom.css') }}">
    <link href="{{ asset('css/osahan.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('vendor/owl-carousel/owl.carousel.css') }}">
    <link rel="stylesheet" href="{{ asset('vendor/owl-carousel/owl.theme.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendor/waitMe/waitMe.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendor/libs/sweetalert2/sweetalert2.css') }}" />
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light osahan-nav shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="{{ url('/') }}"><img alt="logo" src="{{ session('restaurante')["logo_encabezado"] != NULL ? asset('files/restaurant/logo-encabezado/' . session('restaurante')["logo_encabezado"]) : asset('files/restaurant/encabezado-null.png') }}"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
                aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item {{ request()->is('/') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ url('/') }}">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item {{ request()->is('menu') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('menu') }}">Hacer Pedido</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}"><i class="icofont-user"></i> Mi cuenta</a>
                    </li>

                    <li class="nav-item dropdown dropdown-cart">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-shopping-basket"></i> Carrito
                            <span class="badge badge-success quantity-products"></span>
                        </a>
                        <div id="wrapper-cart" class="dropdown-menu dropdown-cart-top p-0 dropdown-menu-right shadow-sm border-0"></div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    @yield('content')


    <script src="{{ asset('assets/vendor/libs/jquery/jquery.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/popper/popper.js') }}"></script>
    <script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('vendor/select2/js/select2.min.js') }}"></script>
    <script src="{{ asset('vendor/owl-carousel/owl.carousel.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/pnotify/pnotify.custom.js') }}"></script>
    <script src="{{ asset('js/custom.js') }}"></script>
    <script src="{{ asset('assets/js/functions.js') }}"></script>
    <script src="{{ asset('assets/vendor/waitMe/waitMe.min.js') }}"></script>
    <script src="{{ asset('assets/vendor/libs/sweetalert2/sweetalert2.js') }}"></script>
    <script defer="" src="../beacon.min.js/v84a3a4012de94ce1a686ba8c167c359c1696973893317"></script>
    @include('js-template')
    @yield('scripts')
</body>

</html>
