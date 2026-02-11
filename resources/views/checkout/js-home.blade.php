<script>
    function load_cart_checkout() {
        $.ajax({
            url         : "{{ route('admin.load_cart_checkout') }}",
            method      : "POST",
            data        : {
                '_token': "{{ csrf_token() }}"
            },
            success     : function(r){
                if (!r.status) {
                    toast_msg(r.msg, r.type);
                    return;
                }
                
                $('#wrapper-cart-checkout').html(r.html_cart);
                $('#wrapper-totals-checkout').html(r.html_subtotal);
            },
            dataType    : "json"
        });
    }

    $('body').on('click', '.btn-delete-item', function() {
        event.preventDefault();
        let id = $(this).data('id');
        $.ajax({
            url         : "{{ route('admin.delete_item_order') }}",
            method      : "POST",
            data        : {
                '_token': "{{ csrf_token() }}",
                id      : id
            },
            success     : function(r){
                if (!r.status) {
                    toast_msg(r.msg, r.type);
                    return;
                }

                toast_msg(r.msg, r.type);
                load_cart_order();
                load_cart_checkout();
            },
            dataType    : "json"
        });
    });

    $('body').on('click', '.btn-down', function() {
        event.preventDefault();
        let id = $(this).data('id'),
            cantidad = parseInt($(this).data('cantidad')),
            cantidad_enviar = cantidad - 1,
            precio = parseFloat($(this).data('precio'));

        if (cantidad_enviar <= 0) {
            toast_msg('La cantidad no puede ser menor a 1', 'warning');
            return;
        }

        $.ajax({
            url: "{{ route('admin.store_product_cart') }}",
            method: "POST",
            data: {
                '_token': "{{ csrf_token() }}",
                id: id,
                cantidad: cantidad_enviar,
                precio: precio
            },
            success: function(r) {
                if (!r.status) {
                    toast_msg(r.msg, r.type);
                    return;
                }

                toast_msg(r.msg, r.type);
                load_cart_order();
                load_cart_checkout();
            },
            dataType: "json"
        });
    });

    $('body').on('click', '.btn-up', function() {
        event.preventDefault();
        let id = $(this).data('id'),
            cantidad = parseInt($(this).data('cantidad')),
            cantidad_enviar = cantidad + 1,
            precio = parseFloat($(this).data('precio'));

        $.ajax({
            url: "{{ route('admin.store_product_cart') }}",
            method: "POST",
            data: {
                '_token': "{{ csrf_token() }}",
                id: id,
                cantidad: cantidad_enviar,
                precio: precio
            },
            success: function(r) {
                if (!r.status) {
                    toast_msg(r.msg, r.type);
                    return;
                }

                toast_msg(r.msg, r.type);
                load_cart_order();
                load_cart_checkout();
            },
            dataType: "json"
        });
    });

    $('body').on('click', '.btn-confirm-order', function() {
        event.preventDefault();
        let sendtype = $("#v-pills-tab a.active").data("sendtype"); // 1 - delivery, 2 - local

        $('input[name="sendtype"]').val(sendtype);
        let form;
        if(sendtype == 1)
            form = $('#form-delivery').serialize();
        else
            form = $('#form-home').serialize();

        $.ajax({
            url         : "{{ route('admin.confirm_order') }}",
            method      : "POST",
            data        : form,
            beforeSend  : function(){
                $('.btn-confirm-order').prop('disabled', true);
                $('.span-confirm').addClass('d-none');
                $('.span-process').removeClass('d-none');
            },
            success     : function(r){
                if (!r.status) {
                    $('.btn-confirm-order').prop('disabled', false);
                    $('.span-confirm').removeClass('d-none');
                    $('.span-process').addClass('d-none');
                    toast_msg(r.msg, r.type);
                    return;
                }

                $('.btn-confirm-order').prop('disabled', false);
                $('.span-confirm').removeClass('d-none');
                $('.span-process').addClass('d-none');
                load_cart_order();
                load_cart_checkout();
                
                if(sendtype == 1)
                    form = $('#form-delivery').trigger('reset');
                else
                    form = $('#form-home').trigger('reset');

                let codigo_telefono = r.country.codigo_telefono,
                    nro_wpp         = r.nro_wpp,
                    html            = r.wpp_msg;
                window.open(
                    `https://api.whatsapp.com/send?phone=${codigo_telefono + nro_wpp}&text=${encodeURI(
                        html
                    )}`
                );
            },
            dataType    : "json"
        });
    });

    $('document').ready(function() {
        load_cart_checkout();
    });
</script>