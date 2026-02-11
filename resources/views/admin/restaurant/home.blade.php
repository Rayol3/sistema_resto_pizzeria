@extends('admin.template')
@section('styles')
    <style>
        body
        {overflow-x:hidden;}
    </style>
@endsection
@section('content')
    <section class="basic-select2">
        <div class="row">
            <!-- Congratulations Card -->
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Datos del Restaurante</h5>
                        <form id="form-info" class="form form-vertical" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" id="nombre" class="form-control text-uppercase"
                                        name="nombre" value="{{ $restaurant->nombre }}" />
                                </div>

                                <div class="col-12 col-md-3 mb-3">
                                    <label for="idpais">Pa&iacute;s</label>
                                    <select name="idpais" id="idpais" class="form-control"></select>
                                </div>

                                <div class="col-12 col-md-3 mb-3">
                                    <label for="direccion">Direcci&oacute;n</label>
                                    <input type="text" id="direccion" class="form-control text-uppercase" id="direccion" name="direccion" value="{{ $restaurant->direccion }}" />
                                </div>

                                <div class="col-12 col-md-3 mb-3">
                                    <label for="entrega">Tiempo de Entrega (min)</label>
                                    <input type="text" id="entrega" class="form-control" id="entrega" name="entrega" placeholder="Ejem. 20-30" value="{{ $restaurant->entrega }}" />
                                </div>

                                <div class="col-12 col-md-3 mb-3">
                                    <label for="telefono">Tel&eacute;fono</label>
                                    <input type="text" id="telefono" class="form-control text-uppercase" id="telefono" name="telefono" value="{{ $restaurant->telefono }}" />
                                </div>

                                <div class="col-12 col-md-4 mb-3">
                                    <label class="form-label" for="logo_encabezado">Logo Encabezado <small class="text-danger">(136 x 31 recomendado)</small></label>
                                    <input class="form-control" type="file" id="logo_encabezado" name="logo_encabezado">
                                </div>

                                <div class="col-12 col-md-4 mb-3">
                                    <label class="form-label" for="logo_principal">Logo Principal <small class="text-danger">(400 x 400 recomendado)</small></label>
                                    <input class="form-control" type="file" id="logo_principal" name="logo_principal">
                                </div>

                                <div class="col-12 col-md-4 mb-3">
                                    <label class="form-label" for="banner">Banner <small class="text-danger">(1359 x 424 recomendado)</small></label>
                                    <input class="form-control" type="file" id="banner" name="banner">
                                </div>

                                <div class="col-12 col-md-8 mb-3">
                                    <label class="form-label" for="publicidad">Publicidad Principal <small class="text-danger">(520 x 520 recomendado)</small></label>
                                    <input type="file" class="form-control image-publicities multi" name="publicities[]">
                                </div>

                                <div class="col-12 col-md-4 mb-3">
                                    <div class="col-md">
                                        <small class="text-light fw-medium d-block">Estado Restaurante</small>
                                        <div class="form-check form-check-inline mt-3">
                                          <input class="form-check-input" type="radio" name="estado" id="abierto" value="1" {{ $restaurant->estado == 1 ? 'checked' : '' }}>
                                          <label class="form-check-label" for="abierto">Abierto</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                          <input class="form-check-input" type="radio" name="estado" id="cerrado" value="2" {{ $restaurant->estado == 2 ? 'checked' : '' }}>
                                          <label class="form-check-label" for="cerrado">Cerrado</label>
                                        </div>
                                      </div>
                                </div>

                                <div class="col-12 text-end mb-2">
                                    <button type="button" class="btn btn-primary btn-save-info">
                                        <span class="text-save-info">Guardar</span>
                                        <span class="spinner-border spinner-border-sm me-1 d-none text-saving-info" role="status" aria-hidden="true"></span>
                                        <span class="text-saving-info d-none">Guardando...</span>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!--/ Congratulations Card -->
        </div>
    </section>
@endsection
@section('scripts')
    @include('admin.restaurant.js-home')
@endsection
