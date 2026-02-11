@extends('admin.template')
@section('styles')
    <style>
        body {
            overflow-x: hidden;
        }
    </style>
@endsection
@section('content')
    <section class="basic-select2">
        <div class="row">
            <!-- Congratulations Card -->
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="bs-stepper-content">
                            <form id="wizard-checkout-form" onsubmit="return false">
                                <!-- Cart -->
                                <div id="checkout-cart"
                                    class="content fv-plugins-bootstrap5 fv-plugins-framework active dstepper-block">
                                    <div class="row">
                                        <!-- Cart left -->
                                        <div class="col-xl-8 mb-0 mb-xl-0 overflow-auto" style="height: 74vh;">
                                            <input type="text" class="form-control input-search-client mb-2" placeholder="Buscar por cliente...">
                                            <ul id="wrapper-orders" class="list-group mb-1" style="height: calc(100% - 65px);"></ul>
                                        </div>

                                        <!-- Cart right -->
                                        <div id="wrapper-resumen-block" class="col-xl-4">
                                            <h5>&nbsp;</h5>
                                            <div class="border rounded p-4 mb-3 pb-3">
                                                <!-- Offer -->
                                                <h6>Resumen</h6>
                                                <!-- Gift wrap -->
                                                <div id="wrapper-detail-order"></div>

                                                <hr class="mx-n4">

                                                <!-- Price Details -->
                                                <h6>Subtotales</h6>
                                                <div id="wrapper-totals-order"></div>
                                            </div>
                                            <div id="wrapper-actions" class="d-grid"></div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--/ Congratulations Card -->
            @include('admin.orders.modals')
            @include('admin.clients.modal-register')
        </div>
    </section>
@endsection
@section('scripts')
    @include('admin.clients.js-register')
    @include('admin.orders.js-store')
@endsection
