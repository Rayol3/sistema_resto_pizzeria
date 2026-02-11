<script>
    function load_cart_order() {
        $.ajax({
            url         : "{{ route('admin.load_cart_order') }}",
            method      : "POST",
            data        : {
                '_token': "{{ csrf_token() }}"
            },
            success     : function(r){
                if (!r.status) {
                    toast_msg(r.msg, r.type);
                    return;
                }

                $('.quantity-products').html(r.quantity);
                $('#wrapper-cart').html(r.html);
            },
            dataType    : "json"
        });
    }

    $('document').ready(function() {
        load_cart_order();
    });
</script>