        @extends('template_init')
@section('content')
    <section class="offer-dedicated-body mt-3 mb-3 pt-1 pb-2">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <div class="offer-dedicated-body-left">
                        <div class="bg-white rounded shadow-sm p-4 osahan-payment">
                            <h4 class="mb-2">Elige el m&eacute;todo de pago</h4>
                            <div class="row">
                                <div class="col-sm-4 pr-0">
                                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist"
                                        aria-orientation="vertical">
                                        <a class="nav-link active" data-sendtype="1" id="v-pills-delivery-tab" data-toggle="pill"
                                            href="#v-pills-delivery" role="tab" aria-controls="v-pills-delivery"
                                            aria-selected="true"><i class="icofont-delivery-time"></i> Delivery</a>
                                        <a class="nav-link" data-sendtype="2" id="v-pills-home-tab" data-toggle="pill"
                                            href="#v-pills-home" role="tab" aria-controls="v-pills-home"
                                            aria-selected="false"><i class="icofont-ui-home"></i> Recojo en local
                                        </a>
                                    </div>
                                </div>
                                <div class="col-sm-8 pl-0">
                                    <div class="tab-content h-100" id="v-pills-tabContent">
                                        <div class="tab-pane fade show active" id="v-pills-delivery" role="tabpanel"
                                            aria-labelledby="v-pills-delivery-tab">
                                            <form id="form-delivery" POST>
                                                @csrf
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>Nombre</label>
                                                        <input type="hidden" name="sendtype">
                                                        <input type="text" class="form-control" name="nombre_delivery">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>Apellidos</label>
                                                        <input type="text" class="form-control" name="apellidos_delivery">
                                                    </div>

                                                    <div class="form-group col-md-12">
                                                        <label>Direcci&oacute;n</label>
                                                        <input type="text" class="form-control" name="direccion_delivery">
                                                    </div>

                                                    <div class="form-group col-md-12">
                                                        <label>Tel&eacute;fono</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                              <span class="input-group-text" id="telefono">{{ $country->codigo_telefono }}</span>
                                                            </div>
                                                            <input type="text" class="form-control" aria-describedby="telefono" name="telefono_delivery">
                                                          </div>
                                                    </div>

                                                    <div class="form-group col-md-12">
                                                        <label>M&eacute;todo de Pago</label>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="tipo_pago_delivery" id="tipo_pago1_delivery" value="1" checked>
                                                            <label class="form-check-label" for="tipo_pago1_delivery">
                                                              Pago en efectivo
                                                            </label>
                                                          </div>
                                                          <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="tipo_pago_delivery" id="tipo_pago2_delivery" value="5">
                                                            <label class="form-check-label" for="tipo_pago2_delivery">
                                                              Pago con tarjeta al repartidor
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="form-group col-md-12">
                                                        <label>Comentarios <small>(Opcional)</small></label>
                                                        <textarea name="comentarios_delivery" id="comentarios" class="form-control" cols="8" rows="3"></textarea>
                                                    </div>
                                                  
                                                    <div class="form-group col-md-12 mb-0">
                                                        <p class="text-danger font-weight-bold">Si el pago es en efectivo, ind&iacute;quenos en COMENTARIOS el monto con el que cancelar&aacute;.</p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="tab-pane fade" id="v-pills-home" role="tabpanel"
                                            aria-labelledby="v-pills-home-tab">
                                            <form id="form-home" method="POST">
                                                @csrf
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                        <label>Nombre</label>
                                                        <input type="hidden" name="sendtype">
                                                        <input type="text" class="form-control" name="nombre">
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        <label>Apellidos</label>
                                                        <input type="text" class="form-control" name="apellidos">
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label>Tel&eacute;fono</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                              <span class="input-group-text" id="telefono">{{ $country->codigo_telefono }}</span>
                                                            </div>
                                                            <input type="text" class="form-control" aria-describedby="telefono" name="telefono">
                                                          </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label>M&eacute;todo de Pago</label>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="tipo_pago" id="tipo_pago1" value="option1" checked>
                                                            <label class="form-check-label" for="1">
                                                              Pago en efectivo
                                                            </label>
                                                          </div>
                                                          <div class="form-check">
                                                            <input class="form-check-input" type="radio" name="tipo_pago" id="tipo_pago2" value="option2">
                                                            <label class="form-check-label" for="5">
                                                              Pago con tarjeta
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group col-md-12">
                                                        <label>Comentarios <small>(Opcional)</small></label>
                                                        <textarea name="comentarios" id="comentarios" class="form-control" cols="8" rows="3"></textarea>
                                                    </div>
                                                    <div class="form-group col-md-12 mb-0">
                                                        <p class="text-danger font-weight-bold">Si el pago es en efectivo, ind&iacute;quenos en COMENTARIOS el monto con el que cancelar&aacute;.</p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="generator-bg rounded shadow-sm mb-4 p-4 osahan-cart-item">
                        <div class="d-flex mb-4 osahan-cart-item-profile">
                            
                            @if ($restaurant->logo_principal == NULL)
                            <img class="img-fluid mr-3 rounded-pill" alt="osahan" src="{{ asset('files/restaurant/principal-null.png') }}">
                            @else
                            <img class="img-fluid mr-3 rounded-pill" alt="osahan" src="{{ asset('files/restaurant/logo-principal/' . $restaurant->logo_principal) }}">
                            @endif
                            <div class="d-flex flex-column">
                                <h6 class="mb-1 text-white">
                                    {{ $restaurant->nombre }}
                                </h6>
                                <p class="mb-0 text-white"><i class="icofont-location-pin"></i> {{ $restaurant->direccion }}</p>
                            </div>
                        </div>

                        <div id="wrapper-cart-checkout" class="bg-white rounded shadow-sm mb-2"></div>
                        <div id="wrapper-totals-checkout"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection
@section('scripts')
    @include('checkout.js-home')
@endsection