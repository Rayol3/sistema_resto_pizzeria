<script>
    $('body').on('change', '.check-category', function() {
        let form = $('#form-check-category').serialize();
        $.ajax({
            url: "{{ route('admin.search_category') }}",
            method: "POST",
            data: form,
            beforeSend  : function(){
                $('.wrapper-wait').waitMe({
                    effect: 'rotateplane',
                    color : '#6c757d'
                });
            },
            success: function(r) {
                if (!r.status) {
                    $('.wrapper-wait').waitMe('hide');
                    toast_msg(r.msg, r.type);
                    return;
                }
                
                $('.wrapper-wait').waitMe('hide');
                $('#wrapper-list-products').html(r.html);
            },
            dataType: "json"
        });
    });

    $('body').on('click', '.btn-add-product-cart', function() {
        event.preventDefault();
        let id = $(this).data('id');
        $.ajax({
            url         : "{{ route('admin.add_product_cart') }}",
            method      : "POST",
            data        : {
                '_token': "{{ csrf_token() }}",
                id      : id
            },
            beforeSend  : function(){
                $(`.list-card-image[data-id="${id}"]`).waitMe({
                    effect: 'rotateplane',
                    color : '#6c757d'
                });
            },
            success     : function(r){
                if (!r.status) {
                    $(`.list-card-image[data-id="${id}"]`).waitMe('hide');
                    toast_msg(r.msg, r.type);
                    return;
                }

                $(`.list-card-image[data-id="${id}"]`).waitMe('hide');
                toast_msg(r.msg, r.type);
                load_cart_order();
            },
            dataType    : "json"
        });
    });

    $('body').on('click', '.btn-add-product-cart-sm', function() {
        event.preventDefault();
        let id = $(this).data('id');
        $.ajax({
            url         : "{{ route('admin.add_product_cart') }}",
            method      : "POST",
            data        : {
                '_token': "{{ csrf_token() }}",
                id      : id
            },
            beforeSend  : function(){
                $(`.btn-add-product-cart-sm[data-id="${id}"]`).waitMe({
                    effect: 'rotateplane',
                    color : '#6c757d'
                });
            },
            success     : function(r){
                if (!r.status) {
                    $(`.btn-add-product-cart-sm[data-id="${id}"]`).waitMe('hide');
                    toast_msg(r.msg, r.type);
                    return;
                }

                $(`.btn-add-product-cart-sm[data-id="${id}"]`).waitMe('hide');
                toast_msg(r.msg, r.type);
                load_cart_order();
            },
            dataType    : "json"
        });
    });
</script>
