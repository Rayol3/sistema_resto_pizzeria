<script>
    var setTimeOutBuscador = '';

    const cargarSonido = function (fuente) {
        const sonido = document.createElement("audio");
        sonido.src = fuente;
        sonido.setAttribute("preload", "auto");
        sonido.setAttribute("controls", "none");
        sonido.style.display = "none"; // <-- oculto
        document.body.appendChild(sonido);
        return sonido.play();
    };

    function open_modal_client() {
        $('#modalConfirmSale').css('z-index', '999');
    }

    function success_save_client(msg = null, type = null, idtipocomprobante = null, last_id = null) {
        toast_msg(msg, type);
        load_clients(idtipocomprobante);
        setTimeout(() => {
            $('#modalConfirmSale select[name="dni_ruc"]').val(last_id);
            $('#modalConfirmSale select[name="dni_ruc"]').trigger('change');
        }, 500);
    }

    function load_clients(idtipo_documento) {
        $.ajax({
            url: "{{ route('admin.get_serie_quote') }}",
            method: 'POST',
            data: {
                '_token': "{{ csrf_token() }}",
                idtipo_documento: idtipo_documento
            },
            success: function(r) {
                if (!r.status) {
                    toast_msg(r.msg, r.type);
                    return;
                }

                let html_clients = '<option></option>';
                $.each(r.clients, function(index, client) {
                    html_clients +=
                        `<option value="${client.id}">${client.dni_ruc + ' - ' + client.nombres}</option>`;
                });

                $('#modalConfirmSale select[name="dni_ruc"]').html(html_clients).select2({
                    placeholder: "[SELECCIONE]",
                    dropdownParent: $('#modalConfirmSale')
                });
            },
            dataType: 'json'
        });
        return;
    }

    function load_orders_list() {
        $.ajax({
            url: "{{ route('admin.load_orders') }}",
            method: "POST",
            data: {
                '_token': "{{ csrf_token() }}"
            },
            success: function(r) {
                if (!r.status) {
                    toast_msg(r.msg, r.type);
                    return;
                }

                $('#wrapper-orders').html(r.html);
            },
            dataType: "json"
        });
    }

    $('body').on('click', '.btn-send-info-wpp', function() {
        event.preventDefault();
        let codigo = $(this).data('codigo'),
            wpp = $(this).data('wpp'),
            nombres = $(this).data('nombres'),
            html = `¡Hola, ${nombres}! \n`;
        html += `Te escribimos para confirmarte la recepcion de tu pedido`;
        window.open(`https://api.whatsapp.com/send?phone=${codigo + wpp}&text=${encodeURI(
                    html
                )}`);
    });

    $('body').on('keyup', '.input-search-client', function() {
        let value = $(this).val();
        if (event.keyCode === 13)
            return;

        if (event.keyCode === 27) {
            $('.input-search-client').val("");
            load_orders_list();
            return;
        }

        if (value.trim() == '') {
            load_orders_list();
            return;
        }

        clearTimeout(setTimeOutBuscador);
        setTimeOutBuscador = setTimeout(() => {
            $.ajax({
                url: "{{ route('admin.search_client_order') }}",
                method: 'POST',
                data: {
                    '_token': "{{ csrf_token() }}",
                    value: value
                },
                beforeSend: function() {
                    block_content(`#wrapper-orders`);
                },
                success: function(r) {
                    if (!r.status) {
                        close_block(`#wrapper-orders`);
                        toast_msg(r.msg, r.type);
                        return;
                    }
                    close_block(`#wrapper-orders`);
                    $('#wrapper-orders').html(r.html);
                },
                dataType: "json"
            });
        }, 300);
    });

    function load_resumen_order(idorder) {
        $.ajax({
            url: "{{ route('admin.load_resumen_order') }}",
            method: "POST",
            data: {
                '_token': "{{ csrf_token() }}",
                idorder: idorder
            },
            beforeSend: function() {
                if (idorder != null)
                    block_content(`#wrapper-resumen-block`);
            },
            success: function(r) {
                if (!r.status) {
                    close_block(`#wrapper-resumen-block`);
                    toast_msg(r.msg, r.type);
                    return;
                }

                close_block(`#wrapper-resumen-block`);
                if (idorder != null) {
                    $('.btn-print-command').prop('disabled', false);
                    $('.btn-pack-off').prop('disabled', false);
                }
                $('#wrapper-detail-order').html(r.html_resumen);
                $('#wrapper-totals-order').html(r.html_totales);
                $('#wrapper-actions').html(r.html_actions);
            },
            dataType: "json"
        });
    }

    $('body').on('click', '.btn-get-resumen-order', function() {
        event.preventDefault();
        let id = $(this).data('id');
        $(this).parent().parent().parent().parent().parent().parent().siblings().removeClass("current-row");
        $(this).parent().parent().parent().parent().parent().parent().toggleClass("current-row");
        load_resumen_order(id);
    });

    $('body').on('click', '.btn-print-command', function() {
        event.preventDefault();
        let id = $(this).data('id');
        $.ajax({
            url: "{{ route('admin.gen_command_order') }}",
            method: "POST",
            data: {
                '_token': "{{ csrf_token() }}",
                id: id
            },
            beforeSend: function() {
                block_content('#layout-content');
            },
            success: function(r) {
                if (!r.status) {
                    close_block('#layout-content');
                    toast_msg(r.msg, r.type);
                    return;
                }
                close_block('#layout-content');
                load_orders_list();

                setTimeout(() => {
                    $(`.btn-get-resumen-order[data-id="${id}"]`).parent().parent().parent()
                        .parent().parent().parent().siblings().removeClass("current-row");
                    $(`.btn-get-resumen-order[data-id="${id}"]`).parent().parent().parent()
                        .parent().parent().parent().toggleClass("current-row");
                }, 150);
                let pdf = `{{ asset('files/orders/commands/${r.comanda}') }}`;
                var iframe = document.createElement('iframe');
                iframe.style.display = "none";
                iframe.src = pdf;
                document.body.appendChild(iframe);
                iframe.contentWindow.focus();
                iframe.contentWindow.print();
            },
            dataType: "json"
        });
    });

    function load_serie() {
        $.ajax({
            url: "{{ route('admin.load_serie_pos') }}",
            method: 'POST',
            data: {
                '_token': "{{ csrf_token() }}"
            },
            success: function(r) {
                if (!r.status) {
                    toast_msg(r.msg, r.title, r.type);
                    return;
                }
                $('#modalConfirmSale input[name="iddocumento_tipo"]').val(2);
                $('#modalConfirmSale input[name="quantity_paying_2"]').val("0");
                $('#modalConfirmSale input[name="quantity_paying_3"]').val("0");
                $(`#modalConfirmSale input[name="type_document"][value="2"]`).prop('checked', true);
                $(`#modalConfirmSale input[name="type_document"][value="1"]`).prop('checked', false);
                $(`#modalConfirmSale input[name="type_document"][value="7"]`).prop('checked', false);
                $(`#modalConfirmSale input[name="type_document"][value="2"]`).parent().parent().addClass(
                    'checked');
                $(`#modalConfirmSale input[name="type_document"][value="1"]`).parent().parent().removeClass(
                    'checked');
                $(`#modalConfirmSale input[name="type_document"][value="7"]`).parent().parent().removeClass(
                    'checked');
                $('#modalConfirmSale #serie-sale').html(r.serie.serie + '-' + r.serie.correlativo);
            },
            dataType: 'json'
        });
    }

    $('body').on('click', '.btn-type-document', function() {
        event.preventDefault();
        let value = $(this).find('input[name="type_document"]').val();
        $.ajax({
            url: "{{ route('admin.get_serie_pos') }}",
            method: 'POST',
            data: {
                '_token': "{{ csrf_token() }}",
                idtipo_documento: value
            },
            success: function(r) {
                if (!r.status) {
                    $('#modalConfirmSale input[name="serie_sale"]').val('');
                    toast_msg(r.msg, r.type);
                    return;
                }

                let serie = r.serie;
                switch (parseInt(r.serie.idtipo_documento)) {
                    case 1:
                        $(`#modalConfirmSale input[name="type_document"][value="1"]`).prop(
                            'checked', true);
                        $(`#modalConfirmSale input[name="type_document"][value="2"]`).prop(
                            'checked', false);
                        $(`#modalConfirmSale input[name="type_document"][value="7"]`).prop(
                            'checked', false);
                        $(`#modalConfirmSale input[name="type_document"][value="1"]`).parent()
                            .parent().addClass('checked');
                        $(`#modalConfirmSale input[name="type_document"][value="2"]`).parent()
                            .parent().removeClass('checked');
                        $(`#modalConfirmSale input[name="type_document"][value="7"]`).parent()
                            .parent().removeClass('checked');
                        break;

                    case 2:
                        $(`#modalConfirmSale input[name="type_document"][value="2"]`).prop(
                            'checked', true);
                        $(`#modalConfirmSale input[name="type_document"][value="1"]`).prop(
                            'checked', false);
                        $(`#modalConfirmSale input[name="type_document"][value="7"]`).prop(
                            'checked', false);
                        $(`#modalConfirmSale input[name="type_document"][value="2"]`).parent()
                            .parent().addClass('checked');
                        $(`#modalConfirmSale input[name="type_document"][value="1"]`).parent()
                            .parent().removeClass('checked');
                        $(`#modalConfirmSale input[name="type_document"][value="7"]`).parent()
                            .parent().removeClass('checked');
                        break;

                    case 7:
                        $(`#modalConfirmSale input[name="type_document"][value="7"]`).prop(
                            'checked', true);
                        $(`#modalConfirmSale input[name="type_document"][value="1"]`).prop(
                            'checked', false);
                        $(`#modalConfirmSale input[name="type_document"][value="2"]`).prop(
                            'checked', false);
                        $(`#modalConfirmSale input[name="type_document"][value="7"]`).parent()
                            .parent().addClass('checked');
                        $(`#modalConfirmSale input[name="type_document"][value="1"]`).parent()
                            .parent().removeClass('checked');
                        $(`#modalConfirmSale input[name="type_document"][value="2"]`).parent()
                            .parent().removeClass('checked');
                        break;
                }

                $('#modalConfirmSale input[name="iddocumento_tipo"]').val(r.serie.idtipo_documento);
                $('#modalConfirmSale input[name="serie_sale"]').val(r.serie.serie + '-' + r.serie
                    .correlativo);
                $('#modalConfirmSale #serie-sale').text(r.serie.serie + '-' + r.serie.correlativo);
                let html_clientes = '';
                $.each(r.clientes, function(index, cliente) {
                    html_clientes +=
                        `<option value="${cliente.id}">${cliente.dni_ruc + ' - ' + cliente.nombres}</option>`;
                });

                $('#modalConfirmSale select[name="dni_ruc"]').html(html_clientes).select2({
                    placeholder: "[SELECCIONE]",
                    dropdownParent: $('#modalConfirmSale')
                });
            },
            dataType: 'json'
        });
        return;
    });

    $('body').on('click', '.btn-process-pay', function() {
        event.preventDefault();
        let id = $(this).data('id');
        $.ajax({
            url         : "{{ route('admin.get_order') }}",
            method      : "POST",
            data        : {
                '_token': "{{ csrf_token() }}",
                id      : id
            },
            beforeSend: function() {
                $('.btn-process-pay').prop('disabled', true);
                $('.text-process').addClass('d-none');
                $('.text-processing').removeClass('d-none');
            },
            success     : function(r){
                if (!r.status) {
                    $('.btn-process-pay').prop('disabled', false);
                    $('.text-process').removeClass('d-none');
                    $('.text-processing').addClass('d-none');
                    toast_msg(r.msg, r.type);
                    return;
                }

                $('.btn-process-pay').prop('disabled', false);
                $('.text-process').removeClass('d-none');
                $('.text-processing').addClass('d-none');
                $('#modalConfirmSale input[name="idorder"]').val(r.order.id);
                $('#modalConfirmSale input[name="quantity_paying"]').val(parseFloat(r.order.total).toFixed(2));
                $('#modalConfirmSale #total_pay').text(parseFloat(r.order.total).toFixed(2));
                $('#modalConfirmSale #total_paying').text(parseFloat(r.order.total).toFixed(2));
                $(`#modalConfirmSale select[name="modo_pago"] option[value="${r.order.idpago}"]`).prop('selected', true);
                $('#modalConfirmSale select[name="dni_ruc"]').select2({
                    placeholder: "[SELECCIONE]",
                    dropdownParent: $('#modalConfirmSale')
                });
                $('#modalConfirmSale select[name="dni_ruc"]').val(1).trigger('change');
                load_serie();
                $('#modalConfirmSale').modal('show');
            },
            dataType    : "json"
        });
    });

    $('body').on('click', '.btn-confirm-pay', function() {
        event.preventDefault();
        let form = $('#form-save-sale').serializeArray();
        form[form.length] = {
            "name": "serie_sale",
            "value": $('#serie-sale').text()
        };
        $.ajax({
            url: "{{ route('admin.save_billing_order') }}",
            method: 'POST',
            data: form,
            beforeSend: function() {
                $('.btn-confirm-pay').prop('disabled', true);
                $('.text-confirm-pay').addClass('d-none');
                $('.text-confirm-payment').removeClass('d-none');
            },
            success: function(r) {
                if (!r.status) {
                    $('.btn-confirm-pay').prop('disabled', false);
                    $('.text-confirm-pay').removeClass('d-none');
                    $('.text-confirm-payment').addClass('d-none');
                    toast_msg(r.msg, r.type);
                    return;
                }

                
                if (r.type_document == '7') {
                    // Open ticket sale note
                    $('.btn-confirm-pay').prop('disabled', false);
                    $('.text-confirm-pay').removeClass('d-none');
                    $('.text-confirm-payment').addClass('d-none');
                    open_ticket_sn(r.pdf);
                } else {
                    // Send billing
                    send_data_sunat(r.id, r.pdf);
                }
            },
            dataType: 'json'
        });
    });

    function open_ticket_sn(ticket) {
        $('#modalConfirmSale').modal('hide');
        let pdf = `{{ asset('files/sale-notes/ticket/${ticket}') }}`;
        var iframe = document.createElement('iframe');
        iframe.style.display = "none";
        iframe.src = pdf;
        document.body.appendChild(iframe);
        iframe.contentWindow.focus();
        iframe.contentWindow.print();
        load_orders_list();
        load_resumen_order(null);
        load_serie();
        load_clients(2);
    }

    function send_data_sunat(id, ticket)
    {
        $.ajax({
            url             : "{{ route('admin.send_bf') }}",
            method          : "POST",
            data            : {
                '_token'    : "{{ csrf_token() }}",
                id          : id
            },
            beforeSend      : function(){
                $('.btn-confirm-pay').prop('disabled', true);
                $('.text-confirm-pay').addClass('d-none');
                $('.text-confirm-payment').removeClass('d-none');
            },
            success         : function(r){
                if(!r.status){}
                $('.btn-confirm-pay').prop('disabled', false);
                $('.text-confirm-pay').removeClass('d-none');
                $('.text-confirm-payment').addClass('d-none');

                let ip          = r.empresa.url_api,
                    api         = "Api/index.php",
                    datosJSON   = JSON.stringify(r.data);
                    datosJSON   = unescape(encodeURIComponent(datosJSON)),
                    idfactura   = parseInt(r.idfactura);

                    $.ajax({    
                        url         : ip + api,
                        method      : 'POST',
                        data        : {datosJSON},
                        beforeSend  : function(){
                            $('.btn-confirm-pay').prop('disabled', true);
                            $('.text-confirm-pay').addClass('d-none');
                            $('.text-confirm-payment').removeClass('d-none');
                    },
                    }).done(function(res){
                        $('.btn-confirm-pay').prop('disabled', false);
                        $('.text-confirm-pay').removeClass('d-none');
                        $('.text-confirm-payment').addClass('d-none');
                        if (res.trim() == "No se registró") 
                        {
                            toast_msg('El número de comprobante electrónico esta duplicado, revise la base de datos', 'error');
                            return;
                        }

                        let respuesta_sunat = JSON.parse(res),
                            estado_conexion = JSON.parse(respuesta_sunat).status;
                         
                        $('#modalConfirmSale').modal('hide');
                        let pdf = `{{ asset('files/billings/ticket/${ticket}') }}`;
                        var iframe = document.createElement('iframe');
                        iframe.style.display = "none";
                        iframe.src = pdf;
                        document.body.appendChild(iframe);
                        iframe.contentWindow.focus();
                        iframe.contentWindow.print();
                        $('input[name="input-search-product"]').val('');
                        load_serie();
                        load_orders_list();
                        load_resumen_order(null);
                        load_clients(2);
                        if(estado_conexion != false)
                        {
                            update_cdr(idfactura);
                        }
                    }).fail(function(jqxhr, textStatus, error){
                        $('.btn-confirm-pay').prop('disabled', false);
                        $('.text-confirm-pay').removeClass('d-none');
                        $('.text-confirm-payment').addClass('d-none');
                        $('#modalConfirmSale').modal('hide');
                        let pdf = `{{ asset('files/billings/ticket/${ticket}') }}`;
                        var iframe = document.createElement('iframe');
                        iframe.style.display = "none";
                        iframe.src = pdf;
                        document.body.appendChild(iframe);
                        iframe.contentWindow.focus();
                        iframe.contentWindow.print();
                        $('input[name="input-search-product"]').val('');
                        load_serie();
                        load_orders_list();
                        load_resumen_order(null);
                        load_clients(2);
                    });
            },
            dataType        : "json"
        });
    }

    function update_cdr(idfactura)
    {
        let resp = '';
        $.ajax({
            url     : "{{ route('admin.update_cdr_bf') }}",
            method  : 'POST',
            data    : {
                '_token'   : "{{ csrf_token() }}",
                idfactura  : idfactura
            },
            success : function(r){},
            dataType : 'json'
        });
    }

    $(document).ready(function() {
        load_orders_list();
        load_resumen_order(null);


        Echo.channel('new-order').listen('NewOrderEvent', (e) => {
            cargarSonido("mp3/notification.mp3");
            setTimeout(() => {
                cargarSonido("mp3/notification.mp3");
            }, 2000);
            load_orders_list();
            toast_msg(e.message, 'success');
        });
    });
</script>
