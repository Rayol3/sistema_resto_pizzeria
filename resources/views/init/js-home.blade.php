<script>
    $('body').on('click', '.btn-send-comment', function() {
        event.preventDefault();
        let form        = $('#form-comment').serialize(),
            comment     = $('#form-comment input[name="comment"]');

        if(comment.val() == '')
            comment.addClass('is-invalid');
        else
            comment.removeClass('is-invalid');

        if(comment.val().trim() != '')
        {
            $.ajax({
                url         :  "{{ route('admin.save_comment') }}",
                method      : 'POST',
                data        : form,
                beforeSend  : function(){
                    $('.btn-send-comment').prop('disabled', true);
                    $('.text-sending').removeClass('d-none');
                    $('.text-send').addClass('d-none');
                },
                success     : function(r)
                {
                    if(!r.status)
                    {
                        $('.btn-send-comment').prop('disabled', false);
                        $('.text-sending').addClass('d-none');
                        $('.text-send').removeClass('d-none');
						toast_msg(r.msg, r.type);
                        return;
                    }

                    $('#form-comment').trigger('reset');
                    $('.btn-send-comment').prop('disabled', false);
                    $('.text-send').removeClass('d-none');
                    $('.text-sending').addClass('d-none');
                    toast_msg(r.msg, r.type);
                },
                dataType    : 'json'
            });
            return;
        }
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
                $(`.btn-add-product-cart[data-id="${id}"]`).waitMe({
                    effect: 'rotateplane',
                    color : '#6c757d'
                });
            },
            success     : function(r){
                if (!r.status) {
                    $(`.btn-add-product-cart[data-id="${id}"]`).waitMe('hide');
                    toast_msg(r.msg, r.type);
                    return;
                }

                $(`.btn-add-product-cart[data-id="${id}"]`).waitMe('hide');
                toast_msg(r.msg, r.type);
                load_cart_order();
            },
            dataType    : "json"
        });
    });

    $(document).ready(function() {
    });
</script>