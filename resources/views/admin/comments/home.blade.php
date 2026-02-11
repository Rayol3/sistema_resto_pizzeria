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
            <div class="col-12 col-md-6 offset-md-3">
                <div class="card">
                    <h5 class="card-header">¡Comentarios de la gente!</h5>
                    <div class="card-body pb-0">
                        <ul class="timeline pt-3">
                            @php
                                $contador = 1;
                            @endphp
                            @foreach ($comentarios as $index => $item)
                            @php
                                $bg = '';
                                (($index % 2) == 0) ? ($bg .= 'primary') : ($bg .= 'success');
                                $contador++;
                            @endphp
                            <li class="timeline-item pb-4 timeline-item-{{ $bg }} border-left-dashed">
                                <div class="timeline-event">
                                    <div class="timeline-header border-bottom mb-3">
                                        <h6 class="mb-0">&nbsp;</h6>
                                        <span class="text-muted">{{ date('d-m-Y', strtotime($item["fecha"])) }}</span>
                                    </div>
                                    <div class="d-flex justify-content-between flex-wrap mb-2">
                                        <div class="d-flex align-items-center">
                                            {{ $item["comentario"] }}
                                        </div>
                                    </div>
                                </div>
                            </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
            <!--/ Congratulations Card -->
            <!--/ Medal Card -->
        </div>
    </section>
@endsection
@section('scripts')
    @include('admin.comments.js-home')
@endsection
